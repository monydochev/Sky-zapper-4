# SKY Zapper Flutter — Product Requirements Document (PRD)

**Версия на документа:** 2.0
**Дата:** 9 март 2026
**Продукт:** SKY Zapper (Flutter)
**Производител:** SKY Company Ltd
**Предишна версия:** 1.58 (Delphi VCL, Windows-only)
**Версия на базата данни:** 2.01 (мигрирана в SQLite)

---

## 1. Обзор на продукта

### 1.1. Какво е SKY Zapper

SKY Zapper е cross-platform приложение за управление и програмиране на биорезонансни терапевтични устройства, произведени от SKY Company Ltd. Новата версия е пълно пренаписване от Delphi VCL (Windows-only) на **Flutter** с **SQLite** база данни.

Приложението позволява на потребителите да:

- Свързват се с физически устройства (zappers) по USB кабел (само desktop) или WiFi/LAN мрежа
- Избират и изпълняват терапевтични програми от база данни с над 6100 програми
- Конфигурират параметрите на устройствата (мощност, честота, продължителност)
- Създават персонални списъци с програми (плейлисти)
- Управляват функцията за производство на сребърна вода (при поддържащи модели)
- Програмират устройства с бързи програми (Quick Programs)
- Обновяват софтуера и базата данни от интернет
- Управляват потребители и права за достъп

### 1.2. Целева аудитория

- Терапевти и практикуващи специалисти по биорезонансна терапия
- Крайни потребители, притежаващи SKY Zapper устройства
- Администратори и техници за поддръжка на устройствата

### 1.3. Целеви платформи

| Платформа | Приоритет | Комуникация с устройство |
|-----------|-----------|--------------------------|
| **Android** | Висок | WiFi/LAN (UDP) |
| **iOS** | Висок | WiFi/LAN (UDP) |
| **Windows** | Висок | USB Serial + WiFi/LAN |
| **macOS** | Среден | USB Serial + WiFi/LAN |

> **Бележка:** USB Serial комуникацията е достъпна само на Desktop платформите. Мобилните устройства поддържат единствено WiFi/LAN свързване.

### 1.4. Технологичен стек

| Компонент | Технология |
|-----------|------------|
| Framework | Flutter (Dart) |
| База данни | SQLite чрез `sqflite` |
| State Management | Riverpod |
| UI дизайн | Material Design 3 |
| Тема | Само Light mode |
| Локализация | BG + EN (i18n-ready за бъдещи езици) |
| Дистрибуция | Директно сваляне (APK / IPA / EXE) |

---

## 2. Поддържани устройства (Zapper модели)

| Модел ID | Наименование | Свързване | Сребърна вода | Бележки |
|----------|-------------|-----------|---------------|---------|
| 8011 | Basic | USB (COM порт) | Не | Базов модел, само Desktop |
| 8012 | Basic + Silver Water | USB (COM порт) | Да | Базов + електролиза, само Desktop |
| 8030 | WiFi | LAN/WiFi (UDP) | Не | Мрежов модел, всички платформи |
| 8031 | WiFi + Silver Water | LAN/WiFi (UDP) | Да | Мрежов + сребърна вода, всички платформи |
| 8040 | Rev1 | USB (COM порт) | Не | Подобрен хардуер, само Desktop |
| 8041 | Rev1 + Silver Water | USB (COM порт) | Да | Rev1 + сребърна вода |
| 8042 | Rev2 + Silver Water | USB (COM порт) | Да | Последна ревизия + сребърна вода |

### 2.1. Разлики между моделите

- **Basic модели (8011, 8012, 8040):** USB Serial комуникация, стандартни byte offsets (Power=10, Duration=11, Zumer=14)
- **WiFi модели (8030, 8031, 8041, 8042):** UDP комуникация на порт 7800, различни byte offsets (Power=54, Duration=55, Zumer=58)
- **Модели със Silver Water (суфикс +SW):** Допълнителни байтове за управление на електролизата
- **На мобилни устройства:** Достъпни са само WiFi модели (8030, 8031, 8041, 8042)

### 2.2. Идентификация на устройството

Устройството се разпознава по първите 4 hex символа от MAC адреса (`GLB_SHORT_MAC`):

| GLB_SHORT_MAC | Модел | Byte Offsets (Power/Duration/Zumer/Sweep) |
|---|---|---|
| `8011` | Basic | 10 / 11 / 14 / 15 |
| `8012` | Basic + SW | 10 / 11 / 14 / 15 |
| `8040` | Rev1 | 10 / 11 / 14 / 15 |
| `8030` | WiFi | 54 / 55 / 58 / 59 |
| `8031` | WiFi + SW | 54 / 55 / 58 / 59 |
| `8041` | Rev1 + SW | 54 / 55 / 58 / 59 |
| `8042` | Rev2 + SW | 54 / 55 / 58 / 59 |

---

## 3. Комуникационен протокол

### 3.1. Транспортен слой

#### USB комуникация (само Desktop)
- **Интерфейс:** Серийен COM порт (Virtual COM Port)
- **Скорост:** 9600 baud
- **Flutter пакет:** `flutter_libserialport` или `usb_serial`
- **Буфер:** 255 байта фиксиран масив

#### LAN/WiFi комуникация (всички платформи)
- **Протокол:** UDP
- **Порт:** 7800
- **Dart:** `RawDatagramSocket` от `dart:io`
- **Откриване:** UDP broadcast за автоматично намиране на устройства

### 3.2. Формат на пакетите

```
Байт 0: Резервиран (0)
Байт 1: Режим — 0 = USB директен, 2 = LAN relay
Байт 2: Команден код (CMD)
Байт 3: Под-команда или начало на данни
Байт 4+: Променливи данни
```

### 3.3. Командни кодове

| CMD | Подкоманда | Описание | Посока |
|-----|-----------|----------|--------|
| 9 | 0 / 255 | Прочети всички настройки (Read All) | PC → Device |
| 16 | _DurationFrequenceTime | Запис на Duration (2 байта LE) | PC → Device |
| 16 | _Zumer | Запис на Zumer + Sweep | PC → Device |
| 16 | 18 | Cloud URL (30 байта null-padded string) | PC → Device |
| 16 | 48 | Cloud Port (2 байта LE) | PC → Device |
| 16 | 73+(slot-1)*4 | Quick Programs запис (WiFi): 2B category + 2B program | PC → Device |
| 16 | 122 | WiFi настройки (AP/WiFi bits + таймаути) | PC → Device |
| 16 | _SilverWaterStartByte | Silver Water параметри | PC → Device |
| 16 | _SilverWaterOn | Silver Water On/Off (0/1) | PC → Device |
| 26 | 10 | Set Power/Freq: ManSweep, Sweep, ManPower, Power, Freq×100 (4B LE) | PC → Device |
| 26 | 15 | Четене на запаметени WiFi мрежи | PC → Device |
| 26 | 17 | Сканиране за налични WiFi мрежи | PC → Device |
| 26 | 18 | Свързване към WiFi: SSID + chr(13) + password | PC → Device |
| 26 | 20 | Четене на Hotspot статус | PC → Device |
| 26 | 21 | Hotspot On/Off | PC → Device |
| 26 | 25 | Четене на Program IDs от устройство | PC → Device |
| 26 | 26 | Четене на Category IDs от устройство | PC → Device |
| 26 | 50 | Block transfer: начало на firmware буфер | PC → Device |
| 26 | 51 | Block transfer: изпращане на блок (128B) | PC → Device |
| 26 | 52 | Block transfer: край | PC → Device |
| 26 | 60 | Ping/heartbeat | PC → Device |
| 26 | 240 | Factory Reset: payload [15, 170, 200] | PC → Device |

### 3.4. Отговори от устройството

| Байт[0/2] | Байт[2] | Байт[3] | Значение |
|---|---|---|---|
| 0/2 | 137 | 0 | Status/Ping — пълно състояние (137+ байта) |
| 0/2 | 208 | - | Грешка (write failed) |
| 0/2 | 144 | - | Успех (write acknowledged) |
| 0/2 | 26 | 7 | Ready за firmware upload |
| 0/2 | 26 | 60 | Ping echo |
| 0/2 | 154 | 50 | Block transfer: ready за следващ блок |
| 0/2 | 154 | 51 | Block transfer: блок получен OK |
| 0/2 | 154 | 52 | Block transfer: грешка |
| 0/2 | 154 | 6 | Програма записана успешно |
| 0/2 | 154 | 15 | Запаметени мрежи |
| 0/2 | 154 | 16 | Текущ WiFi статус |
| 0/2 | 154 | 17 | Налични мрежи (SSID-та) |
| 0/2 | 154 | 20 | Hotspot статус |
| 0/2 | 154 | 25 | Program IDs от устройството |
| 0/2 | 154 | 26 | Category IDs от устройството |

### 3.5. Полета за настройки

| Параметър | Описание | Диапазон |
|-----------|----------|----------|
| Power | Мощност на устройството | 1-100% |
| Duration | Продължителност на всяка честота | В секунди |
| Zumer | Звуков сигнал | 0=изкл, 1=при смяна на програма, 2=при смяна на програма+честота |
| Sweep | Честотен sweep | В секунди |
| WiFi | WiFi вкл/изкл | 0/1 |
| WiFi_AP | Таймаут на Access Point | В секунди |
| WiFi_AP_NoAct | Изключване при неактивност | В секунди |

### 3.6. Полета за сребърна вода

| Параметър | Описание | Стойности |
|-----------|----------|-----------|
| CurrentSetPoint | Ток на електролизата | 2, 5, 8, 11, 14, 17, 20 mA |
| WaterQuantity | Количество вода | 200, 500, 1000, 2000 mL |
| SilverConcentration | Концентрация | 2, 5, 15, 100 ppm |
| SilverWaterOn | Статус | 0 = спрян, 1 = стартиран |
| CurrentSence | Текущ измерен ток | Реално време (стойност/100 = mA) |
| SilverWatterTime | Очаквано време | В секунди (int32 LE) |
| SilverWaterRemain | Оставащо време | В секунди (int32 LE) |

### 3.7. Status Packet Structure (CMD 9 отговор)

**WiFi модели (8030, 8031, 8041, 8042):**

| Offset | Поле |
|--------|------|
| 0-3 | MAC байтове 1-4 |
| 4-5 | Сериен номер (LE) |
| 6-11 | Factory PIN (ASCII) |
| 12-17 | Additional PIN |
| 18-47 | Cloud URL (null-padded, max 30 chars) |
| 48-49 | Cloud Port (uint16 LE) |
| 54 | Power |
| 55-56 | Duration (uint16 LE) |
| 57 | Freq |
| 58 | Zumer |
| 59 | Sweep |
| 60-72 | Power calibration table (11 bytes) |
| 73-120 | 12 Quick-Access Slots × 4B (2B category + 2B program) |
| 122-124 | WiFi настройки |
| 126 | CurrentSetPoint |
| 127-128 | WaterQuantity (LE) |
| 129 | SilverConcentration |
| 132 | SilverWaterOn |
| 133-134 | CurrentSence (LE) |
| 135-138 | SilverWatterTime (int32 LE) |
| 139-142 | SilverWaterRemain (int32 LE) |

**Basic модели (8011, 8012, 8040):**

| Offset | Поле |
|--------|------|
| 10 | Power |
| 11-12 | Duration (LE) |
| 13 | Freq |
| 14 | Zumer |
| 15 | Sweep |
| 29 | CurrentSetPoint |
| 30-31 | WaterQuantity (LE) |
| 32 | SilverConcentration |
| 34 | SilverWaterOn |
| 35-36 | CurrentSence (LE) |
| 37-40 | SilverWatterTime (int32 LE) |
| 41-44 | SilverWaterRemain (int32 LE) |

### 3.8. Cloud телеметрия

- **Протокол:** UDP
- **Адрес:** `cloud.sky.bg` (hardcoded IP: `83.97.27.107`)
- **Порт:** 7433
- **Формат:** `[3, 0, 26, <event_code>, <data...>, M_b1, M_b2, M_b3, M_b4]`

| Код | Събитие |
|-----|---------|
| 90 | Честота стартирана |
| 91 | Пауза |
| 92 | Стоп |
| 94 | Продължаване |
| 95 | Silver Water стартирана |
| 101 | Favorite маркиран/демаркиран |
| 120 | Търсене извършено |
| 150 | App Start telemetry |
| 161 | Machine info (OS, MAC, user, IP) |

### 3.9. WiFi буфер за програмиране (512KB)

**Максимален размер:** 524,288 байта

**Структура на записите (ESP формат):**

| Тип | Дължина | Описание |
|-----|---------|----------|
| Category | 38 B | id(2) + repeat(1) + pause_program(2) + pause_repeat_cycle(2) + name_BG(30, Win1251) + terminator(1) |
| Disease/Program | 92 B | id(2) + category_id(2) + color_group(1) + name_BG(30, Win1251) + freq_count(1) + freq_data(56) |
| Frequency | 5 B | freq_Hz(2, LE) + time_sec(3, LE) |

**Трансфер протокол (WiFi блоков трансфер):**

1. CMD 26/50 — начало (изпращане на общ размер)
2. Device отговаря 154/50 → изпращане на първи 128B блок чрез CMD 26/51
3. Device отговаря 154/51 → изпращане на следващ блок
4. След последния блок: CMD 26/52 (край)
5. Device отговаря 154/6 при успех или 154/52 при грешка

**Кодиране:** Win1251 за всички стрингове в протокола.

---

## 4. База данни

### 4.1. Реализация

- **Формат:** SQLite 3.x (`SKY_Zapper.sqlite`)
- **Размер:** ~2.8 MB
- **Стратегия:** Bundled asset — базата се вгражда в приложението
- **Flutter пакет:** `sqflite`
- **Потребителски данни:** Записват се в локалната копия на SQLite файла

### 4.2. Таблици

| Таблица | Записи | Описание |
|---------|--------|----------|
| **diseases** | 6,163 | Терапевтични програми |
| **freq** | 46,253 | Честоти за всяка програма |
| **category** | 86 | Категории/групи |
| **programs_groups_connections** | 772 | M:N връзка програма-категория |
| **Users** | 5 | Потребителски акаунти |
| **options** | 1 | Глобални настройки |
| **custom_groups** | 0 | Персонални списъци |
| **custom_programs** | 0 | Програми в персоналните списъци |
| **usage_log** | 0 | Лог за използване |

### 4.3. Схема на таблиците

#### diseases
```sql
CREATE TABLE diseases (
  id INTEGER PRIMARY KEY,
  name_en TEXT,
  name_bg TEXT,
  description_en TEXT,
  description_bg TEXT,
  favorite INTEGER DEFAULT 0,
  category_id INTEGER DEFAULT 0,
  sort INTEGER,
  freq_count INTEGER DEFAULT 0,  -- поддържа се от тригери
  gid INTEGER,                    -- синхронизирано с category_id чрез тригери
  prog INTEGER DEFAULT 0
);
```

#### freq
```sql
CREATE TABLE freq (
  id INTEGER PRIMARY KEY,
  freq REAL,           -- честота в Hz (0.0 до 24,750,000.0)
  orderno INTEGER,     -- ред в програмата
  time_sec INTEGER,    -- продължителност в секунди (0-180)
  disease_id INTEGER   -- FK → diseases.id
);
```

#### category
```sql
CREATE TABLE category (
  id INTEGER PRIMARY KEY,
  category_name_BG TEXT,
  category_name_EN TEXT,
  favorite INTEGER DEFAULT 0,
  repeat INTEGER DEFAULT 0,           -- брой повторения
  pause_program INTEGER DEFAULT 0,    -- пауза между програми (сек)
  pause_repeat_cycle INTEGER DEFAULT 0, -- пауза между цикли (сек)
  user_id INTEGER,                     -- FK → Users.id (за лични категории)
  sort INTEGER,
  type_id INTEGER DEFAULT -1,         -- -1=system, 0=for all, 1=personal
  type_user_id INTEGER DEFAULT -1,    -- синхронизирано с type_id
  program_count INTEGER DEFAULT 0
);
```

#### programs_groups_connections
```sql
CREATE TABLE programs_groups_connections (
  id INTEGER PRIMARY KEY,
  category_id INTEGER,  -- FK → category.id
  program_id INTEGER,   -- FK → diseases.id
  sort INTEGER
);
```

#### Users
```sql
CREATE TABLE Users (
  id INTEGER PRIMARY KEY,
  name TEXT,
  power_options TEXT,
  pass TEXT  -- plain text (запазено от legacy)
);
```

#### options
```sql
CREATE TABLE options (
  program_sec INTEGER PRIMARY KEY,  -- default duration per freq (30)
  power INTEGER,                    -- power level (50)
  com_port TEXT,
  search INTEGER,                   -- search mode (0/1/2)
  MAC TEXT,                         -- last connected device MAC
  db_ver REAL,                      -- database version (2.01)
  network_ip TEXT                   -- last connected IP
);
```

#### custom_groups
```sql
CREATE TABLE custom_groups (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  sort INTEGER NOT NULL DEFAULT 0,
  user_id INTEGER NOT NULL  -- FK → Users.id
);
```

#### custom_programs
```sql
CREATE TABLE custom_programs (
  id INTEGER PRIMARY KEY,
  group_id INTEGER NOT NULL,   -- FK → custom_groups.id
  program_id INTEGER NOT NULL, -- FK → diseases.id
  sort INTEGER NOT NULL DEFAULT 0,
  program_count INTEGER DEFAULT 0,
  program_pause INTEGER DEFAULT 0
);
```

#### usage_log
```sql
CREATE TABLE usage_log (
  id INTEGER PRIMARY KEY,
  date_time_start TEXT,
  date_time_end TEXT,
  user_id INTEGER,
  program_id INTEGER,
  duration_sec INTEGER
);
```

### 4.4. Views

| View | Описание |
|------|----------|
| `v_diseases` | Обвивка на diseases с COALESCE defaults |
| `v_category` | Обвивка на category с COALESCE defaults |
| `v_diseases_personal` | JOIN programs_groups_connections с diseases |
| `v_Custom_Groups` | JOIN custom_programs с diseases |
| `v_programming` | Diseases с prog = 1 |

### 4.5. Тригери (9 броя)

- **diseases ↔ gid/category_id sync** (3): Автоматична синхронизация на gid и category_id полетата
- **category type_id ↔ type_user_id sync** (3): Автоматична синхронизация на type полетата
- **freq_count auto-refresh** (3): Автоматично преизчисляване на diseases.freq_count при INSERT/UPDATE/DELETE на freq

### 4.6. Двуезично съдържание

- Всички програми и категории имат полета на български (`_bg` / `_BG`) и английски (`_en` / `_EN`)
- Кодиране в протокола: Win1251 (задължително за комуникация с устройството)

---

## 5. Функционални модули

### 5.1. Навигация (Flutter)

Замяна на MDI архитектурата с Flutter навигация:

```
BottomNavigationBar / NavigationRail (desktop)
├── Програми (Programs)        — основен екран
├── Плейлисти (Custom Groups)  — персонални списъци
├── Сребърна вода (Silver Water) — видим само при +SW модели
├── Редактор (Editor)           — управление на съдържанието
└── Настройки (Settings)        — конфигурация + потребители + обновяване
```

### 5.2. Свързване с устройство (Connection Screen)

#### 5.2.1. USB (само Desktop)
- Сканиране на COM портове (COM1-COM100)
- Изпращане на ping `[0, 0, 26, 60]` на всеки порт при 9600 baud
- Очакване на echo `_read[2]=26, _read[3]=60`
- Показване на открити устройства в списък

#### 5.2.2. WiFi/LAN (всички платформи)
- UDP broadcast на IP range x.x.x.2 до x.x.x.255, порт 7800
- Получаване на отговори и добавяне в списък
- Показване на MAC адрес и IP за всяко устройство

#### 5.2.3. Автоматично свързване
- При стартиране опит за свързване към последно използваното устройство
- Запомняне на com_port и network_ip в options таблицата
- Периодична проверка на връзката (heartbeat)

#### 5.2.4. Индикация за връзка
- Постоянен индикатор в AppBar/StatusBar: свързано/несвързано
- Тип на връзката (USB/WiFi) и MAC адрес
- Модел на устройството

### 5.3. Програми (Programs Screen)

#### 5.3.1. Три-панелен layout
- **Ляв панел / Drawer:** Категории (86 записа)
- **Централен панел:** Програми в избраната категория
- **Десен панел / Bottom Sheet:** Честоти на избраната програма + описание

На мобилни устройства панелите се показват последователно с навигация назад.

#### 5.3.2. Търсене
- Търсене по текст в name_bg, name_en, description_bg, description_en (LIKE заявка)
- Търсене по честота (числово поле)
- Три режима: 0=групи+програми+описания, 1=програми+описания, 2=само програми
- Изпращане на търсения текст към Cloud (CMD 26, подкоманда 120)

#### 5.3.3. Възпроизвеждане (Playback)

**Единична програма:**
1. Зареждане на честоти: `SELECT * FROM freq WHERE disease_id=:id ORDER BY orderno`
2. За всяка честота: `set_power_freq(0, GLB_Sweep, 0, GLB_Power, freq_hz * 100)`
3. Изчакване на `time_sec` секунди
4. Преминаване към следващата честота
5. Изпращане на Cloud event при старт (90), пауза (91), стоп (92), продължи (94)

**Група програми:**
1. Зареждане на всички програми в категорията
2. За всяка програма — изпълнение на всичките й честоти
3. Пауза `pause_program` секунди между програмите
4. Повторение `repeat` пъти с пауза `pause_repeat_cycle` между циклите
5. UI показва: текуща програма, текуща честота, оставащо време, общо време, цикъл X/Y

**Контроли:**
- Play / Pause / Stop бутони
- ProgressBar за визуален прогрес
- Таймер за оставащо време

**Dart имплементация:**
```dart
class PlaybackState {
  int programId;
  double freqHz;
  int freqId;
  int freqSec;
  int totalTimeSec;
  int pauseSec;
  int pauseType;  // 0=program pause, 1=cycle pause
  int pausePass;
}
```
Използва се `Timer.periodic(Duration(seconds: 1), ...)` за обратно броене.

#### 5.3.4. Бързо избиране (Quick Programs) — 12 слота

12 бутона в 3 цветови групи:
- **RED** 1-4
- **GREEN** 1-4
- **BLUE** 1-4

**За WiFi модели:** Записват се в устройството чрез CMD 16, offset=73+(slot-1)*4

**За Basic модели:** Записват се в базата чрез `diseases.favorite` (1-12 = слотове)

#### 5.3.5. WiFi буфер програмиране
- Подготовка на 512KB бинарен буфер от базата данни
- Блоков трансфер към устройството (128B на блок)
- Прогрес индикатор (текущ блок / общо блокове)

#### 5.3.6. Печат
- Генериране на PDF отчет с Quick Programs layout (12 слота × 3 цвята)
- Flutter пакет: `pdf` + `printing`

### 5.4. Редактор (Editor Screen)

#### 5.4.1. Управление на категории
- Grid/ListView с категории (BG/EN имена, брой програми, тип, паузи, повторения)
- Добавяне на нова категория (BG/EN имена, repeat, pause, type_id)
- Изтриване на категория (с потвърждение)
- Редактиране на настройки (repeat, pause_program, pause_repeat_cycle)
- type_id: 0=за всички, 1=лична (user_id=LoginUser)

#### 5.4.2. Управление на програми
- Създаване на нова програма (ID = 61000+, BG/EN имена и описания)
- Изтриване на програма
- Редактиране на име и описание

#### 5.4.3. Управление на честоти
- Добавяне на честота (Hz + продължителност в секунди)
- Изтриване на честота
- Промяна на time_sec (единична или всички наведнъж)
- Пренареждане (промяна на orderno)

#### 5.4.4. Свързване програма-категория
- Link: `INSERT INTO programs_groups_connections (category_id, program_id, sort)`
- Unlink: `DELETE FROM programs_groups_connections WHERE id=:id`

#### 5.4.5. Права за достъп
- Админ (LoginUser=1): вижда всички категории, може да задава type_id
- Обикновен потребител: вижда само type_id<=0 или user_id=LoginUser

### 5.5. Персонални списъци / Плейлисти (Custom Groups Screen)

#### 5.5.1. Управление на групи
- Създаване на нова група (име, user_id=LoginUser)
- Изтриване на група
- Списък с групи за текущия потребител

#### 5.5.2. Управление на програми в група
- Търсене на програми от базата
- Добавяне на програма към групата
- Премахване на програма от групата
- Пренареждане

#### 5.5.3. Възпроизвеждане на плейлист
- Състояния: Idle → Play → Pause → Stop
- 10-секундно обратно броене преди старт ("хванете дръжките")
- Последователно изпълнение на всички програми и честоти
- Пауза между програми (настройваема)
- Повторение на целия цикъл
- UI: текуща програма, текуща честота, оставащо време, прогрес

#### 5.5.4. WiFi буфер
- Същата логика за подготовка и блоков трансфер като в Programs

### 5.6. Сребърна вода (Silver Water Screen)

> **Видимост:** Екранът се показва само за модели с поддръжка на Silver Water (8012, 8031, 8041, 8042).

#### 5.6.1. Настройки
- **Ток:** 2, 5, 8, 11, 14, 17, 20 mA (RadioGroup / SegmentedButton)
- **Количество вода:** 200, 500, 1000, 2000 mL
- **Концентрация:** 2, 5, 15, 100 ppm

#### 5.6.2. Управление
- **Start:** CMD 16 → _SilverWaterStartByte (записва параметри) → CMD 16 → _SilverWaterOn=1
- **Stop:** CMD 16 → _SilverWaterOn=0
- **Read:** CMD 9 (Read All)
- **Cloud events:** 95 при старт, 92 при стоп

#### 5.6.3. Мониторинг
- Polling на всеки 3 секунди чрез CMD 9
- Показване на: текущ ток (mA), очаквано време, оставащо време
- Предупреждение при CurrentSence < 30 (липса на ток)

#### 5.6.4. Предупреждение при липса на ток
- Проверка за вода в чашата
- Проверка за прекъснат кабел
- Проверка за свързани гнезда
- Препоръка за добавяне на сода при ниска минерализация

### 5.7. Настройки (Settings Screen)

#### 5.7.1. Общи настройки
- Duration — продължителност на честотата (секунди)
- Zumer — звуков сигнал (0/1/2)
- Sweep — честотен sweep (секунди)
- Режим на търсене (0/1/2)
- Запис (CMD 16) и Четене (CMD 9) на настройки

#### 5.7.2. Калибровка (Desktop only)
- 12-стъпкова калибровка на мощност
- Калибровка на честота
- Визуализация на таблица с калибровъчни стойности

#### 5.7.3. WiFi настройки (само за WiFi модели)
- Сканиране за WiFi мрежи
- Свързване към мрежа (SSID + парола)
- Четене на текущ IP, маска, gateway, DNS
- Hotspot управление (On/Off)
- WiFi On/Off при стартиране
- AP таймаут и неактивност
- Cloud URL и Cloud Port
- Factory PIN и Additional PIN (read-only)

#### 5.7.4. Debug (опционално, скрит по подразбиране)
- TX/RX лог на комуникацията
- Hex/Dec визуализация на буфера
- Factory Reset (CMD 26/240 с magic bytes [15, 170, 200])

#### 5.7.5. Потребителско управление
- Списък с потребители
- Добавяне / изтриване на потребител
- Смяна на потребител (re-login)
- Смяна на парола

#### 5.7.6. Обновяване на софтуера
- Проверка за нови версии: GET `https://zapper.sky.bg/software/new_versions.xml`
- Парсване на XML, сравнение на версии
- Показване на changelog
- Изтегляне на нов APK/IPA/EXE и нова SQLite база

---

## 6. Локализация

### 6.1. Поддържани езици

| Език | Код | Статус |
|------|-----|--------|
| Български | bg | Пълен (по подразбиране) |
| Английски | en | Пълен |

### 6.2. i18n архитектура

- Flutter `intl` пакет с ARB файлове
- `flutter_localizations` за Material компоненти
- Данните (програми, категории) са двуезични в базата — показват се според езика
- Протоколът изисква Win1251 — конверсия при изпращане към устройство
- Архитектурата е готова за лесно добавяне на нови езици (DE, RU и др.)

---

## 7. Архитектура на приложението

### 7.1. Файлова структура (предложена)

```
lib/
├── main.dart
├── app.dart                          — MaterialApp, theme, routing
├── l10n/                             — ARB файлове за локализация
│   ├── app_bg.arb
│   └── app_en.arb
├── core/
│   ├── constants.dart                — Protocol constants, buffer sizes
│   ├── theme.dart                    — Material Design 3 тема (SKY сини тонове)
│   └── extensions.dart               — Dart extension methods
├── data/
│   ├── database/
│   │   ├── database_helper.dart      — sqflite setup, bundled asset copy
│   │   └── migrations.dart           — DB migration logic
│   ├── models/
│   │   ├── disease.dart              — Program model
│   │   ├── frequency.dart            — Frequency model
│   │   ├── category.dart             — Category model
│   │   ├── user.dart                 — User model
│   │   ├── custom_group.dart         — Custom group model
│   │   ├── options.dart              — Options model
│   │   └── device_state.dart         — Device state model
│   └── repositories/
│       ├── disease_repository.dart
│       ├── frequency_repository.dart
│       ├── category_repository.dart
│       ├── user_repository.dart
│       ├── custom_group_repository.dart
│       └── options_repository.dart
├── device/
│   ├── protocol/
│   │   ├── packet_builder.dart       — Build command packets
│   │   ├── packet_parser.dart        — Parse response packets
│   │   ├── commands.dart             — CMD constants
│   │   └── byte_offsets.dart         — Model-specific offsets
│   ├── transport/
│   │   ├── usb_transport.dart        — USB Serial (desktop only)
│   │   ├── lan_transport.dart        — UDP transport
│   │   └── transport_interface.dart  — Abstract transport layer
│   ├── discovery/
│   │   ├── usb_scanner.dart          — COM port scanner
│   │   └── lan_scanner.dart          — UDP broadcast scanner
│   ├── cloud/
│   │   └── cloud_telemetry.dart      — UDP telemetry to cloud.sky.bg
│   └── buffer/
│       ├── firmware_buffer.dart      — 512KB buffer builder
│       └── block_transfer.dart       — Block transfer protocol
├── features/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── change_password_screen.dart
│   │   └── auth_provider.dart
│   ├── connection/
│   │   ├── connection_screen.dart
│   │   └── connection_provider.dart
│   ├── programs/
│   │   ├── programs_screen.dart
│   │   ├── playback_provider.dart
│   │   ├── quick_programs_widget.dart
│   │   └── search_provider.dart
│   ├── editor/
│   │   ├── editor_screen.dart
│   │   └── editor_provider.dart
│   ├── custom_groups/
│   │   ├── custom_groups_screen.dart
│   │   └── custom_groups_provider.dart
│   ├── silver_water/
│   │   ├── silver_water_screen.dart
│   │   └── silver_water_provider.dart
│   ├── settings/
│   │   ├── settings_screen.dart
│   │   ├── wifi_settings_screen.dart
│   │   ├── calibration_screen.dart
│   │   ├── debug_screen.dart
│   │   ├── users_screen.dart
│   │   └── update_screen.dart
│   └── print/
│       └── quick_programs_pdf.dart
└── providers/
    ├── device_connection_provider.dart  — Connection state, MAC, model
    ├── device_state_provider.dart       — Power, duration, zumer, sweep, SW state
    ├── locale_provider.dart             — Language selection
    └── database_provider.dart           — Database access
```

### 7.2. State Management (Riverpod)

**Основни providers:**

```dart
// Връзка с устройство
final deviceConnectionProvider = StateNotifierProvider<DeviceConnectionNotifier, DeviceConnectionState>(...);

// Състояние на устройството (прочетено чрез CMD 9)
final deviceStateProvider = StateNotifierProvider<DeviceStateNotifier, DeviceState>(...);

// Playback (възпроизвеждане на програми/групи)
final playbackProvider = StateNotifierProvider<PlaybackNotifier, PlaybackState>(...);

// Quick Programs (12 слота)
final quickProgramsProvider = StateNotifierProvider<QuickProgramsNotifier, List<QuickSlot>>(...);

// Silver Water
final silverWaterProvider = StateNotifierProvider<SilverWaterNotifier, SilverWaterState>(...);

// Текущ потребител
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(...);

// Локализация
final localeProvider = StateProvider<Locale>((ref) => const Locale('bg'));
```

### 7.3. Бранд и тема

- **Цветова схема:** Сини тонове от текущото Delphi приложение (SKY brand)
- **Material Design 3:** `ColorScheme.fromSeed(seedColor: skyBlue)`
- **Само Light mode**
- **Шрифтове:** Roboto (default Material)
- **Адаптивен layout:** Responsive за мобилни (single column) и desktop (multi-panel)

### 7.4. Offline поведение

- **Работи offline:** Всички основни функции (програми, playback, custom groups, silver water, editor)
- **Изисква интернет:** Cloud телеметрия (graceful skip при липса на мрежа), проверка за обновяване
- **Bundled база:** Всички 6163 програми и 46253 честоти са вградени в приложението

---

## 8. Бизнес правила и ограничения

### 8.1. Протокол
- Win1251 кодиране е задължително за всички стрингове в протокола
- USB буферът е фиксиран на 255 байта
- WiFi буферът е максимум 524,288 байта (512KB)
- Cloud портът по подразбиране е 7433
- UDP портът за LAN е 7800
- Serial скоростта е 9600 baud

### 8.2. База данни
- Потребителски програми започват от ID 61000+
- Максимум 500 елемента в playback масива
- Максимум 12 Quick Programs слота (3 цвята × 4 бутона)
- `programs_groups_connections` е реалната M:N връзка (не `diseases.category_id`)
- Паролите се съхраняват в plain text (legacy, запазено)

### 8.3. UI
- На мобилни: single-column layout с навигация
- На desktop: multi-panel layout с NavigationRail
- Език се задава глобално и влияе на показваните полета от базата
- Silver Water екранът е видим само при модели с поддръжка

---

## 9. Функционалности НЕ включени (премахнати от legacy)

| Функционалност | Причина за премахване |
|----------------|----------------------|
| **Firmware Flash (avrdude)** | Несъвместимо с мобилни платформи |
| **Remote Access (AnyDesk, TeamViewer, Ammyy)** | Windows-специфично |
| **Email изпращане (SMTP)** | Неизползвано, хардкодирани credentials |
| **Excel импорт** | Специализирана функция, не е в core use case |
| **Dark mode** | Не е приоритет за v1.0 |
| **Тестове** | Ще се добавят в бъдещи версии |

---

## 10. Автоматично обновяване

### 10.1. Механизъм
1. GET `https://zapper.sky.bg/software/new_versions.xml`
2. Парсване на XML (Dart `xml` пакет)
3. Сравнение на `last_version` и `last_version_db` с текущите
4. Показване на changelog
5. Изтегляне на нов APK/IPA/EXE и нова SQLite база

### 10.2. Формат на XML
```xml
<catalog last_version="1.58"
         program_download="https://zapper.sky.bg/software/SKY_Zapper.exe"
         last_version_db="2.01"
         database_download="https://zapper.sky.bg/software/SKY_Zapper.mdb">
  <program program_version="X.XX" database_version="X.XX" release_date="DD.MM.YYYY">
    <description>Описание</description>
  </program>
</catalog>
```

---

## 11. Версионна история на legacy приложението

| Версия | Дата | Описание |
|--------|------|----------|
| 1.32 | 7.6.2017 | Подробно описание на програмите |
| 1.33 | 3.5.2018 | Търсене по честота |
| 1.34 | 18.12.2018 | Автоматични настройки за сребърна вода |
| 1.36 | 28.11.2019 | Прозорец за обновяване |
| 1.38 | 3.4.2020 | Програми за Коронавирус |
| 1.40 | 11.6.2020 | Cloud комуникация |
| 1.43 | 1.10.2021 | Частичен превод на английски |
| 1.44 | 25.3.2024 | Персонални списъци (плейлисти) |
| 1.47 | 21.11.2024 | Над 6100 програми |
| 1.54 | 8.4.2025 | WiFi управление |
| 1.58 | 29.8.2025 | Адаптивен UI, последна Delphi версия |

---

## 12. Глосарий

| Термин | Описание |
|--------|----------|
| **Zapper** | Биорезонансно устройство за терапия |
| **Честота (Frequency)** | Електромагнитна честота в Hz |
| **Програма (Program/Disease)** | Набор от честоти за терапевтично приложение |
| **Категория (Category)** | Групиране на програми по тип |
| **Сребърна вода (Silver Water)** | Колоидно сребро, произведено чрез електролиза |
| **Quick Programs** | 12 бутона за бърз достъп до програми |
| **Custom Group / Playlist** | Потребителски списък от програми |
| **Cloud** | Отдалечен сървър за телеметрия |
| **AP (Access Point)** | WiFi точка за достъп в устройството |
| **Buffer** | 512KB бинарен блок за програмиране |
| **Sweep** | Плавно изменение на честотата |
| **Win1251** | Windows Cyrillic кодиране за протокола |
| **Bundled Asset** | Файл вграден в приложението при компилация |
| **Riverpod** | State management библиотека за Flutter |
| **sqflite** | SQLite пакет за Flutter |
