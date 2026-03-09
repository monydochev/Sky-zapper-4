# SKY Zapper — Подробна референция на Delphi кода

**Версия:** 1.0
**Дата:** 9 март 2026
**Източник:** Анализ на изходния код в `delphi/` + двете PRD документа (PRD-claude.md, PRD-gpt54.md)

---

## 1. Обща архитектура

### 1.1. Entry Point — `SKY_Zapper.dpr`

Програмата стартира от `SKY_Zapper.dpr`. При инициализация се задават глобални FormatSettings:

```
DecimalSeparator := '.'
ThousandSeparator := ' '
DateSeparator := '.'
ShortDateFormat := 'd.M.yyyy'
LongTimeFormat := 'H:mm:ss'
```

Създава се единствена главна форма `TfMain`. Всички останали форми се създават динамично при нужда с `Application.CreateForm`.

### 1.2. Модулна структура

```
SKY_Zapper.dpr
├── uMain.pas / uMain.dfm      — Главна форма, глобално състояние, комуникационен протокол
│   ├── uProgram.pas / .dfm     — Програми, възпроизвеждане, търсене, WiFi буфер
│   ├── uEdit.pas / .dfm        — Редактор на категории/програми/честоти
│   ├── uOptions.pas / .dfm     — Настройки, калибровка, firmware, WiFi конфигурация
│   ├── uCutomGroups.pas / .dfm — Персонални списъци (плейлисти)
│   ├── uSrebarnaVoda.pas / .dfm— Сребърна вода (електролиза)
│   ├── uUpdateSoftware.pas/.dfm— Обновяване на софтуер и база данни
│   ├── uLogin.pas / .dfm       — Login диалог
│   ├── uChangePassword.pas/.dfm— Смяна на парола
│   ├── uUsers.pas / .dfm       — Управление на потребители
│   └── uDebug.pas / .dfm       — Празна debug форма (stub)
└── SKY_Zapper.mdb              — MS Access база данни
```

### 1.3. Архитектурни характеристики

- **Монолитно приложение:** Един EXE файл + една MDB база
- **Event-driven:** Timer-базирана комуникация и мониторинг
- **Глобално състояние:** Всички споделени данни са глобални променливи в `uMain`
- **Директен достъп до БД:** ADO заявки директно от UI формите, без data access layer
- **Dual transport:** USB (VaComm / Serial COM) и LAN (UDP IdUDPServer/IdUDPClient) споделят общ буфер
- **Singleton форми:** Всяка дъщерна форма се създава само ако не съществува, затваря се с `caFree`
- **Взаимно изключване на формите:** При отваряне на нова форма, предишните се затварят

---

## 2. uMain.pas — Главен модул (~6300+ реда)

### 2.1. Клас TfMain

Централната форма на приложението. Съдържа:

**ADO компоненти (достъп до базата данни):**
- `ADOConnectionMDB` — единствената връзка към MDB файла
- `ADOQueryDiseases` — програми (diseases таблица)
- `ADOQueryFreq` — честоти
- `ADOQueryCategory` — категории
- `ADOQueryOptions` — глобални настройки
- `ADOQueryUsers` — потребители
- `ADOQuerySQL`, `ADOQuerySQL2` — помощни заявки за update/insert
- `ADOQuerySumFreq` — сумарни честоти
- `ADOQueryCheckFreq` — проверка на честоти
- `ADOQueryPrograming`, `ADOQueryFreqProgramming` — за програмиране на устройството
- `ADOQueryGetProgramName`, `ADOQueryGetCategoryName` — lookup заявки
- `ADOQueryCategoryList` — списък категории
- `ADOQueryCategory_Personalization` — персонализирани категории
- `ADOQueryPrograms` — програми за редактор
- `ADOQueryCloudPrograms`, `ADOQueryCloudCategory`, `ADOQueryCloudSUB_Category` — Cloud данни
- `ADOQueryExcel` — импорт от Excel
- `ADOQueryUpdate` — за обновяване

**Комуникационни компоненти:**
- `VaComm1: TVaComm` — serial COM порт (USB комуникация)
- `IdUDPClient1: TIdUDPClient` — UDP клиент (Cloud)
- `IdUDPServer1: TIdUDPServer` — UDP сървър (LAN комуникация)
- `IdHTTP1: TIdHTTP` — HTTP клиент (за update)
- `IdSMTP_with_SSL: TIdSMTP` — SMTP с SSL (изпращане на имейли)
- `IdSSLIOHandlerSocketOpenSSL1/2` — SSL обработка
- `IdIPWatch1: TIdIPWatch` — за локален IP

**Таймери:**
- `TimerCheck_Connections` — периодична проверка на връзката
- `TimerSearch` — таймер за автоматично търсене на устройства при стартиране

**UI компоненти:**
- `AdvToolBarPager1` с табове: Programs, SilverWater, Options, Language, Users
- `RadioGroupMainLanguage` — глобален избор на език (0=BG, 1=EN)
- `RadioGroupTypeConnections` — тип връзка (0=USB, 1=LAN)
- `GroupBoxUSBConnections` / `GroupBoxNetworkConnections` — панели за свързване
- `StatusBar1: TdxStatusBar` — 10 панела за статус информация
- `GroupBoxDebug` — debug панел (скрит по подразбиране)
- `PopupMenuColors` — контекстно меню за бързо избиране (12 слота × 3 цвята)
- `DBLookupComboBoxZapper` — избор на модел устройство
- `MemoMainLogTX/RX/Event` — TX/RX/Event логове
- Бутони за Cloud операции (Start/Stop/Pause/Continue)
- Бутони за експорт на данни

### 2.2. Глобални константи

```pascal
program_version = 1.58;
max_mem = 524288;          // 512KB буфер за WiFi програмиране
defualt_cloud_port = 7433;

// Размери на записи за WiFi буфер (ESP формат)
len_categoryESP = 38;
len_diseaseESP = 92;
len_frequenceESP = 5;

// Размери на записи (стандартен формат)
len_category = 8;
len_disease = 12;
len_frequence = 5;
len_settings = 10;
```

### 2.3. Глобални променливи

**Състояние на връзката:**
- `Connection_Type: Integer` — тип връзка (-1=няма, 0=USB, 1=LAN)
- `LAN_Connection_IP: string` — IP адрес на LAN устройство
- `Connected_com_port: string` — активен COM порт
- `LastPacketPing: TDateTime` — последен получен пакет
- `LAST_NETWORK_IP`, `LAST_COM_PORT` — запомнени от предишна сесия

**Буфери:**
- `USB_Buffer: array[1..255] of Byte` — фиксиран 255-байтов буфер за USB
- `LAN_Buffer: TIdBytes` — динамичен буфер за LAN
- `buff: TBytes` — 512KB буфер за WiFi програмиране

**Настройки на устройството (byte offsets в комуникационния буфер):**
- `_Power`, `_DurationFrequenceTime`, `_Freq`, `_Zumer`, `_Sweep` — основни параметри
- `_Wifi`, `_Wifi_AP`, `_Wifi_AP_NoAct` — WiFi настройки
- `_SilverWaterStartByte`, `_CurrentSetPoint`, `_WaterQuantity`, `_SilverConcentration` — сребърна вода
- `_SilverWaterOn`, `_CurrentSence`, `_SilverWatterTime`, `_SilverWaterRemain` — статус на сребърна вода

**Стойности прочетени от устройството:**
- `GLB_Power`, `GLB_Duration`, `GLB_Zumer`, `GLB_Sweep`, `GLB_Freq` — текущи глобални стойности
- `GLB_SHORT_MAC` (4 hex символа, напр. "8031"), `GLB_FULL_MAC` (8 hex символа)
- `M_b1..M_b4` — 4 байта MAC адрес за Cloud идентификация

**Бързо избиране (Quick Programs):**
- `tID1..tID12: Integer` — ID на програми, назначени на 12 бутона
- `tTEXT1..tTEXT12: string` — текстове за 12 бутона
- `_quick_grp[1..12]`, `_quick_prog[1..12]` — category/program ID за Basic модели

**Възпроизвеждане:**
- `CategoryPlay: array[1..500] of objectProgram` — масив с програми за изпълнение
- `ALL_Frequences: array[1..500] of Integer` — честоти за текуща програма
- `state_pause`, `category_repeat`, `category_repeat_current` — състояние на възпроизвеждане
- Множество таймерни променливи за времена (AllCyclesTime_sec, ProgramTime_sec, etc.)

**Потребители:**
- `LoginUser: Integer` — ID на логнатия потребител (1 = admin)
- `LoginName: string` — име на логнатия потребител

**Cloud:**
- `_cloud_service`, `_cloud_port` — URL и порт на Cloud услугата
- `_FactoryPIN`, `_AdditionalPIN` — PIN кодове от устройството

**SMTP (hardcoded):**
- `GLOBAL_EXCH_SERVER = 'smtp.gmail.com'`
- `GLOBAL_EXCH_PORT = '587'`
- `GLOBAL_EXCH_USERNAME = 'sky.sales@sky.bg'`
- `GLOBAL_EXCH_PASSWORD = 'Sales!@23'`

### 2.4. Object тип

```pascal
objectProgram = object
  program_id: Integer;
  freq_hz: Double;
  freq_id: Integer;
  freq_sec: Integer;
  total_time_sec: Integer;
  pause_sec: Integer;
  pause_type: Integer;   // 1=pause program, 2=pause category
  pause_pass: Integer;
end;
```

### 2.5. Ключови процедури и функции

**Инициализация:**
- `FormShow` — Главна инициализация: проверка за single instance, проверка за регионални настройки, проверка за права за запис, отваряне на MDB базата (парола `Qwerty!23`), login логика, проверка за update, изпращане на telemetry към Cloud (CMD 150, 161 — OS, MAC, username, computer name, IP)

**Комуникационен протокол:**
- `PREPARE_BUFF` — зануляване на USB_Buffer[1..255], пауза 100ms за USB
- `PARSE_BUFF(message, count)` — логване на изпратен USB пакет
- `LAN_PARSE_BUFF(message, count)` — логване на изпратен LAN пакет
- `SendBufferToLAN(length)` — конвертиране на USB_Buffer → LAN_Buffer и изпращане по UDP (порт 7800), като Buffer[2] се сменя на 2 (LAN маркер)
- `SEND_Cloud(buffer)` — изпращане на UDP пакет към Cloud (`83.97.27.107:7433`)
- `VaComm1RxChar(Count)` — обработка на получени данни по USB serial
- `IdUDPServer1UDPRead(AData)` — обработка на получени данни по UDP LAN

**Идентификация на устройството (при получаване на CMD 9 = Read All):**

Отговорът има формат: `[0][0/2][137][0][MAC_b1][MAC_b2][MAC_b3][MAC_b4]...`

Устройството се идентифицира по първите 2 байта на MAC (GLB_SHORT_MAC):

| GLB_SHORT_MAC | Модел | Byte offsets |
|---|---|---|
| `8011` | Basic | Power=10, Duration=11, Zumer=14, Sweep=15, SW_Start=29 |
| `8012` | Basic + Silver Water | Същото като 8011, с активна SW секция |
| `8040` | Rev1 | Същото като 8011 |
| `8030` | WiFi | Power=54, Duration=55, Zumer=58, Sweep=59, Wifi=122, SW_Start=126 |
| `8031` | WiFi + Silver Water | Същото като 8030, SilverWaterOn=132 |
| `8041` | Rev1 + Silver | Като 8030, SilverWaterOn=132 |
| `8042` | Rev2 + Silver | Като 8030, SilverWaterOn=132 |

**Свързване:**
- `ButtonSearchZapperUSBCableClick` — сканиране на COM1..COM100 за USB устройства
- `ButtonSearchZappersNetworkClick` — сканиране на IP x.x.x.2..x.x.x.255 за LAN устройства
- `sendReadAll_USBCable(COM_Port)` — изпращане на CMD 9 (Read All) по USB: `[0][0][9][0][255][0][0]`
- `sendReadAll_Network(IP)` — изпращане на CMD 9 по UDP: `[0][2][9][0][255][0][0]`
- `try_connect(COM_Port)` — проба за свързване към конкретен COM порт
- `Check_Connect(showMsg)` — проверка дали устройството е свързано
- `Check_Zapper(showMsg)`, `Check_SilverWater(showMsg)`, `Check_ZapperWiFi(showMsg)` — проверка на възможности по модел

**Cloud автоматично нормализиране:**
При свързване, ако Cloud URL != `cloud.sky.bg`, автоматично се презаписва чрез CMD 18. Ако Cloud порт != 7433, автоматично се презаписва чрез CMD 48.

**Бързо избиране (Quick Programs):**
- `set_button_program(button, category, program)` — назначаване на програма на бутон (1-12)
- `remove_all` — изчистване на всички бързи програми
- `change_menu` — обновяване на popup менюто с текстовете на бутоните
- За Basic модели: записват се в базата чрез `favorite` полето на `diseases`
- За WiFi модели: записват се в устройството чрез CMD 16, offset=73+(button-1)*4, 4 байта (2 category + 2 program)

**Честоти:**
- `set_power_freq(ManSweep, Sweep, ManPower, Power, Frequence)` — изпращане на честота към устройството чрез CMD 26, подкоманда 10 (calibrate command)
- `Refresh_Frequences(ID)` — зареждане на честотите за програма в масива `ALL_Frequences`
- `Get_Frequence_From_Position(pos)` / `Get_Frequence_Until_Position(pos)` — изчисляване на сумарно време

**WiFi буфер (512KB):**
- `ButtonExportNewDBClick` — генериране на 512KB бинарен буфер от базата данни, структура: Settings(10b) → Categories(38b/record) → Diseases(92b/record) → Frequencies(5b/record). Имената се кодират в Win1251.
- `clear_buffer` — зануляване на 512KB буфера

**Помощни:**
- `IsProcessRunning(exeName)` — проверка дали процес е стартиран
- `RunAppAndBringToFront(exePath)` — стартиране на приложение и извеждане на преден план
- `IsUserAnAdmin`, `GetUserPrivilegeLevel` — проверка на административни права
- `GetWMIstring`, `Get_MacAddress_WMI`, `Get_Username_WMI`, `Get_OperationSystem_WMI`, `GET_COMPUTER_NAME`, `GET_LOCAL_IP` — WMI системна информация
- `Save_INI` / `Read_INI` — четене/запис в INI файл (`myapp.ini`)
- `SaveBytesToFile` — запис на бинарни данни
- `SleepSky(ms)`, `waitX(ms)` — неблокиращо чакане с Application.ProcessMessages
- `SendMail(...)` — изпращане на имейл чрез Gmail SMTP
- `LogTX`, `LogRX`, `LogEvent` — логване (ограничено до 3000 реда на memo)
- `Get_a_Bit`, `Set_a_Bit`, `Clear_a_Bit` — битови операции
- `Descriptor(row)` — текстово описание на byte offset за debug
- `isCharacters(byte)` — символ ли е (32-126)

---

## 3. uProgram.pas — Програми и възпроизвеждане

### 3.1. Клас TfProgram

Основна форма за работа с терапевтични програми.

**Грид компоненти:**
- `cxGrid4` — категории (BG/EN имена, favorite, quantity, type, pause, repeat, cycle, user_access)
- `cxGrid1` — програми в избраната категория (ID, BG/EN имена, описания, favorite, count)
- `cxGrid2` — честоти на избраната програма (freq Hz, time_sec, orderno)
- `MemoDescription` — подробно описание на програмата

**Печат:**
- `ppReport1` — ReportBuilder отчет за бързо избиране
- 12 ppLabel-а за имена (ppLabelRed1-4, ppLabelGreen1-4, ppLabelBlue1-4)
- 30 ppShape-а за цветни правоъгълници

**WiFi буфер (дублиран от uMain):**
- `ButtonPrepareBuffer`, `ButtonStartSendingBuffer`, `ButtonSendingBuffer`, `ButtonFinished`
- `AdvEditBlockPos`, `AdvEditBlockMax`, `AdvEditBufferCount`

**Възпроизвеждане:**
- `TimerOnlyTime` — таймер за визуализация на времето
- `ButtonPlayProgram` / `ButtonPlayGroup` — стартиране на единична програма или група
- `ButtonStopProgram` — спиране
- `ButtonPause` — пауза/продължи
- `ProgressBar1` — прогрес
- `RadioGroupPlayType` — тип на възпроизвеждане
- Лейбъли за време: LabelProgram, LabelCategory, LabelFrequence, LabelPause, LabelAllCycles

**Глобални променливи:**
- `cloud_program_id`, `cloud_cat_id` — ID-та за Cloud операции

### 3.2. Ключова логика

**Търсене:**
- `ButtonSearchClick` — търсене по текст в `diseases` (name_bg, name_en, description_bg, description_en) с LIKE заявка. Също изпраща търсения текст към Cloud (CMD 26, подкоманда 120, кодиран в Win1251).
- `ButtonSearchOnFreqClick` — търсене по честота
- Три режима на търсене (от `options.search`): 0=групи+програми+описания, 1=програми+описания, 2=само програми

**Показване:**
- `ButtonShowAllClick` — показва всички категории. Ако LoginUser=1 (admin), показва всички; иначе филтрира по `type_id <= 0 OR user_id=LoginUser`
- `ButtonShowQuickOnlyClick` — показва само бързо избиране

**Възпроизвеждане на програма:**
Процесът е синхронен с `SleepSky` (неблокиращо чакане). За всяка честота се извиква `set_power_freq`. При group play, минава през всички програми в категорията.

**Двуезична локализация:**
- `RadioGroupLanguageClick` — превключване на caption-ите на всички UI елементи

---

## 4. uEdit.pas — Редактор на съдържание

### 3.1. Клас TfEdit

**Категории:**
- Грид с категории (BG/EN имена, описание, брой, тип, паузи, повторения, user_access)
- `ButtonAddGroup` — добавяне: взима MAX(id)+1, записва BG/EN имена, repeat, pause, type_id (0=for all, 1=personal), user_id=LoginUser при personal
- `ButtonRemoveGroup` / `ButtonDeleteGroup` — изтриване (с потвърждение)

**Програми:**
- `ButtonNewProgram`, `ButtonDeleteProgram`, `ButtonSaveProgram` — CRUD
- `EditProgramBG/EN`, `EditDescriptionBG/EN` — полета за редакция

**Честоти:**
- `Button_freq_add` / `Button_freq_remove` — добавяне/премахване
- `ButtonChangeFreq` — промяна на time_sec на единична честота
- `Button19` / `Button24` — преместване нагоре/надолу (swap orderno)

**Свързване програма-категория:**
- `ButtonLinkClick` — INSERT в `programs_groups_connections` (category_id, program_id, sort)
- `ButtonUnlinkClick` — DELETE от `programs_groups_connections`
- Използва параметризирани заявки (`:P1`, `:P2`) — **но има бъг: `ButtonUnlinkClick` и `Button2Click` използват `:P1` за двата параметъра вместо `:P1` и `:P2`**

---

## 5. uOptions.pas — Настройки на устройството

### 5.1. Клас TfOptions

**5 таба (TabSheet):**

**Таб 1 — Общи настройки:**
- `AdvEdit_duration` — продължителност на честотата (секунди)
- `RadioGroupZumer` — зумер вкл/изкл
- `AdvEditSweep` — sweep стойност
- `RadioGroupSearch` — режим на търсене (0/1/2)
- `RadioGroupFreqOptions` — честотни опции
- `ButtonGeneralSave` — записва: CMD 16, offset=_DurationFrequenceTime (duration) + CMD 16, offset=_Zumer (zumer+sweep). Поддържа USB и LAN.
- `ButtonGeneralRead` — CMD 9 (Read All)
- `ButtonFactoryReset` — CMD 26, подкоманда 240: `[0][0][26][240][15][170][200]`

**Таб 2 — Калибровка:**
- `TimerFrequence` / `TimerPower` — таймери за стъпкова калибровка
- `ButtonCalibrateFrequence` / `ButtonCalibratePower` — начало на калибровка
- `ButtonBegin` / `ButtonNextStep` / `ButtonOK_no_more` / `ButtonStopCalibration` — контрол

**Таб 3 — Firmware:**
- `ButtonFirmwareFile` — избор на .hex файл
- `ButtonAVR_Dude` — програмиране чрез avrdude
- `ComboBoxLoader` — избор на bootloader
- `MemoFirmwareLog` — лог

**Таб 4 — WiFi настройки (видим за WiFi модели):**
- `ButtonRecieveNetworks` — сканиране за WiFi мрежи
- `ButtonConnectNetwork` — свързване (SSID + парола)
- `ButtonReadIP` — четене на IP адрес
- `ButtonReadSaveNetworks` — четене на запаметени мрежи: CMD 26, подкоманда 15
- `ButtonHotspotRead` / `ButtonHotSpotTurnOn` / `ButtonHotSpotTurnOff` — Hotspot управление: CMD 26, подкоманда 20/21/22
- `ButtonWiFiSave` — запис на WiFi настройки: CMD 16, подкоманда 122 (AP bit0, WiFi bit1, AP_sec, AP_NoAct_sec)
- `EditCloud_URL`, `EditCloud_PORT` — Cloud настройки
- `EditFactoryPIN`, `EditAdditionalPIN` — PIN кодове
- `ButtonTestDevice` / `ButtonStopTest` — тест на устройството
- `TimerWiFiRead` — таймер за периодично четене на WiFi данни

**Таб 5 — Debug:**
- `ButtonRead` — пълно четене на настройки (CMD 9)
- Grid с визуализация на всички байтове (id, dec, hex, char)
- TX/RX/Event логове с checkbox-ове
- `Button1` — запис на бинарни данни във файл (SaveBytesToFile)
- `Button15` — визуализация на 512KB буфера в grid
- `ComboBoxStandartPorts` — избор на COM порт

---

## 6. uCutomGroups.pas — Персонални списъци (Плейлисти)

### 6.1. Клас TfCustomGroups

**Управление на групи:**
- `ADOQueryCustomGroup` — заявка към `custom_groups`
- `ADOQueryCustomProgram` — заявка към `v_Custom_Groups` (view)
- `ButtonAddGroup` — добавяне на нова група
- `ButtonDeleteGroup` — изтриване (с потвърждение)

**Управление на програми в група:**
- `ButtonAddProgram` — INSERT в `custom_programs`
- `ButtonRemoveProgram` — изтриване от група
- `ButtonSearch` — търсене в базата

**Възпроизвеждане:**
Константи за състояния:
```pascal
pls_Idle = 0;
pls_Play = 1;
pls_Pause = 2;
pls_Stop = 3;
pls_Rest = 4;
```

- `ButtonPlayClick` — последователно изпълнение на всички програми в групата:
  1. `Grab_the_handles_after(10)` — 10-секундно обратно броене „хванете дръжките"
  2. За всеки repeat цикъл, за всяка програма, за всяка честота: `set_power_freq` + `SleepSkyGroup(time_sec * 1000)`
  3. Между програмите: пауза `break_sec` секунди
  4. В края: `set_power_freq(0,0,1,0,0)` — спиране
- `ButtonPause` — превключване Play/Pause чрез `PlayGroupPause`
- `ButtonStop` — спиране на изпълнението
- `TimerElipsed` — обновяване на лейбъли за прогрес

**WiFi буфер:** Дублирана логика от uProgram за подготовка и изпращане на 512KB буфер.

### 6.2. SleepSkyGroup

Специална sleep функция за групово изпълнение: проверява за Stop и Pause състояния при всяка итерация от 100ms.

---

## 7. uSrebarnaVoda.pas — Сребърна вода

### 7.1. Клас TfSrebarnaVoda

**Параметри:**
- `RadioGroupCurrentSetPoint` — ток: 2, 5, 8, 11, 14, 17, 20 mA (7 опции)
- `RadioGroupWaterQ` — количество вода: 200, 500, 1000, 2000 mL (4 опции)
- `RadioGroupSilverConcentration` — концентрация: 2, 5, 15, 100 ppm (4 опции)

**Управление:**
- `ButtonStart` — CMD 16, offset=_SilverWaterOn, value=1. Също изпраща към Cloud (CMD 26, подкоманда 95).
- `ButtonStop` — CMD 16, offset=_SilverWaterOn, value=0. Cloud: CMD 26, подкоманда 92.
- `ButtonRead` — CMD 9 (Read All), чете текущи настройки
- `ButtonWrite` — CMD 16, offset=_SilverWaterStartByte, 4 байта (ток, количество вода L/H, концентрация)

**Мониторинг:**
- `TimerRemaindTime` — интервал 3000ms, извиква `ButtonReadClick` за получаване на актуални данни
- `LabelRemainTime`, `LabelExpectTime`, `LabelPower` — визуализация
- `LabelMessage` — предупреждение при липса на ток между електродите

**Глобална променлива:** `save: Byte` — предотвратява автоматичен запис при първоначално зареждане (0=не записвай, 1=записвай)

---

## 8. uUpdateSoftware.pas — Обновяване

### 8.1. Клас TfUpdateSoftware

**Процес:**
1. `ButtonCheckNewVersion` — изтегля `https://zapper.sky.bg/software/new_versions.xml`, парсва с `TXMLDocument`, сравнява `last_version` и `last_version_db` с текущите `program_version` и `database_version`
2. `ButtonDownloadNewVesrions` — изтегля нов .exe и .mdb от URL-ите в XML каталога, именува ги с версията (напр. `SKY_Zapper1.59.exe`), създава Desktop shortcut чрез `IShellLink`

**URLs:**
- Версии XML: `https://zapper.sky.bg/software/new_versions.xml`
- Програма: `https://zapper.sky.bg/software/SKY_Zapper.exe`
- База данни: `https://zapper.sky.bg/software/SKY_Zapper.mdb`
- Web страница: `http://cloud.sky.bg/options.html`

**Зависимости:** Изисква `libeay32.dll` и `ssleay32.dll` за SSL.

---

## 9. uLogin.pas — Вход

### 9.1. Клас TfLogin

- `DBLookupComboBox1` — избор на потребител от `Users` таблицата
- `MaskEdit1` — въвеждане на парола
- `Bt_OKClick` — проверка: сравнява `ADOQueryUsers.FieldByName('pass').AsString` директно с `MaskEdit1.Text` (**plain text сравнение, без хеширане**)
- При успех: задава `LoginUser` и `LoginName` от базата
- `Bt_cancelClick` — затваря формата (без login)
- `MaskEdit1KeyPress` — ESC затваря приложението, Enter натиска OK
- `FormClose` — `Action := caFree`

### 9.2. Login логика (в FormShow на uMain)

```
Ако Users.RecordCount >= 2 ИЛИ първият потребител има парола:
    Показва login диалог
Иначе (1 потребител без парола):
    Auto-login
Ако LoginUser = 0 след опита:
    Halt(0) — затваря приложението
```

---

## 10. uChangePassword.pas — Смяна на парола

- `FormCreate` — зарежда текущия потребител: `SELECT * FROM Users WHERE ID = LoginUser`
- `BitBtn1Click` — валидация:
  1. Старата парола трябва да съвпада (plain text сравнение)
  2. Новата парола трябва да е различна от старата
  3. Повторението трябва да съвпада с новата
  4. При успех: `ADOQuery2.Edit; FieldByName('pass') := новата парола; Post`

---

## 11. uUsers.pas — Управление на потребители

- `FormShow` — зарежда `SELECT * FROM Users ORDER BY name`
- `ButtonAddGroup` — добавяне: задава `power_options = '100% пълна'`
- `ButtonDeleteGroup` — изтриване (с потвърждение)
- `CheckBoxEdit` — включва/изключва режим на редактиране в grid-a
- Локализация е закоментирана в текущата версия (целият `RadioGroupLanguageClick` е в коментар)

---

## 12. uDebug.pas — Debug

Празен stub — единствено декларира `TfDebug` без никаква функционалност.

---

## 13. Комуникационен протокол — Пълна референция

### 13.1. Формат на пакетите

**USB (Serial COM, 9600 baud):**
```
USB_Buffer[1]: Резервиран (0)
USB_Buffer[2]: Режим — 0=USB директен
USB_Buffer[3]: CMD код
USB_Buffer[4]: Под-команда или данни
USB_Buffer[5+]: Данни
```

**LAN (UDP, порт 7800):**
```
LAN_Buffer[0]: Резервиран (0)
LAN_Buffer[1]: Режим — 2=LAN relay
LAN_Buffer[2]: CMD код
LAN_Buffer[3]: Под-команда или данни
LAN_Buffer[4+]: Данни
```

### 13.2. Команди

| CMD | Подкоманда | Описание | Посока |
|-----|-----------|----------|--------|
| 9 | 0, 255 | Read All Settings | PC → Device, Device → PC |
| 16 | _DurationFrequenceTime | Запис на Duration (2 байта) | PC → Device |
| 16 | _Zumer | Запис на Zumer + Sweep | PC → Device |
| 16 | 13 | Неизвестна настройка | PC → Device |
| 16 | 18 | Cloud URL (30 байта string) | PC → Device |
| 16 | 48 | Cloud Port (2 байта) | PC → Device |
| 16 | 57 | Freq options (0=custom, 1=standard) | PC → Device |
| 16 | 73+ | Quick Programs (WiFi): offset=73+(btn-1)*4, 4 байта | PC → Device |
| 16 | 122 | WiFi настройки: AP/WiFi bits, AP_sec, AP_NoAct_sec | PC → Device |
| 16 | _SilverWaterStartByte | Silver Water: ток, количество, концентрация | PC → Device |
| 16 | _SilverWaterOn | Silver Water On/Off (0/1) | PC → Device |
| 26 | 10 | Set Power/Freq (calibrate): ManSweep, ManPower, Freq(4b), Sweep, Power | PC → Device |
| 26 | 15 | Четене на запаметени WiFi мрежи | PC → Device |
| 26 | 20 | Четене на Hotspot статус | PC → Device |
| 26 | 21 | Hotspot Turn On/Off | PC → Device |
| 26 | 26 | Cloud: параметри на програма (ID, cat, duration, freq_count, name[80]) | PC → Device |
| 26 | 27 | Cloud: честоти на програма (freq*100 4b + time/10 1b per freq) | PC → Device |
| 26 | 28 | Cloud: Start Program | PC → Device |
| 26 | 40 | Cloud: Continue Program (cat_id 2b, prog_id 2b) | PC → Device |
| 26 | 45 | Cloud: Pause Program | PC → Device |
| 26 | 46 | Cloud: Stop Program | PC → Device |
| 26 | 92 | Cloud: Stop Silver Water | PC → Cloud |
| 26 | 95 | Cloud: Start Silver Water (params) | PC → Cloud |
| 26 | 120 | Cloud: Search (Win1251 string + MAC) | PC → Cloud |
| 26 | 150 | Cloud: App Start telemetry | PC → Cloud |
| 26 | 152 | Cloud: Open Programs module | PC → Cloud |
| 26 | 153 | Cloud: Open Silver Water module | PC → Cloud |
| 26 | 154 | Cloud: Open Editor module | PC → Cloud |
| 26 | 155 | Cloud: Open Options module | PC → Cloud |
| 26 | 160 | Cloud: Open Admin module | PC → Cloud |
| 26 | 161 | Cloud: Machine info (OS, MAC, user, computer, IP) | PC → Cloud |
| 26 | 240 | Factory Reset: `[0][0][26][240][15][170][200]` | PC → Device |

### 13.3. Отговор на CMD 9 (Read All)

Отговорът започва с: `[0/2][0][137][0][MAC_b1][MAC_b2][MAC_b3][MAC_b4]`

Следват данни, чиито позиции зависят от модела (виж 2.5 за byte offsets).

**Допълнителна информация (за WiFi модели):**
- Байтове 6-11: Factory PIN
- Байтове 12-17: Additional PIN
- Байтове 18-47: Cloud Service URL (string)
- Байтове 48-49: Cloud Port (Word)
- Байтове 54+: Power, Duration, Freq, Zumer, Sweep...
- Байтове 60-72: Frequency Power Map (за различни честотни диапазони)
- Байтове 73-120: Quick Programs (12 слота × 4 байта: 2b category + 2b program)
- Байтове 122-124: WiFi настройки
- Байтове 126+: Silver Water параметри

---

## 14. База данни — Референция

### 14.1. Файл и достъп

- **Файл:** `SKY_Zapper.mdb` (Microsoft Access)
- **Парола:** `Qwerty!23` (hardcoded)
- **Provider:** `Microsoft.Jet.OLEDB.4.0`
- **Connection string:** `Provider=Microsoft.Jet.OLEDB.4.0;Data Source=<path>;Persist Security Info=False;Jet OLEDB:Database Password=Qwerty!23`
- При стартиране първо търси `SKY_Zapper<version>.mdb`, после `SKY_Zapper.mdb`

### 14.2. Таблици и полета (установени от кода)

| Таблица | Полета | Употреба в кода |
|---------|--------|-----------------|
| `diseases` | id, name_bg, name_en, description_bg, description_en, favorite, sort, category_id | Програми. `favorite` се използва за quick programs (0=няма, 11-22=бутон). |
| `freq` | id, freq (Double), time_sec, orderno, disease_id | Честоти на програма. orderno определя реда. |
| `category` | id, category_name_BG, category_name_EN, favorite, repeat, pause_program, pause_repeat_cycle, type_id, user_id, sort | Категории. type_id: -1=system, 0=for all, 1=personal. |
| `Users` | id, name, pass, power_options | Потребители. pass е plain text. |
| `options` | program_sec, power, com_port, search, MAC, db_ver, network_ip | Глобални настройки (1 запис). |
| `programs_groups_connections` | category_id, program_id, sort | M:N връзка категория-програма. |
| `custom_groups` | id, name, sort | Персонални списъци. |
| `custom_programs` | group_id, program_id, sort | Програми в персонален списък. |
| `usage_log` | date_time_start, date_time_end, user_id, program_id, duration_sec | Лог за използване (не се попълва в текущия код). |

### 14.3. Views (очаквани от кода)

- `v_diseases` — view за програми (използва се в търсене и показване)
- `v_category` — view за категории
- `v_Custom_Groups` — view за персонални групи с join към diseases
- `v_diseases_personal` — view за лични програми (закоментиран в кода)
- `v_programming` — view за програмиране

### 14.4. SQL заявки — примери от кода

```sql
-- Търсене на програми
SELECT * FROM diseases WHERE name_en LIKE '%text%' OR name_bg LIKE '%text%'
  OR description_en LIKE '%text%' OR description_bg LIKE '%text%' ORDER BY name_bg

-- Категории за потребител
SELECT * FROM category WHERE type_id <= 0 OR (user_id=LoginUser) ORDER BY type_id DESC, sort, category_name_BG

-- Честоти за програма
SELECT * FROM freq WHERE disease_id=:id ORDER BY orderno

-- Персонални програми
SELECT * FROM v_Custom_Groups WHERE group_id=:id ORDER BY sort, name_bg

-- Link програма-категория
INSERT INTO programs_groups_connections (category_id, program_id, sort) VALUES (:cat, :prog, :sort)

-- Бързо избиране
UPDATE diseases SET favorite=0 WHERE favorite=:button+10
UPDATE diseases SET favorite=:button+10 WHERE id=:program_id
```

**Забележка:** Част от заявките са с директна string конкатенация (`'...WHERE id='+IntToStr(x)`), което е SQL injection риск, макар и минимален при Access + локално приложение. Някои заявки (в uEdit) правилно използват параметри (`:P1`, `:P2`).

---

## 15. Локализация

- Двуезичен интерфейс: Български (0) и Английски (1)
- Всяка форма има собствен `RadioGroupLanguage` синхронизиран с `fMain.RadioGroupMainLanguage.ItemIndex`
- Локализацията е hardcoded — всеки caption се задава в `RadioGroupLanguageClick` процедурата
- Кодиране: Win1251 за протокола, Unicode за UI
- Конверсия: `type Win1251String = type AnsiString(1251)` — използва се при изпращане към устройството

---

## 16. Зависимости от трети страни

| Компонент | Употреба |
|-----------|----------|
| `VaComm` (VaClasses) | Serial COM порт |
| `DevExpress cxGrid` | Grid-ове навсякъде |
| `DevExpress dxStatusBar` | StatusBar |
| `DevExpress dxSkins` | UI теми |
| `TMS AdvToolBar/AdvEdit` | Toolbar и разширени полета |
| `Indy (Id*)` | HTTP, UDP, SMTP, SSL, IPWatch |
| `ReportBuilder (pp*)` | Печат на отчети |
| `VirtualTable (MemDS)` | In-memory таблици за USB_Zappers, LAN_Zappers, Export, etc. |
| `HTMLabel` | HTML етикет с линк (в Update) |

---

## 17. Известни проблеми в кода

1. **Plain text пароли** — `Users.pass` се съхранява и сравнява без хеширане
2. **Hardcoded SMTP credentials** — `sky.sales@sky.bg` / `Sales!@23` в SendMail
3. **SQL injection рискове** — много заявки с директна string конкатенация
4. **Hardcoded MDB парола** — `Qwerty!23`
5. **Параметър бъг в uEdit** — `ButtonUnlinkClick` използва `:P1` за двата параметъра (вместо `:P1` и `:P2`)
6. **Дублиране на код** — VaComm1RxChar и IdUDPServer1UDPRead съдържат почти идентична логика (~1000 реда всеки)
7. **Cloud IP hardcoded** — `83.97.27.107:7433` в SEND_Cloud
8. **uDebug е празен stub** — не съдържа функционалност
9. **usage_log не се попълва** — таблицата съществува но не се записва
10. **Commented-out код** — значително количество закоментиран код навсякъде
11. **Автоматично нормализиране на Cloud URL/Port** — при свързване, ако устройството има различен Cloud URL или порт, автоматично се презаписва без потвърждение от потребителя
