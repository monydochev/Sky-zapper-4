unit uMain;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Menus, DB, ADODB,  StdCtrls, ComCtrls, ExtCtrls,

  VaComm, VirtualTable, cxStyles, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxDBLookupComboBox, cxClasses, VaClasses, MemDS,
  AdvEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.DBCtrls, VaConfigDialog,
  cxCurrencyEdit, IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, IdBaseComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdIPWatch,
  IdGlobal, IdUDPBase, IdUDPClient, AdvToolBar, dxGDIPlusClasses,
  System.ImageList, Vcl.ImgList, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, IdUDPServer,
  IdSocketHandle, ActiveX, ComObj, dxSkinsCore, dxSkinsDefaultPainters, IdHTTP,
  dxStatusBar;





type
  TfMain = class(TForm)
    ADOQueryDiseases: TADOQuery;
    ADOConnectionMDB: TADOConnection;
    DataSourceDiseases: TDataSource;
    ADOQueryFreq: TADOQuery;
    DataSourceFreq: TDataSource;
    ADOQuerySQL: TADOQuery;
    DataSourcePrevod: TDataSource;
    DataSourceCategory: TDataSource;
    ADOQueryCategory: TADOQuery;
    VirtualTableBuffer: TVirtualTable;
    DataSourceBuffer: TDataSource;
    DataSourceLang: TDataSource;
    VirtualTable2: TVirtualTable;
    DataSourceFavorite: TDataSource;
    VirtualTableFavorite: TVirtualTable;
    VaComm1: TVaComm;
    ADOQueryOptions: TADOQuery;
    PopupMenuLCD: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    ADOQuerySQL2: TADOQuery;
    DataSourceZappers: TDataSource;
    VirtualTableZappers: TVirtualTable;
    PopupMenuNO_LCD: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    TimerCheck_Connections: TTimer;
    ADOQueryCheckFreq: TADOQuery;
    DataSourceCategoryList: TDataSource;
    ADOQueryCategoryList: TADOQuery;
    GroupBoxDebug: TGroupBox;
    CheckBoxTX: TCheckBox;
    CheckBoxRX: TCheckBox;
    AdvEditMS: TAdvEdit;
    IdSMTP_with_SSL: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL2: TIdSSLIOHandlerSocketOpenSSL;
    IdIPWatch1: TIdIPWatch;
    ListBoxEmail: TListBox;
    ListBoxAttachments: TListBox;
    N9: TMenuItem;
    ADOQuerySumFreq: TADOQuery;
    Button1x: TButton;
    ADOQuerySSS: TADOQuery;
    ADOQueryUpdate: TADOQuery;
    IdUDPClient1: TIdUDPClient;
    DataSourceSource: TDataSource;
    vtSource: TVirtualTable;
    DataSourceCommand: TDataSource;
    vtCommand: TVirtualTable;
    DataSourceOn_Off: TDataSource;
    vtOn_Off: TVirtualTable;
    CheckBoxMessage: TCheckBox;
    MemoMainLogTX: TMemo;
    MemoMainLogEvent: TMemo;
    ButtonClear: TButton;
    SaveDialog1: TSaveDialog;
    ButtonExportNewDB: TButton;
    ComboBoxComPorts: TComboBox;
    ButtonConnection: TButton;
    DBLookupComboBoxZapper: TDBLookupComboBox;
    ADOQueryGetProgramName: TADOQuery;
    ADOQueryGetCategoryName: TADOQuery;
    DataSourceVirtualCMD: TDataSource;
    vtVirtualCMD: TVirtualTable;
    ListBoxProgramIDs: TListBox;
    ListBoxCategoriesIDs: TListBox;
    PopupMenuColors: TPopupMenu;
    MenuItemRED1: TMenuItem;
    MenuItemRED2: TMenuItem;
    MenuItemRED3: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItemRemoveAll: TMenuItem;
    MenuItemRED4: TMenuItem;
    N13: TMenuItem;
    MenuItemGREEN1: TMenuItem;
    MenuItemGREEN2: TMenuItem;
    MenuItemGREEN3: TMenuItem;
    MenuItemGREEN4: TMenuItem;
    N18: TMenuItem;
    MenuItemBLUE1: TMenuItem;
    MenuItemBLUE2: TMenuItem;
    MenuItemBLUE3: TMenuItem;
    MenuItemBLUE4: TMenuItem;
    ADOQueryPrograming: TADOQuery;
    ADOQueryFreqProgramming: TADOQuery;
    Button1: TButton;
    RadioGroupMainLanguage: TRadioGroup;
    AdvToolBarPager1: TAdvToolBarPager;
    AdvToolBarPagerPrograms: TAdvPage;
    AdvToolBarPagerSilverWater: TAdvPage;
    AdvToolBarPagerOptions: TAdvPage;
    AdvToolBar1: TAdvToolBar;
    AdvToolBarPrograms: TAdvToolBar;
    AdvToolBarEditor: TAdvToolBar;
    AdvToolBarSilverWater: TAdvToolBar;
    AdvToolBarOptions: TAdvToolBar;
    AdvToolBarRemoteAccess: TAdvToolBar;
    AdvToolBarPagerLanguage: TAdvPage;
    AdvToolBarLanguegeBG: TAdvToolBar;
    AdvToolBarLanguageEN: TAdvToolBar;
    ImageList1: TImageList;
    AdvToolBarButtonPrograms: TAdvToolBarButton;
    AdvToolBarButtonEditor: TAdvToolBarButton;
    AdvToolBarButtonSilverWater: TAdvToolBarButton;
    AdvToolBarButtonOptions: TAdvToolBarButton;
    AdvToolBarButtonAdmin: TAdvToolBarButton;
    AdvToolBarButtonLanguageBG: TAdvToolBarButton;
    AdvToolBarButtonLanguageEN: TAdvToolBarButton;
    MemoMainLogRX: TMemo;
    DataSourceLAN_Zappers: TDataSource;
    VirtualTableLAN_Zappers: TVirtualTable;
    GroupBoxNetworkConnections: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    LabelSearchNetwork: TLabel;
    ButtonUSE_Network: TButton;
    ButtonSearchZappersNetwork: TButton;
    RadioGroupTypeConnections: TRadioGroup;
    CheckBoxDescriptor: TCheckBox;
    IdUDPServer1: TIdUDPServer;
    Button2: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    AdvToolBarUpdate: TAdvToolBar;
    AdvToolBarButton1: TAdvToolBarButton;
    AdvToolBarButtonTeamViewer: TAdvToolBarButton;
    AdvToolBarButtonAnyDesk: TAdvToolBarButton;
    GroupBoxUSBConnections: TGroupBox;
    LabelSearchCable: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ButtonSearchZapperUSBCable: TButton;
    ButtonUSE_Cable: TButton;
    DataSourceUSB_Zappers: TDataSource;
    VirtualTableUSB_Zappers: TVirtualTable;
    AdvToolBarConnection: TAdvToolBar;
    AdvToolBarButtonConnection: TAdvToolBarButton;
    AdvToolBarButtonAmmy: TAdvToolBarButton;
    TimerSearch: TTimer;
    LabelMessage: TLabel;
    Button3: TButton;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    ButtonCloudParameterProgram: TButton;
    ButtonCloudFreq: TButton;
    ButtonCloudStart: TButton;
    ButtonCloudStop: TButton;
    ButtonCloudPause: TButton;
    ButtonCloudContinue: TButton;
    Button4: TButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridDBTableView2Column3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    ButtonFreqExport: TButton;
    ButtonAddFreqExport: TButton;
    VirtualTableExport: TVirtualTable;
    DataSourceExport: TDataSource;
    ADOQueryCloudPrograms: TADOQuery;
    ADOQueryExcel: TADOQuery;
    Button7: TButton;
    OpenDialog1: TOpenDialog;
    ADOConnectionCloud: TADOConnection;
    ADOQueryCloudCategory: TADOQuery;
    ADOQueryCloudSUB_Category: TADOQuery;
    Button8: TButton;
    ListBox1: TListBox;
    ADOQueryUsers: TADOQuery;
    DataSourceUsers: TDataSource;
    AdvToolBarPagerUsers: TAdvPage;
    AdvToolBarChangeUsers: TAdvToolBar;
    AdvToolBarButtonChangeUser: TAdvToolBarButton;
    AdvToolBarChangePassword: TAdvToolBar;
    AdvToolBarUsers: TAdvToolBar;
    AdvToolBarButton4: TAdvToolBarButton;
    AdvToolBarButton2: TAdvToolBarButton;
    DataSourceCategory_Personalization: TDataSource;
    ADOQueryCategory_Personalization: TADOQuery;
    DataSourceGroupType: TDataSource;
    VirtualTableGroupType: TVirtualTable;
    StatusBar1: TdxStatusBar;
    DataSourcePrograms: TDataSource;
    ADOQueryPrograms: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure ButtonConnectionClick(Sender: TObject);
    procedure VaComm1RxChar(Sender: TObject; Count: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TimerCheck_ConnectionsTimer(Sender: TObject);
    procedure IdSSLIOHandlerSocketOpenSSL2Status(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: string);
    procedure IdSSLIOHandlerSocketOpenSSL2StatusInfo(const AMsg: string);
    procedure ADOQueryDiseasesdescription_bgGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1xClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonExportNewDBClick(Sender: TObject);
    procedure MenuItemRED1Click(Sender: TObject);
    procedure MenuItemRED2Click(Sender: TObject);
    procedure MenuItemRED3Click(Sender: TObject);
    procedure MenuItemRED4Click(Sender: TObject);
    procedure MenuItemGREEN1Click(Sender: TObject);
    procedure MenuItemGREEN2Click(Sender: TObject);
    procedure MenuItemGREEN3Click(Sender: TObject);
    procedure MenuItemGREEN4Click(Sender: TObject);
    procedure MenuItemBLUE1Click(Sender: TObject);
    procedure MenuItemBLUE2Click(Sender: TObject);
    procedure MenuItemBLUE3Click(Sender: TObject);
    procedure MenuItemBLUE4Click(Sender: TObject);
    procedure MenuItemRemoveAllClick(Sender: TObject);
    procedure RadioGroupMainLanguageClick(Sender: TObject);
    procedure AdvToolBarButtonProgramsClick(Sender: TObject);
    procedure AdvToolBarButtonPersonalListClick(Sender: TObject);
    procedure AdvToolBarButtonEditorClick(Sender: TObject);
    procedure AdvToolBarButtonSilverWaterClick(Sender: TObject);
    procedure AdvToolBarButtonOptionsClick(Sender: TObject);
    procedure AdvToolBarButtonUpdateClick(Sender: TObject);
    procedure AdvToolBarButtonAdminClick(Sender: TObject);
    procedure AdvToolBarButtonLanguageBGClick(Sender: TObject);
    procedure AdvToolBarButtonLanguageENClick(Sender: TObject);
   
    procedure ButtonSearchZappersNetworkClick(Sender: TObject);
    procedure ButtonUSE_NetworkClick(Sender: TObject);
    procedure ButtonUSE_CableClick(Sender: TObject);
    procedure IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure AdvToolBarButtonAnyDeskClick(Sender: TObject);
    procedure AdvToolBarButtonTeamViewerClick(Sender: TObject);
    procedure ButtonSearchZapperUSBCableClick(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure AdvToolBarButtonConnectionClick(Sender: TObject);
    procedure AdvToolBarButtonAmmyClick(Sender: TObject);
    procedure TimerSearchTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonCloudParameterProgramClick(Sender: TObject);
    procedure ButtonCloudFreqClick(Sender: TObject);
    procedure ButtonCloudStartClick(Sender: TObject);
    procedure ButtonCloudStopClick(Sender: TObject);
    procedure ButtonCloudPauseClick(Sender: TObject);
    procedure ButtonCloudContinueClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonAddFreqExportClick(Sender: TObject);
    procedure ButtonFreqExportClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure AdvToolBarButtonChangeUserClick(Sender: TObject);
    procedure AdvToolBarButton4Click(Sender: TObject);
    procedure AdvToolBarButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;




 objectProgram = object

   program_id : Integer;
   //program_name : string;
   freq_hz : Double;
   freq_id : Integer;
   freq_sec : Integer;
   total_time_sec : Integer;
   pause_sec : Integer;
   pause_type : Integer; //1-pause program, 2-pause category,
   pause_pass : Integer;
 end;






  function set_power_freq(ManSweep, Sweep, ManPower, Power : Byte; Frequence : Integer):Integer;
  procedure clear_buffer;
//  function GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
  procedure waitX(tmpSec:Integer);
  function SendMail(z_Subject, z_FromName, z_Body, zBody_HTML, z_AddMails, z_AddBCC, z_FileAttachments, z_FileName :string):string;

  procedure LogEvent(tmpText : string);
  procedure LogRX(tmpText : string);
  procedure LogTX(tmpText : string);


  procedure Clear_Frequences;
  function Get_Frequence_From_Position(tmpRecord:integer):integer;
  function Get_Frequence_Until_Position(tmpRecord:integer):integer;
  procedure Refresh_Frequences(tmpID:string);
//  procedure Refresh_FrequencesGroup(tmpCategoryID, CategoryPersonalID:string);

  procedure SEND_Cloud(_Buffer : TIdBytes);
  procedure Save_INI(_ident:string; _MAC : string);
  function Read_INI(_ident:string):string;
  function Get_a_Bit(const aValue: Cardinal; const Bit: Byte): Boolean;
  function Get_a_BitN(const aValue: Cardinal; const Bit: Byte): Char;
  function Check_Connect(tmpShowMessage:Byte):Boolean;
  procedure PREPARE_BUFF;
  procedure PARSE_BUFF(tmpMessage:string; tmpCount:Integer);
  function Check_SilverWater(tmpMessage:Byte):Boolean;
  function Check_Zapper(tmpMessage:Byte):Boolean;
  function Check_ZapperWiFi(tmpMessage:Byte):Boolean;
  procedure set_button_program(tmpButton, tmpCategory, tmpProgram : Integer);
  procedure remove_all;
  procedure change_menu;
  function Clear_a_Bit(const aValue: Cardinal; const Bit: Byte): Cardinal;
  function Set_a_Bit(const aValue: Cardinal; const Bit: Byte): Cardinal;
  procedure SleepSky(ms : Integer);
  procedure SaveBytesToFile(const Data: TBytes; const FileName: string);
  procedure SendBufferToLAN(LAN_Buffer_Length:Integer);
  procedure LAN_PARSE_BUFF(tmpMessage:string; tmpCount:Integer);
  function isCharacters(charNumber : byte):string;




const

// 1.40 - error comunication cloud packet

 program_version = 1.58; //last 1.55
 max_mem = 524288;
 defualt_cloud_port = 7433;

 len_categoryESP = 38; //48
 len_diseaseESP = 92; //172



 len_frequenceESP = 5;

 len_category = 8;
 len_disease = 12;
 len_frequence = 5;
 len_settings = 10;



var
  fMain: TfMain;
  xPath : string;

  GLOBAL_EXCH_SERVER,
  GLOBAL_EXCH_PORT,
  GLOBAL_EXCH_USERNAME,
  GLOBAL_EXCH_PASSWORD, GLB_SHORT_MAC, GLB_FULL_MAC,
  LAST_NETWORK_IP, LAST_COM_PORT : string;

  LAN_Connection_IP : string;
  Connection_Type : Integer;
  LastPacketPing : TDateTime;

  FirstTime : Boolean;
  buff : TBytes;
  max_buffer : Integer;
  USB_Buffer : array[1..255] of Byte;
  LAN_Buffer : TIdBytes;

  tmpBufTime : TDateTime;
  zapper_id : Integer;
  firmware_flash : Integer;
  GLB_Duration : Int16;
  GLB_CheckBuffer : Int32;
  GLB_Power : Byte;
  GLB_Zumer : Byte;
  GLB_Sweep : Byte;
  GLB_Freq  : Byte;

  GLB_Wifi : Byte;
  GLB_Wifi_AP_Time,
  GLB_Wifi_AP_NoActTime : Byte;

  Connected_com_port, _pass : string;

  ALL_Frequences : array [1..500] of integer;
  Max_ProgramRecords: Integer;
  Max_GroupRecords : Integer;
  category_repeat, category_repeat_current : Integer;

  AllCyclesTime_sec : Integer;
  AllCyclesTimeCurrent_sec : Integer;
  CategoryTime_sec : Integer;
  CategoryTimeCurrent_sec : Integer;
  ProgramTime_sec : Integer;
  ProgramTimeCurrent_sec : Integer;
  FrequenceTime_sec : Integer;
  FrequenceTimeCurrent_sec : Integer;
  PauseTime_sec : Integer;
  PauseTimeCurrent_sec : Integer;


  program_pause_sec : Integer;
  category_pause_sec : Integer;



  tmpProgresStartUp : Integer;
  state_pause : Integer;


  LastPositionInGroup : Integer;
  CategoryPlay : array [1..500] of objectProgram;

  _quick_grp : array[1..12] of Word;
  _quick_prog : array[1..12] of Word;

  _cloud_service, _new_service, _FactoryPIN, _AdditionalPIN, _cloud_port : string;
  uniWord1 : Word;
  _DurationFrequenceTime,
  _Freq,
  _Zumer,
  _Sweep,
  _Power,
  _Wifi,
  _Wifi_AP,
  _Wifi_AP_NoAct,
  _SilverWaterStartByte,
  _CurrentSetPoint,
  _WaterQuantity,
  _SilverConcentration,
  _SilverWaterOn,
  _CurrentSence,
  _SilverWatterTime,
  _SilverWaterRemain : Byte;
  M_b1, M_b2, M_b3, M_b4 : Byte;
  dt1:TDateTime;
  _Send_UDP : TIdBytes;
  device_test : Boolean;

  tID1, tID2, tID3, tID4, tID5, tID6, tID7, tID8, tID9, tID10, tID11, tID12:Integer;
  tTEXT1, tTEXT2, tTEXT3, tTEXT4, tTEXT5, tTEXT6, tTEXT7, tTEXT8, tTEXT9, tTEXT10, tTEXT11, tTEXT12:string;
  tmpDebugOptiopns : Boolean;

  database_version : Double;
  new_prog, new_db: Extended;

  LoginUser : Integer;
  LoginName : string;

implementation
uses     uOptions, VaPrst, uDebug, dateutils,
  uProgram, uEdit, IdMessage, IdAttachmentFile, IdText,  uSrebarnaVoda, inifiles,
   uUpdateSoftware, uCutomGroups,   StrUtils, XMLIntf, XMLDoc,
   IdIcmpClient, IdRawBase, IdRawClient, ShlObj, math, uLogin, uChangePassword, uUsers,
    TlHelp32;



{$R *.dfm}


function IsProcessRunning(const AExeFileName: string): Boolean;
var
  Snapshot: THandle;
  ProcEntry: TProcessEntry32;
begin
  Result := False;
  Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Snapshot = INVALID_HANDLE_VALUE then Exit;
  try
    ProcEntry.dwSize := SizeOf(TProcessEntry32);
    if Process32First(Snapshot, ProcEntry) then
    repeat
      if SameText(ExtractFileName(ProcEntry.szExeFile), AExeFileName) then
      begin
        Result := True;
        Break;
      end;
    until not Process32Next(Snapshot, ProcEntry);
  finally
    CloseHandle(Snapshot);
  end;
end;

procedure sendReadAll_USBCable(_COM_Port : string);
begin
with fMain do
begin

    VaComm1.Close;
    VaComm1.Baudrate := TVaBaudrate.Br9600;
    VaComm1.DeviceName := _COM_Port;
    VaComm1.Open;

    PREPARE_BUFF;

    USB_Buffer[1] := 0;
    USB_Buffer[2] := 0;
    USB_Buffer[3] := 9;
    USB_Buffer[4] := 0;
    USB_Buffer[5] := 255;
    USB_Buffer[6] := 0;
    USB_Buffer[7] := 0;


{    USB_Buffer[1] := 0;
    USB_Buffer[2] := 0;
    USB_Buffer[3] := 9;
    USB_Buffer[4] := 0;
    USB_Buffer[5] := 255;
 }
    VaComm1.WriteBuf(USB_Buffer, 7);

    PARSE_BUFF('Заявка за четене към Скай Запер на: ' + _COM_Port, 7);

end;
end;

procedure sendReadAll_Network(_IP : string);
begin
with fMain do
begin
    SetLength(LAN_Buffer, 7);

    LAN_Buffer[0] := 0;
    LAN_Buffer[1] := 2;
    LAN_Buffer[2] := 9;
    LAN_Buffer[3] := 0;
    LAN_Buffer[4] := 255;
    LAN_Buffer[5] := 0;
    LAN_Buffer[6] := 0;

    IdUDPServer1.SendBuffer(_IP, 7800, LAN_Buffer);

    LAN_PARSE_BUFF('Заявка за четене към Скай Запер на IP адрес: ' + _IP, 7);

end;
end;


procedure RunAppAndBringToFront(const ExePath: string);
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  AppHandle: HWND;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);

  if CreateProcess(nil, PChar(ExePath), nil, nil, False, 0, nil, nil, SI, PI) then
  begin
    CloseHandle(PI.hThread);
    // Изчакваме малко, за да се стартира приложението
    Sleep(1000);

    // Търсим хендъла на прозореца
    AppHandle := FindWindow(nil, PChar(ExtractFileName(ExePath)));
    if AppHandle <> 0 then
    begin
      SetForegroundWindow(AppHandle);
      ShowWindow(AppHandle, SW_RESTORE);
    end;

    CloseHandle(PI.hProcess);
  end
  else
    ShowMessage('Неуспешно стартиране на приложението.');
end;

function IsUserAnAdmin: Boolean;
var
  TokenHandle: THandle;
  TokenElevation: TOKEN_ELEVATION;
  ReturnLength: DWORD;
begin
  Result := False;
  if OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, TokenHandle) then
  try
    if GetTokenInformation(TokenHandle, TokenElevationType, @TokenElevation, SizeOf(TOKEN_ELEVATION), ReturnLength) then
      Result := TokenElevation.TokenIsElevated <> 0;
  finally
    CloseHandle(TokenHandle);
  end;
end;

type
  TUserPrivilegeLevel = (uplStandardUser, uplElevatedUser, uplAdministrator);

function GetUserPrivilegeLevel: TUserPrivilegeLevel;
const
  TokenElevation = TTokenInformationClass(18); // 18 е стойността за TokenElevation
var
  TokenHandle: THandle;
//  TokenElevation: DWORD;
Elevation: DWORD;
  ReturnLength: DWORD;
begin
  Result := uplStandardUser;

  try
    // Проверка дали токенът показва повишени права
    if GetTokenInformation(TokenHandle, TokenElevation, @Elevation, SizeOf(Elevation), ReturnLength) then
    begin
      if Elevation <> 0 then
        Result := uplAdministrator; // Потребителят има администраторски права
    end;
  finally
    CloseHandle(TokenHandle);
  end;

end;

function Descriptor(DescriptorRowNum : Integer):string;
begin

  if fMain.CheckBoxDescriptor.Checked then
  begin
    Result := '';

    if DescriptorRowNum = _Power then Result := ' Power';
    if DescriptorRowNum = _DurationFrequenceTime then Result := ' DurationFrequenceTime';
    if DescriptorRowNum = _Zumer then Result := ' Zumer';
    if DescriptorRowNum = _Sweep then Result := ' Sweep';
    if DescriptorRowNum = _Wifi then Result := ' Wifi';
    if DescriptorRowNum = _Wifi_AP then Result := ' Wifi_AP';
    if DescriptorRowNum = _Wifi_AP_NoAct then Result := ' Wifi_AP_NoAct';
    if DescriptorRowNum = _SilverWaterStartByte then Result := ' SilverWaterStartByte';
    if DescriptorRowNum = _CurrentSetPoint then Result := ' CurrentSetPoint';
    if DescriptorRowNum = _WaterQuantity then Result := ' WaterQuantity';
    if DescriptorRowNum = _SilverConcentration then Result := ' SilverConcentration';

    if DescriptorRowNum = _CurrentSence then Result := ' CurrentSence';
    if DescriptorRowNum = _SilverWatterTime then Result := ' SilverWatterTime';
    if DescriptorRowNum = _SilverWaterRemain then Result := ' SilverWaterRemain '+IntToStr(DescriptorRowNum);

    if (GLB_SHORT_MAC = '8031') then
    if DescriptorRowNum = _SilverWaterOn then Result := ' SilverWaterOn';

  end;

end;


function isCharacters(charNumber : byte):string;
begin
  if (charNumber >= 32) AND (charNumber <= 126) then
  Result := ' Char: '+chr(charNumber) else
  Result := '';
end;


procedure SaveBytesToFile(const Data: TBytes; const FileName: string);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    if Data <> nil then
      Stream.WriteBuffer(Data[0], max_buffer);
  finally
    Stream.Free;
  end;
end;

procedure SleepSky(ms : Integer);
var
Finish_time : TDateTime;
begin
  Finish_time := IncMilliSecond(Now, ms);

  repeat
     Sleep(20);
     Application.ProcessMessages;
    //изчаква
  until (Now > Finish_time);

  Application.ProcessMessages;
end;




procedure waitX(tmpSec:Integer);
var tmpNow:TDateTime;
begin
    tmpNow := Now;
    repeat
      Sleep(20);
      Application.ProcessMessages;
    until (MilliSecondsBetween(Now, tmpNow) >= tmpSec);
end;

//get if a particular bit is 1
function Get_a_Bit(const aValue: Cardinal; const Bit: Byte): Boolean;
begin
  Result := (aValue and (1 shl Bit)) <> 0;
end;

function Get_a_BitN(const aValue: Cardinal; const Bit: Byte): Char;
Const c10: Array[Boolean] of Char = ('0', '1');
begin
   if Get_a_Bit(aValue, Bit) then
   Result := '1' else
   Result := '0';
end;

//set a particular bit as 1
function Set_a_Bit(const aValue: Cardinal; const Bit: Byte): Cardinal;
begin
  Result := aValue or (1 shl Bit);
end;

//set a particular bit as 0
function Clear_a_Bit(const aValue: Cardinal; const Bit: Byte): Cardinal;
begin
  Result := aValue and not (1 shl Bit);
end;


function try_connect(_CompPort : string):Boolean;
begin
with fMain do
begin
  try
    LogTX('');
    LogTX('Отвори ком порт: '+_CompPort);

    if RadioGroupMainLanguage.ItemIndex=0 then
    StatusBar1.Panels[0].Text := 'Не е свързан Запер - проба на: '+_CompPort else
    StatusBar1.Panels[0].Text := 'Not connected Zapper - sample of: '+_CompPort;

    StatusBar1.Panels[1].Text := '';
    StatusBar1.Panels[2].Text := '';
    StatusBar1.Panels[3].Text := '';
    StatusBar1.Panels[4].Text := '';
    StatusBar1.Panels[5].Text := '';
    StatusBar1.Panels[5].Text := '';//'Port: '+_CompPort;
    StatusBar1.Panels[6].Text := '';
    StatusBar1.Panels[7].Text := '';
    StatusBar1.Panels[8].Text := '';
    StatusBar1.Panels[9].Text := '';


    //wait(100);
    SleepSky(100);

    VaComm1.Close;
    VaComm1.Baudrate := TVaBaudrate.br9600;
    VaComm1.DeviceName := _CompPort;
    VaComm1.Open;

    PREPARE_BUFF;
    USB_Buffer[1] := 0;
    USB_Buffer[2] := 0;
    USB_Buffer[3] := 9;
    USB_Buffer[4] := 0;
    USB_Buffer[5] := 255;
    VaComm1.WriteBuf(USB_Buffer, 5);

    PARSE_BUFF('Заявка за свързване към SKY Zapper на: '+_CompPort, 5);
  except on e:Exception do
    //ShowMessage('Възникна грешка при отваряне на com port: '+VaComm1.DeviceName+' '+e.Message);
  end;

end;
end;



function GetProgramNameWiFi(tmpButton, tmpCategory, tmpProgram:Integer):string;
begin
with fMain do
begin

  if (tmpCategory=0) OR (tmpProgram=0) then
  begin
    Result := '';
    Exit;
  end;



    ADOQueryGetCategoryName.SQL.Text := 'SELECT * FROM category WHERE id=' + IntToStr(tmpCategory);
    ADOQueryGetCategoryName.Open;
    ADOQueryGetProgramName.SQL.Text := 'SELECT * FROM diseases WHERE id='+IntToStr(tmpProgram);
    ADOQueryGetProgramName.Open;

    if ADOQueryGetCategoryName.FieldByName('type_id').AsInteger = -1 then
    begin



      Result := 'Група: '+ADOQueryGetCategoryName.FieldByName('category_name_BG').AsString+' Програма: '+ADOQueryGetProgramName.FieldByName('name_bg').AsString;
    end else
    begin
        Result := 'Група: '+ADOQueryGetCategoryName.FieldByName('category_name_BG').AsString+' ПЕРСОНАЛНА: '+ADOQueryGetProgramName.FieldByName('name_bg').AsString;
    end;



     {
  ADOQueryGetProgramName.SQL.Text := 'SELECT * FROM diseases WHERE category_id='+IntToStr(tmpCategory)+' AND ID='+IntToStr(tmpProgram);
  ADOQueryGetProgramName.Open;
  if ADOQueryGetProgramName.RecordCount = 1 then
  begin
    ADOQueryGetCategoryName.SQL.Text := 'SELECT * FROM category WHERE id='+ADOQueryGetProgramName.FieldByName('category_id').AsString; //id='+IntToStr(tmpCategory);
    ADOQueryGetCategoryName.Open;

    if ADOQueryGetCategoryName.RecordCount = 1 then
    begin
      ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite = '+IntToStr(tmpButton+10)+' WHERE ID='+IntToStr(tmpProgram);
      ADOQuerySQL.ExecSQL;

      Result := 'Група: '+ADOQueryGetCategoryName.FieldByName('category_name_BG').AsString+' програма: '+ADOQueryGetProgramName.FieldByName('name_bg').AsString;
    end else
    Result := 'Невалидна група ID: '+IntToStr(tmpCategory)+' програма: '+ADOQueryGetProgramName.FieldByName('name_bg').AsString;

  end else
  begin //Търсене при персоналните програми
    Result := 'Невалидна програма ID: '+IntToStr(tmpProgram);

  end;
    }


end;
end;

function GetProgramNameBasic(tmpButton, tmpProgram:Integer):string;
begin
with fMain do
begin
  if (tmpProgram=0) then
  begin
    Result := 'Не е конфигурирана програма';
    Exit;
  end;





    ADOQueryGetProgramName.SQL.Text := 'SELECT * FROM diseases WHERE id='+IntToStr(tmpProgram);
    ADOQueryGetProgramName.Open;

    if ADOQueryGetCategoryName.FieldByName('type_id').AsInteger = -1 then
    begin



      Result := 'Програма: '+ADOQueryGetProgramName.FieldByName('name_bg').AsString;
    end else
    begin
        Result := 'ПЕРСОНАЛНА: '+ADOQueryGetProgramName.FieldByName('name_bg').AsString;
    end;


{
  ADOQueryGetProgramName.SQL.Text := 'SELECT * FROM diseases WHERE ID='+IntToStr(tmpProgram);
  ADOQueryGetProgramName.Open;
  if ADOQueryGetProgramName.RecordCount= 1 then
  begin
    ADOQueryGetCategoryName.SQL.Text := 'SELECT * FROM category WHERE id='+ADOQueryGetProgramName.FieldByName('category_id').AsString;
    ADOQueryGetCategoryName.Open;
    if ADOQueryGetCategoryName.RecordCount = 1 then
    begin
      ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite = '+IntToStr(tmpButton+10)+' WHERE ID='+IntToStr(tmpProgram);
      ADOQuerySQL.ExecSQL;

      Result := 'Група: '+ADOQueryGetCategoryName.FieldByName('category_name_BG').AsString+' програма: '+ADOQueryGetProgramName.FieldByName('name_bg').AsString;
    end else
      Result := 'Невалидна група ID: '+ADOQueryGetProgramName.FieldByName('category_id').AsString+' програма: '+ADOQueryGetProgramName.FieldByName('name_bg').AsString;
  end else
  begin
    Result := 'Невалидна програма ID: '+IntToStr(tmpProgram);
  end;
}



end;
end;


procedure change_menu;
begin
  with fMain do
  begin


    if Assigned(fProgram) then
    begin
    fProgram.cxGrid1DBTableView1.PopupMenu := PopupMenuColors;

    case DBLookupComboBoxZapper.KeyValue of  //1-Basic, 2-Basic SW, 3-HighFreq, 4-HighFreq SW, 5-WiFi, 6-WiFi SW, 7-SW
    1,2,3,4: begin MenuItemRED4.Visible := False; MenuItemGREEN4.Visible := False; MenuItemBLUE4.Visible := False; end;
    5,6,8,9: begin MenuItemRED4.Visible := True; MenuItemGREEN4.Visible := True; MenuItemBLUE4.Visible := True;    end;
    7 :      begin fProgram.cxGrid1DBTableView1.PopupMenu := nil;    end;
    end;

    end;

    if tID1=0 then MenuItemRED1.Caption := 'Запиши на ЧЕРВЕН 1' else MenuItemRED1.Caption := 'Запиши на ЧЕРВЕН 1 - '+tTEXT1;
    if tID2=0 then MenuItemRED2.Caption := 'Запиши на ЧЕРВЕН 2' else MenuItemRED2.Caption := 'Запиши на ЧЕРВЕН 2 - '+tTEXT2;
    if tID3=0 then MenuItemRED3.Caption := 'Запиши на ЧЕРВЕН 3' else MenuItemRED3.Caption := 'Запиши на ЧЕРВЕН 3 - '+tTEXT3;
    if tID4=0 then MenuItemRED4.Caption := 'Запиши на ЧЕРВЕН 4' else MenuItemRED4.Caption := 'Запиши на ЧЕРВЕН 4 - '+tTEXT4;

    if tID5=0 then MenuItemGREEN1.Caption := 'Запиши на ЗЕЛЕН 1' else MenuItemGREEN1.Caption := 'Запиши на ЗЕЛЕН 1 - '+tTEXT5;
    if tID6=0 then MenuItemGREEN2.Caption := 'Запиши на ЗЕЛЕН 2' else MenuItemGREEN2.Caption := 'Запиши на ЗЕЛЕН 2 - '+tTEXT6;
    if tID7=0 then MenuItemGREEN3.Caption := 'Запиши на ЗЕЛЕН 3' else MenuItemGREEN3.Caption := 'Запиши на ЗЕЛЕН 3 - '+tTEXT7;
    if tID8=0 then MenuItemGREEN4.Caption := 'Запиши на ЗЕЛЕН 4' else MenuItemGREEN4.Caption := 'Запиши на ЗЕЛЕН 4 - '+tTEXT8;

    if tID9=0 then MenuItemBLUE1.Caption := 'Запиши на СИН 1' else MenuItemBLUE1.Caption := 'Запиши на СИН 1 - '+tTEXT9;
    if tID10=0 then MenuItemBLUE2.Caption := 'Запиши на СИН 2' else MenuItemBLUE2.Caption := 'Запиши на СИН 2 - '+tTEXT10;
    if tID11=0 then MenuItemBLUE3.Caption := 'Запиши на СИН 3' else MenuItemBLUE3.Caption := 'Запиши на СИН 3 - '+tTEXT11;
    if tID12=0 then MenuItemBLUE4.Caption := 'Запиши на СИН 4' else MenuItemBLUE4.Caption := 'Запиши на СИН 4 - '+tTEXT12;



    case DBLookupComboBoxZapper.KeyValue of  //1-Basic, 2-Basic SW, 3-HighFreq, 4-HighFreq SW, 5-WiFi, 6-WiFi SW, 7-SW
    1,2,3,4:begin
      MenuItemRED1.Enabled := True;
      MenuItemGREEN1.Enabled := True;
      MenuItemBLUE1.Enabled := True;

      if tID1 >= 1 then MenuItemRED2.Enabled := True;
      if tID2 >= 1 then MenuItemRED3.Enabled := True;
      if tID3 >= 1 then MenuItemRED4.Enabled := True;

      if tID5 >= 1 then MenuItemGREEN2.Enabled := True;
      if tID6 >= 1 then MenuItemGREEN3.Enabled := True;
      if tID7 >= 1 then MenuItemGREEN4.Enabled := True;

      if tID9 >= 1 then MenuItemBLUE2.Enabled := True;
      if tID10 >= 1 then MenuItemBLUE3.Enabled := True;
      if tID11 >= 1 then MenuItemBLUE4.Enabled := True;

      if (tID1>=1) OR (tID2>=1) OR (tID3>=1)
      OR (tID5>=1) OR (tID6>=1) OR (tID7>=1)
      OR (tID9>=1) OR (tID10>=1) OR (tID11>=1) then MenuItemRemoveAll.Enabled := True;
    end;
    5,6,8,9:begin
      MenuItemRED1.Enabled := True; MenuItemRED2.Enabled := True; MenuItemRED3.Enabled := True; MenuItemRED4.Enabled := True;
      MenuItemGREEN1.Enabled := True; MenuItemGREEN2.Enabled := True; MenuItemGREEN3.Enabled := True; MenuItemGREEN4.Enabled := True;
      MenuItemBLUE1.Enabled := True; MenuItemBLUE2.Enabled := True; MenuItemBLUE3.Enabled := True; MenuItemBLUE4.Enabled := True;

      if (tID1>=1) OR (tID2>=1) OR (tID3>=1) OR (tID4>=1)
      OR (tID5>=1) OR (tID6>=1) OR (tID7>=1) OR (tID8>=1)
      OR (tID9>=1) OR (tID10>=1) OR (tID11>=1) OR (tID12>=1) then MenuItemRemoveAll.Enabled := True;
    end;
    7:begin  end;
    end;


  end;
end;


procedure SendBufferToLAN(LAN_Buffer_Length:Integer);
var
  i:Integer;
    Frequence, ManSweep, ManPower : Integer;
    _Buffer : TIdBytes;
begin

  try

    SetLength(LAN_Buffer, LAN_Buffer_Length);
    for i := 1 to LAN_Buffer_Length do
    begin
      LAN_Buffer[i-1] := USB_Buffer[i];
      if i = 2 then LAN_Buffer[i-1] := 2;
    end;

   // for i := 0 to LAN_Buffer_Length do fMain.MemoMainLogEvent.Lines.Add(IntToStr(i-1)+ '_NO_: '+IntToStr(LAN_Buffer[i-1]));

   // fMain.MemoMainLogEvent.Lines.Add('IP: '+LAN_Connection_IP+' Length: '+IntToStr(LAN_Buffer_Length));

    fMain.IdUDPServer1.SendBuffer(LAN_Connection_IP, 7800, LAN_Buffer);

  except on e:exception do
    ShowMessage('ERROR: '+e.Message);
  end;
end;


procedure remove_all;
var tmpRec:Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;


    case DBLookupComboBoxZapper.KeyValue of  //1-Basic, 2-Basic SW, 3-HighFreq, 4-HighFreq SW, 5-WiFi, 6-WiFi SW, 7-SW
    1,2,3,4:begin

        ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0';
        ADOQuerySQL.ExecSQL;

        if Assigned(fProgram) then
        fProgram.ButtonProgram_for_9progClick(nil);
    end;
    5,6,8,9:begin
        PREPARE_BUFF;
        USB_Buffer[1] := 0;
        USB_Buffer[2] := 0;
        USB_Buffer[3] := 16;
        USB_Buffer[4] := 73;

        USB_Buffer[5] := 0;  USB_Buffer[6] := 0;       USB_Buffer[7] := 0;   USB_Buffer[8] := 0;
        USB_Buffer[9] := 0;  USB_Buffer[10] := 0;      USB_Buffer[11] := 0;  USB_Buffer[12] := 0;
        USB_Buffer[13] := 0; USB_Buffer[14] := 0;      USB_Buffer[15] := 0;  USB_Buffer[16] := 0;
        USB_Buffer[17] := 0; USB_Buffer[18] := 0;      USB_Buffer[19] := 0;  USB_Buffer[20] := 0;

        USB_Buffer[21] := 0; USB_Buffer[22] := 0;      USB_Buffer[23] := 0;  USB_Buffer[24] := 0;
        USB_Buffer[25] := 0; USB_Buffer[26] := 0;      USB_Buffer[27] := 0;  USB_Buffer[28] := 0;
        USB_Buffer[29] := 0; USB_Buffer[30] := 0;      USB_Buffer[31] := 0;  USB_Buffer[32] := 0;
        USB_Buffer[33] := 0; USB_Buffer[34] := 0;      USB_Buffer[35] := 0;  USB_Buffer[36] := 0;

        USB_Buffer[37] := 0; USB_Buffer[38] := 0;      USB_Buffer[39] := 0;  USB_Buffer[40] := 0;
        USB_Buffer[41] := 0; USB_Buffer[42] := 0;      USB_Buffer[43] := 0;  USB_Buffer[44] := 0;
        USB_Buffer[45] := 0; USB_Buffer[46] := 0;      USB_Buffer[47] := 0;  USB_Buffer[48] := 0;
        USB_Buffer[49] := 0; USB_Buffer[50] := 0;      USB_Buffer[51] := 0;  USB_Buffer[52] := 0;

        if Connection_Type = 0 then //0-USB, 1-LAN
        begin
          VaComm1.WriteBuf(USB_Buffer, 52);
          PARSE_BUFF('USB - Изпращане на команда за изтриване на програми WiFi', 52);
        end else
        begin
          SendBufferToLAN(52);
          LAN_PARSE_BUFF('LAN - Изпращане на команда за изтриване на програми WiFi', 52);
        end;


    end;
    7:begin  end;
    end;


    tID1 := 0; tID2 := 0; tID3 := 0; tID4 := 0;
    tID5 := 0; tID6 := 0; tID7 := 0; tID8 := 0;
    tID9 := 0; tID10 := 0; tID11 := 0; tID12 := 0;

    tTEXT1 := ''; tTEXT2 := ''; tTEXT3 := ''; tTEXT4 := '';
    tTEXT5 := ''; tTEXT6 := ''; tTEXT7 := ''; tTEXT8 := '';
    tTEXT9 := ''; tTEXT10 := ''; tTEXT11 := ''; tTEXT12 := '';

    change_menu;
    ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0';
    ADOQuerySQL.ExecSQL;
    tmpRec := ADOQueryDiseases.FieldByName('id').AsInteger;
    ADOQueryDiseases.Requery();
    ADOQueryDiseases.Locate('id', tmpRec, []);
end;
end;

procedure set_button_program(tmpButton, tmpCategory, tmpProgram : Integer);
var tmpPos:Byte;

  procedure set_prog(tmpColor, tmpProg:Integer);
  var tmpRec:Integer;
  begin
  with fMain do
  begin

   { case tmpButton of
    1: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID1); end;
    2: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID2); end;
    3: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID3); end;
    4: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID4); end;
    5: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID5); end;
    6: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID6); end;
    7: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID7); end;
    8: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID8); end;
    9: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID9); end;
    10: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID10); end;
    11: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID11); end;
    12: begin ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE id='+IntToStr(tID12); end;
    end;    }

    case tmpButton of
    1: begin tID1 := tmpProgram; tTEXT1 := GetProgramNameWiFi(1, tmpCategory, tmpProgram); end;
    2: begin tID2 := tmpProgram; tTEXT2 := GetProgramNameWiFi(2, tmpCategory, tmpProgram); end;
    3: begin tID3 := tmpProgram; tTEXT3 := GetProgramNameWiFi(3, tmpCategory, tmpProgram); end;
    4: begin tID4 := tmpProgram; tTEXT4 := GetProgramNameWiFi(4, tmpCategory, tmpProgram); end;
    5: begin tID5 := tmpProgram; tTEXT5 := GetProgramNameWiFi(5, tmpCategory, tmpProgram); end;
    6: begin tID6 := tmpProgram; tTEXT6 := GetProgramNameWiFi(6, tmpCategory, tmpProgram); end;
    7: begin tID7 := tmpProgram; tTEXT7 := GetProgramNameWiFi(7, tmpCategory, tmpProgram); end;
    8: begin tID8 := tmpProgram; tTEXT8 := GetProgramNameWiFi(8, tmpCategory, tmpProgram); end;
    9: begin tID9 := tmpProgram; tTEXT9 := GetProgramNameWiFi(9, tmpCategory, tmpProgram); end;
    10: begin tID10 := tmpProgram; tTEXT10 := GetProgramNameWiFi(10, tmpCategory, tmpProgram); end;
    11: begin tID11 := tmpProgram; tTEXT11 := GetProgramNameWiFi(11, tmpCategory, tmpProgram); end;
    12: begin tID12 := tmpProgram; tTEXT12 := GetProgramNameWiFi(12, tmpCategory, tmpProgram); end;
    end;

    ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0 WHERE favorite='+IntToStr(tmpColor+10);
    ADOQuerySQL.ExecSQL;

    ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite='+IntToStr(tmpColor+10)+' WHERE id='+IntToStr(tmpProgram);
    ADOQuerySQL.ExecSQL;
    tmpRec := ADOQueryDiseases.FieldByName('id').AsInteger;
    ADOQueryDiseases.Requery();
    ADOQueryDiseases.Locate('id', tmpRec, []);
  end;
  end;

begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

{  case tmpButton of
  1,2,3,4: set_prog(2, tmpProgram);
  5,6,7,8: set_prog(3, tmpProgram);
  9,10,11,12: set_prog(4, tmpProgram);
  end;     }

  set_prog(tmpButton, tmpProgram);

  case DBLookupComboBoxZapper.KeyValue of  //1-Basic, 2-Basic SW, 3-HighFreq, 4-HighFreq SW, 5-WiFi, 6-WiFi SW, 7-SW
  1,2,3,4:begin
      //PREPARE_BUFF;
      //VaComm1.WriteBuf(buf, 18);
      //PARSE_BUFF('Изпращане на команда за запис на програми Basic', 18);
   //   if MessageDlg('Искате ли да добавите още бързи програми?'+#13 +' Ако натиснете "No" ще преминете към запис на бързите програми в Запера!', mtConfirmation, mbYesNo, 0) = mrYes then Exit;
      if Assigned(fProgram) then
      fProgram.ButtonProgram_for_9progClick(nil);
  end;
  5,6,8,9:begin

      tmpPos := 73 + ((tmpButton-1)*4);
      PREPARE_BUFF;
      USB_Buffer[1] := 0;
      USB_Buffer[2] := 0;
      USB_Buffer[3] := 16;
      USB_Buffer[4] := tmpPos;
      USB_Buffer[5] := byte(tmpCategory);
      USB_Buffer[6] := byte(tmpCategory shr 8);
      USB_Buffer[7] := byte(tmpProgram);
      USB_Buffer[8] := byte(tmpProgram shr 8);

      if Connection_Type = 0 then //0-USB, 1-LAN
      begin
        VaComm1.WriteBuf(USB_Buffer, 8);
        PARSE_BUFF('USB - Изпращане на команда за запис на програми WiFi', 8);
      end else
      begin
        SendBufferToLAN(8);
        LAN_PARSE_BUFF('LAN - Изпращане на команда за запис на програми WiFi', 8);
      end;




  end;
  7:begin  end;
  end;


  change_menu;
end;
end;

procedure Clear_All_Vars;
begin
  with fMain do
  begin

    _Power := 0;
    _DurationFrequenceTime := 0;
    _Zumer := 0;
    _Sweep := 0;
    _Wifi := 0;
    _Wifi_AP := 0;
    _Wifi_AP_NoAct := 0;
    _SilverWaterStartByte := 0;
    _CurrentSetPoint := 0;
    _WaterQuantity := 0;
    _SilverConcentration := 0;
    _SilverWaterOn := 0;
    _CurrentSence := 0;
    _SilverWatterTime := 0;
    _SilverWaterRemain := 0;
    GLB_SHORT_MAC := '';
    GLB_FULL_MAC := '';

    tID1 := 0; tID2 := 0;  tID3 := 0;  tID4 := 0;  tID5 := 0;  tID6 := 0;  tID7 := 0;  tID8 := 0;  tID9 := 0;  tID10 := 0;  tID11 := 0;  tID12 := 0;
    tTEXT1 := ''; tTEXT2 := ''; tTEXT3 := ''; tTEXT5 := ''; tTEXT6 := ''; tTEXT7 := ''; tTEXT8 := ''; tTEXT9 := ''; tTEXT10 := ''; tTEXT11 := ''; tTEXT12 := '';

    StatusBar1.Panels[0].Text := 'Не е свързан Запер';
    StatusBar1.Panels[1].Text := '';
    StatusBar1.Panels[2].Text := '';
    StatusBar1.Panels[3].Text := '';
    StatusBar1.Panels[4].Text := '';
    StatusBar1.Panels[5].Text := '';
    StatusBar1.Panels[6].Text := '';
    StatusBar1.Panels[7].Text := '';
    StatusBar1.Panels[8].Text := '';
    StatusBar1.Panels[9].Text := '';

    Connected_com_port := '';
    DBLookupComboBoxZapper.KeyValue := -1;

    AdvToolBarButtonPrograms.Enabled := True;
    AdvToolBarButtonSilverWater.Enabled := True;
    AdvToolBarButtonEditor.Enabled := True;

    M_b1 := 0;
    M_b2 := 0;
    M_b3 := 0;
    M_b4 := 0;

    zapper_id := -1;

    MenuItemRED1.Enabled := False;
    MenuItemRED2.Enabled := False;
    MenuItemRED3.Enabled := False;
    MenuItemRED4.Enabled := False;
    MenuItemGREEN1.Enabled := False;
    MenuItemGREEN2.Enabled := False;
    MenuItemGREEN3.Enabled := False;
    MenuItemGREEN4.Enabled := False;
    MenuItemBLUE1.Enabled := False;
    MenuItemBLUE2.Enabled := False;
    MenuItemBLUE3.Enabled := False;
    MenuItemBLUE4.Enabled := False;
  end;
end;

function Check_SilverWater(tmpMessage:Byte):Boolean;
var tmpResult:Boolean;
begin
with fMain do
begin
  try
    tmpResult := False;

    case DBLookupComboBoxZapper.KeyValue of //1-Basic, 2-Basic SW, 3-HighFreq, 4-HighFreq SW, 5-WiFi, 6-WiFi SW, 7-SW
      1:tmpResult := False;
      2:tmpResult := True;
      3:tmpResult := False;
      4:tmpResult := True;
      5:tmpResult := False;
      6:tmpResult := True;
      7:tmpResult := True; //only Silver
      8:tmpResult := True;
      9:tmpResult := True;
    end;
    if (tmpMessage=1) AND (tmpResult=False) then
    begin
      if RadioGroupMainLanguage.ItemIndex=0 then
      ShowMessage('Вашият Запер няма тази функционалност!') else
      ShowMessage('Your Zapper does not have this functionality!');
    end;

  except on e:Exception do
  begin
    tmpResult := False;
    if tmpMessage=1 then ShowMessage('Възникна грешка: '+#13+e.Message);
  end;
  end;

  Result := tmpResult;
end;
end;

function Check_Zapper(tmpMessage:Byte):Boolean;
var tmpResult:Boolean;
begin
with fMain do
begin
  try
    tmpResult := False;

    case DBLookupComboBoxZapper.KeyValue of //1-Basic, 2-Basic SW, 3-HighFreq, 4-HighFreq SW, 5-WiFi, 6-WiFi SW, 7-SW
      1:tmpResult := True;
      2:tmpResult := True;
      3:tmpResult := True;
      4:tmpResult := True;
      5:tmpResult := True;
      6:tmpResult := True;
      7:tmpResult := False;
      8:tmpResult := True;
      9:tmpResult := True;
    end;
    if (tmpMessage=1) AND (tmpResult=False) then
    begin
      if RadioGroupMainLanguage.ItemIndex=0 then
      ShowMessage('Вашият Запер няма тази функционалност!') else
      ShowMessage('Your Zapper does not have this functionality!');
    end;
  except on e:Exception do
  begin
    tmpResult := False;
    if tmpMessage=1 then ShowMessage('Възникна грешка: '+#13+e.Message);
  end;
  end;

  Result := tmpResult;
end;
end;

function Check_ZapperWiFi(tmpMessage:Byte):Boolean;
var tmpResult:Boolean;
begin
with fMain do
begin
  try
    tmpResult := False;

    case DBLookupComboBoxZapper.KeyValue of //1-Basic, 2-Basic SW, 3-HighFreq, 4-HighFreq SW, 5-WiFi, 6-WiFi SW, 7-SW
      1:tmpResult := False;
      2:tmpResult := False;
      3:tmpResult := False;
      4:tmpResult := False;
      5:tmpResult := True;
      6:tmpResult := True;
      7:tmpResult := False;
      8:tmpResult := True; //new model r1
      9:tmpResult := True; //new model r2
    end;
    if (tmpMessage=1) AND (tmpResult=False) then ShowMessage('Вашият Запер няма тази функционалност!');
  except on e:Exception do
  begin
    tmpResult := False;
    if tmpMessage=1 then ShowMessage('Възникна грешка: '+#13+e.Message);
  end;
  end;

  Result := tmpResult;
end;
end;

function VarToStrNil(Value:Variant):string;
 begin
   if VarIsNull(Value) then
    Result:=''
   else
    Result:=VarToStr(Value);
 end;


function GetWMIstring(wmiClass, wmiProperty: string): string;
var
  objWMIService : OLEVariant;
  colItems      : OLEVariant;
  colItem       : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;

  function GetWMIObject(const objectName: String): IDispatch;
  var
    chEaten: Integer;
    BindCtx: IBindCtx;//for access to a bind context
    Moniker: IMoniker;//Enables you to use a moniker object
  begin
    OleCheck(CreateBindCtx(0, bindCtx));
    OleCheck(MkParseDisplayName(BindCtx, StringToOleStr(objectName), chEaten, Moniker));//Converts a string into a moniker that identifies the object named by the string
    OleCheck(Moniker.BindToObject(BindCtx, nil, IDispatch, Result));//Binds to the specified object
  end;

begin
try
  try
    wmiClass:=StringReplace(wmiClass, '"', #39, [rfReplaceAll]);
    objWMIService := GetWMIObject(Format('winmgmts:\\%s\%s',['.','root\CIMV2']));
    colItems      := objWMIService.ExecQuery(Format('SELECT * FROM %s',[wmiClass]),'WQL',0);
    oEnum         := IUnknown(colItems._NewEnum) as IEnumVariant;

    while oEnum.Next(1, colItem, iValue) = 0 do
    begin
       try
       Result := colItem.Properties_.Item(wmiProperty, 0); //you can improve this code  ;) , storing the results in an TString.
       except
       Result := 'null';
       end;
    end;

  finally
  {  FreeAndNil(objWMIService); objWMIService:=null;
    FreeAndNil(colItems); colItems:=null;
    FreeAndNil(colItem); colItem:=null;
    FreeAndNil(oEnum); oEnum:=nil; }
    objWMIService:=null;
    colItems:=null;
    colItem:=null;
    oEnum:=nil;
  end;


except on e:Exception do
  Result := 'ERROR: '+e.Message;
end;
end;

function Get_MacAddress_WMI:string;
var
  objWMIService : OLEVariant;
  colItems      : OLEVariant;
  colItem       : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
  wmiHost, root, wmiClass, tmpMAC: string;

  function GetWMIObject(const objectName: String): IDispatch;
  var
    chEaten: Integer;
    BindCtx: IBindCtx;//for access to a bind context
    Moniker: IMoniker;//Enables you to use a moniker object
  begin
    OleCheck(CreateBindCtx(0, bindCtx));
    OleCheck(MkParseDisplayName(BindCtx, StringToOleStr(objectName), chEaten, Moniker));//Converts a string into a moniker that identifies the object named by the string
    OleCheck(Moniker.BindToObject(BindCtx, nil, IDispatch, Result));//Binds to the specified object
  end;

begin

  tmpMAC := '';
  wmiHost       := '.';
  root          := 'root\CIMV2';
  wmiClass      := 'Win32_NetworkAdapterConfiguration';
  objWMIService := GetWMIObject(Format('winmgmts:\\%s\%s',[wmiHost,root]));
  colItems      := objWMIService.ExecQuery(Format('SELECT * FROM %s',[wmiClass]),'WQL',0);
  oEnum         := IUnknown(colItems._NewEnum) as IEnumVariant;

  while oEnum.Next(1, colItem, iValue) = 0 do
  if VarToStrNil(colItem.MACAddress)<>'' then //uncomment if you only want list the interfaces with mac adress
  if colItem.IPEnabled then  // uncomment if you only want list the active interfaces
  if tmpMAC='' then
  begin
    tmpMAC := VarToStrNil(colItem.MACAddress);
  end;

  Result := tmpMAC;
end;

function Get_Username_WMI:string;
var
  objWMIService : OLEVariant;
  colItems      : OLEVariant;
  colItem       : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
  wmiHost, root, wmiClass, tmpUsername: string;

  function GetWMIObject(const objectName: String): IDispatch;
  var
    chEaten: Integer;
    BindCtx: IBindCtx;//for access to a bind context
    Moniker: IMoniker;//Enables you to use a moniker object
  begin
    OleCheck(CreateBindCtx(0, bindCtx));
    OleCheck(MkParseDisplayName(BindCtx, StringToOleStr(objectName), chEaten, Moniker));//Converts a string into a moniker that identifies the object named by the string
    OleCheck(Moniker.BindToObject(BindCtx, nil, IDispatch, Result));//Binds to the specified object
  end;

begin
  tmpUsername := '';
  wmiHost       := '.';
  root          := 'root\CIMV2';
  wmiClass      := 'Win32_ComputerSystem';
  objWMIService := GetWMIObject(Format('winmgmts:\\%s\%s',[wmiHost,root]));
  colItems      := objWMIService.ExecQuery(Format('SELECT * FROM %s',[wmiClass]),'WQL',0);
  oEnum         := IUnknown(colItems._NewEnum) as IEnumVariant;

  while oEnum.Next(1, colItem, iValue) = 0 do
  begin
    tmpUsername := VarToStrNil(colItem.UserName);
    Delete(tmpUsername, 1, Pos('\', tmpUsername));
  end;

  Result := tmpUsername;
end;

function Get_OperationSystem_WMI:string;
var
  objWMIService : OLEVariant;
  colItems      : OLEVariant;
  colItem       : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
  wmiHost, root, wmiClass, tmpOS: string;

  function GetWMIObject(const objectName: String): IDispatch;
  var
    chEaten: Integer;
    BindCtx: IBindCtx;//for access to a bind context
    Moniker: IMoniker;//Enables you to use a moniker object
  begin
    OleCheck(CreateBindCtx(0, bindCtx));
    OleCheck(MkParseDisplayName(BindCtx, StringToOleStr(objectName), chEaten, Moniker));//Converts a string into a moniker that identifies the object named by the string
    OleCheck(Moniker.BindToObject(BindCtx, nil, IDispatch, Result));//Binds to the specified object
  end;

begin
  tmpOS := '';
  wmiHost       := '.';
  root          := 'root\CIMV2';
  wmiClass      := 'Win32_OperatingSystem';
  objWMIService := GetWMIObject(Format('winmgmts:\\%s\%s',[wmiHost,root]));
  colItems      := objWMIService.ExecQuery(Format('SELECT * FROM %s',[wmiClass]),'WQL',0);
  oEnum         := IUnknown(colItems._NewEnum) as IEnumVariant;

  while oEnum.Next(1, colItem, iValue) = 0 do
  begin
    tmpOS := VarToStrNil(colItem.Caption);
    tmpOS := tmpOS + ' ' +VarToStrNil(colItem.CSDVersion);
    tmpOS := tmpOS + ' ' +VarToStrNil(colItem.OSArchitecture);
    Delete(tmpOS, 1, Pos('\', tmpOS));
  end;

  Result := tmpOS;
end;

function GET_COMPUTER_NAME: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  try
    size := 256;
    if GetComputerName(buffer, size) then
    Result := buffer   else
    Result := '';
  except on e:Exception do
  end;
end;

function GET_LOCAL_IP:string;
begin
  Result := fMain.IdIPWatch1.LocalIP;
end;


Function GetUserFromWindows: string;
Var
   UserName : string;
   UserNameLen : Dword;
Begin
  try
     UserNameLen := 255;
     SetLength(userName, UserNameLen) ;
     If GetUserName(PChar(UserName), UserNameLen) Then
       Result := Copy(UserName,1,UserNameLen - 1)
     Else
       Result := 'Unknown';
  except on e:Exception do
  end;
End;

function Check_Connect(tmpShowMessage:Byte):Boolean;
begin
with fMain do
begin

  Result := False;


  if RadioGroupTypeConnections.ItemIndex=0 then  //usb connection
  begin

    if DBLookupComboBoxZapper.Text = '' then
    begin
      if tmpShowMessage = 1 then
      begin
        if RadioGroupMainLanguage.ItemIndex=0 then
        ShowMessage('Моля, свържете Вашия Запер към компютъра!') else
        ShowMessage('Please connect your Zapper to the computer!');

      end;
      Result := False;
      Exit;
    end else
    begin

      VaComm1.Close;
      VaComm1.Baudrate := TVaBaudrate.br9600;
      VaComm1.DeviceName := Connected_com_port;
      VaComm1.Open;
    end;

    Result := true;

  end else
  begin //lan connection

    Result := True;
  end;

end;
end;

procedure LogRX(tmpText : string);
begin

  if fMain.CheckBoxRX.Checked then
  begin

    if fMain.MemoMainLogRX.Lines.Count >= 3000 then fMain.MemoMainLogRX.Clear;
    fMain.MemoMainLogRX.Lines.Add(tmpText);

    if Assigned(fOptions) then
    begin
    if fOptions.MemoMainLogRX_D.Lines.Count >= 3000 then fOptions.MemoMainLogRX_D.Lines.Clear;
    fOptions.MemoMainLogRX_D.Lines.Add(tmpText);
    end;
  end;


end;

procedure LogTX(tmpText : string);
begin
  if fMain.CheckBoxTX.Checked then
  begin
    if fMain.MemoMainLogTX.Lines.Count >= 3000 then fMain.MemoMainLogTX.Clear;
    fMain.MemoMainLogTX.Lines.Add(tmpText);

    if Assigned(fOptions) then
    begin
    if fOptions.MemoMainLogTX_D.Lines.Count >= 3000 then fOptions.MemoMainLogTX_D.Lines.Clear;
    fOptions.MemoMainLogTX_D.Lines.Add(tmpText);
    end;
  end;

end;

procedure LogEvent(tmpText : string);
begin
  if fMain.CheckBoxMessage.Checked then
  begin
    if fMain.MemoMainLogEvent.Lines.Count >= 3000 then fMain.MemoMainLogEvent.Clear;
    fMain.MemoMainLogEvent.Lines.Add(DateTimeToStr(Now)+' '+tmpText);

    if Assigned(fOptions) then
    begin
    if fOptions.MemoMainLogEvent_D.Lines.Count >= 3000 then fOptions.MemoMainLogEvent_D.Lines.Clear;
    fOptions.MemoMainLogEvent_D.Lines.Add(DateTimeToStr(Now)+' '+tmpText);
    end;
  end;

end;

procedure PREPARE_BUFF;
var
  I: Integer;
begin
  for I := 1 to 255 do USB_Buffer[i] := 0;

  //0-usb , 1-LAN
  if Connection_Type=0 then SleepSky(100);

  tmpBufTime := Now;
end;

procedure PARSE_BUFF(tmpMessage:string; tmpCount:Integer);
var
  I: Integer;
  x: string;
  tmp : TDateTime;
begin
  tmp := Now;

  LogTX(' *** USB Connections ***');
  LogTX(tmpMessage+' '+IntToStr(tmpCount)+' знака. '+IntToStr(MilliSecondsBetween(Now, tmpBufTime))+'мс.');
  LogEvent(tmpMessage+' '+IntToStr(tmpCount)+' знака. '+IntToStr(MilliSecondsBetween(Now, tmpBufTime))+'мс.');

  for i := 1 to tmpCount do
  begin
    LogTX('No: '+IntToStr(i)+ ' Byte: '+IntToStr(USB_Buffer[i])+' Hex: '+IntToHex(USB_Buffer[i], 2) + isCharacters(USB_Buffer[i]) );
  end;

  fMain.MemoMainLogTX.Lines.Add('време за визуализация: '+IntToStr(MilliSecondsBetween(now, tmp)));

  if Connection_Type=0 then //0-USB, 1-LAN
  SleepSky(100);

  fMain.MemoMainLogTX.Lines.Add('2 допълнително: '+IntToStr(MilliSecondsBetween(now, tmp)));

end;




procedure LAN_PARSE_BUFF(tmpMessage:string; tmpCount:Integer);
var
  I: Integer;
  x: string;
  tmp : TDateTime;
begin
  tmp := Now;

  LogTX('======================');
  LogTX('IP Connections: ' + LAN_Connection_IP);
  LogTX(tmpMessage+' '+IntToStr(tmpCount)+' знака. '+IntToStr(MilliSecondsBetween(Now, tmpBufTime))+'мс.');
  LogEvent(tmpMessage+' '+IntToStr(tmpCount)+' знака. '+IntToStr(MilliSecondsBetween(Now, tmpBufTime))+'мс.');

  for i := 0 to tmpCount-1 do
  begin
    LogTX('No: '+IntToStr(i)+ ' Byte: '+IntToStr(LAN_Buffer[i])+' Hex: '+IntToHex(LAN_Buffer[i], 2) + isCharacters(USB_Buffer[i]) );
  end;

  fMain.MemoMainLogTX.Lines.Add('време за визуализация: '+IntToStr(MilliSecondsBetween(now, tmp)));

end;



procedure Save_INI(_ident:string; _MAC : string);
var
   IniFile : TIniFile;
 begin
   IniFile := TIniFile.Create(xPath+'\myapp.ini');
   IniFile.WriteString('Devices', _ident, _MAC);
   IniFile.Free;
end;

function Read_INI(_ident:string):string;
var
   IniFile : TIniFile;
begin
   IniFile := TIniFile.Create(xPath+'\myapp.ini');
   Result := IniFile.ReadString('Devices', _ident, '0');
   IniFile.Free;
end;

procedure SEND_Cloud(_Buffer : TIdBytes);
begin
with fMain do
begin
  try
   IdUDPClient1.SendBuffer('83.97.27.107', 7433, _Buffer);  //95.111.115.72 old IP
  except
  // ShowMessage('ERROR COMUNICATION CLOUD');
  end;
end;
end;

procedure Clear_Frequences;
var i :Integer;
begin
  for I := 1 to 500 do
  ALL_Frequences[i] := 0;
end;

function Get_Frequence_From_Position(tmpRecord:integer):integer;
var i,sum_sec :Integer;
begin
  sum_sec := 0;

  for I := tmpRecord to 500 do
  sum_sec := sum_sec + ALL_Frequences[i];

  Result := sum_sec;
end;

function Get_Frequence_Until_Position(tmpRecord:integer):integer;
var i,sum_sec :Integer;
begin
  sum_sec := 0;

  for I := 1 to tmpRecord do
  sum_sec := sum_sec + ALL_Frequences[i];

  Result := sum_sec;
end;

procedure Refresh_Frequences(tmpID:string);
var sec:Integer;
begin
with fMain do
begin
  Clear_Frequences;


  Max_ProgramRecords := 0;

  ADOQuerySumFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+tmpID+' ORDER BY orderno';
  ADOQuerySumFreq.Open;
  while not ADOQuerySumFreq.Eof do
  begin
    if ADOQuerySumFreq.FieldByName('time_sec').AsInteger = 0 then
    ALL_Frequences[ADOQuerySumFreq.RecNo] := GLB_Duration else
    ALL_Frequences[ADOQuerySumFreq.RecNo] := ADOQuerySumFreq.FieldByName('time_sec').AsInteger;

    Max_ProgramRecords := Max_ProgramRecords + 1;
  ADOQuerySumFreq.Next;
  end;

  sec := Get_Frequence_From_Position(1);

{
  if fProgram.RadioGroupLanguage.ItemIndex = 0 then
  fProgram.LabelTimeProgram.Caption := 'Общо време: ' + Format('%.2d:%.2d мин.', [sec div 60, sec mod 60]) else
  fProgram.LabelTimeProgram.Caption := 'Totel time: ' + Format('%.2d:%.2d мин.', [sec div 60, sec mod 60]);

  if fProgram.RadioGroupLanguage.ItemIndex = 0 then
  fProgram.LabelTimeElipsed.Caption := 'Остава: ' + Format('%.2d:%.2d мин.', [sec div 60, sec mod 60]) else
  fProgram.LabelTimeElipsed.Caption := 'Remains time: ' + Format('%.2d:%.2d мин.', [sec div 60, sec mod 60]);
}

        {
  if fProgram.RadioGroupLanguage.ItemIndex = 0 then
  fProgram.LabelProgram_Time.Caption := 'Общо време: ' + TimeToStr(Time-IncSecond(Time,sec)) else
  fProgram.LabelProgram_Time.Caption := 'Totel time: ' + TimeToStr(Time-IncSecond(Time,sec));


  if fProgram.RadioGroupLanguage.ItemIndex = 0 then
  fProgram.LabelProgram_Time.Caption := TimeToStr(Time-IncSecond(Time,sec)) else //'Остава: ' +
  fProgram.LabelProgram_Time.Caption := TimeToStr(Time-IncSecond(Time,sec)); //'Remains time: ' +
     }
end;
end;
      {

procedure Refresh_FrequencesGroup(tmpCategoryID, CategoryPersonalID:string);
var sec:Integer;
begin
with fMain do
begin
  Clear_Frequences;

  Max_GroupRecords := 0;

  if tmpCategoryID <> '' then ADOQuerySumFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id IN (SELECT id FROM diseases WHERE category_id='+tmpCategoryID+') ORDER BY orderno';
  if CategoryPersonalID <> '' then ADOQuerySumFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id IN (SELECT id FROM v_diseases_personal WHERE group_id='+CategoryPersonalID+') ORDER BY orderno';
  ADOQuerySumFreq.Open;

  while not ADOQuerySumFreq.Eof do
  begin
    if ADOQuerySumFreq.FieldByName('time_sec').AsInteger = 0 then
    ALL_Frequences[ADOQuerySumFreq.RecNo] := GLB_Duration else
    ALL_Frequences[ADOQuerySumFreq.RecNo] := ADOQuerySumFreq.FieldByName('time_sec').AsInteger;

    Max_GroupRecords := Max_GroupRecords + 1;
  ADOQuerySumFreq.Next;
  end;

  sec := Get_Frequence_From_Position(1);

  if fProgram.RadioGroupLanguage.ItemIndex = 0 then
  fProgram.LabelTimeProgram.Caption := 'Общо време: ' + TimeToStr(Time-IncSecond(Time,sec)) else
  fProgram.LabelTimeProgram.Caption := 'Totel time: ' + TimeToStr(Time-IncSecond(Time,sec));

  if fProgram.RadioGroupLanguage.ItemIndex = 0 then
  fProgram.LabelTimeElipsed.Caption := 'Остава: ' + TimeToStr(Time-IncSecond(Time,sec)) else
  fProgram.LabelTimeElipsed.Caption := 'Remains time: ' + TimeToStr(Time-IncSecond(Time,sec));

end;
end; }


function IsValidEmail(const Value: string): Boolean;

function CheckAllowed(const s: string): Boolean;
  var i: Integer;
  begin
    Result:= False;
    for i:= 1 to Length(s) do
      if not (s[i] in ['a'..'z',
                       'A'..'Z',
                       '0'..'9',
                       '_',
                       '-',
                       '.']) then Exit;
    Result:= true;
  end;

var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result:= False;
  i:=Pos('@', Value);
  if i=0 then Exit;

  NamePart:=Copy(Value, 1, i-1);
  ServerPart:=Copy(Value, i+1, Length(Value));

  if (Length(NamePart)=0) or ((Length(ServerPart)<5)) then Exit;

  i:=Pos('.', ServerPart);
  if (i=0) or (i>(Length(serverPart)-2)) then Exit;

  Result:= CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

function SendMail(z_Subject, z_FromName, z_Body, zBody_HTML, z_AddMails, z_AddBCC, z_FileAttachments, z_FileName :string):string;
var
success: Integer;
i:Integer;

TEMP_SEND_FILE, s, z_email_name, zid : string;

Msg : TIdMessage;
File_New : TIdAttachmentFile;
tmpBody : TIdText;
begin
with fMain do
begin

//try

      GLOBAL_EXCH_SERVER:='smtp.gmail.com';
      GLOBAL_EXCH_PORT:='587';
      GLOBAL_EXCH_USERNAME:='sky.sales@sky.bg';
      GLOBAL_EXCH_PASSWORD:='Sales!@23';

    //  GLOBAL_EXCH_FROM_NAME:=ADOQueryEmailCheck.FieldByName('from_name').AsString;
    //  GLOBAL_EXCH_ReplyTo:=ADOQueryEmailCheck.FieldByName('ReplyTo').AsString;
    //  GLOBAL_EXCH_TYPE:=ADOQueryEmailCheck.FieldByName('TYPE').AsString;


        Msg:=TIdMessage.Create(nil);
        Msg.Clear;
        Msg.ClearBody;
        Msg.MessageParts.Clear;
        Msg.Encoding := meMIME;
        Msg.AttachmentEncoding := 'MIME';

        Msg.ConvertPreamble:=True;
        Msg.ContentType:='multipart/related'; // multipart/related text/html   text/plain
        Msg.CharSet:='UTF-8';
        Msg.Subject:=WideString(z_Subject);

        tmpBody:=TIdText.Create(Msg.MessageParts, nil);
        tmpBody.ContentType:='text/html';
        tmpBody.CharSet:='UTF-8'; //windows-1251
      //tmpBody.Body.Text:=WideString(StringReplace(z_Body, #13, '<br>', [rfReplaceAll]));
      //tmpBody.Body.LoadFromFile('E:\1.Delphi_XE7\12.Zapper\3.SPAM\Sky_Zaper_Newsletter\Sky_Zaper_Newsletter\Sky_Zaper_Newsletter_Coronavirus.html');
      //tmpBody.Body.LoadFromFile('c:\Publication-4_.html');
        tmpBody.Body.Text := z_Body;

        Msg.Date:=Now;

        //=====================
        //From Address mail
        //=====================
        Msg.From.Address:=GLOBAL_EXCH_USERNAME;
        Msg.From.Name:=z_FromName;


        //=====================
        //Blank Copy Address mail
        //=====================
// Msg.BccList.Add.Address:='softdev@sky.bg';

        s:=z_AddBCC;
        s:=StringReplace(s,',',#13,[rfReplaceAll]);
        s:=StringReplace(s,';',#13,[rfReplaceAll]);
        s:=StringReplace(s,' ',#13,[rfReplaceAll]);
        ListBoxEmail.Items.Text:=s;

        for I := 0 to ListBoxEmail.Count - 1 do
        begin
            if Length(ListBoxEmail.Items.Strings[i]) >= 5 then
            begin
            if IsValidEmail(ListBoxEmail.Items.Strings[i]) then
            Msg.BccList.Add.Address := ListBoxEmail.Items.Strings[i] else
            LogEvent('Невалиден bcc e-mail: '+ListBoxEmail.Items.Strings[i]);

            end;
        end;

        //=====================
        //To Address mail
        //=====================
        LogEvent('SEND E-MAIL TO '+z_AddMails);
        s:=z_AddMails;
        s:=StringReplace(s,',',#13,[rfReplaceAll]);
        s:=StringReplace(s,';',#13,[rfReplaceAll]);
        s:=StringReplace(s,' ',#13,[rfReplaceAll]);
        ListBoxEmail.Items.Text:=s;

        for I := 0 to ListBoxEmail.Count - 1 do
        begin
            if Length(ListBoxEmail.Items.Strings[i]) >= 5 then
            begin
            if IsValidEmail(ListBoxEmail.Items.Strings[i]) then
            Msg.Recipients.Add.Address:=ListBoxEmail.Items.Strings[i] else
            LogEvent('Невалиден e-mail: '+ListBoxEmail.Items.Strings[i]);
            end;
        end;


        //=====================
        //Atachment files
        //=====================

        ListBoxAttachments.Items.Text:=z_FileAttachments;
        for I := 0 to ListBoxAttachments.Count - 1 do
        begin
          if ListBoxAttachments.Items.Strings[i] <> '' then
          if FileExists(ListBoxAttachments.Items.Strings[i]) then
          begin
              //TEMP_SEND_FILE:='C:\SEND_FILE'+IntToStr(i)+'.XLSX';
              //DeleteFile(TEMP_SEND_FILE);
              //CopyFile(PWideChar(ListBoxAttachments.Items.Strings[i]), PWideChar(TEMP_SEND_FILE), False);
              //ShowMessage(ListBoxAttachments.Items.Strings[i]+#13+TEMP_SEND_FILE);
              //File_New:=TIdAttachmentFile.Create(Msg.MessageParts, TEMP_SEND_FILE);

            File_New:=TIdAttachmentFile.Create(Msg.MessageParts, ListBoxAttachments.Items.Strings[i]);
            if z_FileName <> '' then
            File_New.FileName:=z_FileName;
            File_New.FileIsTempFile:=True;
          end else
          LogEvent('Не съществува такъв файл: '+ListBoxAttachments.Items.Strings[i]);
        end;

        //Socket errod 11001 host not found 74.125.140.109
      //  if fMain.IdIPWatch1.LocalIP = '192.168.7.15' then GLOBAL_EXCH_SERVER:='74.125.140.109'; //smtp

        //IdSMTP2.Disconnect;
        LogEvent('GMAIL SERVER IP: '+GLOBAL_EXCH_SERVER);
        LogEvent('GMAIL SERVER PORT: '+GLOBAL_EXCH_PORT);

        IdSMTP_with_SSL.Host:= GLOBAL_EXCH_SERVER;
        IdSMTP_with_SSL.Port:= StrToInt(GLOBAL_EXCH_PORT);
        IdSMTP_with_SSL.Username:= GLOBAL_EXCH_USERNAME;
        IdSMTP_with_SSL.Password:= GLOBAL_EXCH_PASSWORD;


       // Msg.SaveToFile(APP_PATH + SERVER_TEMP + GET_SUB_DIR_MAIL + FormatDateTime('HHMMSS', Now)+'.EML');

        IdSMTP_with_SSL.Connect;
        IdSMTP_with_SSL.Send(Msg);
        IdSMTP_with_SSL.Disconnect;

        Result:='SUCCES';




{
except on e:Exception do
  Result:='SEND E-MAIL ERROR: '+e.Message;
end;
}
end;
end;

procedure clear_buffer;
var
  I: Integer;
begin
  for I := 0 to max_mem do buff[i] := 0;
end;



function check_freq_count(tmpFreq:string):Integer;
begin
with fMain do
begin

  ADOQueryCheckFreq.SQL.Text:='SELECT * FROM freq WHERE disease_id='+tmpFreq;
  ADOQueryCheckFreq.Open;
  Result := ADOQueryCheckFreq.RecordCount;

end;
end;

function set_power_freq(ManSweep, Sweep, ManPower, Power : Byte; Frequence : Integer):Integer;
begin
with fMain do
begin

  if Check_Connect(1) = False then Exit;


  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 10; //calibate command
  USB_Buffer[5] := ManSweep;
  USB_Buffer[6] := ManPower;
  USB_Buffer[7] := byte(Frequence);
  USB_Buffer[8] := byte(Frequence shr 8);
  USB_Buffer[9] := byte(Frequence shr 16);
  USB_Buffer[10] := byte(Frequence shr 24);
  USB_Buffer[11] := Sweep;
  USB_Buffer[12] := Power;

  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 12);
    PARSE_BUFF('USB - Изпращане на команда сила и честота', 12);
  end else
  begin
    SendBufferToLAN(12);
    LAN_PARSE_BUFF('LAN - Изпращане на команда сила и честота', 12);
  end;


  Result := 0;

end;
end;


{
procedure Command_CMD(zCommand : string);
begin                        // /c
//  WinExec(pansichar('c:\windows\system32\cmd.exe  '+zCommand), SW_SHOWNORMAL);
  WinExec(pansichar('cmd.exe /c '+zCommand), SW_SHOWNORMAL);
end;

procedure RunProgram(CmdLine:String);
var StartupInfo:TStartUpInfo;
    ProcessInformation:TProcessInformation;
    Handle:THandle;
    d:DWord;
begin
    FillChar(StartUpInfo,SizeOf(StartUpInfo),0);
    StartUpInfo.cb:=SizeOf(TStartUpInfo);
    if CreateProcess(nil,PChar(CmdLine),nil,nil,False, Create_Separate_WOW_VDM,nil,nil, StartUpInfo,ProcessInformation) then
    begin
       Handle:=OpenProcess(Synchronize or Standard_Rights_Required or $FFF, True, ProcessInformation.dwProcessID);
       while GetExitCodeProcess(Handle,d) and (d=Still_Active) do sleep(10);
    end;
end;

function GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
var
  SecAtrrs: TSecurityAttributes;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  pCommandLine: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  Result := '';
  with SecAtrrs do begin
    nLength := SizeOf(SecAtrrs);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SecAtrrs, 0);
  try
    with StartupInfo do
    begin
      FillChar(StartupInfo, SizeOf(StartupInfo), 0);
      cb := SizeOf(StartupInfo);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    WorkDir := Work;
    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + CommandLine),
                            nil, nil, True, 0, nil,
                            PChar(WorkDir), StartupInfo, ProcessInfo);
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := windows.ReadFile(StdOutPipeRead, pCommandLine, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            pCommandLine[BytesRead] := #0;
            Result := Result + pCommandLine;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      finally
        CloseHandle(ProcessInfo.hThread);
        CloseHandle(ProcessInfo.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;

}

procedure TfMain.ADOQueryDiseasesdescription_bgGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
if Length(Sender.AsWideString) <= 0 then
Text := ADOQueryDiseases.FieldByName('description_en').AsString+' * ' else
Text := ADOQueryDiseases.FieldByName('description_bg').AsString;
end;

procedure TfMain.AdvToolBarButtonSilverWaterClick(Sender: TObject);
begin
  SEND_Cloud([3, 0, 26, 153, 5, m_b1, m_b2, m_b3, m_b4]);

  if Assigned(fProgram) then fProgram.Close;
  if Assigned(fCustomGroups) then fCustomGroups.Close;
  if Assigned(fEdit) then fEdit.Close;
  if Assigned(fOptions) then fOptions.Close;
  if Assigned(fUpdateSoftware) then fUpdateSoftware.Close;

  if SecondsBetween(Now, LastPacketPing) < 20 then
  begin
    if Assigned(fSrebarnaVoda)=False then
    Application.CreateForm(TfSrebarnaVoda, fSrebarnaVoda) else
    fSrebarnaVoda.WindowState := wsMaximized;
  end else
  ShowMessage('Нямате връзка със Скай Запер!');


end;

procedure TfMain.AdvToolBarButtonTeamViewerClick(Sender: TObject);
begin
  RunAppAndBringToFront(xPath+'\RemoteAccess\TeamViewerQS.exe');
end;

procedure TfMain.AdvToolBarButtonUpdateClick(Sender: TObject);
begin
//161
 // SEND_Cloud([3, 0, 26, 155, 5, m_b1, m_b2, m_b3, m_b4]);

  if Assigned(fProgram) then fProgram.Close;
  if Assigned(fCustomGroups) then fCustomGroups.Close;
  if Assigned(fSrebarnaVoda) then fSrebarnaVoda.Close;
  if Assigned(fEdit) then fEdit.Close;
  if Assigned(fOptions) then fOptions.Close;


  if Assigned(fUpdateSoftware)=False then
  Application.CreateForm(TfUpdateSoftware, fUpdateSoftware) else
  fUpdateSoftware.WindowState := wsMaximized;
end;

procedure TfMain.AdvToolBarButtonProgramsClick(Sender: TObject);
begin
  SEND_Cloud([3, 0, 26, 152, 5, m_b1, m_b2, m_b3, m_b4]);

  if Assigned(fSrebarnaVoda) then fSrebarnaVoda.Close;
  if Assigned(fCustomGroups) then fCustomGroups.Close;
  if Assigned(fEdit) then fEdit.Close;
  if Assigned(fOptions) then fOptions.Close;
  if Assigned(fUpdateSoftware) then fUpdateSoftware.Close;

  if SecondsBetween(Now, LastPacketPing) < 20 then
  begin
    if Assigned(fProgram)=False then
    Application.CreateForm(TfProgram, fProgram) else
    fProgram.WindowState := wsMaximized;
  end else
  ShowMessage('Нямате връзка със Скай Запер!');
end;

procedure TfMain.AdvToolBarButtonPersonalListClick(Sender: TObject);
begin
  if Assigned(fProgram) then fProgram.Close;
  if Assigned(fSrebarnaVoda) then fSrebarnaVoda.Close;
  if Assigned(fEdit) then fEdit.Close;
  if Assigned(fOptions) then fOptions.Close;
  if Assigned(fUpdateSoftware) then fUpdateSoftware.Close;

  if Assigned(fCustomGroups)=False then
  Application.CreateForm(TfCustomGroups, fCustomGroups) else
  fCustomGroups.WindowState := wsMaximized;
end;

procedure TfMain.AdvToolBarButton2Click(Sender: TObject);
begin

  if Assigned(fSrebarnaVoda) then fSrebarnaVoda.Close;
  if Assigned(fCustomGroups) then fCustomGroups.Close;
  if Assigned(fEdit) then fEdit.Close;
  if Assigned(fOptions) then fOptions.Close;
  if Assigned(fUpdateSoftware) then fUpdateSoftware.Close;

  if Assigned(fUsers)=False then
  Application.CreateForm(TfUsers, fUsers) else
  fUsers.WindowState := wsMaximized;


end;

procedure TfMain.AdvToolBarButton4Click(Sender: TObject);
begin
  Application.CreateForm(TfChangePassword, fChangePassword);
  fChangePassword.ShowModal;
end;

procedure TfMain.AdvToolBarButtonAdminClick(Sender: TObject);
begin
  SEND_Cloud([3, 0, 26, 160, 5, m_b1, m_b2, m_b3, m_b4]);
  GroupBoxDebug.Visible := not GroupBoxDebug.Visible;
end;

procedure TfMain.AdvToolBarButtonAmmyClick(Sender: TObject);
begin
  RunAppAndBringToFront(xPath+'\RemoteAccess\AmmyAdmin.exe');
end;

procedure TfMain.AdvToolBarButtonAnyDeskClick(Sender: TObject);
begin
  RunAppAndBringToFront(xPath+'\RemoteAccess\AnyDesk.exe');
end;

procedure TfMain.AdvToolBarButtonChangeUserClick(Sender: TObject);
begin


  LoginUser := 0;

  Application.CreateForm(TfLogin, fLogin);
  fLogin.ShowModal;

  if LoginUser = 0 then
  begin
    ShowMessage('Неуспешно логване в програмата!');
    Halt(0);
  end;



end;

procedure TfMain.AdvToolBarButtonConnectionClick(Sender: TObject);
begin

  if (Assigned(fProgram) = True) then fProgram.Close;
  if (Assigned(fSrebarnaVoda) = True) then fSrebarnaVoda.Close;
  if (Assigned(fCustomGroups) = True) then fCustomGroups.Close;
  if (Assigned(fEdit) = True) then fEdit.Close;
  if (Assigned(fUpdateSoftware) = True) then fUpdateSoftware.Close;
  if (Assigned(fOptions) = True) then fOptions.Close;

  LAST_COM_PORT := '';
  LAST_NETWORK_IP := '';

  VirtualTableUSB_Zappers.Clear;
  VirtualTableLAN_Zappers.Clear;

  GroupBoxUSBConnections.Visible := True;
  GroupBoxNetworkConnections.Visible := True;

  LabelSearchCable.Caption := '';
  LabelSearchNetwork.Caption := '';

end;

procedure TfMain.AdvToolBarButtonEditorClick(Sender: TObject);
begin
  SEND_Cloud([3, 0, 26, 154, 5, m_b1, m_b2, m_b3, m_b4]);

  if Assigned(fProgram) then fProgram.Close;
  if Assigned(fCustomGroups) then fCustomGroups.Close;
  if Assigned(fSrebarnaVoda) then fSrebarnaVoda.Close;
  if Assigned(fOptions) then fOptions.Close;
  if Assigned(fUpdateSoftware) then fUpdateSoftware.Close;


    if Assigned(fEdit)=False then
    Application.CreateForm(TfEdit, fEdit) else
    fEdit.WindowState := wsMaximized;

end;

procedure TfMain.AdvToolBarButtonLanguageBGClick(Sender: TObject);
begin
  RadioGroupMainLanguage.ItemIndex := 0;
  RadioGroupMainLanguageClick(nil);
end;

procedure TfMain.AdvToolBarButtonLanguageENClick(Sender: TObject);
begin
  RadioGroupMainLanguage.ItemIndex := 1;
  RadioGroupMainLanguageClick(nil);
end;

procedure TfMain.AdvToolBarButtonOptionsClick(Sender: TObject);
begin
  SEND_Cloud([3, 0, 26, 155, 5, m_b1, m_b2, m_b3, m_b4]);

  if Assigned(fProgram) then fProgram.Close;
  if Assigned(fCustomGroups) then fCustomGroups.Close;
  if Assigned(fSrebarnaVoda) then fSrebarnaVoda.Close;
  if Assigned(fEdit) then fEdit.Close;
  if Assigned(fUpdateSoftware) then fUpdateSoftware.Close;

  if SecondsBetween(Now, LastPacketPing) < 20 then
  begin
    if Assigned(fOptions)=False then
    Application.CreateForm(TfOptions, fOptions) else
    fOptions.WindowState := wsMaximized;
  end else
  ShowMessage('Нямате връзка със Скай Запер!');



end;

procedure TfMain.ButtonCloudPauseClick(Sender: TObject);
begin
  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 45;

  SendBufferToLAN(4);
  LAN_PARSE_BUFF('LAN - Изпращане PAUSE PROGRAM', 4);

end;

procedure TfMain.ButtonCloudContinueClick(Sender: TObject);
var
  program_id : Word;
  category_id : Word;
begin
  PREPARE_BUFF;

  program_id := 43690;  //АААА
  category_id := 48059; //BBBB

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 40;
  USB_Buffer[5] := byte(category_id); //(2 байта - ID на програма)
  USB_Buffer[6] := byte(category_id shr 8);
  USB_Buffer[7] := byte(program_id); //(2 байта - ID на категория)
  USB_Buffer[8] := byte(program_id shr 8);

  SendBufferToLAN(8);
  LAN_PARSE_BUFF('LAN - Изпращане CONTINUE PROGRAM', 8);

//0 2 26 40 Cat_id_byte_low Cat_id_byte_high Prog_id_byte_low Prog_id_byte_high


end;

procedure TfMain.Button1xClick(Sender: TObject);
var
s:string;
ut:UTF8String;
uni:UnicodeString;
begin

s:='АБВ';

ut := UTF8Encode(s);
uni := UTF8ToUnicodeString(ut);

{
ShowMessage(IntToStr(ord(ut[1])));  // D0 90 , 208 144, 208 145
ShowMessage(IntToStr(ord(ut[2])));
ShowMessage(IntToStr(ord(ut[3])));
ShowMessage(IntToStr(ord(ut[4])));
}


ShowMessage(IntToStr(ord(uni[1])));  // D0 90 , 208 144, 208 145
ShowMessage(IntToStr(ord(uni[2])));
ShowMessage(IntToStr(ord(uni[3])));
ShowMessage(IntToStr(ord(uni[4])));


ShowMessage(UTF8Encode(s));
//ShowMessage(UTF8EncodeToShortString(s));

end;

procedure TfMain.Button2Click(Sender: TObject);
begin

  try
    fMain.IdUDPServer1.Active := True;

    ButtonSearchZappersNetworkClick(nil);

  except on e:Exception do
    Memo1.Lines.Add('NET SERVER UDP - ERROR: '+e.Message);
  end;


end;

procedure TfMain.Button3Click(Sender: TObject);
begin
    GroupBoxNetworkConnections.Visible := False;
    GroupBoxUSBConnections.Visible := False;
end;

procedure TfMain.Button4Click(Sender: TObject);
begin
  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 16;
  USB_Buffer[4] := 57;
  USB_Buffer[5] := 0; //0-custom, 1-глобал тиме

  SendBufferToLAN(5);
  LAN_PARSE_BUFF('LAN - Изпращане Freq settings', 5);

  {
0 2 16 57 0

Последният байт задава следното:
0 - всяка честота има свое собствено време.
1 - всяка честота е с еднакво глобално време.
}


end;

procedure TfMain.ButtonCloudParameterProgramClick(Sender: TObject);
type
  Win1251String = type AnsiString(1251);
var
program_id : Word;
category_id : Word;
duration : Word;
program_freq_count, x, l : Word;
n2x : Word;

tmpWin1251: Win1251String;
tmpUnicode : WideString;
begin
  PREPARE_BUFF;


  ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE id=118';
  ADOQueryDiseases.Open;
  program_id := ADOQueryDiseases.FieldByName('id').AsInteger;
  category_id := ADOQueryDiseases.FieldByName('category_id').AsInteger;
  tmpUnicode := ADOQueryDiseases.FieldByName('name_bg').AsString;

  ADOQueryFreq.SQL.Text := 'SELECT count(*) AS Q FROM freq WHERE disease_id=118';
  ADOQueryFreq.Open;

  //tmpUnicode := 'Program ТЕСТОВА ';
  //program_id := 43690;  //АААА
  //category_id := 48059; //BBBB
  duration := 180 div 10;
  program_freq_count := ADOQueryFreq.FieldByName('Q').AsInteger;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 26;
  USB_Buffer[5] := byte(program_id); //(2 байта - ID на програма)
  USB_Buffer[6] := byte(program_id shr 8);
  USB_Buffer[7] := byte(category_id); //(2 байта - ID на категория)
  USB_Buffer[8] := byte(category_id shr 8);
  USB_Buffer[9] := byte(duration); //(2 байта - времетраене на програмата)
  USB_Buffer[10] := byte(duration shr 8);
  USB_Buffer[11] := byte(program_freq_count);; //(2 байта - брой честоти)
  USB_Buffer[12] := byte(program_freq_count shr 8);

  tmpWin1251 := Win1251String(tmpUnicode); //  (до 80 байта - име на програма)

  x := 12;
  for l := 1 to 80 do
  begin
    x := x + 1;
    if Length(tmpWin1251)+1 = l then USB_Buffer[x] := 0 else
    if Length(tmpWin1251)+1 < l then USB_Buffer[x] := 255 else
    begin
      n2x := Ord(tmpWin1251[l]); //fill name
      USB_Buffer[x] := Byte(n2x);
    end;

  end;

    SendBufferToLAN(x);
    LAN_PARSE_BUFF('LAN - Изпращане NEW program', x);

{
    Задаване на параметрите на програмата:
    00 02 26 26  (2 байта - ID на програма) (2 байта - ID на категория) (2 байта - времетраене на програмата) (2 байта - брой честоти) (до 80 байта - име на програма)
    За времетраене на програмата се подава цяло число което е сумарното време на всички честоти в секунди разделено на 10.
}

end;

procedure TfMain.ButtonUSE_CableClick(Sender: TObject);
begin

  if VirtualTableUSB_Zappers.RecordCount >= 1 then
  begin

    RadioGroupTypeConnections.ItemIndex := 0;
    Connection_Type := 0;  //0-USB, 1-LAN

    GroupBoxNetworkConnections.Visible := False;
    GroupBoxUSBConnections.Visible := False;

    TimerCheck_Connections.Enabled := True;

    //TimerUSE_Network.Enabled := False;

    ComboBoxComPorts.Text := VirtualTableUSB_Zappers.FieldByName('IP').AsString;
    LabelMessage.Caption := 'Aвтоматично избиране на MAC: '+VirtualTableUSB_Zappers.FieldByName('MAC').AsString + ' през кабел!';

    sendReadAll_USBCable(VirtualTableUSB_Zappers.FieldByName('IP').AsString);
    sendReadAll_USBCable(VirtualTableUSB_Zappers.FieldByName('IP').AsString);
    sendReadAll_USBCable(VirtualTableUSB_Zappers.FieldByName('IP').AsString);

    ADOQueryOptions.Edit;
    ADOQueryOptions.FieldByName('com_port').AsString := VirtualTableUSB_Zappers.FieldByName('IP').AsString;
    ADOQueryOptions.FieldByName('network_ip').AsString := '';
    ADOQueryOptions.Post;

    Sleep(1000);
    LabelMessage.Caption := '';


  end else
  begin
    ShowMessage('Трябва да има поне един Запер включен към компютъра / лаптопа!');
  end;



end;

procedure TfMain.ButtonUSE_NetworkClick(Sender: TObject);
begin

  if VirtualTableLAN_Zappers.RecordCount >= 1 then
  begin


    RadioGroupTypeConnections.ItemIndex := 1;
    Connection_Type := 1; //0-USB, 1-LAN

    GroupBoxNetworkConnections.Visible := False;
    GroupBoxUSBConnections.Visible := False;

    TimerCheck_Connections.Enabled := True;
    //TimerUSE_Network.Enabled := False;

    LabelMessage.Caption := 'Aвтоматично избиране на MAC: '+VirtualTableLAN_Zappers.FieldByName('MAC').AsString + ' през WiFi!';
    Application.ProcessMessages;
    Sleep(2000);
    LabelMessage.Caption := '';

    sendReadAll_Network(VirtualTableLAN_Zappers.FieldByName('IP').AsString);
    LAN_Connection_IP := VirtualTableLAN_Zappers.FieldByName('IP').AsString;
    StatusBar1.Panels[5].Text := 'IP: '+LAN_Connection_IP;


    ADOQueryOptions.Edit;
    ADOQueryOptions.FieldByName('network_ip').AsString := VirtualTableLAN_Zappers.FieldByName('IP').AsString;
    ADOQueryOptions.FieldByName('com_port').AsString := '';
    ADOQueryOptions.Post;

  end else
  begin
    ShowMessage('Трябва да има поне един Запер в локалната мрежата');
  end;

end;

procedure TfMain.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ButtonUSE_NetworkClick(Self);
end;

procedure TfMain.cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ButtonUSE_CableClick(Self);
end;

procedure TfMain.Button5Click(Sender: TObject);
begin

  if not IsUserAnAdmin then
  begin
    MessageDlg('Приложението трябва да бъде стартирано като администратор!', mtError, [mbOK], 0);
  end else
  begin
    ShowMessage('ADMIN IS OK');
  end;

end;

procedure TfMain.Button6Click(Sender: TObject);
begin
  case GetUserPrivilegeLevel of
    uplStandardUser: ShowMessage('Текущият потребител е стандартен.');
    uplAdministrator: ShowMessage('Текущият потребител е администратор.');
  end;
end;



procedure TfMain.Button7Click(Sender: TObject);
var
tmpCat, tmpSUB_Cat: Integer;

CAT, SUB :string;
begin

   OpenDialog1.Execute();

   ADOQueryExcel.ConnectionString:='Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + OpenDialog1.FileName +'; Extended Properties=Excel 12.0;'; //HDR=Yes
   ADOQueryExcel.SQL.Text := 'SELECT * FROM [Sheet 1$]';
   ADOQueryExcel.Open;

   ADOQueryCloudPrograms.Open;
   ADOQueryCloudCategory.Open;
   ADOQueryCloudSUB_Category.Open;

   while not ADOQueryExcel.Eof do
   begin



      if Length(ADOQueryExcel.FieldByName('ID').AsString) >= 1 then
      begin

        if ADOQueryCloudPrograms.Locate('program_id', ADOQueryExcel.FieldByName('ID').AsString, []) then
        begin

            CAT := Trim(ADOQueryExcel.FieldByName('CATEGORY').AsString);
           if (Length(CAT) >= 1) then
           begin

              if ADOQueryCloudCategory.Locate('name', CAT, []) = False then
              begin
                ADOQueryCloudCategory.Insert;
                ADOQueryCloudCategory.FieldByName('name').AsString := CAT;
                ADOQueryCloudCategory.Post;
                tmpCat := ADOQueryCloudCategory.FieldByName('id').AsInteger;
                //ShowMessage('insert category: '+IntToStr(tmpCat));

              end else
              begin

                tmpCat := ADOQueryCloudCategory.FieldByName('id').AsInteger;
              end;

           end;


           SUB := Trim(ADOQueryExcel.FieldByName('SUB_CATEGORY').AsString);
           if (Length(SUB) >= 1) then
           begin
              if ADOQueryCloudSUB_Category.Locate('name', SUB, []) = False then
              begin
                ADOQueryCloudSUB_Category.Insert;
                ADOQueryCloudSUB_Category.FieldByName('cat').AsInteger := tmpCat;
                ADOQueryCloudSUB_Category.FieldByName('name').AsString := SUB;
                ADOQueryCloudSUB_Category.Post;
                tmpSUB_Cat := ADOQueryCloudSUB_Category.FieldByName('id').AsInteger;
              end else
              begin
                tmpSUB_Cat := ADOQueryCloudSUB_Category.FieldByName('id').AsInteger;

              end;
           end;


           ADOQueryCloudPrograms.Edit;
           ADOQueryCloudPrograms.FieldByName('category_head_id').AsInteger := tmpCat;
           ADOQueryCloudPrograms.FieldByName('category_sub_id').AsInteger := tmpSUB_Cat;
           ADOQueryCloudPrograms.Post;




        end;

        Application.ProcessMessages;
        Caption := 'NO: '+IntToStr(ADOQueryExcel.RecNo)+' of '+IntToStr(ADOQueryExcel.RecordCount);



      end;


        {
      if Length(ADOQueryExcel.FieldByName('ID').AsString) <= 0 then
      begin




        if ADOQueryCloudPrograms.Locate('name_en', ADOQueryExcel.FieldByName('name_en').AsString, []) then
        begin

          ADOQueryExcel.Edit;
          ADOQueryExcel.FieldByName('ID').AsString := ADOQueryCloudPrograms.FieldByName('program_id').AsString;
          ADOQueryExcel.FieldByName('FREQ').AsString := ADOQueryCloudPrograms.FieldByName('freq_count').AsString;
          ADOQueryExcel.Post;

        end else
        begin
            Memo1.Lines.Add(ADOQueryExcel.FieldByName('name_en').AsString);
        end;


        Application.ProcessMessages;
        Caption := 'NO: '+IntToStr(ADOQueryExcel.RecNo)+' of '+IntToStr(ADOQueryExcel.RecordCount);

      end else
      begin
        Caption := 'Pass: '+IntToStr(ADOQueryExcel.RecNo)+' of '+IntToStr(ADOQueryExcel.RecordCount);
      end;
         }


   ADOQueryExcel.Next;
   end;


end;

procedure TfMain.Button8Click(Sender: TObject);
var
  tmpCAT : string;

begin



   ADOQueryCloudPrograms.SQL.Text := 'SELECT * FROM viewPrograms WHERE in_mem IS NULL ORDER BY cat_head, cat_sub, freq_count desc';
   ADOQueryCloudPrograms.Open;
   while not ADOQueryCloudPrograms.Eof do
   begin

      tmpCAT := ADOQueryCloudPrograms.FieldByName('cat_head').AsString + ADOQueryCloudPrograms.FieldByName('cat_sub').AsString;

      if ListBox1.Items.IndexOf(tmpCAT) = -1 then
      begin
        ListBox1.Items.Add(tmpCAT);
        ADOQueryCloudSUB_Category.SQL.Text := 'UPDATE Programs SET in_mem=1 WHERE program_id = '+ADOQueryCloudPrograms.FieldByName('program_id').AsString;
        ADOQueryCloudSUB_Category.ExecSQL;
      end;


      Application.ProcessMessages;
      Caption := 'NO: '+IntToStr(ADOQueryCloudPrograms.RecNo)+' of '+IntToStr(ADOQueryCloudPrograms.RecordCount);


   ADOQueryCloudPrograms.Next;
   end;



end;

procedure TfMain.ButtonAddFreqExportClick(Sender: TObject);
var
  freq : string;

begin

  with fMain do
  begin


      VirtualTableExport.DisableControls;
      ADOQueryDiseases.DisableControls;
      ADOQueryFreq.DisableControls;

      while not ADOQueryDiseases.Eof do
      begin


        freq := '';

        ADOQueryFreq.First;
        while not ADOQueryFreq.Eof do
        begin

          freq := freq + ', '+ADOQueryFreq.FieldByName('freq').AsString;

          ADOQueryFreq.Next;
        end;

        VirtualTableExport.Insert;
        VirtualTableExport.FieldByName('BG').AsString := ADOQueryDiseases.FieldByName('name_bg').AsString;
        VirtualTableExport.FieldByName('EN').AsString := ADOQueryDiseases.FieldByName('name_en').AsString;
        VirtualTableExport.FieldByName('freq').AsString := freq;
        VirtualTableExport.Post;


       // ShowMessage('stop');
       Caption := IntToStr(ADOQueryDiseases.RecNo);
       Application.ProcessMessages;

      ADOQueryDiseases.next;
      end;



      VirtualTableExport.EnableControls;
      ADOQueryDiseases.EnableControls;
      ADOQueryFreq.EnableControls;

      ShowMessage('Done');


  end;



end;

procedure TfMain.ButtonCloudFreqClick(Sender: TObject);
type
  Win1251String = type AnsiString(1251);
var
  program_id : Word;
  category_id : Word;
  duration : Word;
  freq : Word;
  program_freq_count, x, l : Word;
  tmpWin1251: Win1251String;
  tmpUnicode : WideString;
  n2x : Word;
  n4x : Int64;
  buf_position : Integer;
begin
  PREPARE_BUFF;

  ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id=118';
  ADOQueryFreq.Open;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 27;
  USB_Buffer[5] := 0;

  buf_position := 5;

  while not ADOQueryFreq.Eof do
  begin

    n4x := Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100);

    buf_position := buf_position + 1;
    USB_Buffer[buf_position] := byte(n4x);

    buf_position := buf_position + 1;
    USB_Buffer[buf_position] := byte(n4x shr 8);

    buf_position := buf_position + 1;
    USB_Buffer[buf_position] := byte(n4x shr 16);

    buf_position := buf_position + 1;
    USB_Buffer[buf_position] := byte(n4x shr 24);

    buf_position := buf_position + 1;
    USB_Buffer[buf_position] := 90 div 10; //time


  ADOQueryFreq.Next;
  end;

  SendBufferToLAN(buf_position);
  LAN_PARSE_BUFF('LAN - Изпращане NEW program frequest', buf_position);

{
    Задаване на честотите на програмата:
    00 02 26 27 00 (4 байта - честота 1 ) (1 байт - времетраене 1 ) .....  (4 байта - честота 30 ) (1 байт - времетраене 30 )
    Броят честоти може да е променлив.
    За времетраене на честота се подава цяло число което е времето на честотата в секунди разделено на 10.

}


end;

procedure TfMain.ButtonCloudStartClick(Sender: TObject);
begin
  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 28;

  SendBufferToLAN(4);
  LAN_PARSE_BUFF('LAN - Изпращане START PROGRAM', 4);

end;

procedure TfMain.ButtonCloudStopClick(Sender: TObject);
begin
  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 46;

  SendBufferToLAN(4);
  LAN_PARSE_BUFF('LAN - Изпращане STOP PROGRAM', 4);

end;

procedure TfMain.ButtonSearchZappersNetworkClick(Sender: TObject);
var
 // _Buffer : TIdBytes; //array[0..12] of byte;
  Frequence, ManSweep, ManPower : Integer;
  _IP, IP_NEW : string;
    Parts: TArray<string>;
    A, B, C, D: string;
  I: Integer;
begin
with fMain do
begin

  Connection_Type := -1;
  try

    _IP := IdIPWatch1.LocalIP;

    Parts := SplitString(_IP, '.');
    if Length(Parts) = 4 then
    begin
      A := Parts[0];
      B := Parts[1];
      C := Parts[2];
      D := Parts[3];
    end;

    VirtualTableLAN_Zappers.Clear;


    if LAST_NETWORK_IP <> '' then
    begin

      for I := 2 to 10 do
      begin

        if Connection_Type <> -1 then Break;

        sendReadAll_Network(LAST_NETWORK_IP);

        if VirtualTableLAN_Zappers.RecordCount >= 1 then Exit;

        LabelSearchNetwork.Caption := 'Търси на IP адрес: ' + LAST_NETWORK_IP;
        Application.ProcessMessages;
        Sleep(200);

      end;
    end;




    for I := 2 to 255 do
    begin
      if Connection_Type <> -1 then Break;

      IP_NEW := A + '.'+B+'.'+C+'.' + IntToStr(i);

      sendReadAll_Network(IP_NEW);

      LabelSearchNetwork.Caption := 'Търси на IP адрес: ' + IP_NEW;
      Application.ProcessMessages;
      Sleep(10);
    end;

    LabelSearchNetwork.Caption := 'Приключи търсенето!';
    // IdUDPServer1.Broadcast(_Buffer, 7800);
    //IdUDPServer1.SendBuffer('224.0.0.1', 7800, LAN_Buffer);


  except on e:exception do
  // Memo1.Lines.Add('NET 1 - ERROR: '+e.Message);
  end;

end;
end;

procedure TfMain.ButtonSearchZapperUSBCableClick(Sender: TObject);
var
  i:Integer;
  tmpCOM_Port : string;
begin

    Connection_Type := -1;
    VirtualTableUSB_Zappers.Clear;

    if LAST_COM_PORT <> '' then
    begin

      for I := 1 to 5 do
      begin
         if Connection_Type <> -1 then Break;

         try
            tmpCOM_Port := LAST_COM_PORT; //'COM'+IntToStr(i);

            sendReadAll_USBCable(tmpCOM_Port);
            sendReadAll_USBCable(tmpCOM_Port);

            LabelSearchCable.Caption := 'Търси на Com порт: ' + tmpCOM_Port;
            Application.ProcessMessages;
            Sleep(100);

            VaComm1.Close;
            if VirtualTableUSB_Zappers.RecordCount >= 1 then
            begin
              //ShowMessage('намерен е Запер на ком порт');
              Exit;
            end;

           except on e:exception do
           begin

              //LabelSearchCable.Caption := 'ГРЕШКА  Com порт: ' + 'COM'+IntToStr(i);
              //Memo1.Lines.Add('ГРЕШКА  Com порт: ' + 'COM'+IntToStr(i));
              //Application.ProcessMessages;
              VaComm1.Close;
           end;

         end;


      end;

    end;


  //  ShowMessage('next');

    for I := 1 to 100 do
    begin
       if Connection_Type <> -1 then Break;

       try
          tmpCOM_Port := 'COM'+IntToStr(i);

          sendReadAll_USBCable(tmpCOM_Port);
          sendReadAll_USBCable(tmpCOM_Port);

          LabelSearchCable.Caption := 'Търси на Com порт: ' + tmpCOM_Port;
          Application.ProcessMessages;
          Sleep(100);

          VaComm1.Close;

         except on e:exception do
         begin

            //LabelSearchCable.Caption := 'ГРЕШКА  Com порт: ' + 'COM'+IntToStr(i);
            //Memo1.Lines.Add('ГРЕШКА  Com порт: ' + 'COM'+IntToStr(i));
            //Application.ProcessMessages;
            VaComm1.Close;
         end;

       end;


    end;
    LabelSearchCable.Caption := 'Приключи търсенето!';

end;

procedure TfMain.ButtonClearClick(Sender: TObject);
begin
MemoMainLogRX.Clear;
MemoMainLogTX.Clear;
MemoMainLogEvent.Clear;
end;

procedure TfMain.ButtonConnectionClick(Sender: TObject);
var
  st: Tstrings;
  i: Integer;
  _Buffer : TIdBytes;
begin


  if RadioGroupTypeConnections.ItemIndex=0 then //usb connections
  begin

    LogEvent('Проверка на връзка');

    if Connected_com_port <> '' then
    begin
      try
        VaComm1.Close;
        VaComm1.Baudrate := TVaBaudrate.br9600;
        VaComm1.DeviceName := Connected_com_port;
        VaComm1.Open;
        Exit;
      except
      begin
        Connected_com_port := '';
        TimerCheck_Connections.Enabled := False;
        TimerCheck_Connections.Interval := 3*1000;
        TimerCheck_Connections.Enabled := True;
      end;
      end;
    end;

    Clear_All_Vars;

    zapper_id := 0; //start
    ComboBoxComPorts.Clear;
    DBLookupComboBoxZapper.KeyValue := -1;
    if RadioGroupMainLanguage.ItemIndex=0 then
    StatusBar1.Panels[0].Text := 'Не е свързан Запер - търси портове' else
    StatusBar1.Panels[0].Text := 'Not connected Zapper - looking for ports ';
    for I := 1 to 100 do
    begin
      try
        VaComm1.Close;
        VaComm1.Baudrate := TVaBaudrate.br9600;
        VaComm1.DeviceName := 'COM'+IntToStr(i);
        VaComm1.Open;
        ComboBoxComPorts.Items.Add('COM'+IntToStr(i));
        VaComm1.Close;
       except on e:exception do
       begin
          zapper_id := -1;
          VaComm1.Close;
       end;
       end;
    end;


    for I := 0 to ComboBoxComPorts.Items.Count-1 do
    begin
      if Pos('Model Zapper', StatusBar1.Panels[0].Text) >= 1 then Exit;

      zapper_id := i;
      ComboBoxComPorts.ItemIndex := i;
      try_connect(ComboBoxComPorts.Text);

      Application.ProcessMessages;
      //wait(500);
      SleepSky(500);
    end;

    if Connected_com_port = '' then
    begin
      if RadioGroupMainLanguage.ItemIndex=0 then
      StatusBar1.Panels[0].Text := 'Не е свързан Запер' else
      StatusBar1.Panels[0].Text := 'Zapper is not connected';
    end;

    zapper_id := -1;


  end;


  if RadioGroupTypeConnections.ItemIndex = 1 then //LAN connections
  begin
    zapper_id := 1;


    try
      VirtualTableLAN_Zappers.Clear;

      SetLength(_Buffer, 7);

      _Buffer[0] := 0;
      _Buffer[1] := 2; //lan
      _Buffer[2] := 9;
      _Buffer[3] := 0;
      _Buffer[4] := 4;
      _Buffer[5] := 0;
      _Buffer[6] := 0;

      //IdUDPServer1.SendBuffer('255.255.255.255', 7800, _Buffer);

     // IdUDPServer1.SendBuffer('224.0.0.1', 7800, _Buffer);



    except on e:exception do
     ShowMessage('ERROR: '+e.Message);
    end;



  end;


end;

procedure TfMain.ButtonExportNewDBClick(Sender: TObject);
type
  Win1251String = type AnsiString(1251);
var
all_category, all_diseases:Word;
n2x : word;
n3x : Integer;
n4x : Integer;
fr, x, l: Integer;
point, point_next, All_Memmory : Integer;
category_name, program_name : string;
power_option : byte;
program_sec_option : Word;
b1, b2, b3, b4: Byte;
GLB_FILTER, GLB_CATEGORY_ORDER, GLB_DISEASES_ORDER : string;
i:Integer;
f : file of Byte;
b : Byte;
tmpWin1251: Win1251String;
tmpUnicode : WideString;
begin
with fMain do
begin

if SaveDialog1.Execute() = False then Exit;

ShowMessage('Започва подготовката за Firmware DB');

clear_buffer;
max_buffer := 0;
point := 0;
point_next := 0;

buff[0] := 56;
buff[1] := 255;
buff[2] := 255;
buff[3] := 255;
buff[4] := 255;

GLB_FILTER := '';

GLB_DISEASES_ORDER := ' ORDER BY name_bg'; //GLB_DISEASES_ORDER := ' ORDER BY name_en';
GLB_CATEGORY_ORDER := ' ORDER BY category_name_BG'; //GLB_CATEGORY_ORDER := ' ORDER BY category_name_EN';

ADOQueryCategory.SQL.Text := 'SELECT * FROM category WHERE id IN (SELECT category_id FROM diseases WHERE category_id >= 1 '+GLB_FILTER+') '+GLB_CATEGORY_ORDER;
ADOQueryCategory.Open;

all_category := ADOQueryCategory.RecordCount;
buff[5] := byte(all_category);
buff[6] := byte(all_category shr 8);
buff[7] := 1; //Major version DB
buff[8] := 3; //Minor version DB
buff[9] := 255;

x := 9;

point := 0;
                                                             //(freq_count >= 1) AND
  ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE (id >= 1) ' + GLB_FILTER + GLB_DISEASES_ORDER;
  ADOQueryDiseases.Open;

  ADOQueryFreq.SQL.Text := 'SELECT count(id) AS C FROM freq WHERE disease_id IN (SELECT id FROM diseases WHERE id >= 1 ' + GLB_FILTER + GLB_DISEASES_ORDER+')';
  ADOQueryFreq.Open;

  if ADOQueryFreq.FieldByName('C').AsInteger <= 0 then
  begin
    ShowMessage('В избраните програми няма въведени честоти.');
    Exit;
  end;


  All_Memmory := len_settings + (ADOQueryCategory.RecordCount * len_categoryESP) +
                            (ADOQueryDiseases.RecordCount * len_diseaseESP)+
                            (ADOQueryFreq.FieldByName('C').AsInteger * len_frequenceESP);

  if All_Memmory >= 512*1024 then
  begin
    ShowMessage('Няма достатъчно памет за избраните програми: '+#13+
    'Настройки и всички групи общо: '+IntToStr(len_settings + ADOQueryCategory.RecordCount * len_categoryESP) + #13+
    'Програми '+IntToStr(ADOQueryDiseases.RecordCount)+' всяка заема по '+IntToStr(len_diseaseESP)+' общо: '+IntToStr(ADOQueryDiseases.RecordCount * len_diseaseESP)+#13+
    'Честоти '+IntToStr(ADOQueryFreq.FieldByName('C').AsInteger)+' всяка заема по 5 общо: '+IntToStr(ADOQueryFreq.FieldByName('C').AsInteger * len_frequenceESP)+#13+
    'Zapper разполага с 512KB но селектираните програми изискват: '+FormatFloat('# ###.##', All_Memmory / 1024)
    );
    Exit;
  end else
  begin
    ShowMessage('Има достатъчно памет за избраните програми: '+#13+
    'Настройки и всички групи общо: '+IntToStr(len_settings + ADOQueryCategory.RecordCount * len_categoryESP) + #13+
    'Програми '+IntToStr(ADOQueryDiseases.RecordCount)+' всяка заема по '+IntToStr(len_diseaseESP)+' общо: '+IntToStr(ADOQueryDiseases.RecordCount * len_diseaseESP)+#13+
    'Честоти '+IntToStr(ADOQueryFreq.FieldByName('C').AsInteger)+' всяка заема по 5 общо: '+IntToStr(ADOQueryFreq.FieldByName('C').AsInteger * len_frequenceESP)+#13+
    'Zapper разполага с 512KB но селектираните програми са: '+FormatFloat('# ###.##', All_Memmory / 1024)+#13+
    'Започва записването на избраните програмите в Запера.'
    );
  end;


  ADOQueryCategory.First;
  while not ADOQueryCategory.Eof do
  begin
    if x >= max_mem-20 then
    begin
    ShowMessage('Препълване на буфера');
    Exit;
    end;

    //id category
    n2x := ADOQueryCategory.FieldByName('id').AsInteger;
    x:=x+1; buff[x] := byte(n2x);
    x:=x+1; buff[x] := byte(n2x shr 8);

    //favorite
    x:=x+1; buff[x] := byte(ADOQueryCategory.FieldByName('favorite').AsInteger);

    //number all_diseases
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE category_id='+ADOQueryCategory.FieldByName('id').AsString  + GLB_FILTER + GLB_DISEASES_ORDER;
    ADOQueryDiseases.Open;
    all_diseases := ADOQueryDiseases.RecordCount;

    n2x := all_diseases;
    x:=x+1; buff[x] := byte(n2x);
    x:=x+1; buff[x] := byte(n2x shr 8);

    //pointer all_diseases
    if point = 0 then
    begin
      n3x := len_settings + (all_category * len_categoryESP);
      point_next := (all_diseases * len_diseaseESP);
      point := n3x + point_next;
    end else
    begin
      n3x := point;
      point_next := (all_diseases * len_diseaseESP);
      point := point + point_next;
    end;

    x:=x+1; buff[x] := byte(n3x);
    x:=x+1; buff[x] := byte(n3x shr 8);
    x:=x+1; buff[x] := byte(n3x shr 16);

    category_name := ADOQueryCategory.FieldByName('category_name_bg').AsString; //category_name_en

    tmpUnicode := ADOQueryCategory.FieldByName('category_name_bg').AsString; //category_name_en
    tmpWin1251 := Win1251String(tmpUnicode);

    //if Length(tmpWin1251) >= 30 then LogEvent('ID: '+ADOQueryCategory.FieldByName('id').AsString+' NAME: '+tmpWin1251);

    for l := 1 to 30 do
    begin
      x := x + 1;
      //Send like windows cp1251
      if Length(tmpWin1251)+1 = l then buff[x] := 0 else
      if Length(tmpWin1251)+1 < l then buff[x] := 255 else
      begin
        n2x := Ord(tmpWin1251[l]); //fill name
        buff[x] := Byte(n2x);
      end;
    end;

  ADOQueryCategory.Next;
  end;


  point := 0;
                                                                     //  freq is null AND
  ADOQuerySQL.SQL.Text := 'SELECT count(id) AS c FROM diseases WHERE  category_id >= 1 ' + GLB_FILTER;
  ADOQuerySQL.Open;
  all_diseases := ADOQuerySQL.FieldByName('C').AsInteger;

  //DISEASES
  ADOQueryCategory.First;
  while not ADOQueryCategory.Eof do
  begin
                                                                 //  freq is null AND
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE category_id='+ADOQueryCategory.FieldByName('id').AsString + GLB_FILTER + GLB_DISEASES_ORDER;
      ADOQueryDiseases.Open;
      while not ADOQueryDiseases.Eof do
      begin
          if x >= max_mem-20 then
          begin
          ShowMessage('Препълване на буфера');
          Exit;
          end;

          //ид на болест
          n2x := ADOQueryDiseases.FieldByName('id').AsInteger;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          //категория
          n2x := ADOQueryCategory.FieldByName('id').AsInteger;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          //любими
          x:=x+1; buff[x] := byte(ADOQueryDiseases.FieldByName('favorite').AsInteger);

          //дължина на програмта
          ADOQuerySQL.SQL.Text := 'SELECT SUM(time_sec) AS FREQ_LEN FROM freq WHERE disease_id='+ADOQueryDiseases.FieldByName('id').AsString;
          ADOQuerySQL.Open;

          n2x := ADOQuerySQL.FieldByName('FREQ_LEN').AsInteger;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id=' + ADOQueryDiseases.FieldByName('id').AsString + ' ORDER BY orderno';
          ADOQueryFreq.Open;

          //pointer frequence
          if point = 0 then
          begin
            n3x := len_settings + (all_category * len_categoryESP) + (all_diseases * len_diseaseESP);
            point_next := (ADOQueryFreq.RecordCount * len_frequenceESP);
            point := n3x + point_next;
          end else
          begin
            n3x := point;
            point_next := (ADOQueryFreq.RecordCount * len_frequenceESP);
            point := point + point_next;
          end;
          fr := n3x;

          //Адрес на честоти
          //n3x:=0;
          x:=x+1; buff[x] := byte(n3x);
          x:=x+1; buff[x] := byte(n3x shr 8);
          x:=x+1; buff[x] := byte(n3x shr 16);

          //Брой честоти
          n2x := ADOQueryFreq.RecordCount;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);


          program_name := ADOQueryDiseases.FieldByName('name_bg').AsString;// name_en

          tmpUnicode := ADOQueryDiseases.FieldByName('name_bg').AsString; // name_en

          tmpWin1251 := Win1251String(tmpUnicode);

          //if Length(tmpWin1251) >= 80 then LogEvent('PROG ID: '+ADOQueryDiseases.FieldByName('id').AsString+' NAME: '+tmpWin1251);


          for l := 1 to 80 do
          begin
            x := x + 1;
              if Length(tmpWin1251)+1 = l then buff[x] := 0 else
              if Length(tmpWin1251)+1 < l then buff[x] := 255 else
              begin
                n2x := Ord(tmpWin1251[l]); //fill name
                buff[x] := Byte(n2x);
              end;

          end;

          //FREQUENCE
          ADOQueryFreq.First;
          while not ADOQueryFreq.Eof do
          begin

            n4x := ADOQueryFreq.FieldByName('freq').AsInteger*100;

            fr := fr+1; buff[fr-1] := byte(n4x);
            fr := fr+1; buff[fr-1] := byte(n4x shr 8);
            fr := fr+1; buff[fr-1] := byte(n4x shr 16);
            fr := fr+1; buff[fr-1] := byte(n4x shr 24);

            fr := fr+1; buff[fr-1] := byte(ADOQueryFreq.FieldByName('time_sec').AsInteger);

          ADOQueryFreq.Next;
          end;

      ADOQueryDiseases.Next;
      end;

  ADOQueryCategory.Next;
  end;


max_buffer := fr;



AssignFile(f, SaveDialog1.FileName);
Rewrite(f);

for I := 0 to max_buffer do
begin
 b := buff[i];
 Write(f, b);
end;
CloseFile(f);

ShowMessage(
'Изпратени данни '+IntToStr(max_buffer)+' Bytes'+#13+
'Изпратени данни '+FormatFloat('# ###.##', max_buffer / 1024)+' KB.'
);


end;
end;

procedure TfMain.ButtonFreqExportClick(Sender: TObject);
var
  FileName: string;
  SaveDialog: TSaveDialog;
begin
  // Задайте име на файла, в който ще се експортира
  SaveDialog := TSaveDialog.Create(Self);
  FileName := 'ExportedData.xlsx';
  SaveDialog.FileName := FileName;

  SaveDialog.Filter := 'Excel Files (*.xlsx)|*.xlsx';
  SaveDialog.DefaultExt := 'xlsx';
  SaveDialog.Execute;

  // Извикайте функцията за експорт
  try
   // ExportGridToExcel(SaveDialog.FileName, cxGrid3);
    ShowMessage('Данните бяха успешно експортирани в ' + FileName);
  except
    on E: Exception do
      ShowMessage('Възникна грешка при експортирането: ' + E.Message);
  end;

end;

function get_pinter(tmpDiseaseNum, tmpNo:Integer):Integer;
begin

end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//if Assigned(fProgram) then
//fProgram.Close;

// SEND_Cloud([3, 0, 26, 151, 5, m_b1, m_b2, m_b3, m_b4]);

  Caption := 'close: '+DateTimeToStr(now);

  VaComm1.Close;
  //Sleep(200);
  //halt(0);

  Action := caFree;
end;


function PingHost(const AHost: string): Boolean;
var
  Ping: TIdIcmpClient;
begin
  Ping := TIdIcmpClient.Create(nil);
  try
    Ping.Host := AHost;
    Ping.ReceiveTimeout := 1000;
    try
      Ping.Ping;
      Result := Ping.ReplyStatus.ReplyStatusType = rsEcho;
    except
      Result := False;
    end;
  finally
    Ping.Free;
  end;
end;


function IsInternetReachable: Boolean;
var
  HTTP: TIdHTTP;
begin
  HTTP := TIdHTTP.Create(nil);
  try
    try
      fMain.IdHTTP1.ConnectTimeout := 1000; // 3 секунди
      fMain.IdHTTP1.ReadTimeout := 1000;    // 3 секунди
      fMain.IdHTTP1.Head('https://www.google.com');

      Result := True;
    except
      Result := False;
    end;
  finally
    HTTP.Free;
  end;
end;

function RunProcessAndCheck(const FileName, Params: string): Boolean;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CommandLine: string;
begin
  Result := False;
  ZeroMemory(@StartInfo, SizeOf(StartInfo));
  ZeroMemory(@ProcInfo, SizeOf(ProcInfo));
  StartInfo.cb := SizeOf(StartInfo);

  CommandLine := '"' + FileName + '" ' + Params;

  if CreateProcess(
       nil,
       PChar(CommandLine),
       nil, nil,
       False,
       0,
       nil,
       nil,
       StartInfo,
       ProcInfo) then
  begin
    // Успешно стартиран процес
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
    Result := True;
  end;
end;

function GetDesktopFolder: string;
var
  PIDList: PItemIDList;
  Buffer: array [0..MAX_PATH-1] of Char;
begin
  Result := '';
  SHGetSpecialFolderLocation(Application.Handle, CSIDL_DESKTOP, PIDList);
  if Assigned(PIDList) then
    if SHGetPathFromIDList(PIDList, Buffer) then
      Result := Buffer;
end;


function CreateDesktopShellLink(const TargetName: string; _name:string): Boolean;
var
  IObject: IUnknown;
  ISLink: IShellLink;
  IPFile: IPersistFile;
  PIDL: PItemIDList;
  LinkName: string;
  InFolder: array [0..MAX_PATH-1] of Char;
begin
  Result := False;

  IObject := CreateComObject(CLSID_ShellLink);
  ISLink := IObject as IShellLink;
  IPFile := IObject as IPersistFile;

  with ISLink do
  begin
    SetDescription('Description ...');
    SetPath(PChar(TargetName));
    SetWorkingDirectory(PChar(ExtractFilePath(TargetName)));
  end;


  SHGetSpecialFolderLocation(0, CSIDL_DESKTOPDIRECTORY, PIDL);
  SHGetPathFromIDList(PIDL, InFolder) ;

  LinkName := IncludeTrailingBackslash(GetDesktopFolder);
//  LinkName := LinkName + ExtractFileName(TargetName) + '.lnk';
  LinkName := LinkName + _name + '.lnk';

  if not FileExists(LinkName) then
    if IPFile.Save(PWideChar(LinkName), False) = S_OK then
      Result := True;


end;


procedure CHECK_UPDATE_PROGRAM;
Var
  ms:TMemoryStream;
  EditURL_program, EditURL_DB:string;
  LDocument: IXMLDocument;
  LNodeElement, LNode: IXMLNode;
  I: Integer;
  _program, _database : string;
begin
  new_prog := 0;

  if (FileExists(xPath+'\libeay32.dll')=False) OR (FileExists(xPath+'\ssleay32.dll')=False) then
  begin
    if fMain.RadioGroupMainLanguage.ItemIndex=0 then
    ShowMessage('Липсват важни файлове за свалянето на нова версия!') else
    ShowMessage('Important files are missing to download a new version!');
    Exit
  end;




  ms := TMemoryStream.Create;
  fMain.IdHTTP1.get('https://zapper.sky.bg/software/new_versions.xml', ms);
  ms.SaveToFile(xPath+'\new_versions.xml');
  ms.Free;

  if FileExists(xPath+'\new_versions.xml')=False then
  begin
    if fMain.RadioGroupMainLanguage.ItemIndex=0 then
    ShowMessage('Не може да свали файла за проверка на версиите.') else
    ShowMessage('Could not download version checker file.');
    Exit;
  end;

    LDocument := TXMLDocument.Create(nil);
    LDocument.LoadFromFile(xPath+'\new_versions.xml');
    LNodeElement := LDocument.Node.ChildNodes['catalog'];

    EditURL_program := LDocument.Node.ChildNodes['catalog'].Attributes['program_download'];
    EditURL_DB := LDocument.Node.ChildNodes['catalog'].Attributes['database_download'];

    new_prog := LDocument.Node.ChildNodes['catalog'].Attributes['last_version'];
    new_db :=  LDocument.Node.ChildNodes['catalog'].Attributes['last_version_db'];





    if RoundTo(new_prog, -2) > RoundTo(program_version, -2) then
    begin

    ShowMessage('new version: '+FloatToStr(new_prog)+' current: '+FloatToStr(program_version));


      _program := xPath+'\SKY_Zapper'+FloatToStr(new_prog)+'.exe';
      _database := xPath+'\SKY_Zapper'+FloatToStr(new_prog)+'.mdb';

      ms := TMemoryStream.Create;
      fMain.IdHTTP1.get(EditURL_program,ms);
      ms.SaveToFile(_program);
      ms.Free;
      if FileExists(_program)=False then
      ShowMessage('Не може да свали новата програма от адрес: '+EditURL_program) else


      ms := TMemoryStream.Create;
      fMain.IdHTTP1.get(EditURL_DB,ms);
      fMain.ADOConnectionMDB.Close;
      ms.SaveToFile(_database);
      ms.Free;
      if FileExists(_database)=False then
      ShowMessage('Не може да свали новата база данни от адрес: '+EditURL_DB);

      if CreateDesktopShellLink(_program, 'SKY Zapper '+FloatToStr(new_prog)) then
      ShowMessage('Успешно създаване на пряк път от (Desktop / Работен плот) към новата програма: '+#13+_program) else
      ShowMessage('Неуспешно създаване на пряк път до: '+_program);



      if RunProcessAndCheck(_program, '') then
      begin
        Halt(0);
      end;

//        ShowMessage('Програмата е стартирана успешно!')
//      else    ShowMessage('Грешка при стартиране на програмата.');


    end;



end;


function check_reagional_setting : boolean;
var
  DecSep: Char;
  ShortDateFormat, LongDateFormat, LongTime: string;
begin
  Result := True;

  DecSep := FormatSettings.DecimalSeparator;
  ShortDateFormat := FormatSettings.ShortDateFormat;
  LongDateFormat := FormatSettings.LongDateFormat;
  LongTime := FormatSettings.LongTimeFormat;

  if DecSep <> '.' then
  begin
    Result := False;
    ShowMessage('Моля, променете регионалните настройки на Windows към (Decimal Separator /десетична запетая/) на точка '+#13 +'ТЕКУЩ СИМВОЛ: ' + DecSep);
  end;
      {
  if ShortDateFormat <> 'dd/MM/yyyy' then
  begin
    Result := False;
    ShowMessage('Моля, променете регионалните настройки на Windows към формат на дата: dd/MM/yyyy '+#13 +'ТЕКУЩ ФОРМАТ: '+ShortDateFormat);
  end;
   }
  if LongTime <> 'H:mm:ss' then
  begin
    Result := False;
    ShowMessage('Моля, променете регионалните настройки на Windows към формат на дата: [H:mm:ss] '+#13 +'ТЕКУЩ ФОРМАТ: '+LongTime);
  end;



//  ShowMessage('Short Date Format: ' + ShortDateFormat);
 // ShowMessage('Long Date Format: ' + LongDateFormat);

end;

function Check_Access_Rights : Boolean;
var
  TempDir, TempFileName: string;
  F: TextFile;
begin
  Result := False;
  try
    // Вземаме пътя до временната директория
    //SetLength(TempDir, MAX_PATH);
    //SetLength(TempDir, GetTempPath(MAX_PATH, PChar(TempDir)));

    TempDir := ExtractFileDir(Application.ExeName);
//    TempDir := IncludeTrailingPathDelimiter(TempDir);

    // Генерираме уникално име на временен файл
    TempFileName := TempDir + '\access_test_' + IntToStr(GetTickCount) + '.tmp';

    // Опит за създаване на файл
    //ShowMessage(TempFileName);


    AssignFile(F, TempFileName);
    Rewrite(F);
    Writeln(F, 'Access rights test');
    CloseFile(F);

    // Проверяваме дали файлът е създаден и го изтриваме
    if FileExists(TempFileName) then
    begin
      DeleteFile(PChar(TempFileName));
      Result := True;
    end;

  except on E: Exception do
  begin
//  fmain.Caption := 'ERROR: '+TempFileName;
      Result := False; // При грешка — няма нужните права
  end;
  end;



end;



procedure DemoWithTempLocale;
var
  FS: TFormatSettings;
  FormattedNumber: string;
  FormattedDate: string;
begin
  // Зареждаме регионалните настройки по подразбиране
  FS := TFormatSettings.Create(LOCALE_USER_DEFAULT);

  // Променяме само локално (в този record) нужните стойности
  FS.DecimalSeparator := '.';
  FS.ThousandSeparator := ',';
  FS.DateSeparator := '-';
  FS.ShortDateFormat := 'yyyy-MM-dd';

  // Пример: използване на локално форматиране (не засяга глобално поведение)
  FormattedNumber := FormatFloat('0.00', 1234.56, FS);          // 1234.56
  FormattedDate := FormatDateTime(FS.ShortDateFormat, Date, FS); // 2025-07-23

  ShowMessage('Число: ' + FormattedNumber + sLineBreak + 'Дата: ' + FormattedDate);
end;


function ProcessCount(const AExeFileName: string): Integer;
var
  Snapshot: THandle;
  ProcEntry: TProcessEntry32;
begin
  Result := 0;
  Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Snapshot = INVALID_HANDLE_VALUE then Exit;
  try
    ProcEntry.dwSize := SizeOf(TProcessEntry32);
    if Process32First(Snapshot, ProcEntry) then
    repeat
      if SameText(ExtractFileName(ProcEntry.szExeFile), AExeFileName) then
        Inc(Result);
    until not Process32Next(Snapshot, ProcEntry);
  finally
    CloseHandle(Snapshot);
  end;
end;

procedure TfMain.FormShow(Sender: TObject);
type
  Win1251String = type AnsiString(1251);
var
  tmp1, tmp2, tmp3, tmp4, tmp5: Win1251String;
  I, len1, len2, len3, len4, len5, p, MAC_INT: Integer;
  new_db : string;

  tmpStart : TDateTime;
  check_internet_connection : Boolean;
  sh : Integer;
  AppProgram : string;
begin
  Connection_Type := -1; //-1 няма връзка

  AppProgram := ExtractFileName(Application.ExeName);
  if ProcessCount(AppProgram) >= 2 then
  begin
    ShowMessage('Програмата вече е пусната на този компютър!');
    halt
  end;




  //DemoWithTempLocale;
  LoginUser := 0;

  if check_reagional_setting = false then
  begin
    ShowMessage('Ако регионалните настройки не са направени може софтуера да не работи коректно!');
    //halt;
  end;

  if Check_Access_Rights = False then
  begin
    ShowMessage('Програмата не може да се стартира от DVD, трябва да се копира на компютъра!');
    halt;
  end;

  xPath := ExtractFileDir(Application.ExeName);
  LabelMessage.Caption := '';

  {
  if ParamStr(1) = 'net' then
  begin
    GroupBoxNetworkConnections.Visible := True;
    GroupBoxUSBConnections.Visible := True;

    TimerCheck_USB_Connections.Enabled := False;
    TimerUSE_Network.Enabled := True; //пуска мултикаст докато напълни табличката за избор
  end else
  begin
    TimerCheck_USB_Connections.Enabled := True;
    TimerUSE_Network.Enabled := False;
  end;
  }

  tmpStart := Now;
//  check_internet_connection := IsInternetReachable;
  check_internet_connection := PingHost('sky.bg'); // 8.8.8.8
  sh := MilliSecondsBetween(now, tmpStart);
//  ShowMessage(IntToStr(sh)+ ' IsInternetReachable:  '+BoolToStr(check_internet_connection));


  if check_internet_connection then
  begin
    CHECK_UPDATE_PROGRAM;
  end;



  AdvToolBarPager1.Collaps;
  RadioGroupMainLanguageClick(nil);

  if ParamStr(1)='debug' then
  tmpDebugOptiopns := True else
  tmpDebugOptiopns := False;

  if ParamStr(1)='EN' then
  begin
    RadioGroupMainLanguage.ItemIndex := 1;
    RadioGroupMainLanguageClick(nil);
  end;


  Clear_All_Vars;

  SetLength(buff, max_mem);


//  ADOConnectionMDB.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+xPath+'\SKY_Zapper.mdb;Persist Security Info=False';
//  ADOConnectionMDB.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+xPath+'\SKY_Zapper.mdb;Persist Security Info=False;Jet OLEDB:Database Password=Qwerty!23';


  new_db := xPath + '\SKY_Zapper'+FloatToStr(program_version)+'.mdb';

  if FileExists(new_db) then
  begin
//    ADOConnectionMDB.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+new_db+';Persist Security Info=False;Jet OLEDB:Database Password=Qwerty!23';
    ADOConnectionMDB.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+new_db+';Persist Security Info=False;Jet OLEDB:Database Password=Qwerty!23';
  end else
  begin
    new_db := xPath+'\SKY_Zapper.mdb';

    if FileExists(new_db)=False then
    begin
      if RadioGroupMainLanguage.ItemIndex=0 then
      ShowMessage('Програмата не може да намери базата данни: '+#13+new_db) else
      ShowMessage('Program can not find database file: '+#13+new_db);
      Halt(0);
    end;

    ADOConnectionMDB.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+new_db+';Persist Security Info=False;Jet OLEDB:Database Password=Qwerty!23';
  end;


  ADOConnectionMDB.Open();
  ADOQueryDiseases.Open;
  ADOQueryOptions.Open;

  ADOQueryUsers.SQL.Text := 'SELECT * FROM Users ORDER BY name';
  ADOQueryUsers.Open;

  if (ADOQueryUsers.RecordCount >= 2) OR (length(ADOQueryUsers.FieldByName('pass').AsString) >= 1) then
  begin
    Application.CreateForm(TfLogin, fLogin);
    fLogin.ShowModal;
  end else
  begin
    if (ADOQueryUsers.RecordCount = 1) OR (length(ADOQueryUsers.FieldByName('pass').AsString) = 0) then
    begin
      LoginUser := fMain.ADOQueryUsers.FieldByName('id').AsInteger;
      LoginName := fMain.ADOQueryUsers.FieldByName('name').AsString;
    end;
  end;

  if LoginUser = 0 then
  begin
    ShowMessage('Неуспешно логване в програмата!');
    Halt(0);
  end;

  try
    ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=0';
    ADOQuerySQL.ExecSQL;
  except
    if RadioGroupMainLanguage.ItemIndex=0 then
    ShowMessage('Моля, копирайте "3. Software SKY Zapper" програмата в папка на компютъра, където има права за запис.') else
    ShowMessage('Program can not write in folder.. check permitions!');
    Halt(0);
  end;

  try
    database_version := ADOQueryOptions.FieldByName('db_ver').AsFloat;
  except
    database_version := 1.29;
  end;

  if RadioGroupMainLanguage.ItemIndex=0 then
  Caption := 'Програма SKY Запер v'+FormatFloat('0.00', program_version)+' База данни v'+FormatFloat('0.00', database_version) else
  Caption := 'Program SKY Zapper v'+FormatFloat('0.00', program_version)+' Database v'+FormatFloat('0.00', database_version);




  //80310066
  if length(ADOQueryOptions.FieldByName('MAC').AsString) >= 6 then
  MAC_INT := StrToInt('$'+ADOQueryOptions.FieldByName('MAC').AsString) else
  MAC_INT := 0;

  M_b4 := byte(MAC_INT);
  M_b3 := byte(MAC_INT shr 8);
  M_b2 := byte(MAC_INT shr 16);
  M_b1 := byte(MAC_INT shr 24);

  if FileExists(xPath+'\vars.ini') then
  begin
    //nEditFullHDScreen.Visible := True;
    AdvToolBarButtonAdmin.Visible := True;
  end else
  begin
    //nEditFullHDScreen.Visible := False;
    AdvToolBarButtonAdmin.Visible := False;
  end;


  LAST_COM_PORT := ADOQueryOptions.FieldByName('com_port').AsString;
  LAST_NETWORK_IP := ADOQueryOptions.FieldByName('network_ip').AsString;


  TimerSearch.Interval := 3000;
  TimerSearch.Enabled := True;







  SEND_Cloud([3, 0, 26, 150, 5, m_b1, m_b2, m_b3, m_b4]);



  try
    len1:=0;  len2:=0;  len3:=0;  len4:=0;  len5:=0;
    tmp1:='';   tmp2:='';  tmp3:='';  tmp4:='';  tmp5:='';

    tmp1 := Win1251String(Get_OperationSystem_WMI);  len1 := Length(tmp1);
    tmp2 := Win1251String(Get_MacAddress_WMI);  len2 := Length(tmp2);
    tmp3 := Win1251String(Get_Username_WMI);  len3 := Length(tmp3);
    tmp4 := Win1251String(GET_COMPUTER_NAME);  len4 := Length(tmp4);
    tmp5 := Win1251String(GET_LOCAL_IP);  len5 := Length(tmp5);

    SetLength(_Send_UDP, 5 + len1 + 1 + len2 + 1 + len3 + 1 + len4 + 1 + len5 + 1 + 4);

    _Send_UDP[0] := 3; //program
    _Send_UDP[1] := 0;
    _Send_UDP[2] := 26;
    _Send_UDP[3] := 161;
    _Send_UDP[4] := 5; //SRC
    p := 5;
    for I := p to p+len1 do begin _Send_UDP[i] := Ord(tmp1[i-p+1]);  end; inc(p,len1); _Send_UDP[p] := 13; Inc(p);
    for I := p to p+len2 do begin _Send_UDP[i] := Ord(tmp2[i-p+1]);  end; inc(p,len2); _Send_UDP[p] := 13; Inc(p);
    for I := p to p+len3 do begin _Send_UDP[i] := Ord(tmp3[i-p+1]);  end; inc(p,len3); _Send_UDP[p] := 13; Inc(p);
    for I := p to p+len4 do begin _Send_UDP[i] := Ord(tmp4[i-p+1]);  end; inc(p,len4); _Send_UDP[p] := 13; Inc(p);
    for I := p to p+len5 do begin _Send_UDP[i] := Ord(tmp5[i-p+1]);  end; inc(p,len5); _Send_UDP[p] := 13; Inc(p);
    _Send_UDP[p+0] := M_b1;
    _Send_UDP[p+1] := M_b2;
    _Send_UDP[p+2] := M_b3;
    _Send_UDP[p+3] := M_b4;

    //wait(100);
    SleepSky(100);
    SEND_Cloud(_Send_UDP);


  except
  end;


end;

procedure TfMain.IdSSLIOHandlerSocketOpenSSL2Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
LogEvent(AStatusText);
end;

procedure TfMain.IdSSLIOHandlerSocketOpenSSL2StatusInfo(const AMsg: string);
begin

LogEvent(AMsg);
end;

procedure TfMain.IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);

var
 // I, len: Integer;
  mac1 : string;
  tmp: ansichar;
  i,p,max, length_buffer : integer;

  sn : Int16;
  buf_2b : array [1..2] of Byte;
  buf_4b : array [1..4] of Byte;

  _NH_Buff : TIdBytes;
  _read : TIdBytes;
  WaterQ, CurrentSence : Word;
  SilverWaterTime, SilverWaterRemain:Integer;
  tmpFreq,
  tmpCategory,
  tmpProgram,
  tmpFreqVar :Word;

  tmpWifi, tmpIP, tmpDB, tmpStatus:string;
  tmpRSSI :  SmallInt;


  begin
  with fmain do
  begin
    Application.ProcessMessages;


    //Memo1.Lines.Add('IP: '+ABinding.PeerIP);
    LastPacketPing := Now;

    length_buffer := Length(AData);

    dt1 := Now;
    SetLength(_NH_Buff, length_buffer);
    SetLength(_read, length_buffer);
    for i := 0 to length_buffer-1 do _read[i] := 0;
    for i := 0 to length_buffer-1 do _NH_Buff[i] := 0;

    for i := 0 to length_buffer-1 do
    begin

        _read[i] := AData[i];
        if i >= 4 then _NH_Buff[i-4] := AData[i];

    end;

    if (_read[2]=26) AND (_read[3]=60) then
    begin
       //mising
    end else
    begin
      LogRX('');
      LogRX('UDP Данни: '+IntToStr(length_buffer-1)+' бр. време '+IntToStr(MilliSecondsBetween(Now, dt1))+' ms');


      if CheckBoxDescriptor.Checked = False then
      begin
        for i := 0 to length_buffer-1 do LogRX('No: '+IntToStr(i-4)+ ' Byte: '+IntToStr(_read[i])+' Hex: '+IntToHex(_read[i], 2)  + isCharacters(_read[i]) + Descriptor(i) );
      end else
      begin
        for i := 0 to length_buffer-1 do LogRX('*No: '+IntToStr(i)+ ' Byte: '+IntToStr(_NH_Buff[i])+' Hex: '+IntToHex(_NH_Buff[i], 2)  + isCharacters(_NH_Buff[i]) + Descriptor(i) );
      end;


      LogRX('UDP Преглед: '+IntToStr(length_buffer-1)+' бр. време '+IntToStr(MilliSecondsBetween(Now, dt1))+' ms');
    end;



    if (_read[0]=2) AND (_read[1]=0) AND (_read[2]=137) AND (_read[3]=0) then  //отговора на 9 за всички настройки по мрежата
    begin

        GLB_SHORT_MAC := IntToHex(_read[4],2)+IntToHex(_read[5],2);
        GLB_FULL_MAC := IntToHex(_read[4],2)+IntToHex(_read[5],2)+IntToHex(_read[6],2)+IntToHex(_read[7],2);

        if VirtualTableLAN_Zappers.Locate('MAC', GLB_FULL_MAC, []) = False then
        begin
          VirtualTableLAN_Zappers.Insert;
          VirtualTableLAN_Zappers.FieldByName('MAC').AsString := GLB_FULL_MAC;
          VirtualTableLAN_Zappers.FieldByName('IP').AsString := ABinding.PeerIP;
          VirtualTableLAN_Zappers.Post;

          MemoMainLogEvent.Lines.Add(IntToStr(length_buffer)+' Намерен е запер в мрежата: '+GLB_FULL_MAC);
        end;

        if GroupBoxNetworkConnections.Visible then Exit;


        M_b1 := _read[4];
        M_b2 := _read[5];
        M_b3 := _read[6];
        M_b4 := _read[7];
        _pass := chr(_read[10]) + chr(_read[11]) + chr(_read[12]) + chr(_read[13]) + chr(_read[14]) + chr(_read[15]);

        // UDP
        if (GLB_SHORT_MAC = '8030') OR   // 8030 - Zapper WiFi
           (GLB_SHORT_MAC = '8031') OR   // 8031 - Zapper WiFi + SilverWater
           (GLB_SHORT_MAC = '8041') OR   // 8041 - Zapper Rev 1 + Silver
           (GLB_SHORT_MAC = '8042') then // 8042 - Zapper Rev 2 + Silver
        begin
          _Power := 54;
          _DurationFrequenceTime := 55;
          _Freq := 57;
          _Zumer := 58;
          _Sweep := 59;
          _Wifi := 122;
          _Wifi_AP := 123;
          _Wifi_AP_NoAct := 124;
          _SilverWaterStartByte := 126;
          _CurrentSetPoint := 126;
          _WaterQuantity := 127;
          _SilverConcentration := 129;

          if (GLB_SHORT_MAC = '8031') then _SilverWaterOn := 132;
          _CurrentSence := 133;
          _SilverWatterTime := 135;
          _SilverWaterRemain := 139;

          Move(_NH_Buff[73], tmpCategory, 2);    Move(_NH_Buff[75], tmpProgram, 2);   if tID1 <> tmpProgram then begin tID1 := tmpProgram; tTEXT1 := GetProgramNameWiFi(1, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[77], tmpCategory, 2);    Move(_NH_Buff[79], tmpProgram, 2);   if tID2 <> tmpProgram then begin tID2 := tmpProgram; tTEXT2 := GetProgramNameWiFi(2, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[81], tmpCategory, 2);    Move(_NH_Buff[83], tmpProgram, 2);   if tID3 <> tmpProgram then begin tID3 := tmpProgram; tTEXT3 := GetProgramNameWiFi(3, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[85], tmpCategory, 2);    Move(_NH_Buff[87], tmpProgram, 2);   if tID4 <> tmpProgram then begin tID4 := tmpProgram; tTEXT4 := GetProgramNameWiFi(4, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[89], tmpCategory, 2);    Move(_NH_Buff[91], tmpProgram, 2);   if tID5 <> tmpProgram then begin tID5 := tmpProgram; tTEXT5 := GetProgramNameWiFi(5, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[93], tmpCategory, 2);    Move(_NH_Buff[95], tmpProgram, 2);   if tID6 <> tmpProgram then begin tID6 := tmpProgram; tTEXT6 := GetProgramNameWiFi(6, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[97], tmpCategory, 2);    Move(_NH_Buff[99], tmpProgram, 2);   if tID7 <> tmpProgram then begin tID7 := tmpProgram; tTEXT7 := GetProgramNameWiFi(7, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[101], tmpCategory, 2);  Move(_NH_Buff[103], tmpProgram, 2);   if tID8 <> tmpProgram then begin tID8 := tmpProgram; tTEXT8 := GetProgramNameWiFi(8, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[105], tmpCategory, 2);  Move(_NH_Buff[107], tmpProgram, 2);   if tID9 <> tmpProgram then begin tID9 := tmpProgram; tTEXT9 := GetProgramNameWiFi(9, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[109], tmpCategory, 2);  Move(_NH_Buff[111], tmpProgram, 2);   if tID10 <> tmpProgram then begin tID10 := tmpProgram; tTEXT10 := GetProgramNameWiFi(10, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[113], tmpCategory, 2);  Move(_NH_Buff[115], tmpProgram, 2);   if tID11 <> tmpProgram then begin tID11 := tmpProgram; tTEXT11 := GetProgramNameWiFi(11, tmpCategory, tmpProgram); end;
          Move(_NH_Buff[117], tmpCategory, 2);  Move(_NH_Buff[119], tmpProgram, 2);   if tID12 <> tmpProgram then begin tID12 := tmpProgram; tTEXT12 := GetProgramNameWiFi(12, tmpCategory, tmpProgram); end;
        end;


        if (GLB_SHORT_MAC = '8011') OR (GLB_SHORT_MAC = '8012') OR (GLB_SHORT_MAC = '8040') then //8011-Zapper Basic,  8012-Zapper Basic + SilverWater
        begin
          _Power := 10;
          _DurationFrequenceTime := 11;
          _Freq := 13; //NE ZNAM DALI E TAKA
          _Zumer := 14;
          _Sweep := 15;
          _Wifi := 0;
          _Wifi_AP := 0;
          _Wifi_AP_NoAct := 0;
          _SilverWaterStartByte := 29;
          _CurrentSetPoint := 29;
          _WaterQuantity := 30;
          _SilverConcentration := 32;
          _SilverWaterOn := 34;
          _CurrentSence := 35;
          _SilverWatterTime := 37;
          _SilverWaterRemain := 41;
        end;

		    _FactoryPIN := '';
        _AdditionalPIN := '';
        for I := 6 to 17 do
        begin

          if (_NH_Buff[i]<>0) then
          begin

            if (i <= 11) then
            _FactoryPIN := _FactoryPIN + chr(_NH_Buff[i]) else
            _AdditionalPIN := _AdditionalPIN + chr(_NH_Buff[i]);

          end;

        end;



        if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8030') OR (GLB_SHORT_MAC = '8041') OR (GLB_SHORT_MAC = '8042') then
        begin

            _cloud_service := '';
            for I := 18 to 47 do
            begin
              if (_NH_Buff[i]<>0) then
              _cloud_service := _cloud_service + chr(_NH_Buff[i]);
            end;

            Move(_NH_Buff[i], uniWord1, 2);
            _cloud_port := IntToStr(uniWord1);

            if uniWord1 <> defualt_cloud_port then
            begin
              ShowMessage('ПРОМЯНА НА ПОРТА ЗА КЛАУД УСЛУГАТА ОТ: '+_cloud_port+' по WiFi');

              PREPARE_BUFF;
              USB_Buffer[1] := 0;
              USB_Buffer[2] := 0;
              USB_Buffer[3] := 16;
              USB_Buffer[4] := 48;
              USB_Buffer[5] := byte(defualt_cloud_port);
              USB_Buffer[6] := byte(defualt_cloud_port shr 8);

              _cloud_port := IntToStr(defualt_cloud_port);

              SendBufferToLAN(6);
              PARSE_BUFF('LAN - Смяна на cloud service', 6);
            end;



            if _cloud_service <> 'cloud.sky.bg' then
            begin
              ShowMessage('ПРОМЯНА НА URL АДРЕСА ЗА CLOUD УСЛУГАТА по WiFi!');

              _new_service := 'cloud.sky.bg';

              PREPARE_BUFF;

              USB_Buffer[1] := 0;
              USB_Buffer[2] := 0;
              USB_Buffer[3] := 16;
              USB_Buffer[4] := 18;

              for i := 1 to 29 do
              begin

                if i <= Length(_new_service) then
                USB_Buffer[4+i] := ord(_new_service[i]) else
                USB_Buffer[4+i] := 0;
              end;

              max := 4 + 29 + 1;
              USB_Buffer[max] := 0;

              SendBufferToLAN(max);
              PARSE_BUFF('LAN - Смяна на cloud service', max);

            end;
        end;


        //UDP
        if Assigned(fOptions) then
        begin
          with fOptions do
          begin
            if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8030') OR (GLB_SHORT_MAC = '8041') OR (GLB_SHORT_MAC = '8042') then
            begin

              if RadioGroupMainLanguage.ItemIndex=0 then
              MemoLogPower.Lines.Add('Настройки на мощността') else
              MemoLogPower.Lines.Add('Power settings');

              Move(_NH_Buff[60], tmpFreq, 2);
              if tmpFreq=0 then
              begin
                if RadioGroupMainLanguage.ItemIndex=0 then
                MemoLogPower.Lines.Add('Всички честоти са на 100% мощност') else
                MemoLogPower.Lines.Add('All frequencies are at 100% power');
              end else
              begin
                if RadioGroupMainLanguage.ItemIndex=0 then
                begin
                  if tmpFreq > 100 then begin MemoLogPower.Lines.Add('Честоти от 1 до 100 херца '+IntToStr(_NH_Buff[72])+'% мощност'); tmpFreqVar := 100; end;
                  if tmpFreq > 200 then begin MemoLogPower.Lines.Add('Честоти от 101 до 200 херца '+IntToStr(_NH_Buff[71])+'% мощност'); tmpFreqVar := 200; end;
                  if tmpFreq > 300 then begin MemoLogPower.Lines.Add('Честоти от 201 до 300 херца '+IntToStr(_NH_Buff[70])+'% мощност'); tmpFreqVar := 300; end;
                  if tmpFreq > 400 then begin MemoLogPower.Lines.Add('Честоти от 301 до 400 херца '+IntToStr(_NH_Buff[69])+'% мощност'); tmpFreqVar := 400; end;
                  if tmpFreq > 500 then begin MemoLogPower.Lines.Add('Честоти от 401 до 500 херца '+IntToStr(_NH_Buff[68])+'% мощност'); tmpFreqVar := 500; end;
                  if tmpFreq > 600 then begin MemoLogPower.Lines.Add('Честоти от 501 до 600 херца '+IntToStr(_NH_Buff[67])+'% мощност'); tmpFreqVar := 600; end;
                  if tmpFreq > 700 then begin MemoLogPower.Lines.Add('Честоти от 601 до 700 херца '+IntToStr(_NH_Buff[66])+'% мощност'); tmpFreqVar := 700; end;
                  if tmpFreq > 800 then begin MemoLogPower.Lines.Add('Честоти от 701 до 800 херца '+IntToStr(_NH_Buff[65])+'% мощност'); tmpFreqVar := 800; end;
                  if tmpFreq > 900 then begin MemoLogPower.Lines.Add('Честоти от 801 до 900 херца '+IntToStr(_NH_Buff[64])+'% мощност'); tmpFreqVar := 900; end;
                  if tmpFreq > 1000 then begin MemoLogPower.Lines.Add('Честоти от 901 до 1000 херца '+IntToStr(_NH_Buff[63])+'% мощност'); tmpFreqVar := 1000; end;
                  if (tmpFreq > 1000) then
                  begin
                  MemoLogPower.Lines.Add('Честоти от '+IntToStr(tmpFreqVar)+' до '+IntToStr(tmpFreq)+' херца '+IntToStr(_NH_Buff[62])+'% мощност');
                  MemoLogPower.Lines.Add('Честоти над '+IntToStr(tmpFreq)+' херца 100% мощност');
                  end;
                end else
                begin
                  if tmpFreq > 100 then begin MemoLogPower.Lines.Add('Frequencies from 1 to 100 hertz '+IntToStr(_NH_Buff[72])+'% power'); tmpFreqVar := 100; end;
                  if tmpFreq > 200 then begin MemoLogPower.Lines.Add('Frequencies from 101 to 200 hertz '+IntToStr(_NH_Buff[71])+'% power'); tmpFreqVar := 200; end;
                  if tmpFreq > 300 then begin MemoLogPower.Lines.Add('Frequencies from 201 to 300 hertz '+IntToStr(_NH_Buff[70])+'% power'); tmpFreqVar := 300; end;
                  if tmpFreq > 400 then begin MemoLogPower.Lines.Add('Frequencies from 301 to 400 hertz '+IntToStr(_NH_Buff[69])+'% power'); tmpFreqVar := 400; end;
                  if tmpFreq > 500 then begin MemoLogPower.Lines.Add('Frequencies from 401 to 500 hertz '+IntToStr(_NH_Buff[68])+'% power'); tmpFreqVar := 500; end;
                  if tmpFreq > 600 then begin MemoLogPower.Lines.Add('Frequencies from 501 to 600 hertz '+IntToStr(_NH_Buff[67])+'% power'); tmpFreqVar := 600; end;
                  if tmpFreq > 700 then begin MemoLogPower.Lines.Add('Frequencies from 601 to 700 hertz '+IntToStr(_NH_Buff[66])+'% power'); tmpFreqVar := 700; end;
                  if tmpFreq > 800 then begin MemoLogPower.Lines.Add('Frequencies from 701 to 800 hertz '+IntToStr(_NH_Buff[65])+'% power'); tmpFreqVar := 800; end;
                  if tmpFreq > 900 then begin MemoLogPower.Lines.Add('Frequencies from 801 to 900 hertz '+IntToStr(_NH_Buff[64])+'% power'); tmpFreqVar := 900; end;
                  if tmpFreq > 1000 then begin MemoLogPower.Lines.Add('Frequencies from 901 to 1000 hertz '+IntToStr(_NH_Buff[63])+'% power'); tmpFreqVar := 1000; end;
                  if (tmpFreq > 1000) then
                  begin
                  MemoLogPower.Lines.Add('Frequencies from '+IntToStr(tmpFreqVar)+' to '+IntToStr(tmpFreq)+' hertz '+IntToStr(_NH_Buff[62])+'% power');
                  MemoLogPower.Lines.Add('Frequencies above '+IntToStr(tmpFreq)+' hertz 100% power');
                  end;
                end;
              end;
            end;

            if (GLB_SHORT_MAC = '8011') OR (GLB_SHORT_MAC = '8012') OR (GLB_SHORT_MAC = '8040') then
            begin

              if RadioGroupMainLanguage.ItemIndex=0 then
              MemoLogPower.Lines.Add('Настройки на мощността') else
              MemoLogPower.Lines.Add('Power settings');

              Move(_NH_Buff[16], tmpFreq, 2);
              if tmpFreq=0 then
              begin
                if RadioGroupMainLanguage.ItemIndex=0 then
                MemoLogPower.Lines.Add('Всички честоти са на 100% мощност') else
                MemoLogPower.Lines.Add('All frequencies are at 100% power');
              end else
              begin
                if RadioGroupMainLanguage.ItemIndex=0 then
                begin
                  if tmpFreq > 100 then begin MemoLogPower.Lines.Add('Честоти от 1 до 100 херца '+IntToStr(_NH_Buff[28])+'% мощност'); tmpFreqVar := 100; end;
                  if tmpFreq > 200 then begin MemoLogPower.Lines.Add('Честоти от 101 до 200 херца '+IntToStr(_NH_Buff[27])+'% мощност'); tmpFreqVar := 200; end;
                  if tmpFreq > 300 then begin MemoLogPower.Lines.Add('Честоти от 201 до 300 херца '+IntToStr(_NH_Buff[26])+'% мощност'); tmpFreqVar := 300; end;
                  if tmpFreq > 400 then begin MemoLogPower.Lines.Add('Честоти от 301 до 400 херца '+IntToStr(_NH_Buff[25])+'% мощност'); tmpFreqVar := 400; end;
                  if tmpFreq > 500 then begin MemoLogPower.Lines.Add('Честоти от 401 до 500 херца '+IntToStr(_NH_Buff[24])+'% мощност'); tmpFreqVar := 500; end;
                  if tmpFreq > 600 then begin MemoLogPower.Lines.Add('Честоти от 501 до 600 херца '+IntToStr(_NH_Buff[23])+'% мощност'); tmpFreqVar := 600; end;
                  if tmpFreq > 700 then begin MemoLogPower.Lines.Add('Честоти от 601 до 700 херца '+IntToStr(_NH_Buff[22])+'% мощност'); tmpFreqVar := 700; end;
                  if tmpFreq > 800 then begin MemoLogPower.Lines.Add('Честоти от 701 до 800 херца '+IntToStr(_NH_Buff[21])+'% мощност'); tmpFreqVar := 800; end;
                  if tmpFreq > 900 then begin MemoLogPower.Lines.Add('Честоти от 801 до 900 херца '+IntToStr(_NH_Buff[20])+'% мощност'); tmpFreqVar := 900; end;
                  if tmpFreq > 1000 then begin MemoLogPower.Lines.Add('Честоти от 901 до 1000 херца '+IntToStr(_NH_Buff[19])+'% мощност'); tmpFreqVar := 1000; end;
                  if (tmpFreq > 1000) then
                  begin
                  MemoLogPower.Lines.Add('Честоти от '+IntToStr(tmpFreqVar)+' до '+IntToStr(tmpFreq)+' херца '+IntToStr(_NH_Buff[18])+'% мощност');
                  MemoLogPower.Lines.Add('Честоти над '+IntToStr(tmpFreq)+' херца 100% мощност');
                  end;
                end else
                begin
                  if tmpFreq > 100 then begin MemoLogPower.Lines.Add('Frequencies from 1 to 100 hertz '+IntToStr(_NH_Buff[28])+'% power'); tmpFreqVar := 100; end;
                  if tmpFreq > 200 then begin MemoLogPower.Lines.Add('Frequencies from 101 to 200 hertz '+IntToStr(_NH_Buff[27])+'% power'); tmpFreqVar := 200; end;
                  if tmpFreq > 300 then begin MemoLogPower.Lines.Add('Frequencies from 201 to 300 hertz '+IntToStr(_NH_Buff[26])+'% power'); tmpFreqVar := 300; end;
                  if tmpFreq > 400 then begin MemoLogPower.Lines.Add('Frequencies from 301 to 400 hertz '+IntToStr(_NH_Buff[25])+'% power'); tmpFreqVar := 400; end;
                  if tmpFreq > 500 then begin MemoLogPower.Lines.Add('Frequencies from 401 to 500 hertz '+IntToStr(_NH_Buff[24])+'% power'); tmpFreqVar := 500; end;
                  if tmpFreq > 600 then begin MemoLogPower.Lines.Add('Frequencies from 501 to 600 hertz '+IntToStr(_NH_Buff[23])+'% power'); tmpFreqVar := 600; end;
                  if tmpFreq > 700 then begin MemoLogPower.Lines.Add('Frequencies from 601 to 700 hertz '+IntToStr(_NH_Buff[22])+'% power'); tmpFreqVar := 700; end;
                  if tmpFreq > 800 then begin MemoLogPower.Lines.Add('Frequencies from 701 to 800 hertz '+IntToStr(_NH_Buff[21])+'% power'); tmpFreqVar := 800; end;
                  if tmpFreq > 900 then begin MemoLogPower.Lines.Add('Frequencies from 801 to 900 hertz '+IntToStr(_NH_Buff[20])+'% power'); tmpFreqVar := 900; end;
                  if tmpFreq > 1000 then begin MemoLogPower.Lines.Add('Frequencies from 901 to 1000 hertz '+IntToStr(_NH_Buff[19])+'% power'); tmpFreqVar := 1000; end;
                  if (tmpFreq > 1000) then
                  begin
                  MemoLogPower.Lines.Add('Frequencies from '+IntToStr(tmpFreqVar)+' to '+IntToStr(tmpFreq)+' hertz '+IntToStr(_NH_Buff[18])+'% power');
                  MemoLogPower.Lines.Add('Frequencies above '+IntToStr(tmpFreq)+' hertz 100% power');
                  end;
                end;
              end;
            end;

              MemoPrograms.Clear;
              if RadioGroupMainLanguage.ItemIndex=0 then
              begin
                MemoPrograms.Lines.Add('Червено 1 - '+tTEXT1);  MemoPrograms.Lines.Add('Червено 2 - '+tTEXT2); MemoPrograms.Lines.Add('Червено 3 - '+tTEXT3); MemoPrograms.Lines.Add('Червено 4 - '+tTEXT4);
                MemoPrograms.Lines.Add('Зелено 1 - '+tTEXT5);   MemoPrograms.Lines.Add('Зелено 2 - '+tTEXT6);  MemoPrograms.Lines.Add('Зелено 3 - '+tTEXT7);  MemoPrograms.Lines.Add('Зелено 4 - '+tTEXT8);
                MemoPrograms.Lines.Add('Синьо 1 - '+tTEXT9);    MemoPrograms.Lines.Add('Синьо 2 - '+tTEXT10);  MemoPrograms.Lines.Add('Синьо 3 - '+tTEXT11);  MemoPrograms.Lines.Add('Синьо 4 - '+tTEXT11);
              end else
              begin
                MemoPrograms.Lines.Add('Red 1 - '+tTEXT1);  MemoPrograms.Lines.Add('Red 2 - '+tTEXT2); MemoPrograms.Lines.Add('Red 3 - '+tTEXT3); MemoPrograms.Lines.Add('Red 4 - '+tTEXT4);
                MemoPrograms.Lines.Add('Green 1 - '+tTEXT5);   MemoPrograms.Lines.Add('Green 2 - '+tTEXT6);  MemoPrograms.Lines.Add('Green 3 - '+tTEXT7);  MemoPrograms.Lines.Add('Green 4 - '+tTEXT8);
                MemoPrograms.Lines.Add('Blue 1 - '+tTEXT9);    MemoPrograms.Lines.Add('Blue 2 - '+tTEXT10);  MemoPrograms.Lines.Add('Blue 3 - '+tTEXT11);  MemoPrograms.Lines.Add('Blue 4 - '+tTEXT11);
              end;
          end;
        end;

        //=================================  СРЕБЪРНА ВОДА  UDP
        if Assigned(fSrebarnaVoda) then
        begin
          with fSrebarnaVoda do
          begin
            //MemoMainLogEvent.Lines.Add('SREBRO: '+GLB_SHORT_MAC);

            if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8012') OR (GLB_SHORT_MAC = '8040') OR (GLB_SHORT_MAC = '8041') OR (GLB_SHORT_MAC = '8042') then
            begin

              //MemoMainLogEvent.Lines.Add('SREBRO 2: '+ IntToStr( _CurrentSetPoint)+' DATA: '+IntToStr( _NH_Buff[_CurrentSetPoint]));

              case _NH_Buff[_CurrentSetPoint] of
              2: RadioGroupCurrentSetPoint.ItemIndex:=0;
              5: RadioGroupCurrentSetPoint.ItemIndex:=1;
              8: RadioGroupCurrentSetPoint.ItemIndex:=2;
              11: RadioGroupCurrentSetPoint.ItemIndex:=3;
              14: RadioGroupCurrentSetPoint.ItemIndex:=4;
              17: RadioGroupCurrentSetPoint.ItemIndex:=5;
              20: RadioGroupCurrentSetPoint.ItemIndex:=6;
              end;

              Move(_NH_Buff[_WaterQuantity],WaterQ,2);
              case WaterQ of
              200: RadioGroupWaterQ.ItemIndex := 0;
              500: RadioGroupWaterQ.ItemIndex := 1;
              1000: RadioGroupWaterQ.ItemIndex := 2;
              2000: RadioGroupWaterQ.ItemIndex := 3;
              end;

              case _NH_Buff[_SilverConcentration] of
              2:RadioGroupSilverConcentration.ItemIndex := 0;
              5:RadioGroupSilverConcentration.ItemIndex := 1;
              15:RadioGroupSilverConcentration.ItemIndex := 2;
              100:RadioGroupSilverConcentration.ItemIndex := 3;
              end;

              Move(_NH_Buff[_CurrentSence], CurrentSence, 2);


              if RadioGroupMainLanguage.ItemIndex=0 then
              LabelPower.Caption := 'Изходен ток: '+FormatFloat('0.00', CurrentSence/100)+' mA.' else
              LabelPower.Caption := 'Output current: '+FormatFloat('0.00', CurrentSence/100)+' mA.';

              Move(_NH_Buff[_SilverWatterTime], SilverWaterTime, 4);
              if RadioGroupMainLanguage.ItemIndex=0 then
              LabelExpectTime.Caption := 'Очаквано време: '+TimeToStr(Time-IncSecond(Time,SilverWaterTime)) else //+' num: '+IntToStr(SilverWaterTime)+' pinter: '+IntToStr(_SilverWatterTime);
              LabelExpectTime.Caption := 'Expected time: '+TimeToStr(Time-IncSecond(Time,SilverWaterTime));

              Move(_NH_Buff[_SilverWaterRemain], SilverWaterRemain, 4);
              if RadioGroupMainLanguage.ItemIndex=0 then
              LabelRemainTime.Caption := 'Оставащо време: '+TimeToStr(Time-IncSecond(Time,SilverWaterRemain)) else //+' num: '+IntToStr(SilverWaterRemain)+' pinter: '+IntToStr(_SilverWaterRemain);
              LabelRemainTime.Caption := 'Remaining time: '+TimeToStr(Time-IncSecond(Time,SilverWaterRemain));

              if (SilverWaterTime=SilverWaterRemain) then
              begin
                RadioGroupCurrentSetPoint.Enabled := True;
                RadioGroupWaterQ.Enabled := True;
                RadioGroupSilverConcentration.Enabled := True;
              end;



                //MemoMainLogEvent.Lines.Add('_SilverWaterOn: '+ IntToStr( _SilverWaterOn)+' DATA: '+IntToStr( _NH_Buff[_CurrentSence])+' CurrentSence: '+IntToStr(CurrentSence));

              if _NH_Buff[_SilverWaterOn]=0 then
              begin
                ButtonStart.Enabled := True;
                ButtonStop.Enabled := False;
                TimerRemaindTime.Enabled := False;
              end else
              begin
                if CurrentSence >= 30 then
                LabelMessage.Visible := False else
                LabelMessage.Visible := True;

                LabelPower.Visible := not LabelMessage.Visible;
                LabelExpectTime.Visible := not LabelMessage.Visible;
                LabelRemainTime.Visible := not LabelMessage.Visible;

                RadioGroupCurrentSetPoint.Enabled := False;
                RadioGroupWaterQ.Enabled := False;
                RadioGroupSilverConcentration.Enabled := False;


                ButtonStart.Enabled := False;
                ButtonStop.Enabled := True;
                TimerRemaindTime.Enabled := True;
              end;
            end;



          end;
        end;



        if Assigned(fSrebarnaVoda) then Exit;
//        if Assigned(fProgram) then Exit;
//        if Assigned(fOptions) then Exit;


        VirtualTableZappers.First;
        if VirtualTableZappers.Locate('MAC', GLB_SHORT_MAC, []) then
        begin
          DBLookupComboBoxZapper.KeyValue := VirtualTableZappers.FieldByName('id').AsInteger;
          LogEvent('Разпознат контролер: '+DBLookupComboBoxZapper.Text);

          if RadioGroupMainLanguage.ItemIndex=0 then
          StatusBar1.Panels[0].Text := 'Модел Запер: '+DBLookupComboBoxZapper.Text else
          StatusBar1.Panels[0].Text := 'Model Zapper: '+DBLookupComboBoxZapper.Text;

//          if LAN_Connection_IP <> '' then
  //        StatusBar1.Panels[5].Text := 'IP: '+LAN_Connection_IP else
          //StatusBar1.Panels[5].Text := 'IP: '+LAN_Connection_IP;


          StatusBar1.Panels[6].Text := 'MAC: '+IntToHex(_read[4],2)+IntToHex(_read[5],2);

          GLB_Power := _NH_Buff[_Power];

          GLB_Freq := _NH_Buff[_Freq];
          GLB_Zumer := _NH_Buff[_Zumer];
          GLB_Sweep := _NH_Buff[_Sweep];
          Move(_NH_Buff[_DurationFrequenceTime], GLB_Duration, 2);


          if RadioGroupMainLanguage.ItemIndex=0 then
          StatusBar1.Panels[9].Text := 'Време на всяка честота: '+IntToStr(GLB_Duration) else
          StatusBar1.Panels[9].Text := 'Time on each frequency: '+IntToStr(GLB_Duration);
           {
          ADOQueryOptions.Edit;
          ADOQueryOptions.FieldByName('MAC').AsString := GLB_FULL_MAC;
          ADOQueryOptions.FieldByName('com_port').AsString := ComboBoxComPorts.Text;
          ADOQueryOptions.Post;  network

          Connected_com_port := VaComm1.DeviceName;
            }
          buf_2b[1]:=_read[7];
          buf_2b[2]:=_read[6];

          Move(buf_2b, sn, 2);
          StatusBar1.Panels[7].Text := 'Serial No: '+IntToStr(sn);
          StatusBar1.Panels[8].Text := 'Firmware: v'+IntToStr(_read[8])+'.'+IntToStr(_read[9]);


          if _Wifi >= 1 then
          begin
            GLB_Wifi := _NH_Buff[_Wifi];
            GLB_Wifi_AP_Time := _NH_Buff[_Wifi_AP];
            GLB_Wifi_AP_NoActTime := _NH_Buff[_Wifi_AP_NoAct];

            PREPARE_BUFF;
            USB_Buffer[1] := 0;
            USB_Buffer[2] := 0;
            USB_Buffer[3] := 26;
            USB_Buffer[4] := 16;

            if Connection_Type = 0 then //0-USB, 1-LAN
            begin
              VaComm1.WriteBuf(USB_Buffer, 4);
              PARSE_BUFF('USB - Заявка за получаване на WiFi мрежа и статус', 4);
            end else
            begin
              SendBufferToLAN(4);
              LAN_PARSE_BUFF('LAN - Заявка за получаване на WiFi мрежа и статус', 4);
            end;



          end else
          begin
            PREPARE_BUFF;
            USB_Buffer[1] := 0;
            USB_Buffer[2] := 0;
            USB_Buffer[3] := 26;
            USB_Buffer[4] := 8;

            if Connection_Type = 0 then //0-USB, 1-LAN
            begin
              VaComm1.WriteBuf(USB_Buffer, 4);
              PARSE_BUFF('USB - Заявка за получаване на записаните програми от запер', 4);
            end else
            begin
              SendBufferToLAN(4);
              LAN_PARSE_BUFF('LAN - Заявка за получаване на записаните програми от запер', 4);
            end;



          end;


          if RadioGroupMainLanguage.ItemIndex=0 then
          Caption := 'NET - Програма SKY Запер v'+FormatFloat('0.00', program_version)+' База данни v'+FormatFloat('0.00', database_version)+' MAC: '+GLB_FULL_MAC+' Потребител: '+LoginName else
          Caption := 'NET - Program SKY Zapper v'+FormatFloat('0.00', program_version)+' Database v'+FormatFloat('0.00', database_version)+' MAC: '+GLB_FULL_MAC+' User: '+LoginName
        end else
        begin
          //Memo1.Lines.Add('Не може да разпознае, версията на Zapper!');
        end;
    end;











    if (_read[0]=2) AND (_read[1]=0) AND (_read[2]=208) then //Error command
    begin
      LogEvent('Грешки: '+IntToStr(max_buffer));

      if Assigned(fOptions) then
      begin
      fOptions.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fOptions.LabelAlert.Caption := DateTimeToStr(Now)+' Възникна грешка при запис.' else
      fOptions.LabelAlert.Caption := DateTimeToStr(Now)+' An error occurred while recording .';
      end;

      if Assigned(fSrebarnaVoda) then
      begin
      fSrebarnaVoda.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fSrebarnaVoda.LabelAlert.Caption := DateTimeToStr(Now)+' Възникна грешка при запис.' else
      fSrebarnaVoda.LabelAlert.Caption := DateTimeToStr(Now)+' An error occurred while recording .';
      fSrebarnaVoda.TimerRemaindTime.Enabled := False;
      end;

      if Assigned(fProgram) then
      begin
      fProgram.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fProgram.LabelAlert.Caption := DateTimeToStr(Now)+' Възникна грешка при запис.' else
      fProgram.LabelAlert.Caption := DateTimeToStr(Now)+' An error occurred while recording .';
      end;

    end;




    if (_read[0]=2) AND (_read[1]=0) AND (_read[2]=144) then //Success command
    begin
      LogEvent('Успешна команда за запис.');

      if Assigned(fOptions) then
      begin
      fOptions.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fOptions.LabelAlert.Caption := DateTimeToStr(Now)+ ' Успешно получена команда.' else
      fOptions.LabelAlert.Caption := DateTimeToStr(Now)+ ' Successfully received command .';
      end;

      if Assigned(fSrebarnaVoda) then
      begin
      fSrebarnaVoda.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fSrebarnaVoda.LabelAlert.Caption := DateTimeToStr(Now)+ ' Успешно получена команда.' else
      fSrebarnaVoda.LabelAlert.Caption := DateTimeToStr(Now)+ ' Successfully received command .';
      end;

      if Assigned(fProgram) then
      begin
      fProgram.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fProgram.LabelAlert.Caption := DateTimeToStr(Now)+ ' Успешно получена команда.' else
      fProgram.LabelAlert.Caption := DateTimeToStr(Now)+ ' Successfully received command .';
      end;

    end;




    if (_read[0] = 2 ) AND (_read[1] = 0) AND (_read[2] = 26) then // ???
    begin

        case _read[3] of
          7:begin
              LogEvent('Изпращане на данни: '+IntToStr(max_buffer));
              Application.ProcessMessages;

              fProgram.ProgressBar1.Position := 0;
              fProgram.ProgressBar1.Max := max_buffer;

              for I := 0 to max_buffer do
              begin
                fProgram.ProgressBar1.Position := i;
                VaComm1.WriteBuf(buff[i], 1);   //da se vidi
                Sleep(AdvEditMS.IntValue);

                Application.ProcessMessages;
              end;

              LogEvent('Приключи изпращането на данни: '+IntToStr(max_buffer));
          end;
          8:begin
              buf_4b[1] := _read[4];
              buf_4b[2] := _read[5];
              buf_4b[3] := _read[6];
              buf_4b[4] := _read[7];

              Move(buf_4b, GLB_CheckBuffer, 4);

              if RadioGroupMainLanguage.ItemIndex=0 then
              begin
                if max_buffer = GLB_CheckBuffer-1 then
                ShowMessage('Програмите са записани успешно.') else
                ShowMessage('Възникна проблем получени са по-малко символи: '+IntToStr(GLB_CheckBuffer)+ ' от '+IntToStr(max_buffer) );
              end else
              begin
                if max_buffer = GLB_CheckBuffer-1 then
                ShowMessage('The programs have been saved successfully .') else
                ShowMessage('There was a problem, fewer characters were received: '+IntToStr(GLB_CheckBuffer)+ ' от '+IntToStr(max_buffer) );
              end;

          end;
          60:begin //function generator ping

          end;
          90,91,92,93,94,95,40,45,46,41,100,101,102,105,106,120:begin
              LogEvent('Message recieve:'+IntToStr(_read[3])+' count: '+IntToStr(length_buffer-1));
              _read[0] := 3; //маркира че го препраща
              SEND_Cloud(_read);

             {if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8030') then
             if (_read[3]=100) then
             begin
                PREPARE_BUFF;
                USB_Buffer[1] := 0;
                USB_Buffer[2] := 0;
                USB_Buffer[3] := 9;
                USB_Buffer[4] := 0;
                USB_Buffer[5] := 255;
                VaComm1.WriteBuf(USB_Buffer, 5);
                PARSE_BUFF('Препрочитане на бързите програми', 5);
             end;
             }



          end;

        end;

    end;



    if (_read[0]=2) AND (_read[1]=0) AND (_read[2]=218) then //Грешка при команда 26
    begin
      ShowMessage('Възникна грешки при запис на програмите!');
    end;

    if (_read[0] = 2) AND (_read[1]=0) AND (_read[2]=154) then //отговора на функция 26
    begin

        if _read[3] = 26 then //Успешно записана програма
        begin
          ButtonCloudFreqClick(nil);
        end;

        if _read[3] = 27 then //успешно записани честоти
        begin
          ButtonCloudStartClick(nil);
        end;




        //LogEvent(' Успешна изпълнена команда!');
        if _read[3] = 50 then
        begin
          fProgram.ButtonSendingBuffer.Click;
          fprogram.MemoDescription.Lines.Add('Успешно изчистване на буфера!');
        end;

        if _read[3] = 51 then
        begin
          if fProgram.AdvEditBlockPos.IntValue >= fProgram.AdvEditBlockMax.IntValue then
          begin
            fProgram.ButtonFinished.Click;
            fprogram.MemoDescription.Lines.Add('Успешно записани прогами!');
          end else
          begin
            fProgram.ButtonSendingBuffer.Click;
            fprogram.MemoDescription.Lines.Add('Успешно записан пакет!');
          end;
        end;

        if _read[3] = 52 then
        begin
          ShowMessage('Приключи успешно записването на персонализирани програми!');
        end;


        case _read[3] of
          6:begin
              LogEvent(' Започна изчистването на паметта');
              Application.ProcessMessages;
          end;
          8:begin
              LogEvent('БРОЙ ЗАПИСАНИ ПРОГРАМИ: '+IntToStr(_read[17]));
              for I := 0 to _read[17]-1 do
              begin
              buf_2b[1] := _read[4+len_settings + len_category + (i * len_disease)];
              buf_2b[2] := _read[4+len_settings + len_category + (i * len_disease)+1];
              Move(buf_2b, tmpProgram, 2);

              case _read[4+len_settings + len_category + (i * len_disease)+4] of
                2:begin
                  if tID1=0 then begin tID1 := tmpProgram; tTEXT1 := GetProgramNameBasic(1, tmpProgram); end else
                  if tID2=0 then begin tID2 := tmpProgram; tTEXT2 := GetProgramNameBasic(2, tmpProgram); end else
                  if tID3=0 then begin tID3 := tmpProgram; tTEXT3 := GetProgramNameBasic(3, tmpProgram); end;
                end;
                3:begin
                  if tID5=0 then begin tID5 := tmpProgram; tTEXT5 := GetProgramNameBasic(5, tmpProgram); end else
                  if tID6=0 then begin tID6 := tmpProgram; tTEXT6 := GetProgramNameBasic(6, tmpProgram); end else
                  if tID7=0 then begin tID7 := tmpProgram; tTEXT7 := GetProgramNameBasic(7, tmpProgram); end;
                end;
                4:begin
                  if tID9=0 then begin tID9 := tmpProgram; tTEXT9 := GetProgramNameBasic(9, tmpProgram); end else
                  if tID10=0 then begin tID10 := tmpProgram; tTEXT10 := GetProgramNameBasic(10, tmpProgram); end else
                  if tID11=0 then begin tID11 := tmpProgram; tTEXT11 := GetProgramNameBasic(11, tmpProgram); end;
                end;
              end;

              LogEvent(IntToStr(i)+' Програми id : '+IntToStr(tmpProgram)+' b1: '+IntToStr(4+len_settings + len_category + (len_disease*i))+' b2: '+IntToStr(4+len_settings + len_category + (len_disease*i)+1));
              end;
          end;
          15:begin //save networks
              if Assigned(fOptions) then
              begin
               with fOptions do
               begin

               vtNetworks.Insert;

               if RadioGroupMainLanguage.ItemIndex=0 then
               begin
                 case _read[4] of
                   0: vtNetworks.FieldByName('status').AsString := 'Не е свързан';
                   1: vtNetworks.FieldByName('status').AsString := 'Прогрес на свързване';
                   2: vtNetworks.FieldByName('status').AsString := 'Свързан';
                 end;
               end else
               begin
                case _read[4] of
                   0: vtNetworks.FieldByName('status').AsString := 'Not connected ';
                   1: vtNetworks.FieldByName('status').AsString := 'Connection progress ';
                   2: vtNetworks.FieldByName('status').AsString := 'Connected';
                 end;

               end;

               if _read[5]=0 then
               vtNetworks.FieldByName('config').AsString := 'DHCP' else
               vtNetworks.FieldByName('config').AsString := 'Static';

               vtNetworks.FieldByName('ip').AsString := IntToStr(_read[6])+'.'+IntToStr(_read[7])+'.'+IntToStr(_read[8])+'.'+IntToStr(_read[9]);
               vtNetworks.FieldByName('netmask').AsString := IntToStr(_read[10])+'.'+IntToStr(_read[11])+'.'+IntToStr(_read[12])+'.'+IntToStr(_read[13]);
               vtNetworks.FieldByName('gateway').AsString := IntToStr(_read[14])+'.'+IntToStr(_read[15])+'.'+IntToStr(_read[16])+'.'+IntToStr(_read[17]);
               vtNetworks.FieldByName('dns1').AsString := IntToStr(_read[18])+'.'+IntToStr(_read[19])+'.'+IntToStr(_read[20])+'.'+IntToStr(_read[21]);
               vtNetworks.FieldByName('dns2').AsString := IntToStr(_read[22])+'.'+IntToStr(_read[23])+'.'+IntToStr(_read[24])+'.'+IntToStr(_read[25]);

               tmpStatus := '';
               for I := 26 to length_buffer-1 do
               begin
                 tmpStatus := tmpStatus + Chr(_read[i]);
                 p := i;
                 if _read[i]=0 then
                 Break;
               end;

               vtNetworks.FieldByName('ssid').AsString := tmpStatus;

               tmpStatus := '';
               for I := p+1 to length_buffer-1 do
               begin
                 tmpStatus := tmpStatus + Chr(_read[i]);
                 if _read[i]=0 then
                 Break;
               end;

               vtNetworks.FieldByName('password').AsString := tmpStatus;
               vtNetworks.Post;

               LogEvent('Получаване на запазени мрежи.')

               end;
              end;
          end;
          16:begin //current Wifi network
              tmpIP := '';
              tmpDB := '';
              tmpStatus := '';

              for I := 27 to length_buffer-1 do
              begin
                 tmpStatus := tmpStatus + Chr(_read[i]);
                 if _read[i]=0 then
                 Break;
              end;
              StatusBar1.Panels[1].Text := 'WiFi Мрежа: '+tmpStatus;

              tmpStatus := '';
              if RadioGroupMainLanguage.ItemIndex=0 then
              begin
                case _read[4] of
                   0: tmpStatus := 'Idle';
                   1: tmpStatus := 'Няма открити мрежи';
                   2: tmpStatus := 'Сканирането приключи';
                   3: tmpStatus := 'Свързан';
                   4: tmpStatus := 'Грешка при свързване';
                   5: tmpStatus := 'Загубена връзка';
                   6: tmpStatus := 'Не е свързан';
                end;
                StatusBar1.Panels[2].Text := 'WiFi Статус: '+tmpStatus;
              end else
              begin
                case _read[4] of
                   0: tmpStatus := 'Idle';
                   1: tmpStatus := 'No SSID available';
                   2: tmpStatus := 'Scan compleated';
                   3: tmpStatus := 'Connected';
                   4: tmpStatus := 'Connect failed';
                   5: tmpStatus := 'Connection lost';
                   6: tmpStatus := 'Disconnected';
                end;
                StatusBar1.Panels[2].Text := 'WiFi status: '+tmpStatus;
              end;

              Move(_read[25], tmpRSSI, 2);
              tmpIP := IntToStr(_read[5])+'.'+IntToStr(_read[6])+'.'+IntToStr(_read[7])+'.'+IntToStr(_read[8]);
              if _read[4]=3 then
              begin
              StatusBar1.Panels[3].Text := 'WiFi IP: '+tmpIP;
              StatusBar1.Panels[4].Text := 'WiFi dB: '+IntToStr(tmpRSSI);
              end else
              begin
              StatusBar1.Panels[3].Text := 'WiFi IP: ';
              StatusBar1.Panels[4].Text := 'WiFi dB: ';
              end;

              if Assigned(fOptions) then
              begin
              with fOptions do
              begin
               MemoIP.Lines.Clear;
               MemoIP.Lines.Add('Local IP: '+tmpIP);
               MemoIP.Lines.Add('Subnet: '+IntToStr(_read[9])+'.'+IntToStr(_read[10])+'.'+IntToStr(_read[11])+'.'+IntToStr(_read[12]));
               MemoIP.Lines.Add('Geteway: '+IntToStr(_read[13])+'.'+IntToStr(_read[14])+'.'+IntToStr(_read[15])+'.'+IntToStr(_read[16]));
               MemoIP.Lines.Add('DNS 1: '+IntToStr(_read[17])+'.'+IntToStr(_read[18])+'.'+IntToStr(_read[19])+'.'+IntToStr(_read[20]));
               MemoIP.Lines.Add('DNS 2: '+IntToStr(_read[21])+'.'+IntToStr(_read[22])+'.'+IntToStr(_read[23])+'.'+IntToStr(_read[24]));
              end;
              end;

              LogEvent('Получаване на текущи мрежи в обхват.');
          end;
          17:begin //Изчитане на мрежите
             if Assigned(fOptions) then
             begin
               with fOptions do
               begin
                 tmpWifi := '';
                 //cbb1.Text := '';

                 for I := 4 to length_buffer do
                 begin
                   tmpWifi := tmpWifi + Chr(_read[i]);
                 end;

                 //vtMreji.Clear;
                 ComboBoxcbb1_1.Clear;

                 if RadioGroupMainLanguage.ItemIndex=0 then
                 LabelWiFiNetworks.Caption := 'Моля, изберете мрежа' else
                 LabelWiFiNetworks.Caption := 'Please select a network ';

                 ComboBoxcbb1_1.Items.Text := tmpWifi;

                 for I := 0 to ComboBoxcbb1_1.Items.Count-1 do
                 begin
                 vtMreji.Insert;
                 vtMreji.FieldByName('name').AsString := ComboBoxcbb1_1.Items.Strings[i];
                 vtMreji.Post;
                 end;

                 LogEvent('Моля, изберете мрежа.')
               end;
             end;
          end;
          20:begin
              if Assigned(fOptions) then
              begin
                fOptions.RadioGroupHotspot.ItemIndex := _read[4];
                LogEvent('Получена настройка за Hotspot: '+IntToStr(_read[4]));
              end;
          end;
          25:begin //get IDs programs
              sn := (length_buffer-8) div 2;
              for I := 0 to sn-1 do
              begin
                 // buf_2b[1] := _read[4 + (i * 2)];
                 // buf_2b[2] := _read[4 + (i * 2)]+1;
                 // LogEvent(IntToStr(buf_2b[1])+'    '+IntToStr(buf_2b[2]));
                 // Move(buf_2b, tmpProgram, 2);

                Move(_read[4 + (i * 2)], tmpProgram, 2);
                if ListBoxProgramIDs.Items.IndexOf(IntToStr(tmpProgram)) = -1 then
                ListBoxProgramIDs.Items.Add(IntToStr(tmpProgram));
              end;
          end;
          26:begin //get IDs categories
              sn := (length_buffer-8) div 2;
              for I := 0 to sn-1 do
              begin
                 Move(_read[4 + (i * 2)], tmpProgram, 2);
                if ListBoxCategoriesIDs.Items.IndexOf(IntToStr(tmpProgram)) = -1 then
                ListBoxCategoriesIDs.Items.Add(IntToStr(tmpProgram));
              end;
          end;


        end;

    end;

  end;

end;


function check(tmpNum : Integer):Boolean;
begin
with fMain do
begin
  ADOQuerySQL.SQL.Text := 'SELECT * FROM diseases WHERE favorite='+IntToStr(tmpNum);
  ADOQuerySQL.Open;
  if ADOQuerySQL.RecordCount >= 3 then
  Result := False else
  Result := True;
end;
end;

procedure TfMain.MenuItem2Click(Sender: TObject);
begin

if check_freq_count(ADOQueryDiseases.FieldByName('id').AsString) = 0 then
begin
  ShowMessage('Не можете да добавите програма без честоти в "БЪРЗО НАБИРАНЕ"!');
  Exit;
end;

//Тази програма ще бъде премахната от "БЪРЗО НАБИРАНЕ", понеже не съдържа честоти!



if check(2)=false then
begin
  ShowMessage('Не можете да вкарате повече от три програми с червен цвят.');
  Exit;
end;

ADOQueryDiseases.Edit;
ADOQueryDiseases.FieldByName('favorite').AsInteger := 2;
ADOQueryDiseases.Post;
end;

procedure TfMain.MenuItemBLUE1Click(Sender: TObject);
begin
    set_button_program(9,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemBLUE2Click(Sender: TObject);
begin
    set_button_program(10,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemBLUE3Click(Sender: TObject);
begin
    set_button_program(11,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemBLUE4Click(Sender: TObject);
begin
    set_button_program(12,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemGREEN1Click(Sender: TObject);
begin
    set_button_program(5,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemGREEN2Click(Sender: TObject);
begin
    set_button_program(6,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemGREEN3Click(Sender: TObject);
begin
    set_button_program(7,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemGREEN4Click(Sender: TObject);
begin
    set_button_program(8,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemRED1Click(Sender: TObject);
begin
    set_button_program(1,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemRED2Click(Sender: TObject);
begin
    set_button_program(2,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemRED3Click(Sender: TObject);
begin
    set_button_program(3,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemRED4Click(Sender: TObject);
begin
    set_button_program(4,
                       1, //ADOQueryDiseases.FieldByName('category_id').AsInteger,
                       ADOQueryDiseases.FieldByName('id').AsInteger
                       );
end;

procedure TfMain.MenuItemRemoveAllClick(Sender: TObject);
begin
    remove_all;
end;

procedure TfMain.RadioGroupMainLanguageClick(Sender: TObject);
begin

  if RadioGroupMainLanguage.ItemIndex=0 then
  Caption := 'Програма SKY Запер версия: '+FormatFloat('0.00', program_version)+' База данни версия: '+FormatFloat('0.00', database_version) else
  Caption := 'Program SKY Zapper version: '+FormatFloat('0.00', program_version)+' Database version: '+FormatFloat('0.00', database_version);



  if RadioGroupMainLanguage.ItemIndex=0 then
  begin
    AdvToolBarPagerPrograms.Caption := 'ПРОГРАМИ';
    AdvToolBarPagerSilverWater.Caption := 'СРЕБЪРНА ВОДА';
    AdvToolBarPagerOptions.Caption := 'НАСТРОЙКИ';
    AdvToolBarPagerLanguage.Caption := 'LANGUAGE';
    AdvToolBarPagerUsers.Caption := 'ПОТРЕБИТЕЛИ';

    AdvToolBarPrograms.Caption := 'ПРОГРАМИ';
    AdvToolBarSilverWater.Caption := 'СРЕБЪРНА ВОДА';
    AdvToolBarEditor.Caption := 'ПЕРСОНАЛИЗИРАНЕ'; //    AdvToolBarPersonalList.Caption := 'ПЕРСОНАЛНИ СПИСЪЦИ'; // OTPADA
    AdvToolBarOptions.Caption := 'НАСТРОЙКИ';
    AdvToolBarUpdate.Caption := 'ОБНОВЯВАНЕ';
    AdvToolBarRemoteAccess.Caption := 'ДИСТАНЦИОННА ПОМОЩ';
    AdvToolBarConnection.Caption := 'ИЗБОР НА ЗАПЕР';
    AdvToolBarLanguegeBG.Caption := 'БЪЛГАРСКИ';
    AdvToolBarLanguageEN.Caption := 'ENGLISH';
    AdvToolBarChangeUsers.Caption := 'СМЯНА НА ПОТРЕБИТЕЛ';
    AdvToolBarChangePassword.Caption := 'СМЯНА НА ПАРОЛА';
    AdvToolBarUsers.Caption := 'ПОТРЕБИТЕЛИ';

  end else
  begin
    AdvToolBarPagerPrograms.Caption := 'PROGRAMS';
    AdvToolBarPagerSilverWater.Caption := 'SILVER WATER';
    AdvToolBarPagerOptions.Caption := 'OPTIONS';
    AdvToolBarPagerLanguage.Caption := 'LANGUAGE';
    AdvToolBarPagerUsers.Caption := 'USERS';

    AdvToolBarPrograms.Caption := 'PROGRAMS';
    AdvToolBarSilverWater.Caption := 'SILVER WATER';
    AdvToolBarEditor.Caption := 'PERSONALIZATION'; //    AdvToolBarPersonalList.Caption := 'PERSONAL LISTS'; //OTPADA
    AdvToolBarOptions.Caption := 'OPTIONS';
    AdvToolBarUpdate.Caption := 'UPDATE';
    AdvToolBarRemoteAccess.Caption := 'REMOTE ASSISTANCE';
    AdvToolBarConnection.Caption := 'CHOOSE A ZAPPER';
    AdvToolBarLanguegeBG.Caption := 'БЪЛГАРСКИ';
    AdvToolBarLanguageEN.Caption := 'ENGLISH';
    AdvToolBarChangeUsers.Caption := 'CHANGE USER';
    AdvToolBarChangePassword.Caption := 'CHANGE PASSWORD';
    AdvToolBarUsers.Caption := 'USERS';

  end;

  if Assigned(fProgram) then
  begin
  fProgram.RadioGroupLanguage.ItemIndex := RadioGroupMainLanguage.ItemIndex;
  fProgram.RadioGroupLanguageClick(nil);
  end;

  if Assigned(fSrebarnaVoda) then
  begin
  fSrebarnaVoda.RadioGroupLanguage.ItemIndex := RadioGroupMainLanguage.ItemIndex;
  fSrebarnaVoda.RadioGroupLanguageClick(nil);
  end;

  if Assigned(fCustomGroups) then
  begin
  fCustomGroups.RadioGroupLanguage.ItemIndex := RadioGroupMainLanguage.ItemIndex;
  fCustomGroups.RadioGroupLanguageClick(nil);
  end;

  if Assigned(fEdit) then
  begin
  fEdit.RadioGroupLanguage.ItemIndex := RadioGroupMainLanguage.ItemIndex;
  fEdit.RadioGroupLanguageClick(nil);
  end;

  if Assigned(fOptions) then
  begin
  fOptions.RadioGroupLanguage.ItemIndex := RadioGroupMainLanguage.ItemIndex;
  fOptions.RadioGroupLanguageClick(nil);
  end;

  if Assigned(fUpdateSoftware) then
  begin
  fUpdateSoftware.RadioGroupLanguage.ItemIndex := RadioGroupMainLanguage.ItemIndex;
  fUpdateSoftware.RadioGroupLanguageClick(nil);
  end;


end;

procedure TfMain.N1Click(Sender: TObject);
var
a:Word;
b1,b2:Byte;
begin

  if check_freq_count(ADOQueryDiseases.FieldByName('id').AsString) = 0 then
  begin
    ShowMessage('Не можете да добавите програма без честоти в "БЪРЗО НАБИРАНЕ"!');
    Exit;
  end;

  ADOQueryDiseases.Edit;
  ADOQueryDiseases.FieldByName('favorite').AsInteger := 1;
  ADOQueryDiseases.Post;

  a := ADOQueryDiseases.FieldByName('id').AsInteger;
  b1 := byte(a);
  b2 := byte(a shr 8);
  SEND_Cloud([3, 0, 26, 101, b1, b2, 1, 3, m_b1, m_b2, m_b3, m_b4]);

end;

procedure TfMain.N2Click(Sender: TObject);
var
a:Word;
b1,b2:Byte;
begin
  ADOQueryDiseases.Edit;
  ADOQueryDiseases.FieldByName('favorite').Clear;
  ADOQueryDiseases.Post;

  a := ADOQueryDiseases.FieldByName('id').AsInteger;
  b1 := byte(a);
  b2 := byte(a shr 8);
  SEND_Cloud([3, 0, 26, 101, b1, b2, 0, 3, m_b1, m_b2, m_b3, m_b4]);
end;

procedure TfMain.N3Click(Sender: TObject);
begin

if check_freq_count(ADOQueryDiseases.FieldByName('id').AsString) = 0 then
begin
  ShowMessage('Не можете да добавите програма без честоти в "БЪРЗО НАБИРАНЕ"!');
  Exit;
end;

if check(4)=false then
begin
  ShowMessage('Не можете да вкарате повече от три програми със син цвят.');
  Exit;
end;

ADOQueryDiseases.Edit;
ADOQueryDiseases.FieldByName('favorite').AsInteger := 4;
ADOQueryDiseases.Post;
end;

procedure TfMain.N4Click(Sender: TObject);
begin

if check_freq_count(ADOQueryDiseases.FieldByName('id').AsString) = 0 then
begin
  ShowMessage('Не можете да добавите програма без честоти в "БЪРЗО НАБИРАНЕ"!');
  Exit;
end;

if check(3)=false then
begin
  ShowMessage('Не можете да вкарате повече от три програми със зелен цвят.');
  Exit;
end;

ADOQueryDiseases.Edit;
ADOQueryDiseases.FieldByName('favorite').AsInteger := 3;
ADOQueryDiseases.Post;
end;

procedure TfMain.TimerCheck_ConnectionsTimer(Sender: TObject);
var
  _COM_Port : string;

begin


 // Exit;

  if Connection_Type <> -1 then
  begin

    StatusBar1.Panels[10].Text := 'Онлайн: '+TimeToStr(TimeOf(LastPacketPing));

    if SecondsBetween(Now, LastPacketPing) >= 20 then
    begin
      StatusBar1.Color := clRed;
      StatusBar1.Panels[0].Text := 'НЯМА ВРЪЗКА';
      StatusBar1.Panels[1].Text := '';
      StatusBar1.Panels[2].Text := '';
      StatusBar1.Panels[3].Text := '';
      StatusBar1.Panels[4].Text := '';
      StatusBar1.Panels[5].Text := '';
      StatusBar1.Panels[6].Text := '';
      StatusBar1.Panels[7].Text := '';
      StatusBar1.Panels[8].Text := '';
      StatusBar1.Panels[9].Text := '';
      StatusBar1.Panels[10].Text := '';

      if Assigned(fProgram) then fProgram.Close;
      if Assigned(fSrebarnaVoda) then fSrebarnaVoda.Close;
      if Assigned(fCustomGroups) then fCustomGroups.Close;
      if Assigned(fOptions) then fOptions.Close;



    end else
    begin

      if StatusBar1.Color = clRed then
      begin
        sendReadAll_Network(VirtualTableLAN_Zappers.FieldByName('IP').AsString);
        StatusBar1.Panels[5].Text := 'IP: '+VirtualTableLAN_Zappers.FieldByName('IP').AsString;
      end;

      StatusBar1.Color := clSkyBlue;


    end;

  end;



  if RadioGroupTypeConnections.ItemIndex = 0 then //USB Connection
  begin

    try
      Memo1.Lines.Add('USB connection test');
      _COM_Port := ComboBoxComPorts.Text;
      VaComm1.Close;
      VaComm1.Baudrate := TVaBaudrate.Br9600;
      VaComm1.DeviceName := _COM_Port;
      VaComm1.Open;

      PREPARE_BUFF;

      USB_Buffer[1] := 0;
      USB_Buffer[2] := 0;
      USB_Buffer[3] := 26;
      USB_Buffer[4] := 60;

      VaComm1.WriteBuf(USB_Buffer, 4);
      PARSE_BUFF('Check connection USB: ' + _COM_Port, 4);

    except on e:Exception do
      Caption := e.Message;
    end;


  end;


  if RadioGroupTypeConnections.ItemIndex = 1 then //LAN Connection
  begin

    try
      Memo1.Lines.Add('LAN connection test');
      USB_Buffer[1] := 0;
      USB_Buffer[2] := 0;
      USB_Buffer[3] := 26;
      USB_Buffer[4] := 60;
      USB_Buffer[5] := 0;
      USB_Buffer[6] := 0;
      SendBufferToLAN(7);
      LAN_PARSE_BUFF('Check connection LAN: '+LAN_Connection_IP, 7);
    except on e:Exception do
      Caption := e.Message;
    end;

  end;

end;

procedure TfMain.TimerSearchTimer(Sender: TObject);
begin

  TimerSearch.Enabled := False;

  if LAST_NETWORK_IP = '' then
  begin
    //Търсене по комп порт
    ButtonSearchZapperUSBCableClick(self);
  end;


  if (LAST_COM_PORT <> '') AND (VirtualTableUSB_Zappers.RecordCount >= 1) then
  begin
   // ShowMessage('Пропускане на търсене по мрежа!');
  end else
  begin
    //търсене по мрежа
    ButtonSearchZappersNetworkClick(self);
  end;



  if (VirtualTableUSB_Zappers.RecordCount = 1) AND (VirtualTableLAN_Zappers.RecordCount = 1) then
  begin

     if VirtualTableUSB_Zappers.FieldByName('MAC').AsString = VirtualTableLAN_Zappers.FieldByName('MAC').AsString then
     begin
       ButtonUSE_CableClick(Self);
     end;

  end else
  begin







    if (VirtualTableUSB_Zappers.RecordCount = 1) then ButtonUSE_CableClick(Self);
    if (VirtualTableLAN_Zappers.RecordCount = 1) then ButtonUSE_NetworkClick(Self);

    if ((VirtualTableUSB_Zappers.RecordCount = 0) AND (VirtualTableLAN_Zappers.RecordCount = 0)) then
    begin
        GroupBoxNetworkConnections.Visible := False;
        GroupBoxUSBConnections.Visible := False;


        LabelMessage.Caption := 'Програмата не открива включен Запер!';
        Application.ProcessMessages;
        Sleep(2000);
        LabelMessage.Caption := '';

    end;

  end;


end;

procedure TfMain.VaComm1RxChar(Sender: TObject; Count: Integer);
var
  tmp: ansichar;
  i,p,max : integer;

  sn : Int16;
  buf_2b : array [1..2] of Byte;
  buf_4b : array [1..4] of Byte;

  _NH_Buff : TIdBytes;
  _read : TIdBytes;
  WaterQ, CurrentSence : Word;
  SilverWaterTime, SilverWaterRemain:Integer;
  tmpFreq,
  tmpCategory,
  tmpProgram,
  tmpFreqVar :Word;

  tmpWifi, tmpIP, tmpDB, tmpStatus:string;
  tmpRSSI :  SmallInt;
  begin
    Application.ProcessMessages;
    LastPacketPing := Now;

    dt1 := Now;
    SetLength(_NH_Buff, Count);
    SetLength(_read, Count);
    for i := 0 to Count-1 do _read[i] := 0;
    for i := 0 to Count-1 do _NH_Buff[i] := 0;

    for i := 0 to Count-1 do
    begin
      if VaComm1.ReadChar(tmp) then
      begin
        _read[i] := Ord(tmp);
        if i >= 4 then _NH_Buff[i-4] := Ord(tmp);
      end;
    end;

    if (_read[2]=26) AND (_read[3]=60) then
    begin

    end else
    begin
      LogRX('');
      LogRX('USB Данни: '+IntToStr(Count-1)+' бр. време '+IntToStr(MilliSecondsBetween(Now, dt1))+' ms');

//      for i := 0 to Count-1 do LogRX('No: '+IntToStr(i-4)+ ' Byte: '+IntToStr(_read[i])+' Hex: '+IntToHex(_read[i], 2)+' Char: '+chr(_read[i]));

      if CheckBoxDescriptor.Checked = False then
      begin
        for i := 0 to Count-1 do LogRX('No: '+IntToStr(i-4)+ ' Byte: '+IntToStr(_read[i])+' Hex: '+IntToHex(_read[i], 2)  + isCharacters(_read[i]) + Descriptor(i) );
      end else
      begin
        for i := 0 to Count-1 do LogRX('*No: '+IntToStr(i)+ ' Byte: '+IntToStr(_NH_Buff[i])+' Hex: '+IntToHex(_NH_Buff[i], 2)  + isCharacters(_NH_Buff[i]) + Descriptor(i) );
      end;


      LogRX('USB Преглед: '+IntToStr(Count-1)+' бр. време '+IntToStr(MilliSecondsBetween(Now, dt1))+' ms');
     //fMain.Caption := 'Преглед: '+IntToStr(Count-1)+' бр. време '+IntToStr(MilliSecondsBetween(Now, dt1))+' ms';
    end;

    if (VaComm1.Baudrate = TVaBaudrate.br57600) AND (_read[0]=49) AND (_read[1]=48) then
    begin
      firmware_flash := 1;
      LogEvent('Намерен е порт за програмиране');
    end;

//======================================================================


    if (_read[0]=0) AND (_read[1]=0) AND (_read[2]=137) AND (_read[3]=0) then  //отговора на 9 за всички настройки
    begin
        GLB_SHORT_MAC := IntToHex(_read[4],2)+IntToHex(_read[5],2);
        GLB_FULL_MAC := IntToHex(_read[4],2)+IntToHex(_read[5],2)+IntToHex(_read[6],2)+IntToHex(_read[7],2);
        M_b1 := _read[4];
        M_b2 := _read[5];
        M_b3 := _read[6];
        M_b4 := _read[7];
        _pass := chr(_read[10]) + chr(_read[11]) + chr(_read[12]) + chr(_read[13]) + chr(_read[14]) + chr(_read[15]);


        if VirtualTableUSB_Zappers.Locate('MAC', GLB_FULL_MAC, []) = False then
        begin
          VirtualTableUSB_Zappers.Insert;
          VirtualTableUSB_Zappers.FieldByName('MAC').AsString := GLB_FULL_MAC;
          VirtualTableUSB_Zappers.FieldByName('IP').AsString := VaComm1.DeviceName;
          VirtualTableUSB_Zappers.Post;



          //MemoMainLogEvent.Lines.Add(IntToStr(length_buffer)+' Намерен е запер в мрежата: '+GLB_FULL_MAC);
        end;

        if GroupBoxUSBConnections.Visible then Exit;

        if (GLB_SHORT_MAC = '8030') OR   // 8030 - Zapper WiFi
           (GLB_SHORT_MAC = '8031') OR   // 8031 - Zapper WiFi + SilverWater
           (GLB_SHORT_MAC = '8041') OR   // 8041 - Zapper Rev 1 + Silver
           (GLB_SHORT_MAC = '8042') then // 8042 - Zapper Rev 2 + Silver
        begin
            _Power := 54;
            _DurationFrequenceTime := 55;
            _Zumer := 58;
            _Sweep := 59;
            _Wifi := 122;
            _Wifi_AP := 123;
            _Wifi_AP_NoAct := 124;
            _SilverWaterStartByte := 126;
            _CurrentSetPoint := 126;
            _WaterQuantity := 127;
            _SilverConcentration := 129;

            if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8041') OR (GLB_SHORT_MAC = '8042') then
            _SilverWaterOn := 132;

            _CurrentSence := 133;
            _SilverWatterTime := 135;
            _SilverWaterRemain := 139;

            Move(_NH_Buff[73], tmpCategory, 2);    Move(_NH_Buff[75], tmpProgram, 2);   if tID1 <> tmpProgram then begin tID1 := tmpProgram; tTEXT1 := GetProgramNameWiFi(1, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[77], tmpCategory, 2);    Move(_NH_Buff[79], tmpProgram, 2);   if tID2 <> tmpProgram then begin tID2 := tmpProgram; tTEXT2 := GetProgramNameWiFi(2, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[81], tmpCategory, 2);    Move(_NH_Buff[83], tmpProgram, 2);   if tID3 <> tmpProgram then begin tID3 := tmpProgram; tTEXT3 := GetProgramNameWiFi(3, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[85], tmpCategory, 2);    Move(_NH_Buff[87], tmpProgram, 2);   if tID4 <> tmpProgram then begin tID4 := tmpProgram; tTEXT4 := GetProgramNameWiFi(4, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[89], tmpCategory, 2);    Move(_NH_Buff[91], tmpProgram, 2);   if tID5 <> tmpProgram then begin tID5 := tmpProgram; tTEXT5 := GetProgramNameWiFi(5, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[93], tmpCategory, 2);    Move(_NH_Buff[95], tmpProgram, 2);   if tID6 <> tmpProgram then begin tID6 := tmpProgram; tTEXT6 := GetProgramNameWiFi(6, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[97], tmpCategory, 2);    Move(_NH_Buff[99], tmpProgram, 2);   if tID7 <> tmpProgram then begin tID7 := tmpProgram; tTEXT7 := GetProgramNameWiFi(7, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[101], tmpCategory, 2);  Move(_NH_Buff[103], tmpProgram, 2);   if tID8 <> tmpProgram then begin tID8 := tmpProgram; tTEXT8 := GetProgramNameWiFi(8, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[105], tmpCategory, 2);  Move(_NH_Buff[107], tmpProgram, 2);   if tID9 <> tmpProgram then begin tID9 := tmpProgram; tTEXT9 := GetProgramNameWiFi(9, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[109], tmpCategory, 2);  Move(_NH_Buff[111], tmpProgram, 2);   if tID10 <> tmpProgram then begin tID10 := tmpProgram; tTEXT10 := GetProgramNameWiFi(10, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[113], tmpCategory, 2);  Move(_NH_Buff[115], tmpProgram, 2);   if tID11 <> tmpProgram then begin tID11 := tmpProgram; tTEXT11 := GetProgramNameWiFi(11, tmpCategory, tmpProgram); end;
            Move(_NH_Buff[117], tmpCategory, 2);  Move(_NH_Buff[119], tmpProgram, 2);   if tID12 <> tmpProgram then begin tID12 := tmpProgram; tTEXT12 := GetProgramNameWiFi(12, tmpCategory, tmpProgram); end;


            _FactoryPIN := '';
            _AdditionalPIN := '';
            for I := 6 to 17 do
            begin

              if (_NH_Buff[i]<>0) then
              begin

                if (i <= 11) then
                _FactoryPIN := _FactoryPIN + chr(_NH_Buff[i]) else
                _AdditionalPIN := _AdditionalPIN + chr(_NH_Buff[i]);

              end;

            end;


            _cloud_service := '';
            for I := 18 to 47 do
            begin
              if (_NH_Buff[i]<>0) then
              _cloud_service := _cloud_service + chr(_NH_Buff[i]);
            end;

            Move(_NH_Buff[i], uniWord1, 2);
            _cloud_port := IntToStr(uniWord1);

            if uniWord1 <> defualt_cloud_port then
            begin
              ShowMessage('ПРОМЯНА НА ПОРТА ЗА КЛАУД УСЛУГАТА ОТ: '+_cloud_port+' НА 7433');

              PREPARE_BUFF;
              USB_Buffer[1] := 0;
              USB_Buffer[2] := 0;
              USB_Buffer[3] := 16;
              USB_Buffer[4] := 48;
              USB_Buffer[5] := byte(defualt_cloud_port);
              USB_Buffer[6] := byte(defualt_cloud_port shr 8);

              _cloud_port := IntToStr(defualt_cloud_port);

              VaComm1.WriteBuf(USB_Buffer, 6);
              PARSE_BUFF('Смяна на cloud port', 6);

            end;


            if _cloud_service <> 'cloud.sky.bg' then //  if (Pos('cloud.skyzapper.bg', _cloud_service) >= 1) OR (Pos('cloud.zapper.sky.bg', _cloud_service) >= 1) then
            begin
              ShowMessage('ПРОМЯНА НА URL АДРЕСА ЗА CLOUD УСЛУГАТА!'+#13+'Ноивият адрес: cloud.sky.bg');

              _new_service := 'cloud.sky.bg';
              _cloud_service := _new_service;

              PREPARE_BUFF;
              USB_Buffer[1] := 0;
              USB_Buffer[2] := 0;
              USB_Buffer[3] := 16;
              USB_Buffer[4] := 18;

              for i := 1 to 29 do
              begin

                if i <= Length(_new_service) then
                USB_Buffer[4+i] := ord(_new_service[i]) else
                USB_Buffer[4+i] := 0;
              end;


              //max := 4 + Length(_new_service) + 1;
              max := 4 + 29 + 1;
              USB_Buffer[max] := 0;

              VaComm1.WriteBuf(USB_Buffer, max);
              PARSE_BUFF('Смяна на cloud service', max);
            end;

        end;


        if (GLB_SHORT_MAC = '8011') OR (GLB_SHORT_MAC = '8012') OR (GLB_SHORT_MAC = '8040') then //8011-Zapper Basic,  8012-Zapper Basic + SilverWater
        begin
          _Power := 10;
          _DurationFrequenceTime := 11;
          _Zumer := 14;
          _Sweep := 15;
          _Wifi := 0;
          _Wifi_AP := 0;
          _Wifi_AP_NoAct := 0;
          _SilverWaterStartByte := 29;
          _CurrentSetPoint := 29;
          _WaterQuantity := 30;
          _SilverConcentration := 32;
          _SilverWaterOn := 34;
          _CurrentSence := 35;
          _SilverWatterTime := 37;
          _SilverWaterRemain := 41;
        end;




        // USB
        if Assigned(fOptions) then
        begin
          with fOptions do
          begin



           if (GLB_SHORT_MAC = '8030') OR   // 8030 - Zapper WiFi
              (GLB_SHORT_MAC = '8031') OR   // 8031 - Zapper WiFi + SilverWater
              (GLB_SHORT_MAC = '8041') OR   // 8041 - Zapper Rev 1 + Silver
              (GLB_SHORT_MAC = '8042') then // 8042 - Zapper Rev 2 + Silver
            begin

              if RadioGroupMainLanguage.ItemIndex=0 then
              MemoLogPower.Lines.Add('Настройки на мощността') else
              MemoLogPower.Lines.Add('Power settings');

              Move(_NH_Buff[60], tmpFreq, 2);
              if tmpFreq=0 then
              begin
                if RadioGroupMainLanguage.ItemIndex=0 then
                MemoLogPower.Lines.Add('Всички честоти са на 100% мощност') else
                MemoLogPower.Lines.Add('All frequencies are at 100% power');
              end else
              begin
                if RadioGroupMainLanguage.ItemIndex=0 then
                begin
                  if tmpFreq > 100 then begin MemoLogPower.Lines.Add('Честоти от 1 до 100 херца '+IntToStr(_NH_Buff[72])+'% мощност'); tmpFreqVar := 100; end;
                  if tmpFreq > 200 then begin MemoLogPower.Lines.Add('Честоти от 101 до 200 херца '+IntToStr(_NH_Buff[71])+'% мощност'); tmpFreqVar := 200; end;
                  if tmpFreq > 300 then begin MemoLogPower.Lines.Add('Честоти от 201 до 300 херца '+IntToStr(_NH_Buff[70])+'% мощност'); tmpFreqVar := 300; end;
                  if tmpFreq > 400 then begin MemoLogPower.Lines.Add('Честоти от 301 до 400 херца '+IntToStr(_NH_Buff[69])+'% мощност'); tmpFreqVar := 400; end;
                  if tmpFreq > 500 then begin MemoLogPower.Lines.Add('Честоти от 401 до 500 херца '+IntToStr(_NH_Buff[68])+'% мощност'); tmpFreqVar := 500; end;
                  if tmpFreq > 600 then begin MemoLogPower.Lines.Add('Честоти от 501 до 600 херца '+IntToStr(_NH_Buff[67])+'% мощност'); tmpFreqVar := 600; end;
                  if tmpFreq > 700 then begin MemoLogPower.Lines.Add('Честоти от 601 до 700 херца '+IntToStr(_NH_Buff[66])+'% мощност'); tmpFreqVar := 700; end;
                  if tmpFreq > 800 then begin MemoLogPower.Lines.Add('Честоти от 701 до 800 херца '+IntToStr(_NH_Buff[65])+'% мощност'); tmpFreqVar := 800; end;
                  if tmpFreq > 900 then begin MemoLogPower.Lines.Add('Честоти от 801 до 900 херца '+IntToStr(_NH_Buff[64])+'% мощност'); tmpFreqVar := 900; end;
                  if tmpFreq > 1000 then begin MemoLogPower.Lines.Add('Честоти от 901 до 1000 херца '+IntToStr(_NH_Buff[63])+'% мощност'); tmpFreqVar := 1000; end;
                  if (tmpFreq > 1000) then
                  begin
                  MemoLogPower.Lines.Add('Честоти от '+IntToStr(tmpFreqVar)+' до '+IntToStr(tmpFreq)+' херца '+IntToStr(_NH_Buff[62])+'% мощност');
                  MemoLogPower.Lines.Add('Честоти над '+IntToStr(tmpFreq)+' херца 100% мощност');
                  end;
                end else
                begin
                  if tmpFreq > 100 then begin MemoLogPower.Lines.Add('Frequencies from 1 to 100 hertz '+IntToStr(_NH_Buff[72])+'% power'); tmpFreqVar := 100; end;
                  if tmpFreq > 200 then begin MemoLogPower.Lines.Add('Frequencies from 101 to 200 hertz '+IntToStr(_NH_Buff[71])+'% power'); tmpFreqVar := 200; end;
                  if tmpFreq > 300 then begin MemoLogPower.Lines.Add('Frequencies from 201 to 300 hertz '+IntToStr(_NH_Buff[70])+'% power'); tmpFreqVar := 300; end;
                  if tmpFreq > 400 then begin MemoLogPower.Lines.Add('Frequencies from 301 to 400 hertz '+IntToStr(_NH_Buff[69])+'% power'); tmpFreqVar := 400; end;
                  if tmpFreq > 500 then begin MemoLogPower.Lines.Add('Frequencies from 401 to 500 hertz '+IntToStr(_NH_Buff[68])+'% power'); tmpFreqVar := 500; end;
                  if tmpFreq > 600 then begin MemoLogPower.Lines.Add('Frequencies from 501 to 600 hertz '+IntToStr(_NH_Buff[67])+'% power'); tmpFreqVar := 600; end;
                  if tmpFreq > 700 then begin MemoLogPower.Lines.Add('Frequencies from 601 to 700 hertz '+IntToStr(_NH_Buff[66])+'% power'); tmpFreqVar := 700; end;
                  if tmpFreq > 800 then begin MemoLogPower.Lines.Add('Frequencies from 701 to 800 hertz '+IntToStr(_NH_Buff[65])+'% power'); tmpFreqVar := 800; end;
                  if tmpFreq > 900 then begin MemoLogPower.Lines.Add('Frequencies from 801 to 900 hertz '+IntToStr(_NH_Buff[64])+'% power'); tmpFreqVar := 900; end;
                  if tmpFreq > 1000 then begin MemoLogPower.Lines.Add('Frequencies from 901 to 1000 hertz '+IntToStr(_NH_Buff[63])+'% power'); tmpFreqVar := 1000; end;
                  if (tmpFreq > 1000) then
                  begin
                  MemoLogPower.Lines.Add('Frequencies from '+IntToStr(tmpFreqVar)+' to '+IntToStr(tmpFreq)+' hertz '+IntToStr(_NH_Buff[62])+'% power');
                  MemoLogPower.Lines.Add('Frequencies above '+IntToStr(tmpFreq)+' hertz 100% power');
                  end;
                end;
              end;
            end;

            if (GLB_SHORT_MAC = '8011') OR (GLB_SHORT_MAC = '8012') OR (GLB_SHORT_MAC = '8040') then
            begin

              if RadioGroupMainLanguage.ItemIndex=0 then
              MemoLogPower.Lines.Add('Настройки на мощността') else
              MemoLogPower.Lines.Add('Power settings');

              Move(_NH_Buff[16], tmpFreq, 2);
              if tmpFreq=0 then
              begin
                if RadioGroupMainLanguage.ItemIndex=0 then
                MemoLogPower.Lines.Add('Всички честоти са на 100% мощност') else
                MemoLogPower.Lines.Add('All frequencies are at 100% power');
              end else
              begin
                if RadioGroupMainLanguage.ItemIndex=0 then
                begin
                  if tmpFreq > 100 then begin MemoLogPower.Lines.Add('Честоти от 1 до 100 херца '+IntToStr(_NH_Buff[28])+'% мощност'); tmpFreqVar := 100; end;
                  if tmpFreq > 200 then begin MemoLogPower.Lines.Add('Честоти от 101 до 200 херца '+IntToStr(_NH_Buff[27])+'% мощност'); tmpFreqVar := 200; end;
                  if tmpFreq > 300 then begin MemoLogPower.Lines.Add('Честоти от 201 до 300 херца '+IntToStr(_NH_Buff[26])+'% мощност'); tmpFreqVar := 300; end;
                  if tmpFreq > 400 then begin MemoLogPower.Lines.Add('Честоти от 301 до 400 херца '+IntToStr(_NH_Buff[25])+'% мощност'); tmpFreqVar := 400; end;
                  if tmpFreq > 500 then begin MemoLogPower.Lines.Add('Честоти от 401 до 500 херца '+IntToStr(_NH_Buff[24])+'% мощност'); tmpFreqVar := 500; end;
                  if tmpFreq > 600 then begin MemoLogPower.Lines.Add('Честоти от 501 до 600 херца '+IntToStr(_NH_Buff[23])+'% мощност'); tmpFreqVar := 600; end;
                  if tmpFreq > 700 then begin MemoLogPower.Lines.Add('Честоти от 601 до 700 херца '+IntToStr(_NH_Buff[22])+'% мощност'); tmpFreqVar := 700; end;
                  if tmpFreq > 800 then begin MemoLogPower.Lines.Add('Честоти от 701 до 800 херца '+IntToStr(_NH_Buff[21])+'% мощност'); tmpFreqVar := 800; end;
                  if tmpFreq > 900 then begin MemoLogPower.Lines.Add('Честоти от 801 до 900 херца '+IntToStr(_NH_Buff[20])+'% мощност'); tmpFreqVar := 900; end;
                  if tmpFreq > 1000 then begin MemoLogPower.Lines.Add('Честоти от 901 до 1000 херца '+IntToStr(_NH_Buff[19])+'% мощност'); tmpFreqVar := 1000; end;
                  if (tmpFreq > 1000) then
                  begin
                  MemoLogPower.Lines.Add('Честоти от '+IntToStr(tmpFreqVar)+' до '+IntToStr(tmpFreq)+' херца '+IntToStr(_NH_Buff[18])+'% мощност');
                  MemoLogPower.Lines.Add('Честоти над '+IntToStr(tmpFreq)+' херца 100% мощност');
                  end;
                end else
                begin
                  if tmpFreq > 100 then begin MemoLogPower.Lines.Add('Frequencies from 1 to 100 hertz '+IntToStr(_NH_Buff[28])+'% power'); tmpFreqVar := 100; end;
                  if tmpFreq > 200 then begin MemoLogPower.Lines.Add('Frequencies from 101 to 200 hertz '+IntToStr(_NH_Buff[27])+'% power'); tmpFreqVar := 200; end;
                  if tmpFreq > 300 then begin MemoLogPower.Lines.Add('Frequencies from 201 to 300 hertz '+IntToStr(_NH_Buff[26])+'% power'); tmpFreqVar := 300; end;
                  if tmpFreq > 400 then begin MemoLogPower.Lines.Add('Frequencies from 301 to 400 hertz '+IntToStr(_NH_Buff[25])+'% power'); tmpFreqVar := 400; end;
                  if tmpFreq > 500 then begin MemoLogPower.Lines.Add('Frequencies from 401 to 500 hertz '+IntToStr(_NH_Buff[24])+'% power'); tmpFreqVar := 500; end;
                  if tmpFreq > 600 then begin MemoLogPower.Lines.Add('Frequencies from 501 to 600 hertz '+IntToStr(_NH_Buff[23])+'% power'); tmpFreqVar := 600; end;
                  if tmpFreq > 700 then begin MemoLogPower.Lines.Add('Frequencies from 601 to 700 hertz '+IntToStr(_NH_Buff[22])+'% power'); tmpFreqVar := 700; end;
                  if tmpFreq > 800 then begin MemoLogPower.Lines.Add('Frequencies from 701 to 800 hertz '+IntToStr(_NH_Buff[21])+'% power'); tmpFreqVar := 800; end;
                  if tmpFreq > 900 then begin MemoLogPower.Lines.Add('Frequencies from 801 to 900 hertz '+IntToStr(_NH_Buff[20])+'% power'); tmpFreqVar := 900; end;
                  if tmpFreq > 1000 then begin MemoLogPower.Lines.Add('Frequencies from 901 to 1000 hertz '+IntToStr(_NH_Buff[19])+'% power'); tmpFreqVar := 1000; end;
                  if (tmpFreq > 1000) then
                  begin
                  MemoLogPower.Lines.Add('Frequencies from '+IntToStr(tmpFreqVar)+' to '+IntToStr(tmpFreq)+' hertz '+IntToStr(_NH_Buff[18])+'% power');
                  MemoLogPower.Lines.Add('Frequencies above '+IntToStr(tmpFreq)+' hertz 100% power');
                  end;
                end;
              end;
            end;

              MemoPrograms.Clear;
              if RadioGroupMainLanguage.ItemIndex=0 then
              begin
                MemoPrograms.Lines.Add('Червено 1 - '+tTEXT1);  MemoPrograms.Lines.Add('Червено 2 - '+tTEXT2); MemoPrograms.Lines.Add('Червено 3 - '+tTEXT3); MemoPrograms.Lines.Add('Червено 4 - '+tTEXT4);
                MemoPrograms.Lines.Add('Зелено 1 - '+tTEXT5);   MemoPrograms.Lines.Add('Зелено 2 - '+tTEXT6);  MemoPrograms.Lines.Add('Зелено 3 - '+tTEXT7);  MemoPrograms.Lines.Add('Зелено 4 - '+tTEXT8);
                MemoPrograms.Lines.Add('Синьо 1 - '+tTEXT9);    MemoPrograms.Lines.Add('Синьо 2 - '+tTEXT10);  MemoPrograms.Lines.Add('Синьо 3 - '+tTEXT11);  MemoPrograms.Lines.Add('Синьо 4 - '+tTEXT11);
              end else
              begin
                MemoPrograms.Lines.Add('Red 1 - '+tTEXT1);  MemoPrograms.Lines.Add('Red 2 - '+tTEXT2); MemoPrograms.Lines.Add('Red 3 - '+tTEXT3); MemoPrograms.Lines.Add('Red 4 - '+tTEXT4);
                MemoPrograms.Lines.Add('Green 1 - '+tTEXT5);   MemoPrograms.Lines.Add('Green 2 - '+tTEXT6);  MemoPrograms.Lines.Add('Green 3 - '+tTEXT7);  MemoPrograms.Lines.Add('Green 4 - '+tTEXT8);
                MemoPrograms.Lines.Add('Blue 1 - '+tTEXT9);    MemoPrograms.Lines.Add('Blue 2 - '+tTEXT10);  MemoPrograms.Lines.Add('Blue 3 - '+tTEXT11);  MemoPrograms.Lines.Add('Blue 4 - '+tTEXT11);
              end;
          end;
        end;


        // USB
        if Assigned(fSrebarnaVoda) then
        begin
          with fSrebarnaVoda do
          begin


            if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8012') OR (GLB_SHORT_MAC = '8040') OR (GLB_SHORT_MAC = '8041') OR (GLB_SHORT_MAC = '8042') then
            begin



              case _NH_Buff[_CurrentSetPoint] of
              2: RadioGroupCurrentSetPoint.ItemIndex:=0;
              5: RadioGroupCurrentSetPoint.ItemIndex:=1;
              8: RadioGroupCurrentSetPoint.ItemIndex:=2;
              11: RadioGroupCurrentSetPoint.ItemIndex:=3;
              14: RadioGroupCurrentSetPoint.ItemIndex:=4;
              17: RadioGroupCurrentSetPoint.ItemIndex:=5;
              20: RadioGroupCurrentSetPoint.ItemIndex:=6;
              end;

              Move(_NH_Buff[_WaterQuantity],WaterQ,2);
              case WaterQ of
              200: RadioGroupWaterQ.ItemIndex := 0;
              500: RadioGroupWaterQ.ItemIndex := 1;
              1000: RadioGroupWaterQ.ItemIndex := 2;
              2000: RadioGroupWaterQ.ItemIndex := 3;
              end;

              case _NH_Buff[_SilverConcentration] of
              2:RadioGroupSilverConcentration.ItemIndex := 0;
              5:RadioGroupSilverConcentration.ItemIndex := 1;
              15:RadioGroupSilverConcentration.ItemIndex := 2;
              100:RadioGroupSilverConcentration.ItemIndex := 3;
              end;

              Move(_NH_Buff[_CurrentSence], CurrentSence, 2);
              if RadioGroupMainLanguage.ItemIndex=0 then
              LabelPower.Caption := 'Изходен ток: '+FormatFloat('0.00', CurrentSence/100)+' mA.' else
              LabelPower.Caption := 'Output current: '+FormatFloat('0.00', CurrentSence/100)+' mA.';

              Move(_NH_Buff[_SilverWatterTime], SilverWaterTime, 4);
              if RadioGroupMainLanguage.ItemIndex=0 then
              LabelExpectTime.Caption := 'Очаквано време: '+TimeToStr(Time-IncSecond(Time,SilverWaterTime)) else //+' num: '+IntToStr(SilverWaterTime)+' pinter: '+IntToStr(_SilverWatterTime);
              LabelExpectTime.Caption := 'Expected time: '+TimeToStr(Time-IncSecond(Time,SilverWaterTime));

              Move(_NH_Buff[_SilverWaterRemain], SilverWaterRemain, 4);
              if RadioGroupMainLanguage.ItemIndex=0 then
              LabelRemainTime.Caption := 'Оставащо време: '+TimeToStr(Time-IncSecond(Time,SilverWaterRemain)) else //+' num: '+IntToStr(SilverWaterRemain)+' pinter: '+IntToStr(_SilverWaterRemain);
              LabelRemainTime.Caption := 'Remaining time: '+TimeToStr(Time-IncSecond(Time,SilverWaterRemain));

              if (SilverWaterTime=SilverWaterRemain) then
              begin
                RadioGroupCurrentSetPoint.Enabled := True;
                RadioGroupWaterQ.Enabled := True;
                RadioGroupSilverConcentration.Enabled := True;
              end;



              if _NH_Buff[_SilverWaterOn]=0 then
              begin
                ButtonStart.Enabled := True;
                ButtonStop.Enabled := False;
                TimerRemaindTime.Enabled := False;
              end else
              begin
                if CurrentSence >= 30 then
                LabelMessage.Visible := False else
                LabelMessage.Visible := True;

                LabelPower.Visible := not LabelMessage.Visible;
                LabelExpectTime.Visible := not LabelMessage.Visible;
                LabelRemainTime.Visible := not LabelMessage.Visible;

                RadioGroupCurrentSetPoint.Enabled := False;
                RadioGroupWaterQ.Enabled := False;
                RadioGroupSilverConcentration.Enabled := False;


                ButtonStart.Enabled := False;
                ButtonStop.Enabled := True;
                TimerRemaindTime.Enabled := True;
              end;
            end;


          end;
        end;



        if Assigned(fSrebarnaVoda) then Exit;

        VirtualTableZappers.First;
        if VirtualTableZappers.Locate('MAC', GLB_SHORT_MAC, []) then
        begin
          DBLookupComboBoxZapper.KeyValue := VirtualTableZappers.FieldByName('id').AsInteger;
          LogEvent('Разпознат контролер: '+DBLookupComboBoxZapper.Text);

          if RadioGroupMainLanguage.ItemIndex=0 then
          StatusBar1.Panels[0].Text := 'Модел Запер: '+DBLookupComboBoxZapper.Text else
          StatusBar1.Panels[0].Text := 'Model Zapper: '+DBLookupComboBoxZapper.Text;

          StatusBar1.Panels[5].Text := 'Port: '+ComboBoxComPorts.Text;
          StatusBar1.Panels[6].Text := 'MAC: '+IntToHex(_read[4],2)+IntToHex(_read[5],2);

          GLB_Power := _NH_Buff[_Power];
          GLB_Freq := _NH_Buff[_Freq];
          GLB_Zumer := _NH_Buff[_Zumer];
          GLB_Sweep := _NH_Buff[_Sweep];
          Move(_NH_Buff[_DurationFrequenceTime], GLB_Duration, 2);


          if RadioGroupMainLanguage.ItemIndex=0 then
          StatusBar1.Panels[9].Text := 'Време на всяка честота: '+IntToStr(GLB_Duration) else
          StatusBar1.Panels[9].Text := 'Time on each frequency: '+IntToStr(GLB_Duration);

          ADOQueryOptions.Edit;
          ADOQueryOptions.FieldByName('MAC').AsString := GLB_FULL_MAC;
          //ADOQueryOptions.FieldByName('com_port').AsString := ComboBoxComPorts.Text;
          ADOQueryOptions.Post;

          Connected_com_port := VaComm1.DeviceName;

          buf_2b[1]:=_read[7];
          buf_2b[2]:=_read[6];

          Move(buf_2b, sn, 2);
          StatusBar1.Panels[7].Text := 'Serial No: '+IntToStr(sn);
          StatusBar1.Panels[8].Text := 'Firmware: v'+IntToStr(_read[8])+'.'+IntToStr(_read[9]);

        //  TimerCheck_USB_Connections.Enabled := False;
       //   TimerCheck_USB_Connections.Interval := 10*1000;
        //  TimerCheck_USB_Connections.Enabled := True;

          if _Wifi >= 1 then
          begin
            GLB_Wifi := _NH_Buff[_Wifi];
            GLB_Wifi_AP_Time := _NH_Buff[_Wifi_AP];
            GLB_Wifi_AP_NoActTime := _NH_Buff[_Wifi_AP_NoAct];

            PREPARE_BUFF;
            USB_Buffer[1] := 0;
            USB_Buffer[2] := 0;
            USB_Buffer[3] := 26;
            USB_Buffer[4] := 16;
            VaComm1.WriteBuf(USB_Buffer, 4);
            PARSE_BUFF('USB - Заявка за получаване на WiFi мрежа и статус', 4);
          end else
          begin
            PREPARE_BUFF;
            USB_Buffer[1] := 0;
            USB_Buffer[2] := 0;
            USB_Buffer[3] := 26;
            USB_Buffer[4] := 8;
            VaComm1.WriteBuf(USB_Buffer, 4);
            PARSE_BUFF('Заявка за получаване на записаните програми от запер', 4);
          end;


          if RadioGroupMainLanguage.ItemIndex=0 then
          Caption := 'Програма SKY Запер v'+FormatFloat('0.00', program_version)+' База данни v'+FormatFloat('0.00', database_version)+' MAC: '+GLB_FULL_MAC+' Потребител: '+LoginName else
          Caption := 'Program SKY Zapper v'+FormatFloat('0.00', program_version)+' Database v'+FormatFloat('0.00', database_version)+' MAC: '+GLB_FULL_MAC+' User: '+LoginName
        end else
        begin
          //Memo1.Lines.Add('Не може да разпознае, версията на Zapper!');
        end;
    end;





    if (_read[0]=0) AND (_read[1]=0) AND (_read[2]=208) then //Error
    begin
      LogEvent('Грешки: '+IntToStr(max_buffer));

      if Assigned(fOptions) then
      begin
      fOptions.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fOptions.LabelAlert.Caption := DateTimeToStr(Now)+' Възникна грешка при запис.' else
      fOptions.LabelAlert.Caption := DateTimeToStr(Now)+' An error occurred while recording .';
      end;

      if Assigned(fSrebarnaVoda) then
      begin
      fSrebarnaVoda.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fSrebarnaVoda.LabelAlert.Caption := DateTimeToStr(Now)+' Възникна грешка при запис.' else
      fSrebarnaVoda.LabelAlert.Caption := DateTimeToStr(Now)+' An error occurred while recording .';
      fSrebarnaVoda.TimerRemaindTime.Enabled := False;
      end;

      if Assigned(fProgram) then
      begin
      fProgram.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fProgram.LabelAlert.Caption := DateTimeToStr(Now)+' Възникна грешка при запис.' else
      fProgram.LabelAlert.Caption := DateTimeToStr(Now)+' An error occurred while recording .';
      end;

    end;




    if (_read[0]=0) AND (_read[1]=0) AND (_read[2]=144) then //Success
    begin
      LogEvent('Успешна команда за запис.');

      if Assigned(fOptions) then
      begin
      fOptions.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fOptions.LabelAlert.Caption := DateTimeToStr(Now)+ ' Успешно получена команда.' else
      fOptions.LabelAlert.Caption := DateTimeToStr(Now)+ ' Successfully received command .';
      end;

      if Assigned(fSrebarnaVoda) then
      begin
      fSrebarnaVoda.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fSrebarnaVoda.LabelAlert.Caption := DateTimeToStr(Now)+ ' Успешно получена команда.' else
      fSrebarnaVoda.LabelAlert.Caption := DateTimeToStr(Now)+ ' Successfully received command .';
      end;

      if Assigned(fProgram) then
      begin
      fProgram.LabelAlert.Visible := True;
      if RadioGroupMainLanguage.ItemIndex=0 then
      fProgram.LabelAlert.Caption := DateTimeToStr(Now)+ ' Успешно получена команда.' else
      fProgram.LabelAlert.Caption := DateTimeToStr(Now)+ ' Successfully received command .';
      end;

    end;




    if (_read[0]=0) AND (_read[1]=0) AND (_read[2]=26) then
    begin
      case _read[3] of
        7:begin
            LogEvent('Изпращане на данни: '+IntToStr(max_buffer));
            Application.ProcessMessages;

            fProgram.ProgressBar1.Position := 0;
            fProgram.ProgressBar1.Max := max_buffer;

            for I := 0 to max_buffer do
            begin
              fProgram.ProgressBar1.Position := i;
              VaComm1.WriteBuf(buff[i], 1);
              Sleep(AdvEditMS.IntValue);

              Application.ProcessMessages;
            end;

            LogEvent('Приключи изпращането на данни: '+IntToStr(max_buffer));
        end;
        8:begin
            buf_4b[1] := _read[4];
            buf_4b[2] := _read[5];
            buf_4b[3] := _read[6];
            buf_4b[4] := _read[7];

            Move(buf_4b, GLB_CheckBuffer, 4);

            if RadioGroupMainLanguage.ItemIndex=0 then
            begin
              if max_buffer = GLB_CheckBuffer-1 then
              ShowMessage('Програмите са записани успешно.') else
              ShowMessage('Възникна проблем получени са по-малко символи: '+IntToStr(GLB_CheckBuffer)+ ' от '+IntToStr(max_buffer) );
            end else
            begin
              if max_buffer = GLB_CheckBuffer-1 then
              ShowMessage('The programs have been saved successfully .') else
              ShowMessage('There was a problem, fewer characters were received: '+IntToStr(GLB_CheckBuffer)+ ' от '+IntToStr(max_buffer) );
            end;

        end;
        60:begin //function generator ping

        end;
        90,91,92,93,94,95,40,45,46,41,100,101,102,105,106,120:begin
            LogEvent('Message recieve:'+IntToStr(_read[3])+' count: '+IntToStr(Count-1));
            _read[0] := 3; //маркира че го препраща
            SEND_Cloud(_read);

           if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8030') OR (GLB_SHORT_MAC = '8041') OR (GLB_SHORT_MAC = '8042')then
           if (_read[3]=100) then
           begin
              PREPARE_BUFF;
              USB_Buffer[1] := 0;
              USB_Buffer[2] := 0;
              USB_Buffer[3] := 9;
              USB_Buffer[4] := 0;
              USB_Buffer[5] := 255;
              VaComm1.WriteBuf(USB_Buffer, 5);
              PARSE_BUFF('Препрочитане на бързите програми', 5);
           end;



        end;

      end;

    end;




    if (_read[0]=0) AND (_read[1]=0) AND (_read[2]=154) then //отговора на функция 26
    begin

        //LogEvent(' Успешна изпълнена команда!');
        if _read[3] = 50 then
        begin

          fCustomGroups.ButtonSendingBuffer.Click;
        end;

        if _read[3] = 51 then
        begin
          if fCustomGroups.AdvEditBlockPos.IntValue >= fCustomGroups.AdvEditBlockMax.IntValue then
          fCustomGroups.ButtonFinished.Click else
          fCustomGroups.ButtonSendingBuffer.Click;
        end;

        if _read[3] = 52 then
        begin
          ShowMessage('Приключи успешно записването на персонализирани програми!');
        end;


        case _read[3] of

          6:begin
              LogEvent(' Започна изчистването на паметта');
              Application.ProcessMessages;
          end;
          8:begin
              LogEvent('БРОЙ ЗАПИСАНИ ПРОГРАМИ: '+IntToStr(_read[17]));
              for I := 0 to _read[17]-1 do
              begin
              buf_2b[1] := _read[4+len_settings + len_category + (i * len_disease)];
              buf_2b[2] := _read[4+len_settings + len_category + (i * len_disease)+1];
              Move(buf_2b, tmpProgram, 2);

              case _read[4+len_settings + len_category + (i * len_disease)+4] of
                2:begin
                  if tID1=0 then begin tID1 := tmpProgram; tTEXT1 := GetProgramNameBasic(1, tmpProgram); end else
                  if tID2=0 then begin tID2 := tmpProgram; tTEXT2 := GetProgramNameBasic(2, tmpProgram); end else
                  if tID3=0 then begin tID3 := tmpProgram; tTEXT3 := GetProgramNameBasic(3, tmpProgram); end;
                end;
                3:begin
                  if tID5=0 then begin tID5 := tmpProgram; tTEXT5 := GetProgramNameBasic(5, tmpProgram); end else
                  if tID6=0 then begin tID6 := tmpProgram; tTEXT6 := GetProgramNameBasic(6, tmpProgram); end else
                  if tID7=0 then begin tID7 := tmpProgram; tTEXT7 := GetProgramNameBasic(7, tmpProgram); end;
                end;
                4:begin
                  if tID9=0 then begin tID9 := tmpProgram; tTEXT9 := GetProgramNameBasic(9, tmpProgram); end else
                  if tID10=0 then begin tID10 := tmpProgram; tTEXT10 := GetProgramNameBasic(10, tmpProgram); end else
                  if tID11=0 then begin tID11 := tmpProgram; tTEXT11 := GetProgramNameBasic(11, tmpProgram); end;
                end;
              end;

              LogEvent(IntToStr(i)+' Програми id : '+IntToStr(tmpProgram)+' b1: '+IntToStr(4+len_settings + len_category + (len_disease*i))+' b2: '+IntToStr(4+len_settings + len_category + (len_disease*i)+1));
              end;
          end;
          15:begin //save networks
              if Assigned(fOptions) then
              begin
               with fOptions do
               begin

               vtNetworks.Insert;

               if RadioGroupMainLanguage.ItemIndex=0 then
               begin
                 case _read[4] of
                   0: vtNetworks.FieldByName('status').AsString := 'Не е свързан';
                   1: vtNetworks.FieldByName('status').AsString := 'Прогрес на свързване';
                   2: vtNetworks.FieldByName('status').AsString := 'Свързан';
                 end;
               end else
               begin
                case _read[4] of
                   0: vtNetworks.FieldByName('status').AsString := 'Not connected ';
                   1: vtNetworks.FieldByName('status').AsString := 'Connection progress ';
                   2: vtNetworks.FieldByName('status').AsString := 'Connected';
                 end;

               end;

               if _read[5]=0 then
               vtNetworks.FieldByName('config').AsString := 'DHCP' else
               vtNetworks.FieldByName('config').AsString := 'Static';

               vtNetworks.FieldByName('ip').AsString := IntToStr(_read[6])+'.'+IntToStr(_read[7])+'.'+IntToStr(_read[8])+'.'+IntToStr(_read[9]);
               vtNetworks.FieldByName('netmask').AsString := IntToStr(_read[10])+'.'+IntToStr(_read[11])+'.'+IntToStr(_read[12])+'.'+IntToStr(_read[13]);
               vtNetworks.FieldByName('gateway').AsString := IntToStr(_read[14])+'.'+IntToStr(_read[15])+'.'+IntToStr(_read[16])+'.'+IntToStr(_read[17]);
               vtNetworks.FieldByName('dns1').AsString := IntToStr(_read[18])+'.'+IntToStr(_read[19])+'.'+IntToStr(_read[20])+'.'+IntToStr(_read[21]);
               vtNetworks.FieldByName('dns2').AsString := IntToStr(_read[22])+'.'+IntToStr(_read[23])+'.'+IntToStr(_read[24])+'.'+IntToStr(_read[25]);

               tmpStatus := '';
               for I := 26 to Count-1 do
               begin
                 tmpStatus := tmpStatus + Chr(_read[i]);
                 p := i;
                 if _read[i]=0 then
                 Break;
               end;

               vtNetworks.FieldByName('ssid').AsString := tmpStatus;

               tmpStatus := '';
               for I := p+1 to Count-1 do
               begin
                 tmpStatus := tmpStatus + Chr(_read[i]);
                 if _read[i]=0 then
                 Break;
               end;

               vtNetworks.FieldByName('password').AsString := tmpStatus;
               vtNetworks.Post;

               LogEvent('Получаване на запазени мрежи.')

               end;
              end;
          end;
          16:begin //current Wifi network
              tmpIP := '';
              tmpDB := '';
              tmpStatus := '';

              for I := 27 to Count-1 do
              begin
                 tmpStatus := tmpStatus + Chr(_read[i]);
                 if _read[i]=0 then
                 Break;
              end;
              StatusBar1.Panels[1].Text := 'WiFi Мрежа: '+tmpStatus;

              tmpStatus := '';
              if RadioGroupMainLanguage.ItemIndex=0 then
              begin
                case _read[4] of
                   0: tmpStatus := 'Idle';
                   1: tmpStatus := 'Няма открити мрежи';
                   2: tmpStatus := 'Сканирането приключи';
                   3: tmpStatus := 'Свързан';
                   4: tmpStatus := 'Грешка при свързване';
                   5: tmpStatus := 'Загубена връзка';
                   6: tmpStatus := 'Не е свързан';
                end;
                StatusBar1.Panels[2].Text := 'WiFi Статус: '+tmpStatus;
              end else
              begin
                case _read[4] of
                   0: tmpStatus := 'Idle';
                   1: tmpStatus := 'No SSID available';
                   2: tmpStatus := 'Scan compleated';
                   3: tmpStatus := 'Connected';
                   4: tmpStatus := 'Connect failed';
                   5: tmpStatus := 'Connection lost';
                   6: tmpStatus := 'Disconnected';
                end;
                StatusBar1.Panels[2].Text := 'WiFi status: '+tmpStatus;
              end;

              Move(_read[25], tmpRSSI, 2);
              tmpIP := IntToStr(_read[5])+'.'+IntToStr(_read[6])+'.'+IntToStr(_read[7])+'.'+IntToStr(_read[8]);
              if _read[4]=3 then
              begin
              StatusBar1.Panels[3].Text := 'WiFi IP: '+tmpIP;
              StatusBar1.Panels[4].Text := 'WiFi dB: '+IntToStr(tmpRSSI);
              end else
              begin
              StatusBar1.Panels[3].Text := 'WiFi IP: ';
              StatusBar1.Panels[4].Text := 'WiFi dB: ';
              end;

              if Assigned(fOptions) then
              begin
              with fOptions do
              begin
               MemoIP.Lines.Clear;
               MemoIP.Lines.Add('Local IP: '+tmpIP);
               MemoIP.Lines.Add('Subnet: '+IntToStr(_read[9])+'.'+IntToStr(_read[10])+'.'+IntToStr(_read[11])+'.'+IntToStr(_read[12]));
               MemoIP.Lines.Add('Geteway: '+IntToStr(_read[13])+'.'+IntToStr(_read[14])+'.'+IntToStr(_read[15])+'.'+IntToStr(_read[16]));
               MemoIP.Lines.Add('DNS 1: '+IntToStr(_read[17])+'.'+IntToStr(_read[18])+'.'+IntToStr(_read[19])+'.'+IntToStr(_read[20]));
               MemoIP.Lines.Add('DNS 2: '+IntToStr(_read[21])+'.'+IntToStr(_read[22])+'.'+IntToStr(_read[23])+'.'+IntToStr(_read[24]));
              end;
              end;

              LogEvent('Получаване на текущи мрежи в обхват.');
          end;
          17:begin
             if Assigned(fOptions) then
             begin
               with fOptions do
               begin
                 tmpWifi := '';
                 //cbb1.Text := '';

                 for I := 4 to Count do
                 begin
                   tmpWifi := tmpWifi + Chr(_read[i]);
                 end;

                 //vtMreji.Clear;
                 ComboBoxcbb1_1.Clear;

                 if RadioGroupMainLanguage.ItemIndex=0 then
                 LabelWiFiNetworks.Caption := 'Моля, изберете мрежа' else
                 LabelWiFiNetworks.Caption := 'Please select a network ';

                 ComboBoxcbb1_1.Items.Text := tmpWifi;

                 for I := 0 to ComboBoxcbb1_1.Items.Count-1 do
                 begin
                 vtMreji.Insert;
                 vtMreji.FieldByName('name').AsString := ComboBoxcbb1_1.Items.Strings[i];
                 vtMreji.Post;
                 end;

                 LogEvent('Моля, изберете мрежа.')
               end;
             end;
          end;
          20:begin
              if Assigned(fOptions) then
              begin
                fOptions.RadioGroupHotspot.ItemIndex := _read[4];
                LogEvent('Получена настройка за Hotspot: '+IntToStr(_read[4]));
              end;
          end;
          25:begin //get IDs programs
              sn := (Count-8) div 2;
              for I := 0 to sn-1 do
              begin
                 // buf_2b[1] := _read[4 + (i * 2)];
                 // buf_2b[2] := _read[4 + (i * 2)]+1;
                 // LogEvent(IntToStr(buf_2b[1])+'    '+IntToStr(buf_2b[2]));
                 // Move(buf_2b, tmpProgram, 2);

                Move(_read[4 + (i * 2)], tmpProgram, 2);
                if ListBoxProgramIDs.Items.IndexOf(IntToStr(tmpProgram)) = -1 then
                ListBoxProgramIDs.Items.Add(IntToStr(tmpProgram));
              end;
          end;
          26:begin //get IDs categories
              sn := (Count-8) div 2;
              for I := 0 to sn-1 do
              begin
                 Move(_read[4 + (i * 2)], tmpProgram, 2);
                if ListBoxCategoriesIDs.Items.IndexOf(IntToStr(tmpProgram)) = -1 then
                ListBoxCategoriesIDs.Items.Add(IntToStr(tmpProgram));
              end;
          end;


        end;

    end;


end;

end.
