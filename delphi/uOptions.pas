unit uOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, AdvEdit, Vcl.ExtCtrls, VaComm, Vcl.Menus,
  Vcl.ComCtrls, MemDS, VirtualTable, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfOptions = class(TForm)
    TimerFrequence: TTimer;
    TimerPower: TTimer;
    OpenDialogFirmware: TOpenDialog;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N21: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    ButtonGeneralSave: TButton;
    AdvEdit_duration: TAdvEdit;
    RadioGroupZumer: TRadioGroup;
    AdvEditSweep: TAdvEdit;
    RadioGroupSearch: TRadioGroup;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabelStep: TLabel;
    LabelDescription: TLabel;
    AdvEdit_frequence: TAdvEdit;
    AdvEdit_power: TAdvEdit;
    AdvEdit_interval: TAdvEdit;
    AdvEdit_frequence_interval: TAdvEdit;
    AdvEdit_power_interval: TAdvEdit;
    ButtonCalibrateFrequence: TButton;
    ButtonCalibratePower: TButton;
    ButtonStopCalibration: TButton;
    RadioGroupMove: TRadioGroup;
    ButtonBegin: TButton;
    ButtonOK_no_more: TButton;
    ButtonNextStep: TButton;
    grpFirmware: TGroupBox;
    MemoFirmwareLog: TMemo;
    ButtonFirmware: TButton;
    ButtonAVR_Dude: TButton;
    Edit1: TEdit;
    ButtonFirmwareFile: TButton;
    ComboBoxLoader: TComboBox;
    AdvEditDelay: TAdvEdit;
    AdvEditTry: TAdvEdit;
    MemoLogPower: TMemo;
    SaveDialog1: TSaveDialog;
    TabSheet4: TTabSheet;
    ButtonRecieveNetworks: TButton;
    ComboBoxcbb1_1: TComboBox;
    EditPassword: TEdit;
    ButtonConnectNetwork: TButton;
    ButtonReadIP: TButton;
    MemoIP: TMemo;
    LabelWiFiNetworks: TLabel;
    LabelWiFiPassword: TLabel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSourceNetworks: TDataSource;
    vtNetworks: TVirtualTable;
    ButtonReadSaveNetworks: TButton;
    TabSheet5: TTabSheet;
    grpDebugOptions: TGroupBox;
    Button15: TButton;
    Button13: TButton;
    cxGrid5: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxgrdbclmnGridDBTableView4id: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView4dec: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView4hex: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView4char: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    ButtonRead: TButton;
    grp1: TGroupBox;
    Button1: TButton;
    MemoMainLogRX_D: TMemo;
    MemoMainLogTX_D: TMemo;
    MemoMainLogEvent_D: TMemo;
    CheckBoxRX_D: TCheckBox;
    CheckBoxTX_D: TCheckBox;
    CheckBoxMessage_D: TCheckBox;
    cxgrdbclmnGridDBTableView1status: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1config: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1ip: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1netmask: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1gateway: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1dns1: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1dns2: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1ssid: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1password: TcxGridDBColumn;
    RadioGroupHotspot: TRadioGroup;
    ButtonHotspotRead: TButton;
    ButtonHotSpotTurnOn: TButton;
    LabelHotSpot1: TLabel;
    LabelHotSpot2: TLabel;
    ButtonGeneralRead: TButton;
    MemoPrograms: TMemo;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    DataSourceMreji: TDataSource;
    vtMreji: TVirtualTable;
    cxGridDBTableView2name: TcxGridDBColumn;
    LabelAlert: TLabel;
    Labelt1_program_save: TLabel;
    ComboBoxStandartPorts: TComboBox;
    TimerWiFiRead: TTimer;
    ButtonFactoryReset: TButton;
    CheckBoxWiFi: TCheckBox;
    CheckBoxAP: TCheckBox;
    AdvEditAP_sec: TAdvEdit;
    ButtonWiFiSave: TButton;
    AdvEditAP_no_activity_sec: TAdvEdit;
    ButtonHotSpotTurnOff: TButton;
    ButtonTestDevice: TButton;
    ButtonStopTest: TButton;
    Button5: TButton;
    EditCloud_URL: TEdit;
    RadioGroupLanguage: TRadioGroup;
    ButtonExit: TButton;
    LabelCloudAddress: TLabel;
    LabelFactoryPIN: TLabel;
    EditFactoryPIN: TEdit;
    LabelAdditionalPIN: TLabel;
    EditAdditionalPIN: TEdit;
    EditCloud_PORT: TEdit;
    Label1: TLabel;
    RadioGroupFreqOptions: TRadioGroup;
    procedure Button13Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure ButtonGeneralSaveClick(Sender: TObject);
    procedure ButtonStopCalibrationClick(Sender: TObject);
    procedure ButtonCalibrateFrequenceClick(Sender: TObject);
    procedure ButtonCalibratePowerClick(Sender: TObject);
    procedure TimerFrequenceTimer(Sender: TObject);
    procedure TimerPowerTimer(Sender: TObject);
    procedure ButtonReadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonFirmwareFileClick(Sender: TObject);
    procedure ButtonAVR_DudeClick(Sender: TObject);
    procedure ButtonFirmwareClick(Sender: TObject);
    procedure ButtonBeginClick(Sender: TObject);
    procedure ButtonOK_no_moreClick(Sender: TObject);
    procedure ButtonNextStepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure CheckBoxRXClick(Sender: TObject);
    procedure CheckBoxTXClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonRecieveNetworksClick(Sender: TObject);
    procedure ButtonReadIPClick(Sender: TObject);
    procedure ButtonConnectNetworkClick(Sender: TObject);
    procedure ButtonReadSaveNetworksClick(Sender: TObject);
    procedure ButtonHotspotReadClick(Sender: TObject);
    procedure ButtonHotSpotTurnOnClick(Sender: TObject);
    procedure ButtonGeneralReadClick(Sender: TObject);
    procedure TimerWiFiReadTimer(Sender: TObject);
    procedure ButtonFactoryResetClick(Sender: TObject);
    procedure ButtonWiFiSaveClick(Sender: TObject);
    procedure ButtonHotSpotTurnOffClick(Sender: TObject);
    procedure ButtonTestDeviceClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioGroupLanguageClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  fOptions: TfOptions;
  FrequenceCalibration : Double;
  tmpCalibration, tmpFirstStop : Integer;
  tmpGLB_count : Integer;



implementation

{$R *.dfm}

uses uMain, IdGlobal, math;

procedure TfOptions.Button13Click(Sender: TObject);
begin
  MemoMainLogRX_D.Clear;
  MemoMainLogTX_D.Clear;
  MemoMainLogEvent_D.Clear;

  fMain.MemoMainLogRX.Clear;
  fMain.MemoMainLogTX.Clear;
  fMain.MemoMainLogEvent.Clear;
end;

procedure TfOptions.Button15Click(Sender: TObject);
var
i:Integer;
begin
with fMain do
begin

VirtualTableBuffer.DisableControls;
for I := 0 to max_buffer  do
begin

  VirtualTableBuffer.Insert;
  VirtualTableBuffer.FieldByName('id').AsInteger := i;
  VirtualTableBuffer.FieldByName('dec').AsInteger := Ord(buff[i]);
  VirtualTableBuffer.FieldByName('hex').AsString := IntToHex(Ord(buff[i]),2);
  VirtualTableBuffer.FieldByName('char').AsString := Chr(buff[i]);
  VirtualTableBuffer.Post;

end;
VirtualTableBuffer.EnableControls;



end;
end;



procedure TfOptions.Button1Click(Sender: TObject);
var i:Integer;
    f:TextFile;
    b:Byte;
begin
  SaveDialog1.Execute();
  with fMain do
  begin
      SaveBytesToFile(buff, SaveDialog1.FileName);
  end;

end;

procedure TfOptions.ButtonFactoryResetClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
//  if Check_ZapperWiFi(1) = False then Exit;

  if RadioGroupLanguage.ItemIndex = 0 then
  begin
    if MessageDlg('Сигурни ли сте, че искате да пуснете ФАБРИЧНИ НАСТРОЙКИ?', mtConfirmation, mbYesNo, 0) <> mrYes then exit;
  end else
  begin
    if MessageDlg('Are you sure you want to restore FACTORY SETTINGS?', mtConfirmation, mbYesNo, 0) <> mrYes then exit;
  end;



  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 240;
  USB_Buffer[5] := 15;
  USB_Buffer[6] := 170;
  USB_Buffer[7] := 200;

  VaComm1.WriteBuf(USB_Buffer, 7);
  PARSE_BUFF('Фабрични настройки', 7);

//0 0 26 240 15 170 200

end;
end;

procedure TfOptions.ButtonWiFiSaveClick(Sender: TObject);
var
n2x:byte;
i:Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  PREPARE_BUFF;
  n2x := 0;
  if CheckBoxAP.Checked then n2x := Set_a_Bit(n2x, 0);
  if CheckBoxWiFi.Checked then n2x := Set_a_Bit(n2x, 1);
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 16;
  USB_Buffer[4] := 122;
  USB_Buffer[5] := n2x;
  USB_Buffer[6] := byte(AdvEditAP_sec.IntValue);
  USB_Buffer[7] := byte(AdvEditAP_no_activity_sec.IntValue);
  VaComm1.WriteBuf(USB_Buffer, 7);
  PARSE_BUFF('ВиФи Настройка ', 7);


     {
No: 122 Byte: 3 Hex: 03 Char: 
No: 123 Byte: 47 Hex: 2F Char: /
No: 124 Byte: 111 Hex: 6F Char: o}
end;
end;

procedure TfOptions.Button5Click(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 16;
  USB_Buffer[4] := 13;
  USB_Buffer[5] := 0;

  VaComm1.WriteBuf(USB_Buffer, 5);
  PARSE_BUFF('Фабрични настройки', 5);

  // 0 0 16 13 0
end;
end;



procedure TfOptions.ButtonReadSaveNetworksClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_ZapperWiFi(1) = False then Exit;

  vtNetworks.Clear;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 15;

  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 4);
    PARSE_BUFF('USB - Получаване на запазени мрежи', 4);
  end else
  begin
    SendBufferToLAN(4);
    LAN_PARSE_BUFF('LAN - Получаване на запазени мрежи', 4);
  end;



end;
end;

procedure TfOptions.ButtonGeneralReadClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 9;
  USB_Buffer[4] := 0;
  USB_Buffer[5] := 255;

  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 5);
    PARSE_BUFF('USB - Прочитане на настройките', 5);
  end else
  begin
    SendBufferToLAN(5);
    LAN_PARSE_BUFF('LAN - Прочитане на настройките', 5);
  end;





end;
end;

procedure TfOptions.ButtonGeneralSaveClick(Sender: TObject);
var n2x:Int16;
i:Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  ADOQueryOptions.Edit;
  ADOQueryOptions.FieldByName('search').AsInteger := RadioGroupSearch.ItemIndex;
  ADOQueryOptions.Post;

  //option 1
  PREPARE_BUFF;
  n2x := AdvEdit_duration.IntValue;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 16;
  USB_Buffer[4] := _DurationFrequenceTime;
  USB_Buffer[5] := byte(n2x);
  USB_Buffer[6] := byte(n2x shr 8);

  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 6);
    PARSE_BUFF('USB - Настройка времетраене за една честота', 6);
  end else
  begin
    SendBufferToLAN(6);
    LAN_PARSE_BUFF('LAN - Настройка времетраене за една честота', 6);
  end;


  SleepSky(100);

  //option 2
  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 16;
  USB_Buffer[4] := _Zumer;
  USB_Buffer[5] := RadioGroupZumer.ItemIndex;
  USB_Buffer[6] := AdvEditSweep.IntValue;

  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 6);
    PARSE_BUFF('Настройка звук и плавно преминаване', 6);
  end else
  begin
    SendBufferToLAN(6);
    PARSE_BUFF('Настройка звук и плавно преминаване', 6);
  end;


  SleepSky(100);


  ButtonGeneralReadClick(nil);
end;

end;

procedure TfOptions.ButtonHotspotReadClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_ZapperWiFi(1) = False then Exit;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 20;
  VaComm1.WriteBuf(USB_Buffer, 4);
  PARSE_BUFF('Получаване на Hotspot', 4);
end;
end;

procedure TfOptions.ButtonHotSpotTurnOffClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_ZapperWiFi(1) = False then Exit;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 21;
  USB_Buffer[5] := 0;
  VaComm1.WriteBuf(USB_Buffer, 5);
  PARSE_BUFF('Изключи Hotspot', 5);
end;
end;

procedure TfOptions.ButtonHotSpotTurnOnClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_ZapperWiFi(1) = False then Exit;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 21;
  USB_Buffer[5] := 1;
  VaComm1.WriteBuf(USB_Buffer, 5);
  PARSE_BUFF('Включи Hotspot', 5);
end;
end;

procedure TfOptions.ButtonRecieveNetworksClick(Sender: TObject);
var
  I: Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_ZapperWiFi(1) = False then Exit;

  vtMreji.Clear;
  if RadioGroupMainLanguage.ItemIndex=0 then
  LabelWiFiNetworks.Caption := 'Сканиране на безжични мрежи' else
  LabelWiFiNetworks.Caption := 'Scan wireless networks';

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 17;

  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 4);
    PARSE_BUFF('USB - Получаване на мрежи', 4);
  end else
  begin
    SendBufferToLAN(4);
    LAN_PARSE_BUFF('LAN - Получаване на мрежи', 4);
  end;


end;
end;

procedure TfOptions.ButtonConnectNetworkClick(Sender: TObject);
var
tmps: TIdBytes; //TIdBytes;
tmpWifi:string;
tmpPassword:string;
I,p, aa, len: Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_ZapperWiFi(1) = False then Exit;

  tmpGLB_count := 0;
  TimerWiFiRead.Enabled:=True;
  tmpWifi := vtMreji.FieldByName('name').AsString;
  tmpPassword := EditPassword.Text;
  len := 6+length(tmpWifi)+length(tmpPassword)+10;

  //SetLength(ttmps, len);

  for I := 1 to len do
  USB_Buffer[i] := 0;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 18;

  p := 4;

  for I := 1 to Length(tmpWifi) do
  begin
    p := p + 1;
    USB_Buffer[p] := Ord(tmpWifi[i]);
  end;

  p := p + 1;
  USB_Buffer[p] := 13;

  for I := 1 to Length(tmpPassword) do
  begin
    p := p + 1;
    USB_Buffer[p] := Ord(tmpPassword[i]);
  end;

  p := p + 1;
  USB_Buffer[p] := 13;


  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, p);
    PARSE_BUFF('USB - Команда за връзка към мрежа', p);
  end else
  begin
    SendBufferToLAN(p);
    LAN_PARSE_BUFF('LAN - Команда за връзка към мрежа', p);
  end;








end;

end;

procedure TfOptions.ButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TfOptions.ButtonReadIPClick(Sender: TObject);
var i:Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_ZapperWiFi(1) = False then Exit;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 16;


  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 4);
    PARSE_BUFF('USB - Команда за прочитане на IP', 4);
  end else
  begin
    SendBufferToLAN(4);
    LAN_PARSE_BUFF('LAN - Команда за прочитане на IP', 4);
  end;



end;
end;

procedure TfOptions.ButtonBeginClick(Sender: TObject);
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  MemoLogPower.Clear;
  tmpCalibration := 1;
  tmpFirstStop := 1;

  if RadioGroupLanguage.ItemIndex = 0 then
  begin
    LabelStep.Caption := 'СТЪПКА   '+IntToStr(tmpCalibration)+' от 12';
    MemoLogPower.Lines.Add('Започва режим на настройка на мощността.');
    LabelDescription.Caption := 'Когато започнете да усещате по-ниските честоти по-силно и непоносимо, оставете ръкохватката и натиснете бутона "ОК до тук"';
  end else
  begin
    LabelStep.Caption := 'STEP   '+IntToStr(tmpCalibration)+' of 12';
    MemoLogPower.Lines.Add('Power setting mode starts.');
    LabelDescription.Caption := 'When you start to feel the lower frequencies more strongly and unbearably, let go of the handle and press the "OK here" button';
  end;


  MemoLogPower.Lines.Add('');

  AdvEdit_frequence.IntValue := 5000;
  AdvEdit_power.IntValue := 100;
  RadioGroupMove.ItemIndex := 1;
  ButtonCalibrateFrequence.Click;

  ButtonNextStep.Enabled := False;
  ButtonOK_no_more.Enabled := True;
  ButtonBegin.Enabled := False;
end;

procedure TfOptions.ButtonOK_no_moreClick(Sender: TObject);
var i:Integer;
 n2x:Int16;
 pointerFreq:Byte;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  if tmpFirstStop=1 then
  begin
    if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8030') OR (GLB_SHORT_MAC = '8041') OR (GLB_SHORT_MAC = '8042') then
    pointerFreq := 60 else
    pointerFreq := 16;

    PREPARE_BUFF;
    n2x := AdvEdit_frequence.IntValue;
    USB_Buffer[1] := 0;
    USB_Buffer[2] := 0;
    USB_Buffer[3] := 16;
    USB_Buffer[4] := pointerFreq;
    USB_Buffer[5] := byte(n2x);
    USB_Buffer[6] := byte(n2x shr 8);
    VaComm1.WriteBuf(USB_Buffer, 6);
    PARSE_BUFF('Настройка честота', 6);

    tmpFirstStop := 9;
  end;


  if tmpCalibration > 1 then
  begin

    if (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8030') then
    begin
      case tmpCalibration of
      2:i := 62;
      3:i := 63;
      4:i := 64;
      5:i := 65;
      6:i := 66;
      7:i := 67;
      8:i := 68;
      9:i := 69;
      10:i := 70;
      11:i := 71;
      12:i := 72;
      end;
    end else
    begin
      case tmpCalibration of
      2:i := 18;
      3:i := 19;
      4:i := 20;
      5:i := 21;
      6:i := 22;
      7:i := 23;
      8:i := 24;
      9:i := 25;
      10:i := 26;
      11:i := 27;
      12:i := 28;
      end;
    end;

    PREPARE_BUFF;
    USB_Buffer[1] := 0;
    USB_Buffer[2] := 0;
    USB_Buffer[3] := 16;
    USB_Buffer[4] := i;
    USB_Buffer[5] := AdvEdit_power.IntValue;
    VaComm1.WriteBuf(USB_Buffer, 5);
    PARSE_BUFF('Настройка мощност', 5);
  end;


  if Length(AdvEdit_frequence.Text)=4 then MemoLogPower.Lines.Add(LabelStep.Caption+', честота: '+AdvEdit_frequence.Text+' Hz. мощност: '+AdvEdit_power.Text+'%');
  if Length(AdvEdit_frequence.Text)=3 then MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   '+AdvEdit_frequence.Text+' Hz. мощност: '+AdvEdit_power.Text+'%');
  if Length(AdvEdit_frequence.Text)=2 then MemoLogPower.Lines.Add(LabelStep.Caption+', честота:    '+AdvEdit_frequence.Text+' Hz. мощност: '+AdvEdit_power.Text+'%');
  if Length(AdvEdit_frequence.Text)=1 then MemoLogPower.Lines.Add(LabelStep.Caption+', честота:       '+AdvEdit_frequence.Text+' Hz. мощност: '+AdvEdit_power.Text+'%');

  MemoLogPower.Lines.Add('');
  ButtonStopCalibration.Click;

  ButtonNextStep.Enabled := True;
  ButtonOK_no_more.Enabled := False;

  if tmpCalibration=12 then
  begin
    ButtonBegin.Enabled := True;
    ButtonNextStep.Enabled := False;
    ButtonOK_no_more.Enabled := False;

    ShowMessage('Приключиха настройките на мощността.');

    ShowMessage('Настройките са успешно записани в Запера.');

    ShowMessage('Вече можете да използвате Запера чрез меню Програми.');


    LabelDescription.Caption :=
    'Приключиха настройките на мощността.' + #13+#13+
    'Настройките са успешно записани в Запера.' + #13+#13+
    'Вече можете да използвате Запера чрез меню Програми.';


    MemoLogPower.Lines.Add('Приключиха настройките на мощността.');
    MemoLogPower.Lines.Add('');
    MemoLogPower.Lines.Add('Настройките са успешно записани в Запера.');


  end;

end;
end;

procedure TfOptions.ButtonNextStepClick(Sender: TObject);
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  if (TimerPower.Enabled=True) OR (TimerFrequence.Enabled=True) then
  begin
    if RadioGroupLanguage.ItemIndex = 0 then
    MemoLogPower.Lines.Add('За да приключите тази стъпка натиснете "ОКЕЙ дотук"') else
    MemoLogPower.Lines.Add('To finish this step press "OK so far"');
    Exit;
  end;

  tmpCalibration := tmpCalibration + 1;

  if tmpCalibration >= 13 then
  begin
    tmpCalibration := 0;

    if RadioGroupLanguage.ItemIndex = 0 then
    begin
      MemoLogPower.Lines.Add('Приключиха настройките на мощността.');
      MemoLogPower.Lines.Add('');
      MemoLogPower.Lines.Add('Настройките са успешно записани в Запера.');
    end else
    begin
      MemoLogPower.Lines.Add('Power settings completed.');
      MemoLogPower.Lines.Add('');
      MemoLogPower.Lines.Add('The settings have been successfully saved in Zapper.');
    end;

    Exit;
  end;

  case tmpCalibration of
  2:AdvEdit_frequence.IntValue := 1000;
  3:AdvEdit_frequence.IntValue := 900;
  4:AdvEdit_frequence.IntValue := 800;
  5:AdvEdit_frequence.IntValue := 700;
  6:AdvEdit_frequence.IntValue := 600;
  7:AdvEdit_frequence.IntValue := 500;
  8:AdvEdit_frequence.IntValue := 400;
  9:AdvEdit_frequence.IntValue := 300;
  10:AdvEdit_frequence.IntValue := 200;
  11:AdvEdit_frequence.IntValue := 100;
  12:AdvEdit_frequence.IntValue := 1;
  end;


  if RadioGroupLanguage.ItemIndex = 0 then
  begin
    if Length(IntToStr(tmpCalibration))=1 then
    LabelStep.Caption := 'СТЪПКА   '+IntToStr(tmpCalibration)+' от 12' else
    LabelStep.Caption := 'СТЪПКА '+IntToStr(tmpCalibration)+' от 12';
  end else
  begin
    if Length(IntToStr(tmpCalibration))=1 then
    LabelStep.Caption := 'STEP   '+IntToStr(tmpCalibration)+' of 12' else
    LabelStep.Caption := 'STEP '+IntToStr(tmpCalibration)+' of 12';
  end;

  AdvEdit_power.IntValue := 0;
  RadioGroupMove.ItemIndex := 0;
  ButtonCalibratePower.Click;


  ButtonNextStep.Enabled := False;
  ButtonOK_no_more.Enabled := True;

end;

procedure TfOptions.ButtonAVR_DudeClick(Sender: TObject);
var CMD :string;
  I: Integer;
begin
with fMain do
begin
  firmware_flash := 2;
  MemoFirmwareLog.Lines.Add('Програмиране на Запер');

  for I := 1 to 10 do
  begin
    MemoFirmwareLog.Lines.Add('Опит: '+IntToStr(i));

    try
      VaComm1.Close;
      VaComm1.DeviceName := ComboBoxComPorts.Text;
      VaComm1.Baudrate := TVaBaudrate.br1200;
      VaComm1.Open;
      VaComm1.Close;
      MemoFirmwareLog.Lines.Add('Reset: '+IntToStr(i));
      Break;
    except
      //wait(1000);
      SleepSky(1000);
    end;

  end;

  //wait(AdvEditDelay.IntValue*1000);
  SleepSky(AdvEditDelay.IntValue*1000);

//  CMD:='"'+ExtractFilePath(Application.ExeName)+'Firmware\avrdude.exe" -cavr109 -P '+ComboBoxLoader.Text+' -pm32u4 -b57600 -U flash:w:'+Edit1.Text+':i';
//  MemoFirmwareLog.Lines.Add(CMD);
//  MemoFirmwareLog.Lines.Add(GetDosOutput(CMD, ExtractFilePath(Application.ExeName)+'Firmware'));
end;
end;

procedure TfOptions.ButtonCalibrateFrequenceClick(Sender: TObject);
var
freq : Cardinal;
power_option, b1, b2, b3, b4 :Byte;
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  set_power_freq(1, AdvEdit_interval.IntValue, 1, AdvEdit_power.IntValue, AdvEdit_frequence.IntValue*100);
  FrequenceCalibration := AdvEdit_frequence.IntValue;

  //set_power(AdvEdit_power.IntValue);

  TimerPower.Enabled := False;

  TimerFrequence.Enabled := False;
  TimerFrequence.Interval := AdvEdit_interval.IntValue * 1000;
  TimerFrequence.Enabled := True;

end;

procedure TfOptions.ButtonCalibratePowerClick(Sender: TObject);
var
freq : Cardinal;
power_option, b1, b2, b3, b4 :Byte;
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  set_power_freq(1, AdvEdit_interval.IntValue, 1, AdvEdit_power.IntValue, AdvEdit_frequence.IntValue*100);

  //set_frequence(AdvEdit_frequence.IntValue*100);
  //set_power(AdvEdit_power.IntValue);

  TimerFrequence.Enabled := False;

  TimerPower.Enabled := False;
  TimerPower.Interval := AdvEdit_interval.IntValue * 1000;
  TimerPower.Enabled := True;

end;

procedure TfOptions.ButtonFirmwareClick(Sender: TObject);
var i,x:Integer;
begin
with fMain do
begin

  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  if FileExists(Edit1.Text)=false then
  begin
    ShowMessage('Файла не съществува на указаното място: '+Edit1.Text);
    Exit;
  end;

  ComboBoxStandartPorts.Clear;
  for x := 1 to 100 do
  begin

    try
      VaComm1.Close;
      VaComm1.Baudrate := TVaBaudrate.br9600;
      VaComm1.DeviceName := 'COM'+IntToStr(x);
      VaComm1.Open;
      ComboBoxStandartPorts.Items.Add('COM'+IntToStr(x));
    except
    end;

  end;
  MemoFirmwareLog.Lines.Add('Found: '+IntToStr(ComboBoxStandartPorts.Items.Count));


  ComboBoxLoader.Clear;
  firmware_flash := 0;

  VaComm1.Close;
  VaComm1.DeviceName := ComboBoxComPorts.Text;
  VaComm1.Baudrate := TVaBaudrate.br1200;
  VaComm1.Open;
  VaComm1.Close;
  MemoFirmwareLog.Lines.Add('Reset com port: '+ComboBoxComPorts.Text);

  //wait(AdvEditDelay.IntValue*1000);
  SleepSky(AdvEditDelay.IntValue*1000);

  for x := 1 to 100 do
  begin
    if ComboBoxStandartPorts.Items.IndexOf('COM'+IntToStr(x)) = -1 then
    try
      VaComm1.Close;
      VaComm1.Baudrate := TVaBaudrate.br9600;
      VaComm1.DeviceName := 'COM'+IntToStr(x);
      VaComm1.Open;
      ComboBoxLoader.Items.Add('COM'+IntToStr(x));
      MemoFirmwareLog.Lines.Add('Found loader com port: COM'+IntToStr(x));
    except
    end;
  end;

  if ComboBoxLoader.Items.Count <= 0 then
  MemoFirmwareLog.Lines.Add('Not Found loader com port');



  for x := 0 to ComboBoxLoader.Items.Count-1 do
  begin

      try
        VaComm1.Close;
        VaComm1.DeviceName := ComboBoxComPorts.Text;
        VaComm1.Baudrate := TVaBaudrate.br1200;
        VaComm1.Open;
        VaComm1.Close;
      except on e:Exception do
      end;

    for I := 1 to AdvEditTry.IntValue do
    begin

      if (firmware_flash=0) then
      begin

        try
          MemoFirmwareLog.Lines.Add(DateTimeToStr(Now)+' Comport '+ComboBoxLoader.Items.Strings[x]+' Try:'+IntToStr(i)+' _ f: '+IntToStr(firmware_flash));

          ComboBoxLoader.Text := ComboBoxLoader.Items.Strings[x];
          VaComm1.Close;
          VaComm1.DeviceName := ComboBoxLoader.Items.Strings[x];
          VaComm1.Baudrate := TVaBaudrate.br57600;
          VaComm1.Open;
          VaComm1.WriteText('V');

        except on e:Exception do
          MemoFirmwareLog.Lines.Add('ver: '+e.Message+' '+IntToStr(i));
        end;

        //wait(1000);
        SleepSky(1000);

        if firmware_flash=1 then ButtonAVR_DudeClick(nil);
      end else
      begin

        if firmware_flash=1 then
        begin
          MemoFirmwareLog.Lines.Add('Стартиране');
          ButtonAVR_DudeClick(nil);
        end;

      end;

    end;

  end;
end;


end;

procedure TfOptions.ButtonFirmwareFileClick(Sender: TObject);
begin
OpenDialogFirmware.Execute();
if FileExists(OpenDialogFirmware.FileName) then
Edit1.Text := OpenDialogFirmware.FileName;
end;

procedure TfOptions.ButtonReadClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  VaComm1.WriteText(Chr(0)+Chr(0)+Chr(26)+chr(8));
end;
end;

procedure TfOptions.ButtonStopCalibrationClick(Sender: TObject);
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  set_power_freq(0, 0, 1, 0, 0);

  TimerPower.Enabled := False;
  TimerFrequence.Enabled := False;

  ButtonBegin.Enabled := True;
 // Memo1.Lines.Add('Спри калибрацията');
end;

procedure stop_test;
begin
with fOptions do
begin
    MemoLogPower.Lines.Add('Спрян теста');
    set_power_freq(0, 0, 1, 0, 0);
end;
end;

procedure TfOptions.ButtonTestDeviceClick(Sender: TObject);
var
  I: Integer;
  wait_prog : Integer;
  wait_stop : integer;
begin
  wait_prog := 6;
  wait_stop := 3;

  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  device_test := True;
  MemoLogPower.Clear;
  if RadioGroupLanguage.ItemIndex = 0 then
  MemoLogPower.Lines.Add('Започва теста') else
  MemoLogPower.Lines.Add('The test starts');

  set_power_freq(0, 0, 1, 0, 0);
  for I := 1 to 10 do
  begin
    if RadioGroupLanguage.ItemIndex = 0 then
    MemoLogPower.Lines.Add('Моля, хванете ръкохватките '+IntToStr(i)+' до 10 сек.') else
    MemoLogPower.Lines.Add('Please hold the handles '+IntToStr(i)+' for up to 10 sec.');

    Application.ProcessMessages;
    if device_test = False then stop_test;
    Sleep(1000);
  end;


  if device_test = False then stop_test;

  set_power_freq(0, 0, 0, 0, Trunc(1 * 100));
  if RadioGroupLanguage.ItemIndex = 0 then
  MemoLogPower.Lines.Add('Честота: '+IntToStr(i)+' от 1000') else
  MemoLogPower.Lines.Add('Frequency: '+IntToStr(i)+' of 1000');

  Application.ProcessMessages;
  Sleep(1000);

  device_test := False;



end;

procedure TfOptions.CheckBoxRXClick(Sender: TObject);
begin
fMain.CheckBoxRX.Checked := CheckBoxRX_D.Checked;
end;

procedure TfOptions.CheckBoxTXClick(Sender: TObject);
begin
fMain.CheckBoxTX.Checked := CheckBoxTX_D.Checked;
end;

procedure TfOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
fOptions := nil;
end;

procedure TfOptions.FormShow(Sender: TObject);
begin
  if fMain.RadioGroupMainLanguage.ItemIndex=0 then
  fOptions.Caption := 'Настройки' else
  fOptions.Caption := 'Settings';

  if Check_Zapper(1) = False then Exit;

  RadioGroupLanguage.ItemIndex := fMain.RadioGroupMainLanguage.ItemIndex;
  RadioGroupLanguageClick(nil);



  grpFirmware.Visible := tmpDebugOptiopns;
  grpDebugOptions.Visible := tmpDebugOptiopns;


  MemoMainLogRX_D.Lines.Text := fMain.MemoMainLogRX.Lines.Text;
  MemoMainLogTX_D.Lines.Text := fMain.MemoMainLogTX.Lines.Text;
  MemoMainLogEvent_D.Lines.Text := fMain.MemoMainLogEvent.Lines.Text;


  if _Wifi=0 then
  begin
    CheckBoxWiFi.Visible := False;
    CheckBoxAP.Visible := False;
    AdvEditAP_sec.Visible := False;

    ButtonRecieveNetworks.Enabled := False;
    ButtonConnectNetwork.Enabled := False;
    ButtonReadSaveNetworks.Enabled := False;
    ButtonReadIP.Enabled := False;
    ButtonHotspotRead.Enabled := False;
    ButtonHotSpotTurnOn.Enabled := False;
    ButtonHotSpotTurnOff.Enabled := False;
    RadioGroupHotspot.Enabled := False;
  end else
  begin
    EditCloud_URL.Text := _cloud_service;
    EditCloud_PORT.Text := _cloud_port;

    EditFactoryPIN.Text := _FactoryPIN;
    EditAdditionalPIN.Text := _AdditionalPIN;

  end;

  with fMain do
  begin

    if Check_Connect(1) = False then begin fOptions.Close; Exit; end;

    if FileExists(xPath+'\vars.ini') then
    grpDebugOptions.Visible := True else
    grpDebugOptions.Visible := False;

    ButtonCalibrateFrequence.Visible := grpDebugOptions.Visible;
    ButtonCalibratePower.Visible := grpDebugOptions.Visible;
    RadioGroupMove.Visible := grpDebugOptions.Visible;


    AdvEdit_duration.IntValue := GLB_Duration;
    RadioGroupFreqOptions.ItemIndex := GLB_Freq;
    RadioGroupZumer.ItemIndex := GLB_Zumer;

    AdvEditSweep.IntValue := GLB_Sweep;
    AdvEditAP_sec.IntValue := GLB_Wifi_AP_Time;
    AdvEditAP_no_activity_sec.IntValue := GLB_Wifi_AP_NoActTime;

    CheckBoxWiFi.Checked := Get_a_Bit(GLB_Wifi, 1);
    CheckBoxAP.Checked := Get_a_Bit(GLB_Wifi, 0);

    RadioGroupSearch.ItemIndex := ADOQueryOptions.FieldByName('search').AsInteger;

    if Check_Zapper(0) then
    ButtonGeneralReadClick(nil);

    if Check_ZapperWiFi(0) then
    begin
    ButtonHotspotReadClick(nil);
    ButtonReadIPClick(nil);
    ButtonRecieveNetworksClick(nil);
    end;

  end;
end;

procedure TfOptions.N1Click(Sender: TObject);
begin

          {
SendMail( StringReplace(fMain.StatusBar1.Panels[0].Text, 'Модел Запер: ', '', [rfReplaceAll])
+' ', 'SKY Zapper',
fMain.StatusBar1.Panels[2].Text+#13+
fMain.StatusBar1.Panels[3].Text+#13+
fMain.StatusBar1.Panels[4].Text+#13+#13+
MemoFirmwareLog.Lines.Text,
'softdev@sky.bg', '', '', '');

    }


end;

procedure TfOptions.N21Click(Sender: TObject);
begin
       {
SendMail(
StringReplace(fMain.StatusBar1.Panels[0].Text, 'Модел Запер: ', '', [rfReplaceAll])
, 'SKY Zapper',
fMain.StatusBar1.Panels[2].Text+#13+
fMain.StatusBar1.Panels[3].Text+#13+
fMain.StatusBar1.Panels[4].Text+#13+#13+
MemoMainLogEvent_D.Lines.Text,
'softdev@sky.bg', '', '', '');
}

end;

procedure TfOptions.RadioGroupLanguageClick(Sender: TObject);
begin


  case RadioGroupLanguage.ItemIndex of
  0:begin //BG
      TabSheet1.Caption := 'Общи настройки';
      ButtonGeneralSave.Caption := 'ЗАПИШИ НАСТРОЙКИ';
      ButtonGeneralRead.Caption := 'ПРОЧЕТИ НАСТРОЙКИ';
      AdvEdit_duration.LabelCaption := 'Времетраене на всяка честота (сек.)';
      AdvEditSweep.LabelCaption := 'Време за плавен преход между две честоти (сек.)';
      RadioGroupZumer.Caption := 'Настройки за звук';
      RadioGroupZumer.Items.Text := 'Без звук'+#13+'При смяна на програма'+#13+'При смяна на програма и честота';
      RadioGroupSearch.Caption := 'Търсене в:';
      RadioGroupSearch.Items.Text := 'Група, програма и описание'+#13+'Програма и описание'+#13+'Група и описание';
      Labelt1_program_save.Caption := 'Програми запазени за бързо избиране от бутон';

      TabSheet4.Caption := 'WiFi - Безжични настройки';
      ButtonRecieveNetworks.Caption := 'Получаване на безжични мрежи';
      LabelWiFiNetworks.Caption := 'Безжични мрежи';
      cxGridDBTableView2name.Caption := 'Безжични мрежи';
      LabelWiFiPassword.Caption := 'Парола за връзка (Ако има такава)';
      ButtonConnectNetwork.Caption := 'Свързване към безжична мрежа';
      ButtonReadSaveNetworks.Caption := 'Прочитане на запазани мрежи';
      ButtonReadIP.Caption := 'Прочитане на локално IP и мрежа';
      CheckBoxWiFi.Caption := 'Включи WiFi при стартиране на запера';
      CheckBoxAP.Caption := 'Изключи AP след стартиране на програма';
      AdvEditAP_sec.LabelCaption := 'Времетраене за изключване на AP след започване на програма (сек.)';
      AdvEditAP_no_activity_sec.LabelCaption := 'Времетраене за изключване на AP при неактивност (сек.)';
      LabelHotSpot1.Caption := 'Hotspot е безжична мрежа за връзка от телефон, таблет, лаптоп или други мобилни устройства.';
      LabelHotSpot2.Caption := '* Ако не се вържете към тази мрежа, ще се изключи автоматично на 5-та минута';
      ButtonHotSpotTurnOn.Caption := 'Включи HotSpot';
      ButtonHotSpotTurnOff.Caption := 'Изключи HotSpot';
      RadioGroupHotspot.Items.Text := 'Изключено'+#13+'Включено';
      ButtonWiFiSave.Caption := 'Запиши';

      TabSheet2.Caption := 'Настройка на мощността';
      AdvEdit_frequence.LabelCaption := 'Честота';
      AdvEdit_frequence_interval.LabelCaption := 'Стъпка';
      AdvEdit_power.LabelCaption := 'Мощност';
      AdvEdit_interval.LabelCaption := 'Интервал сек.';
      RadioGroupMove.Items.Text := 'Увеличаване'+#13+'Намаляване';
      ButtonBegin.Caption := 'Започни настройка на мощността';
      LabelDescription.Caption := 'За да направите настройка на мощността на Запера спрямо Вашите лични усещания натиснете бутона "Започни настройка на мощността" и вземете ръкохватките.';
      ButtonOK_no_more.Caption := 'ОК до тук';
      ButtonStopCalibration.Caption := 'Спри';
      ButtonNextStep.Caption := 'Следваща стъпка';
      ButtonCalibrateFrequence.Caption := 'Тест по честота';
      ButtonCalibratePower.Caption := 'Тест по мощност';
      ButtonTestDevice.Caption := 'Тест на уреда';
      ButtonStopTest.Caption := 'Стоп на теста';
      ButtonFactoryReset.Caption := 'Фабрични настройки';

      TabSheet3.Caption := '...';
      ButtonFirmwareFile.Caption := 'Избери файл';
      AdvEditDelay.LabelCaption := 'Изчакване секунди (1..7)';
      AdvEditTry.LabelCaption := 'Колко опита за разпознаване (1..7)';
      ButtonFirmware.Caption := 'Запиши Firmware';

      TabSheet5.Caption := 'Дебъгване';
      ButtonExit.Caption := 'ЗАТВОРИ';

      LabelCloudAddress.Caption := 'Адрес за комуникация с CLOUD услугата';
      LabelFactoryPIN.Caption := 'Фабричен ПИН';
      LabelAdditionalPIN.Caption := 'Допълнителен ПИН';


  end;
  1:begin //EN
      TabSheet1.Caption := 'General settings';
      ButtonGeneralSave.Caption := 'SAVE OPTIONS';
      ButtonGeneralRead.Caption := 'READ OPTIONS';
      AdvEdit_duration.LabelCaption := 'Duration of each frequency (sec.)';
      AdvEditSweep.LabelCaption := 'Smooth transition time between two frequencies (sec.)';
      RadioGroupZumer.Caption := 'Sound settings';
      RadioGroupZumer.Items.Text := 'Without sound'+#13+'When changing the program'+#13+'When changing program and frequency';
      RadioGroupSearch.Caption := 'Search in:';
      RadioGroupSearch.Items.Text := 'Group, program and description'+#13+'Program and description'+#13+'Group and description';

      Labelt1_program_save.Caption := 'Programs reserved for quick button selection';

      TabSheet4.Caption := 'Wireless settings';
      ButtonRecieveNetworks.Caption := 'Receiving wireless networks';
      LabelWiFiNetworks.Caption := 'Wireless networks';
      cxGridDBTableView2name.Caption := 'Wireless networks';
      LabelWiFiPassword.Caption := 'Connection password';
      ButtonConnectNetwork.Caption := 'Connecting to a wireless network';
      ButtonReadSaveNetworks.Caption := 'Read saved networks';
      ButtonReadIP.Caption := 'Read local IP ';
      CheckBoxWiFi.Caption := 'Turn on WiFi when starting the zapper';
      CheckBoxAP.Caption := 'Turn off the AP after starting a program';
      AdvEditAP_sec.LabelCaption := 'AP shutdown time after program start (sec.)';
      AdvEditAP_no_activity_sec.LabelCaption := 'AP Idle Shutdown Timeout (sec.)';
      LabelHotSpot1.Caption := 'A hotspot is a wireless network for connecting from a phone, tablet, laptop or other mobile devices.';
      LabelHotSpot2.Caption := '* If you do not connect to this network, it will turn off automatically at 5 minutes';
      ButtonHotSpotTurnOn.Caption := 'Turn on HotSpot';
      ButtonHotSpotTurnOff.Caption := 'Turn off HotSpot';
      RadioGroupHotspot.Items.Text := 'On'+#13+'Off';
      ButtonWiFiSave.Caption := 'Save';

      TabSheet2.Caption := 'Power setting';
      AdvEdit_frequence.LabelCaption := 'Frequency';
      AdvEdit_frequence_interval.LabelCaption := 'A step';
      AdvEdit_power.LabelCaption := 'Power';
      AdvEdit_interval.LabelCaption := 'Interval sec.';
      RadioGroupMove.Items.Text := 'Increase'+#13+'Decrease';
      ButtonBegin.Caption := 'Start power setting';
      LabelDescription.Caption := 'To adjust the power of the Zapper according to your personal feelings, press the button "Start power adjustment" and take the handles.';
      ButtonOK_no_more.Caption := 'OK so far';
      ButtonStopCalibration.Caption := 'Stop it';
      ButtonNextStep.Caption := 'Next step';
      ButtonCalibrateFrequence.Caption := 'Frequency test';
      ButtonCalibratePower.Caption := 'Power test';
      ButtonTestDevice.Caption := 'Device test';
      ButtonStopTest.Caption := 'Stop the test';
      ButtonFactoryReset.Caption := 'Factory settings';

      TabSheet3.Caption := '...';
      ButtonFirmwareFile.Caption := 'Choose a file';
      AdvEditDelay.LabelCaption := 'Wait seconds (1..7)';
      AdvEditTry.LabelCaption := 'How many recognition attempts (1..7)';
      ButtonFirmware.Caption := 'Save Firmware';

      TabSheet5.Caption := 'Debugging';
      ButtonExit.Caption := 'CLOSE';


      LabelCloudAddress.Caption := 'Address for communication with the CLOUD service';
      LabelFactoryPIN.Caption := 'Factory PIN';
      LabelAdditionalPIN.Caption := 'Additional PIN';

  end;
  end;

end;

procedure TfOptions.TimerWiFiReadTimer(Sender: TObject);
begin
tmpGLB_count := tmpGLB_count +1;
ButtonReadIPClick(nil);
if tmpGLB_count>=15 then TimerWiFiRead.Enabled:=False;
end;

procedure TfOptions.TimerFrequenceTimer(Sender: TObject);
var
freq : Cardinal;
b1, b2, b3, b4 :Byte;
begin


  if RadioGroupMove.ItemIndex = 0 then
  FrequenceCalibration := FrequenceCalibration + (FrequenceCalibration * AdvEdit_frequence_interval.IntValue / 100) else
  FrequenceCalibration := FrequenceCalibration - (FrequenceCalibration * AdvEdit_frequence_interval.IntValue / 100);

  AdvEdit_frequence.IntValue := Trunc(FrequenceCalibration);

  if ((AdvEdit_frequence.IntValue >= 1) AND (AdvEdit_frequence.IntValue <= 2000000)) then //2Mhz
  begin

    set_power_freq(1, AdvEdit_interval.IntValue, 1, AdvEdit_power.IntValue, AdvEdit_frequence.IntValue*100);
  end else
  begin
    ButtonStopCalibration.Click;
  end;

  if tmpCalibration >= 1 then
  begin



    if (tmpCalibration=1) AND (AdvEdit_frequence.IntValue < 1000) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота: Над 1000 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 2;    end;

    if (tmpCalibration=2) AND (AdvEdit_frequence.IntValue < 900) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота: 1000 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 3;    end;

    if (tmpCalibration=3) AND (AdvEdit_frequence.IntValue < 800) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   900 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 4;    end;

    if (tmpCalibration=4) AND (AdvEdit_frequence.IntValue < 700) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   800 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 5;    end;

    if (tmpCalibration=5) AND (AdvEdit_frequence.IntValue < 600) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   700 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 6;    end;

    if (tmpCalibration=6) AND (AdvEdit_frequence.IntValue < 500) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   600 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 7;    end;

    if (tmpCalibration=7) AND (AdvEdit_frequence.IntValue < 400) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   500 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 8;    end;

    if (tmpCalibration=8) AND (AdvEdit_frequence.IntValue < 300) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   400 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 9;    end;

    if (tmpCalibration=9) AND (AdvEdit_frequence.IntValue < 200) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   300 Hz. мощност: '+AdvEdit_power.Text+'%');     tmpCalibration := 10;    end;

    if (tmpCalibration=10) AND (AdvEdit_frequence.IntValue < 100) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   200 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 11;    end;

    if (tmpCalibration=11) AND (AdvEdit_frequence.IntValue <= 1) then
    begin MemoLogPower.Lines.Add(LabelStep.Caption+', честота:   100 Hz. мощност: '+AdvEdit_power.Text+'%');      tmpCalibration := 12;

      if Length(IntToStr(tmpCalibration))=1 then
      LabelStep.Caption := 'СТЪПКА   '+IntToStr(tmpCalibration)+' от 12' else
      LabelStep.Caption := 'СТЪПКА '+IntToStr(tmpCalibration)+' от 12';

      //MemoLogPower.Lines.Add('Приключи - '+LabelStep.Caption+' честота: 1 мощност: '+AdvEdit_power.Text);
      ButtonOK_no_moreClick(nil);
    end;

      if Length(IntToStr(tmpCalibration))=1 then
      LabelStep.Caption := 'СТЪПКА   '+IntToStr(tmpCalibration)+' от 12' else
      LabelStep.Caption := 'СТЪПКА '+IntToStr(tmpCalibration)+' от 12';

  end;


end;

procedure TfOptions.TimerPowerTimer(Sender: TObject);
var
power_option : byte;
begin

  if RadioGroupMove.ItemIndex = 0 then
  AdvEdit_power.IntValue := AdvEdit_power.IntValue + AdvEdit_power_interval.IntValue else
  AdvEdit_power.IntValue := AdvEdit_power.IntValue - AdvEdit_power_interval.IntValue;

  if ((AdvEdit_power.IntValue >= 1) AND (AdvEdit_power.IntValue <= 100)) then
  begin
    set_power_freq(1, AdvEdit_interval.IntValue, 1, AdvEdit_power.IntValue, AdvEdit_frequence.IntValue*100);
  end else
  begin

  if AdvEdit_power.IntValue >= 100 then
  AdvEdit_power.IntValue := 100;

    if tmpCalibration >= 1 then
    begin
    ButtonOK_no_more.Click;
    ButtonNextStep.Click;
    end else
    ButtonStopCalibration.Click;


  end;

end;

end.
