unit uProgram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCurrencyEdit,
  cxDBLookupComboBox, Vcl.ExtCtrls, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, AdvEdit, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands,
  ppCache, ppDesignLayer, ppParameter, IdGlobal, ppBarCode2D, adodb,
  dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog, MemDS,
  VirtualTable, cxGridExportLink;

type
  TfProgram = class(TForm)
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3category_name_BG: TcxGridDBColumn;
    cxGridDBTableView3category_name_EN: TcxGridDBColumn;
    cxGridDBTableView3favorite: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    ButtonProgram_for_WiFi: TButton;
    ButtonProgram_for_9prog: TButton;
    ButtonWrite: TButton;
    btn1: TButton;
    chkAllPrograms: TCheckBox;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabelRed1: TppLabel;
    ppLabelRed2: TppLabel;
    ppLabelRed3: TppLabel;
    ppLabelRed4: TppLabel;
    ppLabelBlue1: TppLabel;
    ppLabelBlue2: TppLabel;
    ppLabelBlue3: TppLabel;
    ppLabelBlue4: TppLabel;
    ppLabelGreen1: TppLabel;
    ppLabelGreen2: TppLabel;
    ppLabelGreen3: TppLabel;
    ppLabelGreen4: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLine16: TppLine;
    ppLabel14: TppLabel;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppLabel15: TppLabel;
    ppLine17: TppLine;
    TimerOnlyTime: TTimer;
    cxGridDBTableView3quantity: TcxGridDBColumn;
    ppLabel16: TppLabel;
    ppLabel_1: TppLabel;
    ppLabel_2: TppLabel;
    ppLabel_3: TppLabel;
    ppLabel_4: TppLabel;
    ppLabel_5: TppLabel;
    ppLabel_6: TppLabel;
    ppLabel_7: TppLabel;
    ppLabel_8: TppLabel;
    ppLabel_0: TppLabel;
    cxGridDBTableView3ID: TcxGridDBColumn;
    Button1: TButton;
    Button2: TButton;
    GroupBoxNavigation: TGroupBox;
    LabelAlert: TLabel;
    RadioGroupLanguage: TRadioGroup;
    ButtonPlayProgram: TButton;
    CheckBoxRepeat: TCheckBox;
    ButtonShowAll: TButton;
    ButtonStopProgram: TButton;
    ButtonPrograming: TButton;
    ButtonShowQuickOnly: TButton;
    ProgressBar1: TProgressBar;
    ButtonPause: TButton;
    ButtonPrint: TButton;
    ButtonShowQuickWeb: TButton;
    ButtonPlayGroup: TButton;
    CheckBoxNoEqualFreq: TCheckBox;
    ButtonExit: TButton;
    PanelContent: TPanel;
    GroupBoxHeaderBar: TGroupBox;
    LabelSearch: TLabel;
    LabelSearchFreq: TLabel;
    EditSearch: TEdit;
    ButtonSearch: TButton;
    EditFreq: TEdit;
    ButtonSearchOnFreq: TButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1name_en: TcxGridDBColumn;
    cxGrid1DBTableView1name_bg: TcxGridDBColumn;
    cxGrid1DBTableView1Favorite: TcxGridDBColumn;
    cxGrid1DBTableView1description_en: TcxGridDBColumn;
    cxGrid1DBTableView1description_bg: TcxGridDBColumn;
    cxGrid1DBTableView1Count: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    MemoDescription: TMemo;
    Panel1: TPanel;
    GroupBoxHeader: TGroupBox;
    AdvEditDuration: TAdvEdit;
    ButtonChangeFreq: TButton;
    ButtonChangeAll: TButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ButtonRefreshFreq: TButton;
    cxGridDBTableView3Type: TcxGridDBColumn;
    cxGridDBTableView3Pause: TcxGridDBColumn;
    cxGridDBTableView3Repeat: TcxGridDBColumn;
    cxGridDBTableView3Cycle: TcxGridDBColumn;
    GroupBox2: TGroupBox;
    LabelProgram: TLabel;
    LabelCategory: TLabel;
    LabelFrequence: TLabel;
    LabelPause: TLabel;
    LabelCategory_Time: TLabel;
    LabelProgram_Time: TLabel;
    RadioGroupPlayType: TRadioGroup;
    LabelAllCycles: TLabel;
    LabelFrequence_Time: TLabel;
    LabelPause_Time: TLabel;
    LabelAllCycles_Time: TLabel;
    ButtonSavePrograms: TButton;
    ButtonPrepareBuffer: TButton;
    AdvEditBufferCount: TAdvEdit;
    ButtonStartSendingBuffer: TButton;
    ButtonSendingBuffer: TButton;
    ButtonFinished: TButton;
    AdvEditBlockPos: TAdvEdit;
    AdvEditBlockMax: TAdvEdit;
    MemoPersonalList: TMemo;
    ADOQueryCategory_BUFFER: TADOQuery;
    ADOQueryDiseases_BUFFER: TADOQuery;
    ADOQueryFreq_BUFFER: TADOQuery;
    ADOQuerySQL: TADOQuery;
    AdvEditRepeatList: TAdvEdit;
    AdvEditBreakProgram: TAdvEdit;
    AdvEdit_pause_repeat_cycle: TAdvEdit;
    cxGridDBTableView3User_access: TcxGridDBColumn;
    procedure ButtonRefreshFreqClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ButtonShowAllClick(Sender: TObject);
    procedure ButtonShowQuickOnlyClick(Sender: TObject);
    procedure RadioGroupLanguageClick(Sender: TObject);
    procedure ButtonPlayProgramClick(Sender: TObject);
    procedure ButtonStopProgramClick(Sender: TObject);
    procedure ButtonProgramingClick(Sender: TObject);
    procedure ButtonWriteClick(Sender: TObject);
    procedure ButtonProgram_for_9progClick(Sender: TObject);
    procedure ButtonProgram_for_WiFiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditSearchChange(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ButtonPauseClick(Sender: TObject);
    procedure ButtonChangeFreqClick(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure ButtonPrintClick(Sender: TObject);
    procedure TimerOnlyTimeTimer(Sender: TObject);
    procedure ButtonShowQuickWebClick(Sender: TObject);
    procedure ButtonSearchOnFreqClick(Sender: TObject);
    procedure ButtonPlayGroupClick(Sender: TObject);
    procedure ButtonChangeAllClick(Sender: TObject);
    procedure cxGridDBTableView1Column3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure ButtonExitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonSaveProgramsClick(Sender: TObject);
    procedure ButtonPrepareBufferClick(Sender: TObject);
    procedure ButtonStartSendingBufferClick(Sender: TObject);
    procedure ButtonSendingBufferClick(Sender: TObject);
    procedure ButtonFinishedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProgram: TfProgram;
  cloud_program_id, cloud_cat_id : Integer;


implementation
uses uMain, dateutils, math;

{$R *.dfm}




procedure DrowButtonPause();
begin

  if fMain.RadioGroupMainLanguage.ItemIndex = 0 then
  begin
    if state_pause = 0 then //пускане на пауза
    fProgram.ButtonPause.Caption := 'ПАУЗА' else
    fProgram.ButtonPause.Caption := 'ПРОДЪЛЖИ';
  end else
  begin
    if state_pause = 0 then //пускане на пауза
    fProgram.ButtonPause.Caption := 'PAUSE' else
    fProgram.ButtonPause.Caption := 'CONTINUE';
  end;

end;


procedure TfProgram.btn1Click(Sender: TObject);
var catname :string;
l,n2x:Integer;
begin

{
        catname := fMain.ADOQueryDiseases.FieldByName('name_bg').AsString;
        n2x := Ord(catname[1]);

              ShowMessage(

              IntToStr(n2x)+    #13+
              IntToStr(Byte(n2x))+#13+
              IntToStr(Byte(n2x shr 8))+#13+

              IntToHex(Byte(n2x),2)+#13+
              IntToHex(Byte(n2x shr 8),2)+#13


              );
              }


while not fMain.ADOQueryCategory.Eof do
begin
   if Length(fMain.ADOQueryCategory.FieldByName('category_name_BG').AsString) >= 40 then ShowMessage('categori bg ');
   if Length(fMain.ADOQueryCategory.FieldByName('category_name_EN').AsString) >= 40 then ShowMessage('categori en ');

   fMain.ADOQueryCategory.Next;
end;

fMain.ADOQueryDiseases.First;
while not fMain.ADOQueryDiseases.Eof do
begin
   if Length(fMain.ADOQueryDiseases.FieldByName('name_bg').AsString) >= 80 then ShowMessage('desises bg ');
   if Length(fMain.ADOQueryDiseases.FieldByName('name_en').AsString) >= 80 then ShowMessage('desises en ');

   fMain.ADOQueryDiseases.Next;
end;

end;

procedure TfProgram.ButtonShowAllClick(Sender: TObject);
var
  order_category, order_program, OrderCategory : string;
begin
with fMain do
begin

  case RadioGroupLanguage.ItemIndex of
  0:OrderCategory := ' ORDER BY type_id DESC, sort, category_name_BG';
  1:OrderCategory := ' ORDER BY type_id DESC, sort, category_name_EN';
  end;

  if LoginUser=1 then
  begin
    ADOQueryCategory.SQL.Text := 'SELECT * FROM category '+OrderCategory;
    ADOQueryCategory.Open;
  end else
  begin
    ADOQueryCategory.SQL.Text := 'SELECT * FROM category WHERE type_id <= 0 OR (user_id='+IntToStr(LoginUser)+')'+OrderCategory;
    ADOQueryCategory.Open;
  end;


  if RadioGroupLanguage.ItemIndex=0 then
  order_program := 'ORDER BY sort, name_bg' else
  order_program := 'ORDER BY sort, name_en';


  ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases '+order_program;
  ADOQueryDiseases.Open;

  ButtonRefreshFreqClick(nil); //show all
end;
end;

procedure TfProgram.ButtonSaveProgramsClick(Sender: TObject);
begin

  if MessageDlg('Сигурни ли сте, че искате да обновите добавените програми в Ска Запер', mtConfirmation, mbYesNo, 0) = mrYes then
  begin

    fMain.ButtonClearClick(nil);
    ButtonPrepareBufferClick(nil);
    ButtonStartSendingBufferClick(nil);

  end;

end;

procedure TfProgram.ButtonSearchClick(Sender: TObject);
type
  Win1251String = type AnsiString(1251);
var
  len, lenPack, i : Integer;
  order_cat,
  order_des, tmpDescription, tmpGrupi : string;
  tmpSearch : Win1251String;
begin
with fMain do
begin
  len := Length(EditSearch.Text);

  if RadioGroupLanguage.ItemIndex=0 then
  begin
    order_cat := 'ORDER BY category_name_bg';
    order_des := 'ORDER BY name_bg';
  end else
  begin
    order_cat := 'ORDER BY category_name_en';
    order_des := 'ORDER BY name_en';
  end;
  tmpDescription := '';
  tmpGrupi := '';


  if Length(EditSearch.Text) >= 3 then
  begin

    tmpSearch := Win1251String(EditSearch.Text);
    lenPack := Length(tmpSearch);
    SetLength(_Send_UDP, lenPack + 10);

    _Send_UDP[0] := 3; //program
    _Send_UDP[1] := 0;
    _Send_UDP[2] := 26;
    _Send_UDP[3] := 120;
    _Send_UDP[4] := 5; //SRC

    for I := 5 to lenPack+5 do begin
    _Send_UDP[i] := Ord(tmpSearch[i-4]);  end; //ShowMessage('bukva: '+tmpSearch[i-9])

    _Send_UDP[lenPack+5] := 0;

    _Send_UDP[lenPack+6] := M_b1;
    _Send_UDP[lenPack+7] := M_b2;
    _Send_UDP[lenPack+8] := M_b3;
    _Send_UDP[lenPack+9] := M_b4;

    SEND_Cloud(_Send_UDP);

  end;

{
0-Група, програма и описание
1-Програма и описание
2-Програма
}

  case ADOQueryOptions.FieldByName('search').AsInteger of
  0:begin
     tmpGrupi := '1';
     tmpDescription := '1';
  end;
  1:begin
     tmpGrupi := '0';
     tmpDescription := '1';
  end;
  2:begin
     tmpGrupi := '0';
     tmpDescription := '0';
  end;
  end;


  if len = 0 then
  begin

    if tmpGrupi = '1' then
    begin
    //  ADOQueryCategory.SQL.Text := 'SELECT * FROM category '+order_cat;
    //  ADOQueryCategory.Open;
    end;

    ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases '+order_des;
    ADOQueryDiseases.Open;

  end else
  begin

    if tmpGrupi = '1' then
    begin
      ADOQueryCategory.SQL.Text := 'SELECT * FROM category WHERE category_name_BG LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' OR category_name_EN LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' '+order_cat;
      ADOQueryCategory.Open;
    end;

    if tmpDescription = '1' then
    begin
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE name_en LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' OR name_bg LIKE '+#39+'%'+EditSearch.Text+'%'+#39+
                                                          ' OR description_en LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' OR description_bg LIKE '+#39+'%'+EditSearch.Text+'%'+#39+order_des;
      ADOQueryDiseases.Open;
    end else
    begin
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE name_en LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' OR name_bg LIKE '+#39+'%'+EditSearch.Text+'%'+#39+ order_des;
      ADOQueryDiseases.Open;
    end;

  end;

end;
end;

procedure TfProgram.ButtonStartSendingBufferClick(Sender: TObject);
begin

  MemoDescription.Lines.Add('Изпращане на пакет за изчистване на буфера!');

  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 50;

  SendBufferToLAN(4);
  LAN_PARSE_BUFF('LAN - START BLOCK', 4);

end;

procedure TfProgram.ButtonStopProgramClick(Sender: TObject);
var
b1,b2,b3,b4:Byte;
begin
with fMain do
begin

  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  LabelAllCycles.Caption := 'Всички повторения';
  LabelAllCycles_Time.Caption := '0:00:00';
  LabelCategory.Caption := 'Категория';
  LabelCategory_Time.Caption := '0:00:00';
  LabelProgram.Caption := 'Програма';
  LabelProgram_Time.Caption := '0:00:00';
  LabelFrequence.Caption := 'Честота';
  LabelFrequence_Time.Caption := '0:00:00';
  LabelPause.Caption := 'Пауза';
  LabelPause_Time.Caption := '0:00:00';

  LabelAllCycles.Visible := True;
  LabelAllCycles_Time.Visible := True;
  LabelCategory.Visible := True;
  LabelCategory_Time.Visible := True;

  ButtonPlayProgram.Visible := True;
  ButtonPlayGroup.Visible := True;
  ButtonPause.Visible := False;

  Clear_Frequences;
  ButtonRefreshFreqClick(nil); //stop button

  ButtonPause.Enabled := False; //изключва бутона
  TimerOnlyTime.Enabled := False; //Спира отброяването на време

  set_power_freq(0, 0, 1, 0, 0);

  b1 := byte(cloud_cat_id);
  b2 := byte(cloud_cat_id shr 8);
  b3 := byte(cloud_program_id);
  b4 := byte(cloud_program_id shr 8);
  SEND_Cloud([3, 0, 26, 92, b1, b2, b3, b4, 3, m_b1, m_b2, m_b3, m_b4]);

  state_pause := 0;
  DrowButtonPause();

end;
end;

procedure TfProgram.ButtonShowQuickWebClick(Sender: TObject);
var tmpFilterProgram, tmpFilterCategory:string;
  I: Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_ZapperWiFi(1) = False then Exit;

  ListBoxCategoriesIDs.Clear;
  ListBoxProgramIDs.Clear;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 25; //fast programs
  VaComm1.WriteBuf(USB_Buffer, 4);
  PARSE_BUFF('Изпращане на команда за бързи програми', 4);

  //wait(30);
  SleepSky(30);
  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 26; //fast categories
  VaComm1.WriteBuf(USB_Buffer, 4);
  PARSE_BUFF('Изпращане на команда за бързи категории', 4);

  //wait(200);
  SleepSky(200);

  tmpFilterProgram := '';
  tmpFilterCategory := '';


  for I := 0 to ListBoxCategoriesIDs.Items.Count-1 do
  begin
    if tmpFilterCategory = '' then
    tmpFilterCategory := ListBoxCategoriesIDs.Items.Strings[i] else
    tmpFilterCategory := tmpFilterCategory + ', '+ListBoxCategoriesIDs.Items.Strings[i];
  end;

  for I := 0 to ListBoxProgramIDs.Items.Count-1 do
  begin
    if tmpFilterProgram = '' then
    tmpFilterProgram := ListBoxProgramIDs.Items.Strings[i] else
    tmpFilterProgram := tmpFilterProgram + ', '+ListBoxProgramIDs.Items.Strings[i];
  end;

  if tmpFilterCategory = '' then tmpFilterCategory := '0';
  tmpFilterCategory := ' WHERE id IN ('+tmpFilterCategory+')';

  if tmpFilterProgram = '' then tmpFilterProgram := '0';
  tmpFilterProgram := ' WHERE id IN ('+tmpFilterProgram+')';


  if RadioGroupLanguage.ItemIndex=0 then
  ADOQueryCategory.SQL.Text := 'SELECT * FROM category '+tmpFilterCategory+' ORDER BY category_name_bg' else
  ADOQueryCategory.SQL.Text := 'SELECT * FROM category '+tmpFilterCategory+' ORDER BY category_name_en';
  ADOQueryCategory.Open;

  if RadioGroupLanguage.ItemIndex = 0 then
  ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases '+tmpFilterProgram+' ORDER BY name_bg' else
  ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases '+tmpFilterProgram+' ORDER BY name_en';
  ADOQueryDiseases.Open;


end;
end;

procedure TfProgram.ButtonSearchOnFreqClick(Sender: TObject);
var
  order_des : string;
begin
with fMain do
begin
  if RadioGroupLanguage.ItemIndex=0 then
  order_des := 'ORDER BY sort, name_bg'  else
  order_des := 'ORDER BY sort, name_en';

  ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE ID IN (SELECT disease_id FROM freq WHERE freq = :P1) '+order_des;
  ADOQueryDiseases.Parameters.Clear;
  ADOQueryDiseases.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, EditFreq.Text);
  ADOQueryDiseases.Open;

end;
end;

procedure TfProgram.ButtonSendingBufferClick(Sender: TObject);
var
x, pos, block_position, block_maximum, tmpLengthBuffer, block_position_addr:Integer;
begin

  fprogram.MemoDescription.Lines.Add('Изпращане на пакет: '+AdvEditBlockPos.Text + ' / ' + AdvEditBlockMax.Text);

  block_position := AdvEditBlockPos.IntValue;
  block_maximum := AdvEditBlockMax.IntValue;

//  if block_position >= 1 then block_position := block_position + 1;

  block_position_addr := block_position; // + 1;

  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 51;
  USB_Buffer[5] := byte(block_position_addr);
  USB_Buffer[6] := byte(block_position_addr shr 8);
  USB_Buffer[7] := byte(block_position_addr shr 16);
  USB_Buffer[8] := byte(block_position_addr shr 24);

  tmpLengthBuffer := block_maximum - block_position;

  if tmpLengthBuffer >= AdvEditBufferCount.IntValue then tmpLengthBuffer := AdvEditBufferCount.IntValue;

  MemoPersonalList.Lines.Add('SEND: '+IntToStr(tmpLengthBuffer));

  pos := 8;

  for x := 0 to tmpLengthBuffer do
  begin

    pos := pos + 1;

    if block_position >= 1 then
    USB_Buffer[ pos ] := buff[block_position + x] else
    USB_Buffer[ pos ] := buff[block_position + x];

  end;

  SendBufferToLAN(pos);
  LAN_PARSE_BUFF('LAN - STOP BLOCK sending position: '+IntToStr(AdvEditBlockPos.IntValue), pos);

  AdvEditBlockPos.IntValue := AdvEditBlockPos.IntValue + AdvEditBufferCount.IntValue;

  if AdvEditBlockPos.IntValue >= AdvEditBlockMax.IntValue then
  MemoPersonalList.Lines.Add('Everything is sending of bytes!');


end;

function BytesToHex(const Buffer: TIdBytes): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Length(Buffer) - 1 do
    Result := Result + IntToHex(Buffer[I], 2) + ' ';
end;

procedure TfProgram.Button1Click(Sender: TObject);
var
  _Buffer : TIdBytes;
  Frequence, ManSweep, ManPower : Integer;
begin
with fMain do
begin

  try

    ManSweep := 0;
    ManPower := 0;

    Frequence := StrToInt(EditFreq.Text)*100;
    SetLength(_Buffer, 12);

    _Buffer[0] := 0;
    _Buffer[1] := 2;
    _Buffer[2] := 26;
    _Buffer[3] := 10; //calibate command
    _Buffer[4] := ManSweep;
    _Buffer[5] := ManPower;
    _Buffer[6] := byte(Frequence);
    _Buffer[7] := byte(Frequence shr 8);
    _Buffer[8] := byte(Frequence shr 16);
    _Buffer[9] := byte(Frequence shr 24);
    _Buffer[10] := 0;
    _Buffer[11] := 0;

    MemoDescription.Lines.Add( BytesToHex(_Buffer) );
    //IdUDPServer1.SendBuffer(LAN_Connection_IP, 7800, _Buffer); //'192.168.7.125'

  except on e:exception do
   ShowMessage('ERROR: '+e.Message);
  end;

end;
end;

procedure TfProgram.Button2Click(Sender: TObject);
var
  _Buffer : TIdBytes; //array[0..12] of byte;
  Frequence, ManSweep, ManPower : Integer;
begin
with fMain do
begin

  try

  ManSweep := 0;
  ManPower := 1;

  Frequence := 0;
  SetLength(_Buffer, 12);

  _Buffer[0] := 0;
  _Buffer[1] := 2;
  _Buffer[2] := 26;
  _Buffer[3] := 10; //calibate command
  _Buffer[4] := ManSweep;
  _Buffer[5] := ManPower;
  _Buffer[6] := byte(Frequence);
  _Buffer[7] := byte(Frequence shr 8);
  _Buffer[8] := byte(Frequence shr 16);
  _Buffer[9] := byte(Frequence shr 24);
  _Buffer[10] := 0;
  _Buffer[11] := 0;


  MemoDescription.Lines.Add( BytesToHex(_Buffer) );
  //IdUDPServer1.SendBuffer(LAN_Connection_IP, 7800, _Buffer);


  except on e:exception do
   ShowMessage('ERROR COMUNICATION CLOUD: '+e.Message);
  end;

end;
end;

procedure TfProgram.ButtonChangeAllClick(Sender: TObject);
begin
with fMain do
begin


  ADOQueryFreq.First;
  while not ADOQueryFreq.Eof do
  begin
    ADOQueryFreq.Edit;
    ADOQueryFreq.FieldByName('time_sec').AsInteger := AdvEditDuration.IntValue;
    ADOQueryFreq.Post;
    Refresh_Frequences(ADOQueryDiseases.FieldByName('id').AsString);

    ADOQueryFreq.Next;
  end;



end;
end;

procedure TfProgram.ButtonChangeFreqClick(Sender: TObject);
begin
with fMain do
begin
  ADOQueryFreq.Edit;
  ADOQueryFreq.FieldByName('time_sec').AsInteger := AdvEditDuration.IntValue;
  ADOQueryFreq.Post;
  Refresh_Frequences(ADOQueryDiseases.FieldByName('id').AsString);
end;
end;

procedure TfProgram.ButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TfProgram.ButtonFinishedClick(Sender: TObject);
begin

  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 52;

  SendBufferToLAN(4);
  LAN_PARSE_BUFF('LAN - STOP BLOCK sending', 4);

end;

procedure TfProgram.ButtonProgramingClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  if (GLB_SHORT_MAC = '8011') OR (GLB_SHORT_MAC = '8012') then
  ButtonProgram_for_9prog.Click;
end;
end;

procedure TfProgram.ButtonShowQuickOnlyClick(Sender: TObject);
var tmpFilter:string;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  tmpFilter := ' ID IN ('+IntToStr(tID1)+','+IntToStr(tID2)+','+IntToStr(tID3)+','+IntToStr(tID4)+','+IntToStr(tID5)+','+IntToStr(tID6)+','
                         +IntToStr(tID7)+','+IntToStr(tID8)+','+IntToStr(tID9)+','+IntToStr(tID10)+','+IntToStr(tID11)+','+IntToStr(tID12)+')';

 // ADOQueryCategory.SQL.Text := 'SELECT * FROM category WHERE id IN (SELECT category_id FROM diseases WHERE category_id >= 1 AND '+tmpFilter+') ORDER BY category_name_bg';
 // ADOQueryCategory.Open;

  if RadioGroupLanguage.ItemIndex = 0 then
  ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE '+tmpFilter+' ORDER BY favorite' else
  ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE '+tmpFilter+' ORDER BY favorite';
  ADOQueryDiseases.Open;
end;
end;

procedure TfProgram.ButtonPrepareBufferClick(Sender: TObject);
type
  Win1251String = type AnsiString(1251);
var
all_category, all_diseases:Word;
n2x : word;
n3x : Integer;
n4x : Int64;
fr, x, l: Integer;
point, point_next, All_Memmory : Integer;
category_name, program_name : string;
power_option : byte;
program_sec_option : Word;
b1, b2, b3, b4: Byte;
settings : byte;
GLB_FILTER, GLB_CATEGORY_ORDER, GLB_PROGRAM_ORDER, tmp_TOP100 : string;
i:Integer;
f : file of Byte;
b : Byte;
tmpWin1251: Win1251String;
tmpUnicode : WideString;
begin

//with fMain do
begin

  MemoDescription.Lines.Clear;
  MemoDescription.Lines.Add('Подготовка на програмите');

  clear_buffer;
  max_buffer := 0;
  point := 0;
  point_next := 0;

  buff[0] := 56;
  buff[1] := 255;
  buff[2] := 255;
  buff[3] := 255;
  buff[4] := 255;


 // GLB_FILTER := ' AND prog=1 ';
  GLB_FILTER := ' AND id IN (SELECT id FROM v_programming)';

  if RadioGroupLanguage.ItemIndex = 0 then
  GLB_PROGRAM_ORDER := ' ORDER BY name_bg' else //favorite, name_bg'
  GLB_PROGRAM_ORDER := ' ORDER BY name_en';

  if RadioGroupLanguage.ItemIndex = 0 then
  GLB_CATEGORY_ORDER := ' ORDER BY category_name_BG' else
  GLB_CATEGORY_ORDER := ' ORDER BY category_name_EN';


  ADOQueryCategory_BUFFER.SQL.Text := 'SELECT * FROM category WHERE type_id >= 0';
  ADOQueryCategory_BUFFER.Open;

  all_category := ADOQueryCategory_BUFFER.RecordCount;
  buff[5] := byte(all_category);
  buff[6] := byte(all_category shr 8);
  buff[7] := 2; //StrToInt(EditMajor.Text); //Major version DB
  buff[8] := 3; //StrToInt(EditMinor.Text); //Minor version DB
  buff[9] := 255;

  x := 9;
  settings := 10;
  point := 0;

  ADOQueryDiseases_BUFFER.SQL.Text := 'SELECT * FROM diseases WHERE id >= 1 ' + GLB_FILTER + GLB_PROGRAM_ORDER;
  ADOQueryDiseases_BUFFER.Open;

  ADOQueryFreq_BUFFER.SQL.Text := 'SELECT count(id) AS C FROM freq WHERE disease_id IN (SELECT id FROM v_programming)';  //(SELECT id FROM diseases WHERE id >= 1 ' + GLB_FILTER + GLB_PROGRAM_ORDER+')'
  ADOQueryFreq_BUFFER.Open;

  if ADOQueryFreq_BUFFER.FieldByName('C').AsInteger <= 0 then
  begin
    ShowMessage('В избраните програми няма въведени честоти.');
    Exit;
  end;

  All_Memmory := settings + (ADOQueryCategory_BUFFER.RecordCount * len_categoryESP) +
                            (ADOQueryDiseases_BUFFER.RecordCount * len_diseaseESP)+
                            (ADOQueryFreq_BUFFER.FieldByName('C').AsInteger * len_frequenceESP);



  ADOQueryCategory_BUFFER.First;
  while not ADOQueryCategory_BUFFER.Eof do
  begin

      //if (x >= max_buffer-20) then
      if x >= All_Memmory then
      begin
        ShowMessage('Препълване на буфера');
        Exit;
      end;

      //id category
      n2x := ADOQueryCategory_BUFFER.FieldByName('id').AsInteger;
      x:=x+1; buff[x] := byte(n2x);
      x:=x+1; buff[x] := byte(n2x shr 8);

      //favorite
      //x:=x+1; buff[x] := byte(ADOQueryCategory_BUFFER.FieldByName('favorite').AsInteger);
      x:=x+1; buff[x] := byte(0);

      //number all_diseases
      ADOQueryDiseases_BUFFER.DisableControls;
      ADOQueryDiseases_BUFFER.SQL.Text := 'SELECT count(*) FROM diseases WHERE gid='+ADOQueryCategory_BUFFER.FieldByName('id').AsString + GLB_PROGRAM_ORDER;
      ADOQueryDiseases_BUFFER.Open;

      all_diseases := ADOQueryDiseases_BUFFER.RecordCount;

      n2x := all_diseases;
      x:=x+1; buff[x] := byte(n2x);
      x:=x+1; buff[x] := byte(n2x shr 8);

      //pointer all_diseases
      if point = 0 then
      begin
        n3x := settings + (all_category * len_categoryESP);
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


      //if RadioGroupProgLang.ItemIndex = 0 then
      //category_name := ADOQueryCategory_BUFFER.FieldByName('category_name_bg').AsString else
      //category_name := ADOQueryCategory_BUFFER.FieldByName('category_name_en').AsString;

      tmpUnicode := ADOQueryCategory_BUFFER.FieldByName('category_name_BG').AsString;
      tmpWin1251 := Win1251String(tmpUnicode);

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

  ADOQueryCategory_BUFFER.Next;
  end;


  MemoDescription.Lines.Add('1');
  Application.ProcessMessages;


  point := 0;

  //Взема всички програми за запис / като бройка
  ADOQuerySQL.SQL.Text := 'SELECT count(id) AS c FROM diseases WHERE category_id >= 1 ' + GLB_FILTER;
  ADOQuerySQL.Open;
  all_diseases := ADOQuerySQL.FieldByName('C').AsInteger;


  //DISEASES
  ADOQueryCategory_BUFFER.First;
  while not ADOQueryCategory_BUFFER.Eof do
  begin

      ADOQueryDiseases_BUFFER.SQL.Text := 'SELECT * FROM v_diseases_personal WHERE group_id='+ADOQueryCategory_BUFFER.FieldByName('id').AsString + GLB_PROGRAM_ORDER; //GLB_FILTER
      ADOQueryDiseases_BUFFER.Open;


      MemoDescription.Lines.Add('program step: '+ADOQueryCategory_BUFFER.FieldByName('id').AsString);
      Application.ProcessMessages;

      while not ADOQueryDiseases_BUFFER.Eof do
      begin

          // MemoPersonalList.Lines.Add('ADDD: '+ADOQueryDiseases_BUFFER.FieldByName('name_bg').AsString);
           Application.ProcessMessages;

          //if x >= max_buffer-20 then
          if x >= All_Memmory then
          begin
            ShowMessage('Препълване на буфера');
            Exit;
          end;

          //ид на болест
          n2x := ADOQueryDiseases_BUFFER.FieldByName('id').AsInteger;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          //категория
          n2x := ADOQueryCategory_BUFFER.FieldByName('id').AsInteger;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          //любими
          x:=x+1; buff[x] := byte(0);

          //дължина на програмта
          ADOQuerySQL.SQL.Text := 'SELECT count(disease_id) AS Q, SUM(time_sec) AS FREQ_LEN FROM freq WHERE disease_id='+ADOQueryDiseases_BUFFER.FieldByName('id').AsString;
          ADOQuerySQL.Open;

          n2x :=  ADOQuerySQL.FieldByName('FREQ_LEN').AsInteger * 300;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          ADOQueryFreq_BUFFER.DisableControls;
          ADOQueryFreq_BUFFER.SQL.Text := 'SELECT * FROM freq WHERE disease_id=' + ADOQueryDiseases_BUFFER.FieldByName('id').AsString + ' ORDER BY orderno';
          ADOQueryFreq_BUFFER.Open;

          MemoDescription.Lines.Add('freq step: '+ADOQueryDiseases_BUFFER.FieldByName('id').AsString);
          Application.ProcessMessages;

          Application.ProcessMessages;

          //pointer frequence
          if point = 0 then
          begin
            n3x := settings + (all_category * len_categoryESP) + (all_diseases * len_diseaseESP);
            point_next := (ADOQueryFreq_BUFFER.RecordCount * len_frequenceESP);
            point := n3x + point_next;
          end else
          begin
            n3x := point;
            point_next := (ADOQueryFreq_BUFFER.RecordCount * len_frequenceESP);
            point := point + point_next;
          end;
          fr := n3x;

          //Адрес на честоти
          //n3x:=0;
          x:=x+1; buff[x] := byte(n3x);
          x:=x+1; buff[x] := byte(n3x shr 8);
          x:=x+1; buff[x] := byte(n3x shr 16);

          //Брой честоти
          n2x := ADOQueryFreq_BUFFER.RecordCount;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          if RadioGroupLanguage.ItemIndex = 0 then
          tmpUnicode := ADOQueryDiseases_BUFFER.FieldByName('name_bg').AsString else
          tmpUnicode := ADOQueryDiseases_BUFFER.FieldByName('name_en').AsString;

          tmpWin1251 := Win1251String(tmpUnicode);


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
          ADOQueryFreq_BUFFER.DisableControls;
          ADOQueryFreq_BUFFER.First;
          while not ADOQueryFreq_BUFFER.Eof do
          begin
            n4x := StrToInt64(FloatToStr(RoundTo(ADOQueryFreq_BUFFER.FieldByName('freq').AsFloat,-2) * 100)); //StrToInt

            fr := fr+1; buff[fr-1] := byte(n4x);
            fr := fr+1; buff[fr-1] := byte(n4x shr 8);
            fr := fr+1; buff[fr-1] := byte(n4x shr 16);
            fr := fr+1; buff[fr-1] := byte(n4x shr 24);

            fr := fr+1; buff[fr-1] := byte(ADOQueryFreq_BUFFER.FieldByName('time_sec').AsInteger);

           // MemoPersonalList.Lines.Add('freq: '+ADOQueryFreq_BUFFER.FieldByName('freq').AsString);
            Application.ProcessMessages;

          ADOQueryFreq_BUFFER.Next;
          end;



      ADOQueryDiseases_BUFFER.Next;
      end;




  ADOQueryCategory_BUFFER.Next;
  end;


  max_buffer := fr;

  AdvEditBlockMax.IntValue := max_buffer;

  MemoDescription.Lines.Add('Приключи подготовката на програмите размер на буфера: '+IntToStr(max_buffer));

//  for i := 0 to max_buffer do
  //begin
  //  MemoMainLogEvent.Lines.Add('No: '+IntToStr(i)+ ' Byte: '+IntToStr(buff[i])+' Hex: '+IntToHex(buff[i], 2) + isCharacters(buff[i]) );
//  end;


{
  ShowMessage(
  'Изпратени данни '+IntToStr(max_buffer)+' Bytes'+#13+
  'Изпратени данни '+FormatFloat('# ###.##', max_buffer / 1024)+' KB.'
  );


  SaveDialog1.Execute();
  with fMain do
  begin
      SaveBytesToFile(buff, SaveDialog1.FileName);
  end;
}

end;

end;

procedure TfProgram.ButtonPrintClick(Sender: TObject);
var tmpFilter, tmpName:string;
prog12 : Boolean;
begin
with fMain do
begin
   if Check_Connect(1) = False then Exit;
   if Check_Zapper(1) = False then Exit;

   ppLabelRed1.Caption := tTEXT1;
   ppLabelRed2.Caption := tTEXT2;
   ppLabelRed3.Caption := tTEXT3;
   ppLabelRed4.Caption := tTEXT4;

   ppLabelGreen1.Caption := tTEXT5;
   ppLabelGreen2.Caption := tTEXT6;
   ppLabelGreen3.Caption := tTEXT7;
   ppLabelGreen4.Caption := tTEXT8;

   ppLabelBlue1.Caption := tTEXT9;
   ppLabelBlue2.Caption := tTEXT10;
   ppLabelBlue3.Caption := tTEXT11;
   ppLabelBlue4.Caption := tTEXT12;

   ppLabel_0.Caption := StatusBar1.Panels[0].Text;
   ppLabel_1.Caption := StatusBar1.Panels[1].Text;
   ppLabel_2.Caption := StatusBar1.Panels[2].Text;
   ppLabel_3.Caption := StatusBar1.Panels[3].Text;
   ppLabel_4.Caption := StatusBar1.Panels[4].Text;
   ppLabel_5.Caption := StatusBar1.Panels[5].Text;
   ppLabel_6.Caption := StatusBar1.Panels[6].Text;
   ppLabel_7.Caption := StatusBar1.Panels[7].Text;
   ppLabel_8.Caption := StatusBar1.Panels[8].Text;

   if (GLB_SHORT_MAC = '8031') then prog12 := True;
   if (GLB_SHORT_MAC = '8012') then prog12 := False;

   ppLabel5.Visible := prog12;
   ppShape6.Visible := prog12;
   ppShape7.Visible := prog12;
   ppShape8.Visible := prog12;
   ppShape9.Visible := prog12;
   ppLabel13.Visible := prog12;
   ppShape27.Visible := prog12;
   ppShape28.Visible := prog12;
   ppShape29.Visible := prog12;
   ppShape30.Visible := prog12;
   ppLabel9.Visible := prog12;
   ppShape17.Visible := prog12;
   ppShape18.Visible := prog12;
   ppShape19.Visible := prog12;
   ppShape20.Visible := prog12;

   ppReport1.Print;
end;
end;

procedure TfProgram.ButtonPauseClick(Sender: TObject);
var
b1,b2,b3,b4:Byte;
begin

  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;



  if state_pause = 0 then //пускане на пауза
  begin
    state_pause := 1; //пауза

    TimerOnlyTime.Enabled := False; //Спира отброяването на време
    set_power_freq(0, 0, 1, 0, 0);

    b1 := byte(cloud_cat_id);
    b2 := byte(cloud_cat_id shr 8);
    b3 := byte(cloud_program_id);
    b4 := byte(cloud_program_id shr 8);
    SEND_Cloud([3, 0, 26, 91, b1, b2, b3, b4, 3, m_b1, m_b2, m_b3, m_b4]);

  end else
  begin
    state_pause := 0; //продължи

    TimerOnlyTime.Enabled := True; //Пуска отброяването на време
    FirstTime := True; //Време за хващане на ръкохватките
    tmpProgresStartUp := 0;

    set_power_freq(0, 0, 0, 0, Trunc(fMain.ADOQueryFreq.FieldByName('freq').AsFloat * 100));

    b1 := byte(cloud_cat_id);
    b2 := byte(cloud_cat_id shr 8);
    b3 := byte(cloud_program_id);
    b4 := byte(cloud_program_id shr 8);
    SEND_Cloud([3, 0, 26, 94, b1, b2, b3, b4, 3, m_b1, m_b2, m_b3, m_b4]);
  end;



  DrowButtonPause();




end;


function GetProgramTime(program_id : Integer):Integer;
var
i, sec:Integer;
begin
with fmain do
begin
  ProgramTimeCurrent_sec := 0;
  sec := 0;
  for I := 1 to 500 do
  begin

    if CategoryPlay[i].program_id = program_id then
    begin
      sec := sec + CategoryPlay[i].freq_sec + CategoryPlay[i].pause_sec;
    end;

  end;
  Result := sec;


end;
end;

function GetFrequenceTime:Integer;
begin
with fmain do
begin
  FrequenceTimeCurrent_sec := 0;
  if ADOQueryFreq.FieldByName('time_sec').AsInteger = 0 then
  Result := GLB_Duration else
  Result := ADOQueryFreq.FieldByName('time_sec').AsInteger;

end;
end;


procedure TfProgram.ButtonPlayGroupClick(Sender: TObject);
var
b1,b2,b3,b4:Byte;
i:Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  if ADOQueryCategory.RecordCount <= 0 then Exit;

  ButtonPlayProgram.Visible := False;
  ButtonPause.Visible := True;

  RadioGroupPlayType.ItemIndex := 1; //play group

  for I := 1 to 500 do
  begin
    CategoryPlay[i].program_id := 0;
    CategoryPlay[i].freq_hz := 0;
    CategoryPlay[i].freq_id := 0;
    CategoryPlay[i].freq_sec := 0;
    CategoryPlay[i].total_time_sec := 0;
    CategoryPlay[i].pause_type := 0;
    CategoryPlay[i].pause_pass := 0;
  end;

  Max_GroupRecords := 0;

  AllCyclesTime_sec := 0;
  AllCyclesTimeCurrent_sec := 0;
  CategoryTime_sec := 0;
  CategoryTimeCurrent_sec := 0;
  ProgramTime_sec := 0;
  ProgramTimeCurrent_sec := 0;
  FrequenceTime_sec := 0;
  FrequenceTimeCurrent_sec := 0;


  if CheckBoxNoEqualFreq.Checked then // неповтарящи се честоти
  begin
    if ADOQueryCategory.FieldByName('type_user_id').AsInteger >= 0 then
    ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id IN (SELECT id FROM diseases WHERE category_id='+ADOQueryCategory.FieldByName('id').AsString+') ORDER BY disease_id, orderno' else
    ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id IN (SELECT id FROM v_diseases_personal WHERE group_id='+ADOQueryCategory.FieldByName('id').AsString+') ORDER BY disease_id, orderno';
    ADOQueryFreq.Open;
  end else
  begin // категория и програми една след друга

    category_repeat := AdvEditRepeatList.IntValue; //ADOQueryCategory.FieldByName('repeat').AsInteger;
    category_repeat_current := 1;
    program_pause_sec :=  AdvEditBreakProgram.IntValue;        //ADOQueryCategory.FieldByName('pause_program').AsInteger;
    category_pause_sec := AdvEdit_pause_repeat_cycle.IntValue; //ADOQueryCategory.FieldByName('pause_repeat_cycle').AsInteger;

    if category_repeat <= 0 then
    begin
      category_repeat := 1;
    end;

    i := 0;

    ADOQueryDiseases.First;
    while not ADOQueryDiseases.Eof do
    begin

        ButtonRefreshFreqClick(nil); //get freq for group

        while not ADOQueryFreq.Eof do
        begin

          i := i + 1;
          CategoryPlay[i].program_id := ADOQueryFreq.FieldByName('disease_id').AsInteger;
          CategoryPlay[i].freq_id := ADOQueryFreq.FieldByName('ID').AsInteger;

          if ADOQueryFreq.FieldByName('time_sec').AsInteger=0 then
          CategoryPlay[i].freq_sec := GLB_Duration else
          CategoryPlay[i].freq_sec := ADOQueryFreq.FieldByName('time_sec').AsInteger;

          CategoryPlay[i].freq_hz := ADOQueryFreq.FieldByName('freq').AsFloat;
          Max_GroupRecords := Max_GroupRecords + 1;

          CategoryTime_sec := CategoryTime_sec + CategoryPlay[i].freq_sec;

          CategoryPlay[i].total_time_sec := CategoryTime_sec;

          if ADOQueryFreq.RecNo = ADOQueryFreq.RecordCount then
          begin
            CategoryPlay[i].pause_sec := program_pause_sec;
            CategoryPlay[i].pause_type := 1; //пауза на програма
            CategoryPlay[i].pause_pass := 1;  //има пауза
            //CategoryTime_sec := CategoryTime_sec + CategoryPlay[i].pause_sec;
          end;

        //  MemoDescription.Lines.Add('pos: '+IntToStr(i)+ ' time: '+IntToStr(CategoryPlay[i].total_time_sec)+ 'pause: '+IntToStr(CategoryPlay[i].pause_sec) );


        ADOQueryFreq.Next;
        end;


         if ADOQueryDiseases.RecNo = ADOQueryDiseases.RecordCount then
         begin
          CategoryPlay[i].pause_sec := category_pause_sec;
          CategoryPlay[i].pause_type := 2; //пауза на категория
          CategoryPlay[i].pause_pass := 1;  //има пауза
          //CategoryTime_sec := CategoryTime_sec + CategoryPlay[i].pause_sec;
         end;


    ADOQueryDiseases.Next;
    end;


    for I := 1 to 500 do
    begin
      if CategoryPlay[i].freq_sec >= 1 then
      CategoryTime_sec := CategoryTime_sec + CategoryPlay[i].pause_sec;
    end;
    AllCyclesTime_sec := CategoryTime_sec * category_repeat;

  end;

  ButtonPause.Enabled := True;
  state_pause := 0;
  AllCyclesTimeCurrent_sec := 0;
  FirstTime := True; //вземане на ръкохватки
  tmpProgresStartUp := 0; //вземане на ръкохватки

  DrowButtonPause();

  TimerOnlyTime.Enabled := True;

  ADOQueryDiseases.First;
  ProgramTime_sec := GetProgramTime(ADOQueryDiseases.FieldByName('id').AsInteger);

  ButtonRefreshFreqClick(nil); //get freq for group
  FrequenceTime_sec := GetFrequenceTime;


  LastPositionInGroup := 1;
  set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));

  cloud_program_id := ADOQueryDiseases.FieldByName('id').AsInteger;
  cloud_cat_id := 0; //ADOQueryDiseases.FieldByName('category_id').AsInteger;
  b1 := byte(cloud_cat_id);
  b2 := byte(cloud_cat_id shr 8);
  b3 := byte(cloud_program_id);
  b4 := byte(cloud_program_id shr 8);
  SEND_Cloud([3, 0, 26, 90, b1, b2, b3, b4, 3, m_b1, m_b2, m_b3, m_b4]);
end;
end;





procedure TfProgram.ButtonPlayProgramClick(Sender: TObject);
var
b1,b2,b3,b4:Byte;
i:Integer;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  RadioGroupPlayType.ItemIndex := 0; //play program

  ButtonPlayProgram.Visible := False;
  ButtonPlayGroup.Visible := False;
  ButtonPause.Visible := True;

  for I := 1 to 500 do
  begin
    CategoryPlay[i].program_id := 0;
    CategoryPlay[i].freq_hz := 0;
    CategoryPlay[i].freq_id := 0;
    CategoryPlay[i].freq_sec := 0;
    CategoryPlay[i].total_time_sec := 0;
    CategoryPlay[i].pause_type := 0;
    CategoryPlay[i].pause_pass := 0;
  end;

  Max_GroupRecords := 0;

  AllCyclesTime_sec := 0;
  AllCyclesTimeCurrent_sec := 0;
  CategoryTime_sec := 0;
  CategoryTimeCurrent_sec := 0;
  ProgramTime_sec := 0;
  ProgramTimeCurrent_sec := 0;
  FrequenceTime_sec := 0;
  FrequenceTimeCurrent_sec := 0;

    i := 0;

  ADOQueryFreq.First;
  ButtonRefreshFreqClick(nil); //get freq for group

  while not ADOQueryFreq.Eof do
  begin

    i := i + 1;
    CategoryPlay[i].program_id := ADOQueryFreq.FieldByName('disease_id').AsInteger;
    CategoryPlay[i].freq_id := ADOQueryFreq.FieldByName('ID').AsInteger;

    if ADOQueryFreq.FieldByName('time_sec').AsInteger=0 then
    CategoryPlay[i].freq_sec := GLB_Duration else
    CategoryPlay[i].freq_sec := ADOQueryFreq.FieldByName('time_sec').AsInteger;

    CategoryPlay[i].freq_hz := ADOQueryFreq.FieldByName('freq').AsFloat;
    Max_GroupRecords := Max_GroupRecords + 1;

    CategoryTime_sec := CategoryTime_sec + CategoryPlay[i].freq_sec;
    CategoryPlay[i].total_time_sec := CategoryTime_sec;

  ADOQueryFreq.Next;
  end;


  ProgramTime_sec := GetProgramTime(ADOQueryDiseases.FieldByName('id').AsInteger);

  ADOQueryFreq.First;
  FrequenceTime_sec := GetFrequenceTime;


  //ButtonRefreshFreqClick(nil); //play program

  ButtonPause.Enabled := True;
  state_pause := 0;
  DrowButtonPause();

  TimerOnlyTime.Enabled := True;

  //ProgramTime_sec := Get_Frequence_From_Position(1);
  //ProgramTimeCurrent_sec := 0;

  FirstTime := True;
  tmpProgresStartUp := 0;

  set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));






  cloud_program_id := ADOQueryDiseases.FieldByName('id').AsInteger;
  cloud_cat_id := 0; //ADOQueryDiseases.FieldByName('category_id').AsInteger;
  b1 := byte(cloud_cat_id);
  b2 := byte(cloud_cat_id shr 8);
  b3 := byte(cloud_program_id);
  b4 := byte(cloud_program_id shr 8);
  SEND_Cloud([3, 0, 26, 90, b1, b2, b3, b4, 3, m_b1, m_b2, m_b3, m_b4]);
end;
end;



function convLED(_Favorite:byte):byte;
begin

  case _Favorite of
  11,12,13,14 : result := 2;
  15,16,17,18 : result := 3;
  19,20,21,22 : result := 4;

  end;

end;


procedure TfProgram.ButtonProgram_for_9progClick(Sender: TObject);
var
category, diseases:Word;
n2x : word;
n3x : Integer;
n4x : Integer;
fr, x, l: Integer;
point, point_next, All_Memmory : Integer;
catname : string;
power_option : byte;
program_sec_option : Word;
b1, b2, b3, b4: Byte;
begin
with fMain do
begin


clear_buffer;
max_buffer := 0;
point := 0;
point_next := 0;

buff[0] := 56; //0x38
buff[1] := 255;
buff[2] := 255;
buff[3] := 255;
buff[4] := 255;

category := 1; //ADOQueryCategory.RecordCount;
buff[5] := byte(category); //edna kategoria
buff[6] := byte(0);
buff[7] := 255;
buff[8] := 255;
buff[9] := 255;

x:=9;

point := 0;

  if RadioGroupLanguage.ItemIndex = 0 then
  ADOQueryPrograming.SQL.Text := 'SELECT * FROM v_diseases WHERE favorite >= 1 ORDER BY favorite' else
  ADOQueryPrograming.SQL.Text := 'SELECT * FROM v_diseases WHERE favorite >= 1 ORDER BY favorite';
  ADOQueryPrograming.Open;

  if ADOQueryPrograming.RecordCount <= 0 then
  begin
  //  ShowMessage('НЯМА МАРКИРАНИ ПРОГРАМИ ЗА БЪРЗО ИЗБИРАНЕ. По този начин ще изтиете програмите от Запера. ');
  //  if MessageDlg('Желаете ли да продължите?', mtConfirmation, mbYesNo, 0) <> mrYes then Exit;

    buff[0] := 56; //0x38
    buff[1] := 255;
    buff[2] := 255;
    buff[3] := 255;
    buff[4] := 255;
    buff[5] := 0; //kategoria 0
    buff[6] := 0;
    buff[7] := 255;
    buff[8] := 255;
    buff[9] := 255;
    buff[10] := 0;
    buff[11] := 0;
    buff[12] := 0;
    buff[13] := 0;
    buff[14] := 0;
    buff[15] := 0;
    buff[16] := 0;
    buff[17] := 0;
    max_buffer := 17;


    ButtonWrite.Click;
    Exit;
  end;

  ADOQueryFreqProgramming.SQL.Text := 'SELECT count(id) AS C FROM freq WHERE disease_id IN (SELECT id FROM diseases WHERE favorite >= 1)';
  ADOQueryFreqProgramming.Open;

  if ADOQueryFreqProgramming.FieldByName('C').AsInteger <= 0 then
  begin
    ShowMessage('В избраните програми няма въведени честоти.');
    Exit;
  end;


  All_Memmory := len_settings + len_category +(ADOQueryPrograming.RecordCount*len_disease)+(ADOQueryFreqProgramming.FieldByName('C').AsInteger*5);
  if All_Memmory >= 1024 then
  begin
    ShowMessage('Няма достатъчно памет за избраните програми: '+#13+
    'Системни и за 1 група общо: '+IntToStr(14+48)+#13+
    'Програми '+IntToStr(ADOQueryPrograming.RecordCount)+' всяка заема по '+IntToStr(len_disease)+' общо: '+IntToStr(ADOQueryPrograming.RecordCount*len_disease)+#13+
    'Честоти '+IntToStr(ADOQueryFreqProgramming.FieldByName('C').AsInteger)+' всяка заема по 5 общо: '+IntToStr(ADOQueryFreqProgramming.FieldByName('C').AsInteger*5)+#13+
    'Zapper разполага с 1024 но селектираните програми изискват: '+IntToStr(All_Memmory)
    );
    Exit;
  end else
  begin
  //ShowMessage('Свободно място '+IntToStr(1024-All_Memmory)+' от 1024 bytes. Започва записването на избраните програмите в Запера.');
  end;

  //id category
  n2x := 1; //ADOQueryCategory.FieldByName('id').AsInteger;
  x:=x+1; buff[x] := byte(n2x);
  x:=x+1; buff[x] := byte(n2x shr 8);

  //favorite
  x:=x+1; buff[x] := 0; //byte(ADOQueryCategory.FieldByName('favorite').AsInteger);

  //number diseases
  diseases := ADOQueryPrograming.RecordCount;
  n2x := diseases;
  x:=x+1; buff[x] := byte(n2x);
  x:=x+1; buff[x] := byte(n2x shr 8);

  //pointer diseases
  if point = 0 then
  begin
    n3x := len_settings + (category * len_category);
    point_next := (diseases * len_disease);
    point := n3x + point_next;
  end else
  begin
    n3x := point;
    point_next := (diseases * len_disease);
    point := point + point_next;
  end;

  x:=x+1; buff[x] := byte(n3x);
  x:=x+1; buff[x] := byte(n3x shr 8);
  x:=x+1; buff[x] := byte(n3x shr 16);


  point := 0;
  diseases := ADOQueryPrograming.RecordCount;

  //ShowMessage('num diseases: '+IntToStr(diseases)+#13+' after pointer: '+IntToStr(diseases*92));

    //=========================DISEASES
    while not ADOQueryPrograming.Eof do
    begin
        if x > max_mem then ShowMessage('OVERLOAD BUFFER: '+IntToStr(max_mem)+' chars: '+IntToStr(x));

        //ид на болест
        n2x := ADOQueryPrograming.FieldByName('id').AsInteger;
        x:=x+1; buff[x] := byte(n2x);
        x:=x+1; buff[x] := byte(n2x shr 8);

        //категория
        n2x := 1; //ADOQueryCategory.FieldByName('id').AsInteger;
        x:=x+1; buff[x] := byte(n2x);
        x:=x+1; buff[x] := byte(n2x shr 8);

        //любими  2-red, 3-green, 4-blue
        x:=x+1; buff[x] := byte(convLED(ADOQueryPrograming.FieldByName('favorite').AsInteger));
        //дължина на програмта

        ADOQuerySQL.SQL.Text := 'SELECT SUM(time_sec) AS FREQ_LEN FROM freq WHERE disease_id='+ADOQueryPrograming.FieldByName('id').AsString;
        ADOQuerySQL.Open;

        n2x := ADOQuerySQL.FieldByName('FREQ_LEN').AsInteger;
        x:=x+1; buff[x] := byte(n2x);
        x:=x+1; buff[x] := byte(n2x shr 8);

        ADOQueryFreqProgramming.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+ADOQueryPrograming.FieldByName('id').AsString+' ORDER BY id';
        ADOQueryFreqProgramming.Open;

        //pointer frequence
        if point = 0 then
        begin
          n3x := len_settings + (category * len_category) + (diseases * len_disease);
          point_next := (ADOQueryFreqProgramming.RecordCount * 5);
          point := n3x + point_next;
        end else
        begin
          n3x := point;
          point_next := (ADOQueryFreqProgramming.RecordCount * 5);
          point := point + point_next;
        end;
        fr := n3x;

        //Адрес на честоти
        //n3x:=0;
        x:=x+1; buff[x] := byte(n3x);
        x:=x+1; buff[x] := byte(n3x shr 8);
        x:=x+1; buff[x] := byte(n3x shr 16);

        //Брой честоти
        n2x := ADOQueryFreqProgramming.RecordCount;
        x:=x+1; buff[x] := byte(n2x);
        x:=x+1; buff[x] := byte(n2x shr 8);


        //==============================================FREQUENCE
        ADOQueryFreqProgramming.First;
        while not ADOQueryFreqProgramming.Eof do
        begin

          n4x := Trunc(ADOQueryFreqProgramming.FieldByName('freq').AsFloat*100);

          fr := fr+1; buff[fr-1] := byte(n4x);
          fr := fr+1; buff[fr-1] := byte(n4x shr 8);
          fr := fr+1; buff[fr-1] := byte(n4x shr 16);
          fr := fr+1; buff[fr-1] := byte(n4x shr 24);

          fr := fr+1; buff[fr-1] := byte(ADOQueryFreqProgramming.FieldByName('time_sec').AsInteger);

        ADOQueryFreqProgramming.Next;
        end;

    ADOQueryPrograming.Next;
    end;




//ShowMessage('CHARS: '+IntToStr(x)+' freq: '+IntToStr(fr));
max_buffer := fr;

ButtonWriteClick(nil);
end;
end;

procedure TfProgram.ButtonProgram_for_WiFiClick(Sender: TObject);
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
settings : byte;
GLB_FILTER, GLB_CATEGORY_ORDER, GLB_DISEASES_ORDER : string;
i:Integer;
f : file of Byte;
b : Byte;
tmpWin1251: Win1251String;
tmpUnicode : WideString;
begin
with fMain do
begin

clear_buffer;
max_buffer := 0;
point := 0;
point_next := 0;

buff[0] := 56;
buff[1] := 255;
buff[2] := 255;
buff[3] := 255;
buff[4] := 255;

if chkAllPrograms.Checked then
GLB_FILTER := '' else
GLB_FILTER := ' AND favorite >= 1';

if RadioGroupLanguage.ItemIndex = 0 then
GLB_DISEASES_ORDER := ' ORDER BY name_bg' else //favorite, name_bg'
GLB_DISEASES_ORDER := ' ORDER BY name_en';

if RadioGroupLanguage.ItemIndex = 0 then
GLB_CATEGORY_ORDER := ' ORDER BY category_name_BG' else
GLB_CATEGORY_ORDER := ' ORDER BY category_name_EN';


ADOQueryCategory.SQL.Text := 'SELECT * FROM category WHERE id IN (SELECT category_id FROM diseases WHERE category_id >= 1 '+GLB_FILTER+') '+GLB_CATEGORY_ORDER;
ADOQueryCategory.Open;

all_category := ADOQueryCategory.RecordCount;
buff[5] := byte(all_category);
buff[6] := byte(all_category shr 8);
buff[7] := 1; //Major version DB
buff[8] := 2; //Minor version DB
buff[9] := 255;

x := 9;
settings := 10;
point := 0;
                                                             //(freq is null) AND (
  ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE id >= 1 ' + GLB_FILTER + GLB_DISEASES_ORDER;
  ADOQueryDiseases.Open;
 // ShowMessage(ADOQueryDiseases.SQL.Text);

 // ShowMessage(IntToStr(ADOQueryDiseases.RecordCount)+ GLB_FILTER + GLB_DISEASES_ORDER);

        {
  if ADOQueryDiseases.RecordCount <= 0 then
  begin
    ShowMessage('НЯМА МАРКИРАНИ ПРОГРАМИ ЗА БЪРЗО ИЗБИРАНЕ. По този начин ще изтиете програмите от Запера. ');
    if MessageDlg('Желаете ли да продължите?', mtConfirmation, mbYesNo, 0) <> mrYes then Exit;

    buff[0] := 56; //0x38
    buff[1] := 255;
    buff[2] := 255;
    buff[3] := 255;
    buff[4] := 255;
    buff[5] := 0; //kategoria 0
    buff[6] := 0;

    ButtonWrite.Click;
    Exit;
  end;  }

  ADOQueryFreq.SQL.Text := 'SELECT count(id) AS C FROM freq WHERE disease_id IN (SELECT id FROM diseases WHERE id >= 1 ' + GLB_FILTER + GLB_DISEASES_ORDER+')';
  ADOQueryFreq.Open;

  if ADOQueryFreq.FieldByName('C').AsInteger <= 0 then
  begin
    ShowMessage('В избраните програми няма въведени честоти.');
    Exit;
  end;


  All_Memmory := settings + (ADOQueryCategory.RecordCount * len_categoryESP) +
                            (ADOQueryDiseases.RecordCount * len_diseaseESP)+
                            (ADOQueryFreq.FieldByName('C').AsInteger * len_frequenceESP);

  if All_Memmory >= 512*1024 then
  begin
    ShowMessage('Няма достатъчно памет за избраните програми: '+#13+
    'Настройки и всички групи общо: '+IntToStr(settings + ADOQueryCategory.RecordCount * len_categoryESP) + #13+
    'Програми '+IntToStr(ADOQueryDiseases.RecordCount)+' всяка заема по '+IntToStr(len_diseaseESP)+' общо: '+IntToStr(ADOQueryDiseases.RecordCount * len_diseaseESP)+#13+
    'Честоти '+IntToStr(ADOQueryFreq.FieldByName('C').AsInteger)+' всяка заема по 5 общо: '+IntToStr(ADOQueryFreq.FieldByName('C').AsInteger * len_frequenceESP)+#13+
    'Zapper разполага с 512KB но селектираните програми изискват: '+FormatFloat('# ###.##', All_Memmory / 1024)
    );
    Exit;
  end else
  begin
    ShowMessage('Има достатъчно памет за избраните програми: '+#13+
    'Настройки и всички групи общо: '+IntToStr(settings + ADOQueryCategory.RecordCount * len_categoryESP) + #13+
    'Програми '+IntToStr(ADOQueryDiseases.RecordCount)+' всяка заема по '+IntToStr(len_diseaseESP)+' общо: '+IntToStr(ADOQueryDiseases.RecordCount * len_diseaseESP)+#13+
    'Честоти '+IntToStr(ADOQueryFreq.FieldByName('C').AsInteger)+' всяка заема по 5 общо: '+IntToStr(ADOQueryFreq.FieldByName('C').AsInteger * len_frequenceESP)+#13+
    'Zapper разполага с 512KB но селектираните програми са: '+FormatFloat('# ###.##', All_Memmory / 1024)+#13+
    'Започва записването на избраните програмите в Запера.'
    );

  //ShowMessage('Свободно място '+IntToStr((1000*1024)-All_Memmory)+' от 1MB. Започва записването на избраните програмите в Запера.');

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
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE category_id='+ADOQueryCategory.FieldByName('id').AsString  + GLB_FILTER + GLB_DISEASES_ORDER;
    ADOQueryDiseases.Open;
    all_diseases := ADOQueryDiseases.RecordCount;

    n2x := all_diseases;
    x:=x+1; buff[x] := byte(n2x);
    x:=x+1; buff[x] := byte(n2x shr 8);

    //pointer all_diseases
    if point = 0 then
    begin
      n3x := settings + (all_category * len_categoryESP);
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


    if RadioGroupLanguage.ItemIndex = 0 then
    category_name := ADOQueryCategory.FieldByName('category_name_bg').AsString else
    category_name := ADOQueryCategory.FieldByName('category_name_en').AsString;


    if RadioGroupLanguage.ItemIndex = 0 then
    tmpUnicode := ADOQueryCategory.FieldByName('category_name_bg').AsString else
    tmpUnicode := ADOQueryCategory.FieldByName('category_name_en').AsString;

    tmpWin1251 := Win1251String(tmpUnicode);

    for l := 1 to 30 do
    begin

      x := x + 1;

      {
      //Send like UTF-8
      if Length(category_name)+1 = l then
      begin
        buff[x] := 0;
        x := x + 1; buff[x] := 0;
      end else //terminal char
      if Length(category_name)+1 < l then
      begin
        buff[x] := 255;
        x := x + 1; buff[x] := 255;
      end else //pull
      begin
        n2x := Ord(category_name[l]); //fill name
        buff[x] := Byte(n2x);
        x := x + 1; buff[x] := Byte(n2x shr 8);
      end;
      }

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
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE category_id='+ADOQueryCategory.FieldByName('id').AsString + GLB_FILTER + GLB_DISEASES_ORDER;
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
            n3x := settings + (all_category * len_categoryESP) + (all_diseases * len_diseaseESP);
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

          if RadioGroupLanguage.ItemIndex = 0 then
          program_name := ADOQueryDiseases.FieldByName('name_bg').AsString else
          program_name := ADOQueryDiseases.FieldByName('name_en').AsString;


          if RadioGroupLanguage.ItemIndex = 0 then
          tmpUnicode := ADOQueryDiseases.FieldByName('name_bg').AsString else
          tmpUnicode := ADOQueryDiseases.FieldByName('name_en').AsString;

          tmpWin1251 := Win1251String(tmpUnicode);


          for l := 1 to 80 do
          begin
            x := x + 1;

            {//Send like UTF-8
            if Length(catname)+1 = l then
            begin
              buff[x] := 0;
              x := x + 1; buff[x] := 0;
            end else //terminal char
            if Length(catname)+1 < l then
            begin
              buff[x] := 255;
              x := x + 1; buff[x] := 255;
            end else //fill empty
            begin
              n2x := Ord(catname[l]); //fill name
              buff[x] := Byte(n2x);
              x := x + 1; buff[x] := Byte(n2x shr 8);
            end; }

            //Send like windows cp1251

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

//            n4x := ADOQueryFreq.FieldByName('freq').AsFloat*100;
            n4x := StrToInt(FloatToStr(RoundTo(ADOQueryFreq.FieldByName('freq').AsFloat,-2) * 100));

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
ShowMessage(
'Изпратени данни '+IntToStr(max_buffer)+' Bytes'+#13+
'Изпратени данни '+FormatFloat('# ###.##', max_buffer / 1024)+' KB.'
);



AssignFile(f, 'c:\bufferZapper.bin');
Rewrite(f);

for I := 0 to max_buffer do
begin
 b := buff[i];
 Write(f, b);
end;

ShowMessage('ezxit;');
Exit;

ButtonWrite.Click;

end;
end;

procedure TfProgram.ButtonRefreshFreqClick(Sender: TObject);
var sec:Integer;
begin
with fMain do
begin
  if ADOQueryDiseases.RecordCount <= 0 then Exit;

  ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+ADOQueryDiseases.FieldByName('id').AsString+' ORDER BY orderno';
  ADOQueryFreq.Open;

  Refresh_Frequences(ADOQueryDiseases.FieldByName('id').AsString);

 // if RadioGroupLanguage.ItemIndex=0 then
 // MemoDescription.Lines.Text := ADOQueryDiseases.FieldByName('description_bg').AsString else
 // MemoDescription.Lines.Text := ADOQueryDiseases.FieldByName('description_en').AsString;

end;
end;

procedure TfProgram.ButtonWriteClick(Sender: TObject);
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  VaComm1.WriteText(Chr(0)+Chr(0)+Chr(26)+chr(6));

end;
end;

procedure TfProgram.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
  var sec:Integer;
begin

  ButtonRefreshFreqClick(nil); //click program
  if RadioGroupLanguage.ItemIndex = 0 then
  MemoDescription.Lines.Text := fMain.ADOQueryDiseases.FieldByName('description_bg').AsString else
  MemoDescription.Lines.Text := fMain.ADOQueryDiseases.FieldByName('description_en').AsString;

end;

procedure TfProgram.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  ButtonPlayProgram.Click;
end;

procedure TfProgram.cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  AdvEditDuration.IntValue := fMain.ADOQueryFreq.FieldByName('time_sec').AsInteger;
end;

procedure TfProgram.cxGridDBTableView1Column3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin

if AText = '0' then
begin
  if GLB_Duration <> 0 then
  AText := IntToStr(GLB_Duration) else
  AText := '180';
end;
end;

procedure TfProgram.cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
  var
  OrderPrograms :string;
begin
with fMain do
begin


  if RadioGroupLanguage.ItemIndex = 0 then
  OrderPrograms :=  ' ORDER BY sort, name_bg' else
  OrderPrograms :=  ' ORDER BY sort, name_en';

  ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE id IN (SELECT program_id FROM programs_groups_connections WHERE category_id = ' + ADOQueryCategory.FieldByName('id').AsString +')'+ OrderPrograms;
  ADOQueryDiseases.Open;


  AdvEditRepeatList.IntValue := ADOQueryCategory.FieldByName('repeat').AsInteger;
  AdvEditBreakProgram.IntValue := ADOQueryCategory.FieldByName('pause_program').AsInteger;
  AdvEdit_pause_repeat_cycle.IntValue := ADOQueryCategory.FieldByName('pause_repeat_cycle').AsInteger;


  //Показва честотите
  ButtonRefreshFreqClick(nil); //click category
end;
end;

procedure TfProgram.EditSearchChange(Sender: TObject);
begin
  ButtonSearchClick(nil);
end;

procedure TfProgram.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if TimerOnlyTime.Enabled=True then
  begin
    try
    ButtonStopProgram.Click;
    except
    end;
  end;

Action := caFree;
fProgram := nil;
end;

procedure TfProgram.FormResize(Sender: TObject);
var
tmpWidth, Col1, Col2 : Integer;
begin

tmpWidth := cxGrid1.ClientWidth - cxGrid1DBTableView1Favorite.Width - cxGrid1DBTableView1Count.Width - 40;
Col1 :=  MulDiv(tmpWidth, 40, 100);
Col2 := tmpWidth - Col1;

//Caption := 'Width: '+IntToStr(tmpWidth)+' Progrm: '+IntToStr(Col1)+' Description '+IntToStr(col2);

cxGrid1DBTableView1name_bg.Width := Col1;
cxGrid1DBTableView1name_en.Width := Col1;

cxGrid1DBTableView1description_bg.Width := Col2;
cxGrid1DBTableView1description_en.Width := Col2;

end;

procedure TfProgram.FormShow(Sender: TObject);
begin


  if LoginUser = 1 then //admin
  cxGridDBTableView3User_access.Visible := True else
  cxGridDBTableView3User_access.Visible := False;

  state_pause := 0;

  if fMain.RadioGroupMainLanguage.ItemIndex=0 then
  fProgram.Caption := 'Програми' else
  fProgram.Caption := 'Programs';


  RadioGroupLanguage.ItemIndex := fMain.RadioGroupMainLanguage.ItemIndex;
  RadioGroupLanguageClick(nil);

  if (GLB_SHORT_MAC = '8011') OR (GLB_SHORT_MAC = '8012') then
  begin
    ButtonPrograming.Visible := False;
    ProgressBar1.Visible := True;
  end else
  begin
    ButtonPrograming.Visible := False;
    ProgressBar1.Visible := False;
  end;

  if (GLB_SHORT_MAC = '8030') OR (GLB_SHORT_MAC = '8031') OR (GLB_SHORT_MAC = '8041') OR (GLB_SHORT_MAC = '8042') then //WiFi
  ButtonShowQuickWeb.Visible := True else
  ButtonShowQuickWeb.Visible := False;


  change_menu;

end;

procedure TfProgram.RadioGroupLanguageClick(Sender: TObject);
begin
with fMain do
begin
  case RadioGroupLanguage.ItemIndex of
  0:begin //BG
    cxGridDBTableView3category_name_BG.Visible := True;
    cxGridDBTableView3category_name_EN.Visible := False;

    cxGrid1DBTableView1name_bg.Visible := True;
    cxGrid1DBTableView1name_en.Visible := False;

    cxGrid1DBTableView1description_bg.Visible := True;
    cxGrid1DBTableView1description_en.Visible := False;


    cxGridDBTableView3quantity.Caption := 'БР.';
    cxGridDBTableView3Type.Caption := 'Тип';
    cxGridDBTableView3Repeat.Caption := 'Повтори';
    cxGridDBTableView3Pause.Caption := 'Пауза';
    cxGridDBTableView3Cycle.Caption := 'Пауза при повторение';

    cxGrid1DBTableView1Favorite.Caption := 'Бързо избиране';
    cxGrid1DBTableView1Count.Caption := 'БР.';

    cxGridDBTableView1Column1.Caption := 'Честота';
    cxGridDBTableView1Column3.Caption := 'Сек.';

    ButtonPrint.Caption := 'ПРИНТ';
    ButtonShowAll.Caption := 'Покажи всички';
    ButtonPlayProgram.Caption := 'ПУСНИ ПРОГРАМА';
    ButtonStopProgram.Caption := 'СТОП';
    ButtonPause.Caption := 'ПАУЗА';
    ButtonShowQuickOnly.Caption := 'БЪРЗО ИЗБИРАНЕ';
    ButtonPrograming.Caption := 'Запиши програмите за бързо избиране в Запера';
    CheckBoxRepeat.Caption := 'Повтаряне на програмата';
    LabelSearch.Caption := 'Търсене:';
    ButtonSearch.Caption := 'Търси';
    ButtonChangeFreq.Caption := 'Промени';
    AdvEditDuration.LabelCaption := 'Продължителност сек.';
    ButtonPlayGroup.Caption := 'ПУСНИ ГРУПА';
    LabelSearchFreq.Caption := 'Търсене по честота:';
    ButtonSearchOnFreq.Caption := 'Търси';
    ButtonChangeAll.Caption := 'Всички';
    ButtonExit.Caption := 'ЗАТВОРИ';
  end;
  1:begin //EN
    cxGridDBTableView3category_name_EN.Visible := True;
    cxGridDBTableView3category_name_BG.Visible := False;

    cxGrid1DBTableView1name_bg.Visible := False;
    cxGrid1DBTableView1name_en.Visible := True;

    cxGrid1DBTableView1description_bg.Visible := False;
    cxGrid1DBTableView1description_en.Visible := True;


    cxGridDBTableView3quantity.Caption := 'Q.';
    cxGridDBTableView3Type.Caption := 'Type';
    cxGridDBTableView3Repeat.Caption := 'Repeat';
    cxGridDBTableView3Pause.Caption := 'Pause';
    cxGridDBTableView3Cycle.Caption := 'Pause on repeat';

    cxGrid1DBTableView1Favorite.Caption := 'Quick select';
    cxGrid1DBTableView1Count.Caption := 'Q.';

    cxGridDBTableView1Column1.Caption := 'Freq.';
    cxGridDBTableView1Column3.Caption := 'Sec.';

    ButtonPrint.Caption := 'PRINT';
    ButtonShowAll.Caption := 'Show all';
    ButtonPlayProgram.Caption := 'PLAY PROGRAM';
    ButtonStopProgram.Caption := 'STOP';
    ButtonPause.Caption := 'PAUSE';
    ButtonShowQuickOnly.Caption := 'FAVOURITE PROGRAMS'; //ONLY QUICK
    ButtonPrograming.Caption := 'Save programs for qiuck call in Zapper'; //Запиши програмите за бързо избиране в Запера
    CheckBoxRepeat.Caption := 'Repeat program';
    LabelSearch.Caption := 'Search:';
    ButtonSearch.Caption := 'Search';
    ButtonChangeFreq.Caption := 'Change';
    AdvEditDuration.LabelCaption := 'Duration in sec.';
    ButtonPlayGroup.Caption := 'PLAY GROUP';
    LabelSearchFreq.Caption := 'Search by frequency:';
    ButtonSearchOnFreq.Caption := 'Search';
    ButtonChangeAll.Caption := 'All';
    ButtonExit.Caption := 'CLOSE';
  end;
  end;



  ButtonShowAllClick(nil);

end;
end;


procedure SleepTimer(ms : Integer);
var
Finish_time : TDateTime;
begin
  Finish_time := IncMilliSecond(Now, ms);

  repeat
     Sleep(500);
     Application.ProcessMessages;

    fProgram.LabelPause_Time.Caption := TimeToStr(Finish_time - Now);

  until (Now > Finish_time);

  Application.ProcessMessages;
end;


procedure TurnOnAllPause();
var
  i : Integer;
begin

    for I := 1 to 500 do
    begin

      if CategoryPlay[i].pause_sec >= 1 then
      begin
      //CategoryPlay[i].pause_type := 0;
      CategoryPlay[i].pause_pass := 1;
      end;

    end;


end;



procedure TfProgram.TimerOnlyTimeTimer(Sender: TObject);
var
sec:integer;


AllCyclesName,
CategoryName,
ProgramName,
FrequenceName,
GroupPause,
TimeProgram,
TimeElipsed : string;

begin
with fMain do
begin

  if FirstTime then //Влиза само когато е за хващане на ръкохватките
  begin

      tmpProgresStartUp := tmpProgresStartUp + 1;
      sec := 10 - tmpProgresStartUp;

      if RadioGroupMainLanguage.ItemIndex=0 then
      begin
        LabelPause.Caption := 'Моля, хванете ръкохватките';
        LabelPause_Time.Caption := Format('%.2d сек.', [sec mod 60]); //Format('%.2d:%.2d мин.', [sec div 60, sec mod 60]); //'Остава: ' +
        //LabelPause_Time.Caption := TimeToStr(IncSecond(Now, ms) - Now);

      end else
      begin
        LabelPause.Caption := 'Please grab the handles';
        LabelPause_Time.Caption := Format('%.2d sec.', [sec mod 60]); //Format('%.2d:%.2d мин.', [sec div 60, sec mod 60]); // 'It remains : ' +
      end;

      if tmpProgresStartUp >= 10 then  FirstTime := False;

  end else
  begin

      if fProgram.RadioGroupLanguage.ItemIndex = 0 then //по програма
      begin
        AllCyclesName := 'Всички повторения: '+ IntToStr(category_repeat_current) + ' / '+IntToStr(category_repeat);;
        CategoryName := 'Категория ';   //ADOQueryCategory.FieldByName('category_name_BG').AsString;

        if RadioGroupPlayType.ItemIndex = 0 then
        ProgramName := 'Програма ' else //+ ADOQueryDiseases.FieldByName('name_bg').AsString
        ProgramName := 'Програма: ' + IntToStr(ADOQueryDiseases.RecNo) + ' / '+IntToStr(ADOQueryDiseases.RecordCount) ;    //+' ('+ADOQueryDiseases.FieldByName('name_bg').AsString+')'

        FrequenceName := 'Честота: ';
        GroupPause := 'Пауза: ';
        TimeProgram := 'Общо време: ';
        TimeElipsed := 'Остава: ';
      end else //по група
      begin
        AllCyclesName := 'All cycles: '+ IntToStr(category_repeat_current) + ' / '+IntToStr(category_repeat);;
        CategoryName := 'Category: '; //+ ADOQueryCategory.FieldByName('category_name_EN').AsString;

        if RadioGroupPlayType.ItemIndex = 0 then
        ProgramName := 'Program: ' else // + ADOQueryDiseases.FieldByName('name_en').AsString
        ProgramName := 'Program: ' + IntToStr(ADOQueryDiseases.RecNo) + ' / '+IntToStr(ADOQueryDiseases.RecordCount);

        FrequenceName := 'Frequence: ';
        GroupPause := 'Pause: ';
        TimeProgram := 'Total time: ';
        TimeElipsed := 'Remains time: ';
      end;

      if RadioGroupPlayType.ItemIndex = 0 then //пускане на програма
      begin

        LabelAllCycles.Visible := False;
        LabelAllCycles_Time.Visible := False;
        LabelCategory.Visible := False;
        LabelCategory_Time.Visible := False;
       // LabelPause.Visible := False;
      end else
      begin //пускане на категория

        LabelAllCycles.Visible := True;
        LabelAllCycles_Time.Visible := True;
        LabelCategory.Visible := True;
        LabelCategory_Time.Visible := True;
       // LabelPause.Visible := True;
      end;

      AllCyclesTimeCurrent_sec := AllCyclesTimeCurrent_sec + 1;
      CategoryTimeCurrent_sec := CategoryTimeCurrent_sec + 1;
//      ProgramTimeCurrent_sec := ProgramTimeCurrent_sec + 1;

      ProgramTimeCurrent_sec := ProgramTimeCurrent_sec + 1;

      LabelAllCycles_Time.Caption := TimeToStr(Time-IncSecond(Time, AllCyclesTime_sec - AllCyclesTimeCurrent_sec));
      LabelCategory_Time.Caption := TimeToStr(Time-IncSecond(Time, CategoryTime_sec - CategoryTimeCurrent_sec));
      LabelProgram_Time.Caption := TimeToStr(Time-IncSecond(Time, ProgramTime_sec - ProgramTimeCurrent_sec));
     {
      LabelAllCycles_Time.Caption := TimeToStr(Time-IncSecond(Time, AllCyclesTime_sec)) +' - ' + TimeToStr(Time-IncSecond(Time, AllCyclesTime_sec - AllCyclesTimeCurrent_sec));
      LabelCategory_Time.Caption := TimeToStr(Time-IncSecond(Time, CategoryTime_sec)) +' - ' + TimeToStr(Time-IncSecond(Time, CategoryTime_sec - CategoryTimeCurrent_sec));
      LabelProgram_Time.Caption := TimeToStr(Time-IncSecond(Time, ProgramTime_sec)) +' - ' + TimeToStr(Time-IncSecond(Time, ProgramTime_sec - ProgramTimeCurrent_sec));
}
      if RadioGroupPlayType.ItemIndex <= 1 then  //пусната е програма или категория
      begin

        FrequenceTimeCurrent_sec := FrequenceTimeCurrent_sec + 1;
        LabelFrequence_Time.Caption := TimeToStr(Time-IncSecond(Time, FrequenceTime_sec - FrequenceTimeCurrent_sec));

        LabelAllCycles.Caption := AllCyclesName;
        LabelCategory.Caption := CategoryName;
        LabelProgram.Caption := ProgramName;
        LabelFrequence.Caption := FrequenceName + IntToStr(ADOQueryFreq.RecNo) + ' / '+IntToStr(ADOQueryFreq.RecordCount); //+' ('+ADOQueryFreq.FieldByName('freq').AsString+' Hz)';
        LabelPause.Caption := GroupPause;

      end else
      begin //Когато е на автоматична пауза

        tmpProgresStartUp := tmpProgresStartUp + 1;
        sec := CategoryPlay[LastPositionInGroup].pause_sec - tmpProgresStartUp;

        if tmpProgresStartUp >= CategoryPlay[LastPositionInGroup].pause_sec then
        begin
            MemoDescription.Lines.Add('ИЗТИЧЕ ПАУЗАТА');
            RadioGroupPlayType.ItemIndex := 1;
            CategoryPlay[LastPositionInGroup].pause_pass := 0;
        end else
        begin
          LabelPause_Time.Caption := TimeToStr(Time-IncSecond(Time, sec));
        end;
      end;



      if RadioGroupPlayType.ItemIndex=0 then // 0-play program
      begin
          if (ProgramTimeCurrent_sec) >= (Get_Frequence_Until_Position(ADOQueryFreq.RecNo)) then //AllCyclesTimeCurrent_sec   CategoryPlay[LastPositionInGroup].
          begin
            if (ADOQueryFreq.RecNo = ADOQueryFreq.RecordCount)  then
            begin

              if CheckBoxRepeat.Checked then //непрекъснато повтаря
              begin
                ADOQueryFreq.First;
                FrequenceTime_sec := GetFrequenceTime;
                set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));
                AllCyclesTimeCurrent_sec := 0;
                ProgramTimeCurrent_sec := 0;

                Exit;
              end else
              begin //stop program
                //set_power_freq(0, 0, 1, 0, 0);
                //TimerOnlyTime.Enabled := False;
                ButtonStopProgramClick(nil);
                Exit;
              end;
            end;

            ADOQueryFreq.Next;
            FrequenceTime_sec := GetFrequenceTime;
            set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));
          end;

      end;


      if RadioGroupPlayType.ItemIndex=1 then  //1- play group
      begin

                             {
         MemoDescription.Lines.Add(' sec: '+IntToStr(AllCyclesTimeCurrent_sec)+
                                   ' total: '+IntToStr(CategoryPlay[LastPositionInGroup].total_time_sec)  +
                                   ' position: '+IntToStr(LastPositionInGroup)+
                                   ' Пауза: '+IntToStr(CategoryPlay[LastPositionInGroup].pause_sec)+
                                   ' type: '+IntToStr(CategoryPlay[LastPositionInGroup].pause_type)+
                                   ' минала: '+IntToStr(CategoryPlay[LastPositionInGroup].pause_pass)
                                   );
                                   }

         if (AllCyclesTimeCurrent_sec >= CategoryPlay[LastPositionInGroup].total_time_sec) then
         begin

            if ADOQueryFreq.RecNo = ADOQueryFreq.RecordCount then
            begin
              if ADOQueryDiseases.RecNo = ADOQueryDiseases.RecordCount then
              begin

                 if category_repeat_current = category_repeat then //ПРИКЛЮЧИ
                 begin
                  //  MemoDescription.Lines.Add('finish');
                    ButtonStopProgramClick(nil);
                 end else
                 begin //следващ цикъл на категорията

                    if (CategoryPlay[LastPositionInGroup].pause_sec >= 1) AND (CategoryPlay[LastPositionInGroup].pause_pass >= 1)  then
                    begin
                    //  MemoDescription.Lines.Add('Pause category: '+IntToStr(CategoryPlay[LastPositionInGroup].pause_sec));
                      RadioGroupPlayType.ItemIndex := 2;
                      tmpProgresStartUp := 0;
                      Exit;
                    end;

                    category_repeat_current := category_repeat_current + 1;
                    LastPositionInGroup := 1;
                    //AllCyclesTimeCurrent_sec := 0;
                    CategoryTimeCurrent_sec := 0;

                    TurnOnAllPause();

                    ADOQueryDiseases.First;
                    ProgramTime_sec := GetProgramTime(ADOQueryDiseases.FieldByName('id').AsInteger);

                    ButtonRefreshFreqClick(nil); //get freq for timer
                    FrequenceTime_sec := GetFrequenceTime;

                    set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));

                   // MemoDescription.Lines.Add('Start Category cicle: '+IntToStr(category_repeat_current));

                 end;

              end else
              begin //Следваща програма

                if (CategoryPlay[LastPositionInGroup].pause_sec >= 1) AND (CategoryPlay[LastPositionInGroup].pause_pass >= 1)  then
                begin
                //  MemoDescription.Lines.Add('Pause programs: '+IntToStr(CategoryPlay[LastPositionInGroup].pause_sec));
                  RadioGroupPlayType.ItemIndex := 2;
                  tmpProgresStartUp := 0;
                  Exit;
                end;



                ADOQueryDiseases.Next;
                ProgramTime_sec := GetProgramTime(ADOQueryDiseases.FieldByName('id').AsInteger);

                ButtonRefreshFreqClick(nil); //get freq for timer
                FrequenceTime_sec := GetFrequenceTime;

                set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));
                LastPositionInGroup := LastPositionInGroup + 1;
              //  MemoDescription.Lines.Add('Next program: '+ADOQueryDiseases.FieldByName('name_bg').AsString);

              end;

            end else
            begin //следваща честота

               ADOQueryFreq.Next;
               FrequenceTime_sec := GetFrequenceTime;

               set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));
               LastPositionInGroup := LastPositionInGroup + 1;
             //  MemoDescription.Lines.Add('Next freq: '+ADOQueryFreq.FieldByName('freq').AsString)
            end;


         end;




      end;


  end;


end;
end;

end.
