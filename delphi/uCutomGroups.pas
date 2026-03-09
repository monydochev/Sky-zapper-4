unit uCutomGroups;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  Data.Win.ADODB, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxDBLookupComboBox, Vcl.ExtCtrls, cxCurrencyEdit, AdvEdit;

type
  TfCustomGroups = class(TForm)
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    DataSourceCustomGroup: TDataSource;
    ADOQueryCustomGroup: TADOQuery;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSourceCustomProgram: TDataSource;
    ADOQueryCustomProgram: TADOQuery;
    ButtonFilterGroup: TButton;
    cxGridDBTableView1ColumnProgram: TcxGridDBColumn;
    cxGridDBTableView1ColumnRepeate: TcxGridDBColumn;
    cxGridDBTableView1ColumnPause: TcxGridDBColumn;
    cxGridDBTableView1ColumnSort: TcxGridDBColumn;
    cxGridDBTableView3Column2: TcxGridDBColumn;
    ADOQuerySQL: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonPrepareBuffer: TButton;
    ButtonSendingBuffer: TButton;
    AdvEditBlockPos: TAdvEdit;
    AdvEditBlockMax: TAdvEdit;
    ButtonFinished: TButton;
    ButtonStartSendingBuffer: TButton;
    AdvEditBufferCount: TAdvEdit;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    ButtonAddGroup: TButton;
    EditGroupName: TEdit;
    CheckBoxEdit: TCheckBox;
    ButtonPlay: TButton;
    ButtonPause: TButton;
    ButtonStop: TButton;
    AdvEditBreakProgram: TAdvEdit;
    AdvEditRepeatList: TAdvEdit;
    ButtonDeleteGroup: TButton;
    ButtonSavePrograms: TButton;
    GroupBox2: TGroupBox;
    LabelProgram: TLabel;
    LabelGroupName: TLabel;
    LabelProgramFreq: TLabel;
    LabelPause: TLabel;
    LabelTimeProgram: TLabel;
    LabelTimeElipsed: TLabel;
    ButtonExit: TButton;
    TimerElipsed: TTimer;
    RadioGroupLanguage: TRadioGroup;
    Label1: TLabel;
    EditMajor: TEdit;
    EditMinor: TEdit;
    MemoPersonalList: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    LabelSearch: TLabel;
    EditSearch: TEdit;
    ButtonSearch: TButton;
    AdvEditDuration: TAdvEdit;
    ButtonChangeFreq: TButton;
    ButtonChangeAll: TButton;
    Panel3: TPanel;
    ButtonAddProgram: TButton;
    ButtonRemoveProgram: TButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGridDBTableGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1name_en: TcxGridDBColumn;
    cxGrid1DBTableView1name_bg: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ButtonRefreshFreq: TButton;
    ADOQueryCategory_BUFFER: TADOQuery;
    ADOQueryDiseases_BUFFER: TADOQuery;
    ADOQueryFreq_BUFFER: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure ButtonAddGroupClick(Sender: TObject);
    procedure EditSearchChange(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure RadioGroupLanguageClick(Sender: TObject);
    procedure ButtonAddProgramClick(Sender: TObject);
    procedure cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonFilterGroupClick(Sender: TObject);
    procedure CheckBoxEditClick(Sender: TObject);
    procedure ButtonPlayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonRefreshFreqClick(Sender: TObject);
    procedure cxGridDBColumn2GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonPauseClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonDeleteGroupClick(Sender: TObject);
    procedure ButtonRemoveProgramClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonChangeAllClick(Sender: TObject);
    procedure ButtonChangeFreqClick(Sender: TObject);
    procedure cxGridDBTableView2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TimerElipsedTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonPrepareBufferClick(Sender: TObject);
    procedure ButtonStartSendingBufferClick(Sender: TObject);
    procedure ButtonFinishedClick(Sender: TObject);
    procedure ButtonSendingBufferClick(Sender: TObject);
    procedure ButtonSaveProgramsClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  pls_Idle = 0;
  pls_Play = 1;
  pls_Pause = 2;
  pls_Stop = 3;
  pls_Rest = 4;

var
  fCustomGroups: TfCustomGroups;
  PlayGroupState : Integer; //0-idle, 1-play, 2-pause, 3-stop
  PlayGroupPause : Integer;
  tmpProgresProgramSec, tmpAllProgramSec, break_sec : Integer;
  state_pause : Integer;

implementation
uses uMain, dateutils, math;

{$R *.dfm}

procedure SleepSkyGroup(ms : Integer);
var
Finish_time : TDateTime;
begin
  Finish_time := IncMilliSecond(Now, ms);

  fCustomGroups.MemoPersonalList.Lines.Add('SleepGroup: '+IntToStr(ms)+ ' DATE: '+TimeToStr(Now));

  repeat

     Sleep(100);
     Application.ProcessMessages;

     if PlayGroupState = pls_stop then Exit;


     if PlayGroupPause = pls_Play then
     begin
       while (PlayGroupPause = pls_Play) do
       begin

        if PlayGroupState = pls_stop then Exit;

        Sleep(100);
        Application.ProcessMessages;
       end;
     end;


    //изчаква
  until (Now > Finish_time);

  fCustomGroups.MemoPersonalList.Lines.Add('EXIT - SleepGroup DATE: '+TimeToStr(Finish_time));

  Application.ProcessMessages;
end;



procedure Grab_the_handles_after(wait_secconds:integer);
var
  I, sec: Integer;
begin
with fCustomGroups do
begin

    for I := 1 to wait_secconds do
    begin
        sec := wait_secconds - i;

        if fMain.RadioGroupMainLanguage.ItemIndex=0 then
        begin
          fCustomGroups.LabelTimeProgram.Caption := 'Моля, хванете ръкохватките';
          fCustomGroups.LabelTimeElipsed.Caption := 'Остава: ' + Format('%.2d сек.', [sec mod 60]); //Format('%.2d:%.2d мин.', [sec div 60, sec mod 60]);
        end else
        begin
          fCustomGroups.LabelTimeProgram.Caption := 'Please grab the handles';
          fCustomGroups.LabelTimeElipsed.Caption := 'It remains : ' + Format('%.2d sec.', [sec mod 60]); //Format('%.2d:%.2d мин.', [sec div 60, sec mod 60]);
        end;

        if PlayGroupState = pls_stop then Break;
        if PlayGroupState = pls_Pause then Break;

        SleepSky(1000);
    end;

    if (PlayGroupState = pls_stop) OR (PlayGroupState = pls_Pause) then
    begin
      LabelTimeProgram.Caption := '';
      LabelTimeElipsed.Caption := '';
      MemoPersonalList.Lines.Add('exit from GRAB HANDLES: '+DateTimeToStr(now));
    end;


end;
end;


procedure TfCustomGroups.ButtonPlayClick(Sender: TObject);
var
  I,p, repeat_list: Integer;
begin
with fMain do
begin

  if ADOQueryCustomProgram.RecordCount <= 0 then Exit;

  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  ButtonPause.Enabled := True;

  PlayGroupState := pls_Play;
  PlayGroupPause := 0;

  set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));

  Grab_the_handles_after(10); //Вземете ръкохватките

  if (PlayGroupState <> pls_stop) AND (PlayGroupState <> pls_Pause) then
  begin
    fCustomGroups.MemoPersonalList.Lines.Add('START: '+DateTimeToStr(now));

    repeat_list := AdvEditRepeatList.IntValue;
    break_sec := AdvEditBreakProgram.IntValue;

    for I := 1 to repeat_list do
    begin

      if RadioGroupLanguage.ItemIndex = 0 then
      LabelGroupName.Caption := 'П. списък: ' + ADOQueryCustomGroup.FieldByName('name').AsString+' '+IntToStr(i)+' / '+IntToStr(repeat_list) else
      LabelGroupName.Caption := 'P. list:' + ADOQueryCustomGroup.FieldByName('name').AsString+' '+IntToStr(i)+' / '+IntToStr(repeat_list);

      TimerElipsed.Enabled := True;

      ADOQueryCustomProgram.First;
      while not ADOQueryCustomProgram.Eof  do
      begin

          if RadioGroupLanguage.ItemIndex=0 then
          LabelPause.Caption := 'Пауза: 0 / '+IntToStr(break_sec) else
          LabelPause.Caption := 'Break: 0 / '+IntToStr(break_sec);

          if RadioGroupLanguage.ItemIndex = 0 then
          LabelProgram.Caption := 'Програма:' + ADOQueryCustomProgram.FieldByName('name_bg').AsString else
          LabelProgram.Caption := 'Program:' + ADOQueryCustomProgram.FieldByName('name_en').AsString;

          //Показва честотите и пресмята общото време
          tmpAllProgramSec := 0;
          tmpProgresProgramSec := 0;
          ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+ADOQueryCustomProgram.FieldByName('program_id').AsString+' ORDER BY orderno';
          ADOQueryFreq.Open;
          while not ADOQueryFreq.Eof do
          begin

            if ADOQueryFreq.FieldByName('time_sec').AsInteger=0 then
            tmpAllProgramSec := tmpAllProgramSec + GLB_Duration else
            tmpAllProgramSec := tmpAllProgramSec + ADOQueryFreq.FieldByName('time_sec').AsInteger;

          ADOQueryFreq.Next;
          end;


          PlayGroupState := pls_Play;
          //Пускане на честоти
          ADOQueryFreq.First;
          while not ADOQueryFreq.Eof do
          begin

            if RadioGroupLanguage.ItemIndex = 0 then
            LabelProgramFreq.Caption := 'Честота: '+IntToStr(ADOQueryFreq.RecNo)+' / '+IntToStr(ADOQueryFreq.RecordCount) else
            LabelProgramFreq.Caption := 'Frequence: '+IntToStr(ADOQueryFreq.RecNo)+' / '+IntToStr(ADOQueryFreq.RecordCount);

            //ПУСКАНЕ НА ЧЕСТОТА
            set_power_freq(0, 0, 0, 0, Trunc(ADOQueryFreq.FieldByName('freq').AsFloat * 100));

            //Провери за стопиране на програмата
            if PlayGroupState = pls_stop then Break;

            if ADOQueryFreq.FieldByName('time_sec').AsInteger = 0 then
            SleepSkyGroup(GLB_Duration*1000) else
            SleepSkyGroup(ADOQueryFreq.FieldByName('time_sec').AsInteger*1000);

            //Провери за стопиране на програмата
            if PlayGroupState = pls_stop then Break;

          ADOQueryFreq.Next;
          end;

          //ПОЧИВКА МЕЖДУ ПРОГРАМИТЕ
          PlayGroupState := pls_Rest;
          tmpAllProgramSec := break_sec;
          tmpProgresProgramSec := 0;

          //SleepSkyGroup(1000);

          for p := 1 to break_sec do
          begin

            if RadioGroupLanguage.ItemIndex=0 then
            LabelPause.Caption := 'Пауза: '+IntToStr(p)+' / '+IntToStr(break_sec) else
            LabelPause.Caption := 'Break: '+IntToStr(p)+' / '+IntToStr(break_sec);


            //Провери за стопиране на програмата
            if PlayGroupState = pls_stop then Break;

            SleepSkyGroup(1000);

            //Провери за стопиране на програмата
            if PlayGroupState = pls_stop then Break;
          end;

          //Провери за стопиране на програмата
          if PlayGroupState = pls_stop then Break;


      ADOQueryCustomProgram.Next;
      end;

      //Провери за стопиране на програмата
      if PlayGroupState = pls_stop then Break;

    end;

    ADOQueryCustomProgram.First;

    PlayGroupState := pls_stop;
    TimerElipsed.Enabled := False;

    set_power_freq(0, 0, 1, 0, 0);


  end;


end;













end;

procedure TfCustomGroups.ButtonFilterGroupClick(Sender: TObject);
begin

  with fMain do
  begin

    ADOQueryCustomProgram.Close;

    if ADOQueryCustomGroup.RecordCount <= 0 then Exit;

    ADOQueryCustomProgram.SQL.Text := 'SELECT * FROM v_Custom_Groups WHERE group_id='+ADOQueryCustomGroup.FieldByName('id').AsString+' ORDER BY sort, name_bg';
    ADOQueryCustomProgram.Open;

    if ADOQueryCustomProgram.RecordCount <= 0 then Exit;

    ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+ADOQueryCustomProgram.FieldByName('program_id').AsString+' ORDER BY orderno';
    ADOQueryFreq.Open;

  end;
end;

procedure TfCustomGroups.ButtonAddProgramClick(Sender: TObject);
begin
with fMain do
begin

  ADOQuerySQL.SQL.Text := 'SELECT * FROM custom_programs WHERE id=0';
  ADOQuerySQL.Open;

  ADOQuerySQL.Insert;
  ADOQuerySQL.FieldByName('group_id').AsInteger := ADOQueryCustomGroup.FieldByName('id').AsInteger;
  ADOQuerySQL.FieldByName('program_id').AsInteger := fMain.ADOQueryDiseases.FieldByName('id').AsInteger;
  ADOQuerySQL.FieldByName('sort').AsInteger := ADOQueryCustomProgram.RecordCount + 1;
  ADOQuerySQL.Post;

  ADOQueryCustomProgram.Requery();
end;
end;

procedure TfCustomGroups.ButtonChangeAllClick(Sender: TObject);
begin
with fMain do
begin

  ADOQueryFreq.First;
  while not ADOQueryFreq.Eof do
  begin
    ADOQueryFreq.Edit;
    ADOQueryFreq.FieldByName('time_sec').AsInteger := AdvEditDuration.IntValue;
    ADOQueryFreq.Post;
    //Refresh_Frequences(ADOQueryDiseases.FieldByName('id').AsString);

    ADOQueryFreq.Next;
  end;

end;
end;

procedure TfCustomGroups.ButtonChangeFreqClick(Sender: TObject);
begin
with fMain do
begin
  ADOQueryFreq.Edit;
  ADOQueryFreq.FieldByName('time_sec').AsInteger := AdvEditDuration.IntValue;
  ADOQueryFreq.Post;
//  Refresh_Frequences(ADOQueryDiseases.FieldByName('id').AsString);
end;
end;

procedure TfCustomGroups.ButtonDeleteGroupClick(Sender: TObject);
begin

  if RadioGroupLanguage.ItemIndex=0 then
  begin
    if MessageDlg('Сигурни ли сте, че искате да изтриете тази група?', mtConfirmation, mbYesNo, 0) <> mrYes then exit;
  end else
  begin
    if MessageDlg('Are you sure you want to delete this group?', mtConfirmation, mbYesNo, 0) <> mrYes then exit;
  end;


  ADOQueryCustomGroup.Delete;
  ButtonFilterGroup.Click;
end;

procedure TfCustomGroups.ButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TfCustomGroups.ButtonRefreshFreqClick(Sender: TObject);
var sec:Integer;
begin
with fMain do
begin
  if ADOQueryDiseases.RecordCount <= 0 then Exit;

  ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+ADOQueryDiseases.FieldByName('id').AsString+' ORDER BY orderno';
  ADOQueryFreq.Open;

 // Refresh_Frequences(ADOQueryDiseases.FieldByName('id').AsString);

   {
  if RadioGroupLanguage.ItemIndex=0 then
  MemoDescription.Lines.Text := ADOQueryDiseases.FieldByName('description_bg').AsString else
  MemoDescription.Lines.Text := ADOQueryDiseases.FieldByName('description_en').AsString;
 }

end;
end;

procedure TfCustomGroups.ButtonRemoveProgramClick(Sender: TObject);
begin
  if RadioGroupLanguage.ItemIndex=0 then
  begin
    if MessageDlg('Искате ли да извадите тази програма от списъка?', mtConfirmation, mbYesNo, 0) <> mrYes then exit;
  end else
  begin
    if MessageDlg('Do you want to remove this program from the list?', mtConfirmation, mbYesNo, 0) <> mrYes then exit;
  end;

  ADOQuerySQL.SQL.Text := 'DELETE FROM custom_programs WHERE id = '+ADOQueryCustomProgram.FieldByName('id').AsString;
  ADOQuerySQL.ExecSQL;

  ADOQueryCustomProgram.Requery;

end;

procedure TfCustomGroups.ButtonSearchClick(Sender: TObject);
var
order_des : string;
begin
with fMain do
begin

  if RadioGroupLanguage.ItemIndex=0 then
  begin
    //order_cat := 'ORDER BY category_name_bg';
    order_des := 'ORDER BY name_bg';
  end else
  begin
    //order_cat := 'ORDER BY category_name_en';
    order_des := 'ORDER BY name_en';
  end;


  ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE name_en LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' OR name_bg LIKE '+#39+'%'+EditSearch.Text+'%'+#39+
                                                      ' OR description_en LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' OR description_bg LIKE '+#39+'%'+EditSearch.Text+'%'+#39+order_des;
  ADOQueryDiseases.Open;

end;
end;


procedure DrowPause;
begin
with fCustomGroups do
begin

  if RadioGroupLanguage.ItemIndex = 0 then
  begin
    if PlayGroupPause=0 then
    ButtonPause.Caption := 'Пауза' else
    ButtonPause.Caption := 'Продължи';
  end else
  begin
    if PlayGroupPause=0 then
    ButtonPause.Caption := 'Pause' else
    ButtonPause.Caption := 'Continue';
  end;

end;
end;

procedure TfCustomGroups.ButtonPauseClick(Sender: TObject);
var
  exit_pause : Integer;
begin

  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  {
  if PlayGroupState <> pls_Play then
  begin
    if RadioGroupLanguage.ItemIndex = 0 then
    ShowMessage('Не е пусната програма!') else
    ShowMessage('No program has been launched');
  end;
  }

  MemoPersonalList.Lines.Add('Pause: '+IntToStr(PlayGroupPause));

  if PlayGroupPause = 0 then //ИЗКЛЮЧЕНО
  PlayGroupPause := 1 else //ПУСКАНЕ НА ПАУЗА
  PlayGroupPause := 0; //СПИРАНЕ

  DrowPause;

  MemoPersonalList.Lines.Add('Pause: '+IntToStr(PlayGroupPause));


  PlayGroupState := pls_Pause; //0 - idle, 1 - Play, 2 - Pause, 3 - Stop

  //Спиране на таймера и стоп на генератора
  TimerElipsed.Enabled := False;
  set_power_freq(0, 0, 1, 0, 0);
  exit_pause := 0;

  MemoPersonalList.Lines.Add('START - СТАТУС НА БУТОН ПАУЗА: '+IntToStr(PlayGroupPause));

  repeat

     Sleep(100);
     Application.ProcessMessages;
     if PlayGroupState = pls_stop then exit_pause := 1;
     if PlayGroupPause = 0 then exit_pause := 1;

     fMain.Caption := 'PAUSE: '+TimeToStr(time);

  until (exit_pause = 1);


  DrowPause;

  if PlayGroupPause = 0 then
  TimerElipsed.Enabled := True;

  MemoPersonalList.Lines.Add('FINISH - СТАТУС НА БУТОН ПАУЗА: '+ButtonPause.Caption);

end;

procedure TfCustomGroups.ButtonStopClick(Sender: TObject);
begin

  if Check_Connect(1) = False then Exit;
  if Check_Zapper(1) = False then Exit;

  ButtonPause.Enabled := False;

  PlayGroupState := pls_stop;
  TimerElipsed.Enabled := False;
  set_power_freq(0, 0, 1, 0, 0);

  fCustomGroups.LabelTimeProgram.Caption := '';
  fCustomGroups.LabelTimeElipsed.Caption := '';

  MemoPersonalList.Lines.Add('STOP BUTTON: '+DateTimeToStr(now));

end;

procedure TfCustomGroups.Button1Click(Sender: TObject);
var

  Program_ID,
  Category_ID : Integer;
  PROGRAM_LENGTH : Integer;

  PROGRAM_COUNT : Integer;
  PROGRAM_NAME : string;

  x, pos:Integer;

begin

  PREPARE_BUFF;

  Category_ID := 1111;
  Program_ID := 2222;
  PROGRAM_LENGTH := 6; //60 / 10 = 1 секунди
  PROGRAM_COUNT := 2;
  PROGRAM_NAME := 'Testing program 100';

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 26; //save program
  USB_Buffer[5] := byte(Program_ID);
  USB_Buffer[6] := byte(Program_ID shr 8);

  USB_Buffer[7] := byte(Category_ID);
  USB_Buffer[8] := byte(Category_ID shr 8);

  USB_Buffer[9] := byte(PROGRAM_LENGTH);
  USB_Buffer[10] := byte(PROGRAM_LENGTH shr 8);

  USB_Buffer[11] := byte(PROGRAM_COUNT);
  USB_Buffer[12] := byte(PROGRAM_COUNT shr 8);

  pos := 13;
  for x := 1 to 80 do
  begin

    if x <= Length(PROGRAM_NAME) then
    begin
      USB_Buffer[pos] := Ord(PROGRAM_NAME[x]);
      pos := pos + 1;
    end else
    begin
      //USB_Buffer[pos] := ord('*');
    end;




  end;


   //  for x := 1 to 92 do
   //  MemoPersonalList.Lines.Add('B. Send - no: '+IntToStr(x)+' - '+IntToStr(USB_Buffer[pos]));




  SendBufferToLAN(pos);
  LAN_PARSE_BUFF('LAN - Изпращане на команда сила и честота', pos);

  {
    Задаване на параметрите на програмата:
    00 02 26 26
    (2 байта - ID на програма)
    (2 байта - ID на категория)
    (2 байта - времетраене на програмата)
    (2 байта - брой честоти)
    (до 80 байта - име на програма)

    За времетраене на програмата се подава цяло число което е сумарното време на всички честоти в секунди разделено на 10
  }

end;

procedure TfCustomGroups.Button2Click(Sender: TObject);
var

  Frequence_ID, Frequence_IDv2,
  FREQ_LENGTH, FREQ_LENGTHv2 : Integer;


  x, pos:Integer;

begin

  PREPARE_BUFF;

  Frequence_ID := 150 * 100;
  Frequence_IDv2 := 350 * 100;

  FREQ_LENGTH := 30; //60 / 10 = 1 секунди
  FREQ_LENGTHv2 := 30; //60 / 10 = 1 секунди

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 27; //save frequence
  USB_Buffer[5] := 0;

  USB_Buffer[6] := byte(Frequence_ID);
  USB_Buffer[7] := byte(Frequence_ID shr 8);
  USB_Buffer[8] := byte(Frequence_ID shr 16);
  USB_Buffer[9] := byte(Frequence_ID shr 24);
  USB_Buffer[10] := FREQ_LENGTH;

  USB_Buffer[11] := byte(Frequence_IDv2);
  USB_Buffer[12] := byte(Frequence_IDv2 shr 8);
  USB_Buffer[13] := byte(Frequence_IDv2 shr 16);
  USB_Buffer[14] := byte(Frequence_IDv2 shr 24);
  USB_Buffer[15] := FREQ_LENGTHv2;

  SendBufferToLAN(15);
  LAN_PARSE_BUFF('LAN - Изпращане на команда запази честота', 15);


{
Задаване на честотите на програмата:
00 02 26 27 00
(4 байта - честота 1 )
(1 байт - времетраене 1 )
.....
(4 байта - честота 30 )
(1 байт - времетраене 30 )

Броят честоти може да е променлив.
За времетраене на честота се подава цяло число което е времето на честотата в секунди разделено на 10


}
end;

procedure TfCustomGroups.Button3Click(Sender: TObject);
begin
  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 28; //start program

  SendBufferToLAN(4);
  LAN_PARSE_BUFF('LAN - Изпращане на команда START', 4);

//  Старт на програмата:
//00 02 26 28
end;

procedure TfCustomGroups.ButtonPrepareBufferClick(Sender: TObject);
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
GLB_FILTER, GLB_CATEGORY_ORDER, GLB_DISEASES_ORDER, tmp_TOP100 : string;
i:Integer;
f : file of Byte;
b : Byte;
tmpWin1251: Win1251String;
tmpUnicode : WideString;
begin

//with fMain do
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


  GLB_FILTER := ' AND prog=1 ';

  if RadioGroupLanguage.ItemIndex = 0 then
  GLB_DISEASES_ORDER := ' ORDER BY name_bg' else //favorite, name_bg'
  GLB_DISEASES_ORDER := ' ORDER BY name_en';

  if RadioGroupLanguage.ItemIndex = 0 then
  GLB_CATEGORY_ORDER := ' ORDER BY category_name_BG' else
  GLB_CATEGORY_ORDER := ' ORDER BY category_name_EN';


  //Изчистване на старите програми
  ADOQuerySQL.SQL.Text := 'UPDATE diseases SET prog=0';
  ADOQuerySQL.ExecSQL;

  //Селектира само новите за наливане в Zapper
  ADOQuerySQL.SQL.Text := 'UPDATE diseases SET prog=1 WHERE id IN (SELECT program_id FROM custom_programs)';
  ADOQuerySQL.ExecSQL;


  //ADOQueryCategory.SQL.Text := 'SELECT * FROM category WHERE id IN (SELECT category_id FROM diseases WHERE category_id >= 1 '+GLB_FILTER+') ' + GLB_CATEGORY_ORDER;
  ADOQueryCategory_BUFFER.SQL.Text := 'SELECT * FROM custom_groups ORDER BY sort, name';
  ADOQueryCategory_BUFFER.Open;

  all_category := ADOQueryCategory_BUFFER.RecordCount;
  buff[5] := byte(all_category);
  buff[6] := byte(all_category shr 8);
  buff[7] := StrToInt(EditMajor.Text); //Major version DB
  buff[8] := StrToInt(EditMinor.Text); //Minor version DB
  buff[9] := 255;

  x := 9;
  settings := 10;
  point := 0;

  ADOQueryDiseases_BUFFER.SQL.Text := 'SELECT * FROM diseases WHERE id >= 1 ' + GLB_FILTER + GLB_DISEASES_ORDER;
  ADOQueryDiseases_BUFFER.Open;

  ADOQueryFreq_BUFFER.SQL.Text := 'SELECT count(id) AS C FROM freq WHERE disease_id IN (SELECT id FROM diseases WHERE id >= 1 ' + GLB_FILTER + GLB_DISEASES_ORDER+')';
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
    //ADOQueryDiseases_BUFFER.SQL.Text := 'SELECT * FROM diseases WHERE category_id='+ADOQueryCategory_BUFFER.FieldByName('id').AsString  + GLB_FILTER + GLB_DISEASES_ORDER;
    ADOQueryDiseases_BUFFER.SQL.Text := 'SELECT * FROM v_Custom_Groups WHERE group_id='+ADOQueryCategory_BUFFER.FieldByName('id').AsString+' ORDER BY sort';
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

                  //IntToStr(ADOQueryCustomGroup.RecNo) + '-' +
    tmpUnicode := ADOQueryCategory_BUFFER.FieldByName('name').AsString;


    //if RadioGroupProgLang.ItemIndex = 0 then
    //tmpUnicode := tmpUnicode + ADOQueryCategory.FieldByName('category_name_bg').AsString else
    //tmpUnicode := tmpUnicode + ADOQueryCategory.FieldByName('category_name_en').AsString;

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






  point := 0;

  //Взема всички програми за запис / като бройка
  ADOQuerySQL.SQL.Text := 'SELECT count(id) AS c FROM diseases WHERE  category_id >= 1 ' + GLB_FILTER;
  ADOQuerySQL.Open;
  all_diseases := ADOQuerySQL.FieldByName('C').AsInteger;

  //DISEASES
  ADOQueryCategory_BUFFER.First;
  while not ADOQueryCategory_BUFFER.Eof do
  begin

      //ADOQueryDiseases_BUFFER.SQL.Text := 'SELECT * FROM diseases WHERE category_id='+ADOQueryCategory_BUFFER.FieldByName('id').AsString + GLB_FILTER + GLB_DISEASES_ORDER;
      ADOQueryDiseases_BUFFER.SQL.Text := 'SELECT * FROM v_Custom_Groups WHERE group_id='+ADOQueryCategory_BUFFER.FieldByName('id').AsString+' ORDER BY sort';
      ADOQueryDiseases_BUFFER.Open;
      while not ADOQueryDiseases_BUFFER.Eof do
      begin

          //if x >= max_buffer-20 then
          if x >= All_Memmory then
          begin
            ShowMessage('Препълване на буфера');
            Exit;
          end;

          //ид на болест
          //n2x := ADOQueryDiseases_BUFFER.FieldByName('id').AsInteger;
          n2x := ADOQueryDiseases_BUFFER.FieldByName('program_id').AsInteger;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          //категория
          n2x := ADOQueryCategory_BUFFER.FieldByName('id').AsInteger;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          //любими
          //x:=x+1; buff[x] := byte(ADOQueryDiseases_BUFFER.FieldByName('favorite').AsInteger);
          x:=x+1; buff[x] := byte(0);

          //дължина на програмта
          //ADOQuerySQL.SQL.Text := 'SELECT count(disease_id) AS Q, SUM(time_sec) AS FREQ_LEN FROM freq WHERE disease_id='+ADOQueryDiseases_BUFFER.FieldByName('id').AsString;
          ADOQuerySQL.SQL.Text := 'SELECT count(disease_id) AS Q, SUM(time_sec) AS FREQ_LEN FROM freq WHERE disease_id='+ADOQueryDiseases_BUFFER.FieldByName('program_id').AsString;
          ADOQuerySQL.Open;

          n2x :=  ADOQuerySQL.FieldByName('FREQ_LEN').AsInteger * 300; //ADOQuerySQL.FieldByName('FREQ_LEN').AsInteger;
          x:=x+1; buff[x] := byte(n2x);
          x:=x+1; buff[x] := byte(n2x shr 8);

          ADOQueryFreq_BUFFER.DisableControls;
          //ADOQueryFreq_BUFFER.SQL.Text := 'SELECT * FROM freq WHERE disease_id=' + ADOQueryDiseases_BUFFER.FieldByName('id').AsString + ' ORDER BY orderno';
          ADOQueryFreq_BUFFER.SQL.Text := 'SELECT * FROM freq WHERE disease_id=' + ADOQueryDiseases_BUFFER.FieldByName('program_id').AsString + ' ORDER BY orderno';
          ADOQueryFreq_BUFFER.Open;
          //Caption := ADOQueryFreq_BUFFER.SQL.Text;
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

         // if RadioGroupProgLang.ItemIndex = 0 then
         // program_name := ADOQueryDiseases_BUFFER.FieldByName('name_bg').AsString else
         // program_name := ADOQueryDiseases_BUFFER.FieldByName('name_en').AsString;


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

            MemoPersonalList.Lines.Add('freq: '+ADOQueryFreq_BUFFER.FieldByName('time_sec').AsString);

          ADOQueryFreq_BUFFER.Next;
          end;



      ADOQueryDiseases_BUFFER.Next;
      end;




  ADOQueryCategory_BUFFER.Next;
  end;


  max_buffer := fr;

  AdvEditBlockMax.IntValue := max_buffer;

  for i := 0 to max_buffer do
  begin
  //  MemoMainLogEvent.Lines.Add('No: '+IntToStr(i)+ ' Byte: '+IntToStr(buff[i])+' Hex: '+IntToHex(buff[i], 2) + isCharacters(buff[i]) );
  end;


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

procedure TfCustomGroups.ButtonSendingBufferClick(Sender: TObject);
var
x, pos, block_position, block_maximum, tmpLengthBuffer, block_position_addr:Integer;
begin

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

procedure TfCustomGroups.ButtonFinishedClick(Sender: TObject);
begin
  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 52;

  SendBufferToLAN(4);
  LAN_PARSE_BUFF('LAN - STOP BLOCK sending', 4);

end;

procedure TfCustomGroups.ButtonStartSendingBufferClick(Sender: TObject);
begin
  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 2;
  USB_Buffer[3] := 26;
  USB_Buffer[4] := 50;

  SendBufferToLAN(4);
  LAN_PARSE_BUFF('LAN - START BLOCK', 4);

end;

procedure TfCustomGroups.ButtonSaveProgramsClick(Sender: TObject);
begin


  ButtonPrepareBufferClick(nil);
  ButtonStartSendingBufferClick(nil);

end;

procedure TfCustomGroups.ButtonAddGroupClick(Sender: TObject);
begin

//ADOQuerySQL.SQL.Text := 'SELECT MAX(sort) AS S FROM ';
//ADOQuerySQL.Open;

  if EditGroupName.Text <> '' then
  begin
    ADOQueryCustomGroup.Insert;
//    ADOQueryCustomGroup.FieldByName('ID').AsInteger := 10000 + ADOQueryCustomGroup.RecordCount + 1;
    ADOQueryCustomGroup.FieldByName('name').AsString := EditGroupName.Text;
    ADOQueryCustomGroup.FieldByName('sort').AsInteger := ADOQueryCustomGroup.RecordCount + 1;
    ADOQueryCustomGroup.FieldByName('user_id').AsInteger := LoginUser;
    ADOQueryCustomGroup.Post;

    ButtonFilterGroupClick(nil);
  end else
  begin

    if RadioGroupLanguage.ItemIndex=0 then
    ShowMessage('Моля, въведете име!') else
    ShowMessage('Please enter a name!');

  end;
  EditGroupName.Text := '';

end;

procedure TfCustomGroups.CheckBoxEditClick(Sender: TObject);
begin

cxGridDBTableView1.OptionsData.Editing := CheckBoxEdit.Checked;
cxGridDBTableView3.OptionsData.Editing := CheckBoxEdit.Checked;

end;

procedure TfCustomGroups.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
with fMain do
begin
  if ADOQueryDiseases.RecordCount <= 0 then Exit;

  ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+ADOQueryDiseases.FieldByName('id').AsString+' ORDER BY orderno';
  ADOQueryFreq.Open;

end;
end;

procedure TfCustomGroups.cxGridDBColumn2GetDisplayText(
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

procedure TfCustomGroups.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
with fMain do
begin
  if ADOQueryCustomProgram.RecordCount <= 0 then Exit;

  ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+ADOQueryCustomProgram.FieldByName('program_id').AsString+' ORDER BY orderno';
  ADOQueryFreq.Open;

end;
end;

procedure TfCustomGroups.cxGridDBTableView2CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  AdvEditDuration.IntValue := fMain.ADOQueryFreq.FieldByName('time_sec').AsInteger;
end;

procedure TfCustomGroups.cxGridDBTableView3CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  ButtonFilterGroupClick(nil);
  LabelGroupName.Caption := ADOQueryCustomGroup.FieldByName('name').AsString;
end;

procedure TfCustomGroups.EditSearchChange(Sender: TObject);
begin
  ButtonSearch.Click;
end;

procedure TfCustomGroups.FormClose(Sender: TObject; var Action: TCloseAction);
begin
          {
  if (PlayGroupState = pls_Play) OR (PlayGroupState = pls_Pause) then
  begin
    try
      ButtonStopClick(nil);
    except
    end;
  end;      }

  Action:=caFree;
  fCustomGroups := nil;
end;

procedure TfCustomGroups.FormResize(Sender: TObject);
var
  tmpWidth, Col1, Col2 : Integer;
begin

  tmpWidth := cxGrid2.ClientWidth - cxGridDBTableView1ColumnSort.Width - 40;

  //Col1 :=  MulDiv(tmpWidth, 40, 100);
  cxGridDBTableView1ColumnProgram.Width := tmpWidth;



end;

procedure TfCustomGroups.FormShow(Sender: TObject);
var order_des:string;
begin

  if fMain.RadioGroupMainLanguage.ItemIndex=0 then
  fCustomGroups.Caption := 'Персонализирани групи' else
  fCustomGroups.Caption := 'Custom groups';

  RadioGroupLanguage.ItemIndex := fMain.RadioGroupMainLanguage.ItemIndex;
  RadioGroupLanguageClick(nil);

  ADOQueryCustomGroup.SQL.Text := 'SELECT * FROM custom_groups WHERE user_id = ' + IntToStr(LoginUser) + ' ORDER BY sort, name';
  ADOQueryCustomGroup.Open;

  ADOQueryCustomProgram.SQL.Text := 'SELECT * FROM v_Custom_Groups WHERE id=0 ORDER BY sort';
  ADOQueryCustomProgram.Open;

  ButtonFilterGroupClick(nil);

  if RadioGroupLanguage.ItemIndex=0 then
  begin
    //order_cat := 'ORDER BY category_name_bg';
    order_des := 'ORDER BY name_bg';
  end else
  begin
    //order_cat := 'ORDER BY category_name_en';
    order_des := 'ORDER BY name_en';
  end;



  fMain.ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases '+order_des;
  fMain.ADOQueryDiseases.Open;


  if ParamStr(1) = 'net' then
  begin
    MemoPersonalList.Visible := True;
    ButtonSavePrograms.Visible := True;
  end;


end;

procedure TfCustomGroups.RadioGroupLanguageClick(Sender: TObject);
begin



  case RadioGroupLanguage.ItemIndex of
  0:begin //BG
    cxGridDBTableView3Column1.Caption := 'Персонален списък';
    cxGridDBTableView3Column2.Caption := 'Сорт номер';

    cxGridDBTableView1ColumnProgram.Caption := 'Програма';
    cxGridDBTableView1ColumnRepeate.Caption := 'Повтаряне брой';
    cxGridDBTableView1ColumnPause.Caption := 'Почивка сек.';
    cxGridDBTableView1ColumnSort.Caption := 'Сорт номер';
    cxGrid1DBTableView1name_bg.Visible := True;
    cxGrid1DBTableView1name_en.Visible := False;
    cxgrdbclmnGrid1DBTableView1Column1.Caption := 'Бр.';
    CheckBoxEdit.Caption := 'Редактиране';
    LabelSearch.Caption := 'Търсене';
    ButtonSearch.Caption := 'Търси';
    ButtonAddProgram.Caption := 'ДОБАВИ КЪМ ТОЗИ СПИСЪК';
    Label3.Caption := 'Име';
    LabelGroupName.Caption := 'Персонален списък';
    LabelProgram.Caption := 'Текуща програма';
    LabelProgramFreq.Caption := 'Честоти';
    LabelPause.Caption := 'Почивка';
    ButtonPlay.Caption := 'Пусни';
    ButtonPause.Caption := 'Пауза';
    ButtonStop.Caption := 'Стоп';
    ButtonAddGroup.Caption := 'Добави списък';
    ButtonDeleteGroup.Caption := 'Премахни списък';

    cxGridDBColumn1.Caption := 'Честота';
    cxGridDBColumn2.Caption := 'Сек.';

    AdvEditBreakProgram.LabelCaption := 'Времетраене за почивка между програмите в секунди';
    AdvEditRepeatList.LabelCaption := 'Колко цикъла да повтори списъка с програми';

    AdvEditDuration.LabelCaption := 'Продължителност в секунди';
    ButtonChangeFreq.Caption := 'Промени';
    ButtonChangeAll.Caption := 'Промени всички';

    ButtonExit.Caption := 'ЗАТВОРИ';
    ButtonSavePrograms.Caption := 'ДОБАВИ ПРОГРАМИТЕ В ЗАПЕРА';

  end;
  1:begin //EN
    cxGridDBTableView3Column1.Caption := 'Personal list';
    cxGridDBTableView3Column2.Caption := 'Sort No';

    cxGridDBTableView1ColumnProgram.Caption := 'Programs';
    cxGridDBTableView1ColumnRepeate.Caption := 'Repeat';
    cxGridDBTableView1ColumnPause.Caption := 'Break sec.';
    cxGridDBTableView1ColumnSort.Caption := 'Sort No';
    cxGrid1DBTableView1name_bg.Visible := False;
    cxGrid1DBTableView1name_en.Visible := True;
    cxgrdbclmnGrid1DBTableView1Column1.Caption := 'Q.';
    CheckBoxEdit.Caption := 'Editing';
    LabelSearch.Caption := 'Search';
    ButtonSearch.Caption := 'Search';
    ButtonAddProgram.Caption := 'Add in this list';
    Label3.Caption := 'Name'; //Personal list name
    LabelGroupName.Caption := 'Personal list';
    LabelProgram.Caption := 'Current program';
    LabelProgramFreq.Caption := 'Frequence';
    LabelPause.Caption := 'Break';
    ButtonPlay.Caption := 'Play';
    ButtonPause.Caption := 'Pause';
    ButtonStop.Caption := 'Stop';
    ButtonAddGroup.Caption := 'Add list';
    ButtonDeleteGroup.Caption := 'Remove list';

    cxGridDBColumn1.Caption := 'Freq.';
    cxGridDBColumn2.Caption := 'Sec.';

    AdvEditDuration.LabelCaption := 'Duration in seconds';
    ButtonChangeFreq.Caption := 'Change';
    ButtonChangeAll.Caption := 'Change All';

    AdvEditBreakProgram.LabelCaption := 'Break time between programs in personal list (in secs)';
    AdvEditRepeatList.LabelCaption := 'How many times to repeat the personal list';

    ButtonExit.Caption := 'CLOSE';
    ButtonSavePrograms.Caption := 'ADD PROGRAMS TO ZAPERA';
  end;
  end;


end;

procedure TfCustomGroups.TimerElipsedTimer(Sender: TObject);
var sec:integer;
begin
with fMain do
begin

  tmpProgresProgramSec := tmpProgresProgramSec + 1;
  sec := tmpAllProgramSec - tmpProgresProgramSec;







  if (PlayGroupState = pls_Rest) then
  begin

    if fCustomGroups.RadioGroupLanguage.ItemIndex = 0 then
    begin
      LabelTimeProgram.Caption := 'ПОЧИВКА ОТ: '+IntToStr(break_sec);
//      LabelTimeProgram.Caption := 'Общо време: ' + TimeToStr(Time-IncSecond(Time, tmpAllProgramSec));
      LabelTimeElipsed.Caption := 'Остава: ' + TimeToStr(Time-IncSecond(Time, sec));
    end else
    begin
      LabelTimeProgram.Caption := 'Totel time: ' + TimeToStr(Time-IncSecond(Time, sec));
      LabelTimeElipsed.Caption := 'Remains time: ' + TimeToStr(Time-IncSecond(Time, sec));
    end;


  end else
  begin

    if fCustomGroups.RadioGroupLanguage.ItemIndex = 0 then
    begin
      LabelTimeProgram.Caption := 'Общо време: ' + TimeToStr(Time-IncSecond(Time, tmpAllProgramSec));
      LabelTimeElipsed.Caption := 'Остава: ' + TimeToStr(Time-IncSecond(Time, sec));
    end else
    begin
      LabelTimeProgram.Caption := 'Totel time: ' + TimeToStr(Time-IncSecond(Time, sec));
      LabelTimeElipsed.Caption := 'Remains time: ' + TimeToStr(Time-IncSecond(Time, sec));
    end;

  end;




end;
end;

end.
