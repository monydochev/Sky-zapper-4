unit uEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox,
  Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, AdvEdit,
  dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.Win.ADODB;

type
  TfEdit = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1name_bg: TcxGridDBColumn;
    cxGrid1DBTableView1description_bg: TcxGridDBColumn;
    cxGrid1DBTableView1Prevod: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ButtonRefreshFreq: TButton;
    Button19: TButton;
    Button24: TButton;
    cxGrid1DBTableView1name_en: TcxGridDBColumn;
    cxGrid1DBTableView1description_EN: TcxGridDBColumn;
    cxGrid1DBTableView1Quantity: TcxGridDBColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    AdvEditFreq: TAdvEdit;
    ButtonChangeFreq: TButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel4: TPanel;
    AdvEditFreqQ: TAdvEdit;
    Button_freq_add: TButton;
    Button_freq_remove: TButton;
    AdvEditDuration: TAdvEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    CheckBoxCategory: TCheckBox;
    CheckBoxDiseases: TCheckBox;
    EditDescriptionEN: TEdit;
    EditDescriptionBG: TEdit;
    ButtonNewProgram: TButton;
    ButtonDeleteProgram: TButton;
    ButtonSaveProgram: TButton;
    RadioGroupLanguage: TRadioGroup;
    CheckBox1: TCheckBox;
    ButtonAddGroup: TButton;
    ButtonRemoveGroup: TButton;
    EditProgramEN: TEdit;
    EditProgramBG: TEdit;
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3category_name: TcxGridDBColumn;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView3Column2: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    ButtonShowPrograms: TButton;
    Panel6: TPanel;
    ButtonLink: TButton;
    ButtonUnlink: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    CheckBoxEdit: TCheckBox;
    AdvEditBreakProgram: TAdvEdit;
    AdvEditRepeatList: TAdvEdit;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel7: TPanel;
    Button2: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
    ButtonExit: TButton;
    ADOQuerySQL: TADOQuery;
    AdvEdit_pause_repeat_cycle: TAdvEdit;
    ADOQuerySort: TADOQuery;
    Button1: TButton;
    ButtonDeleteGroup: TButton;
    RadioGroupGroupType: TRadioGroup;
    cxGridDBTableView3Column2: TcxGridDBColumn;
    cxGridDBTableView3Column3: TcxGridDBColumn;
    cxGridDBTableView3Column4: TcxGridDBColumn;
    cxGridDBTableView3Column5: TcxGridDBColumn;
    EditSearch: TEdit;
    Button4: TButton;
    Label6: TLabel;
    EditGroupNameBG: TEdit;
    Label7: TLabel;
    EditGroupNameEN: TEdit;
    ButtonShowProgramsRight: TButton;
    cxGrid5: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxGridDBTableView3User_access: TcxGridDBColumn;
    ButtonShowAll: TButton;
    procedure ButtonLinkClick(Sender: TObject);
    procedure ButtonUnlinkClick(Sender: TObject);
    procedure ButtonRefreshFreqClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure CheckBoxCategoryClick(Sender: TObject);
    procedure CheckBoxDiseasesClick(Sender: TObject);
    procedure RadioGroupLanguageClick(Sender: TObject);
    procedure ButtonNewProgramClick(Sender: TObject);
    procedure ButtonDeleteProgramClick(Sender: TObject);
    procedure ButtonSaveProgramClick(Sender: TObject);
    procedure Button_freq_addClick(Sender: TObject);
    procedure Button_freq_removeClick(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonShowAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonAddGroupClick(Sender: TObject);
    procedure ButtonRemoveGroupClick(Sender: TObject);
    procedure cxGridDBTableView1Column3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonChangeFreqClick(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonShowProgramsClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cxGridDBTableView2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonDeleteGroupClick(Sender: TObject);
    procedure CheckBoxEditClick(Sender: TObject);
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure ButtonShowProgramsRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEdit: TfEdit;
  add_new_program : Integer;
implementation

{$R *.dfm}

uses uMain, math;

procedure TfEdit.ButtonLinkClick(Sender: TObject);
begin

  ADOQuerySort.SQL.Text := 'SELECT count(*) AS Q FROM programs_groups_connections WHERE category_id = :P1';
  ADOQuerySort.Parameters.Clear;
  ADOQuerySort.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, fMain.ADOQueryCategory.FieldByName('id').AsInteger);
  ADOQuerySort.Open;

  ADOQuerySQL.SQL.Text := 'SELECT * FROM programs_groups_connections WHERE category_id = :P1 AND program_id = :P2';
  ADOQuerySQL.Parameters.Clear;
  ADOQuerySQL.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, fMain.ADOQueryCategory.FieldByName('id').AsInteger);
  ADOQuerySQL.Parameters.CreateParameter('P2', ftInteger, pdInput, 255, fMain.ADOQueryDiseases.FieldByName('id').AsInteger);
  ADOQuerySQL.Open;

  if ADOQuerySQL.RecordCount = 1 then
  begin
    ShowMessage('Вече е добавена тази програма!');
  end else
  begin
    ADOQuerySQL.Insert;
    ADOQuerySQL.FieldByName('category_id').AsInteger := fMain.ADOQueryCategory.FieldByName('id').AsInteger;
    ADOQuerySQL.FieldByName('program_id').AsInteger := fMain.ADOQueryDiseases.FieldByName('id').AsInteger;
    ADOQuerySQL.FieldByName('sort').AsInteger := ADOQuerySort.FieldByName('Q').AsInteger + 1;
    ADOQuerySQL.Post;
    ShowMessage('Успешно добавена програма!');
    fMain.ADOQueryPrograms.Requery();
  end;


end;

procedure TfEdit.ButtonUnlinkClick(Sender: TObject);
begin


  ADOQuerySQL.SQL.Text := 'SELECT * FROM programs_groups_connections WHERE category_id = :P1 AND program_id = :P2';
  ADOQuerySQL.Parameters.Clear;
  ADOQuerySQL.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, fMain.ADOQueryCategory.FieldByName('id').AsInteger);
  ADOQuerySQL.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, fMain.ADOQueryDiseases.FieldByName('id').AsInteger);
  ADOQuerySQL.Open;

  if ADOQuerySQL.RecordCount = 1 then
  begin
    ADOQuerySQL.Delete;
    //ButtonShowProgramsClick(nil);
    fMain.ADOQueryPrograms.Requery();
    ShowMessage('Тази програма е премахната от групата!');
  end else
  begin
    ShowMessage('Тази програма липсва във връзките към групата!');
  end;

end;

procedure TfEdit.Button19Click(Sender: TObject);
var i:Integer;
begin
with fmain do
begin
if ADOQueryFreq.RecNo > 1 then
begin
i:=ADOQueryFreq.FieldByName('id').AsInteger;
ADOQueryFreq.Edit;
ADOQueryFreq.FieldByName('orderno').AsInteger:=ADOQueryFreq.FieldByName('orderno').AsInteger-1;
ADOQueryFreq.Post;
ADOQueryFreq.Prior;
ADOQueryFreq.Edit;
ADOQueryFreq.FieldByName('orderno').AsInteger:=ADOQueryFreq.FieldByName('orderno').AsInteger+1;
ADOQueryFreq.Post;
ADOQueryFreq.Requery();
ADOQueryFreq.Locate('id',i,[]);
end;
end;
end;

procedure TfEdit.ButtonShowAllClick(Sender: TObject);
begin

  with fMain do
  begin

    //add_new_program := 0;

    if RadioGroupLanguage.ItemIndex=0 then
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases ORDER BY sort, name_en' else
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases ORDER BY sort, name_bg';

    ADOQueryDiseases.Open;

  end;

end;

procedure TfEdit.ButtonShowProgramsClick(Sender: TObject);
var
  table, OrderPrograms : string;
begin

  with fMain do
  begin


    if RadioGroupLanguage.ItemIndex = 0 then
    OrderPrograms :=  ' ORDER BY sort, name_bg' else
    OrderPrograms :=  ' ORDER BY sort, name_en';
                        {
    if add_new_program = 1 then                 //v_diseases
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE id IN (SELECT program_id FROM programs_groups_connections WHERE category_id = ' + ADOQueryCategory.FieldByName('id').AsString +')'+ OrderPrograms else
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE id IN (SELECT program_id FROM programs_groups_connections WHERE category_id = ' + ADOQueryCategory.FieldByName('id').AsString +')'+ OrderPrograms;
    ADOQueryDiseases.Open;

    }
    if RadioGroupLanguage.ItemIndex=0 then
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases ORDER BY sort, name_en' else
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases ORDER BY sort, name_bg';
    ADOQueryDiseases.Open;

    ADOQueryPrograms.SQL.Text := ADOQueryDiseases.SQL.Text;
    ADOQueryPrograms.Open;


     {
    if RadioGroupLanguage.ItemIndex = 0 then
    OrderPrograms :=  ' ORDER BY sort, name_bg' else
    OrderPrograms :=  ' ORDER BY sort, name_en';

    if ADOQueryCategory.FieldByName('type_user_id').AsInteger >= 0 then
    begin
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases_personal WHERE category_id = ' + ADOQueryCategory.FieldByName('id').AsString + OrderPrograms;
      ADOQueryDiseases.Open;
    end else
    begin

      if add_new_program = 1 then
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE category_id = ' + ADOQueryCategory.FieldByName('id').AsString + OrderPrograms else
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE category_id = ' + ADOQueryCategory.FieldByName('id').AsString + OrderPrograms;

      ADOQueryDiseases.Open;
    end;

    }


  end;
end;

procedure TfEdit.ButtonShowProgramsRightClick(Sender: TObject);
var
  table, OrderPrograms : string;
begin

  with fMain do
  begin



    if RadioGroupLanguage.ItemIndex = 0 then
    OrderPrograms :=  ' ORDER BY sort, name_bg' else
    OrderPrograms :=  ' ORDER BY sort, name_en';

    if add_new_program = 1 then
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE id IN (SELECT program_id FROM programs_groups_connections WHERE category_id = ' + ADOQueryCategory_Personalization.FieldByName('id').AsString +')'+ OrderPrograms else
    ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE id IN (SELECT program_id FROM programs_groups_connections WHERE category_id = ' + ADOQueryCategory_Personalization.FieldByName('id').AsString +')'+ OrderPrograms;
    ADOQueryDiseases.Open;

  


    {
    if RadioGroupLanguage.ItemIndex = 0 then
    OrderPrograms :=  ' ORDER BY sort, name_bg' else
    OrderPrograms :=  ' ORDER BY sort, name_en';

    if ADOQueryCategory_Personalization.FieldByName('type_user_id').AsInteger >= 0 then
    begin
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases_personal WHERE category_id = ' + ADOQueryCategory_Personalization.FieldByName('id').AsString + OrderPrograms;
      ADOQueryDiseases.Open;
    end else
    begin

      if add_new_program = 1 then
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM diseases WHERE category_id = ' + ADOQueryCategory_Personalization.FieldByName('id').AsString + OrderPrograms else
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE category_id = ' + ADOQueryCategory_Personalization.FieldByName('id').AsString + OrderPrograms;

      ADOQueryDiseases.Open;
    end;

  }


  end;

end;

procedure TfEdit.Button24Click(Sender: TObject);
var i:Integer;
begin
with fMain do
begin
if ADOQueryFreq.RecNo < ADOQueryFreq.RecordCount then
begin
i:=ADOQueryFreq.FieldByName('id').AsInteger;
ADOQueryFreq.Edit;
ADOQueryFreq.FieldByName('orderno').AsInteger:=ADOQueryFreq.FieldByName('orderno').AsInteger+1;
ADOQueryFreq.Post;
ADOQueryFreq.Next;
ADOQueryFreq.Edit;
ADOQueryFreq.FieldByName('orderno').AsInteger:=ADOQueryFreq.FieldByName('orderno').AsInteger-1;
ADOQueryFreq.Post;
ADOQueryFreq.Requery();
ADOQueryFreq.Locate('id',i,[]);
end;
end;
end;

procedure TfEdit.Button2Click(Sender: TObject);
begin

  ADOQuerySQL.SQL.Text := 'SELECT * FROM programs_groups_connections WHERE category_id = :P1 AND program_id = :P2';
  ADOQuerySQL.Parameters.Clear;
  ADOQuerySQL.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, fMain.ADOQueryCategory_Personalization.FieldByName('id').AsInteger);
  ADOQuerySQL.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, fMain.ADOQueryDiseases.FieldByName('id').AsInteger);
  ADOQuerySQL.Open;

  if ADOQuerySQL.RecordCount = 1 then
  begin
    ADOQuerySQL.Delete;
    ButtonShowProgramsRightClick(nil);
    ShowMessage('Тази програма е премахната от групата!');
  end else
  begin
    ShowMessage('Тази програма липсва във връзките към групата!');
  end;

end;

procedure TfEdit.Button3Click(Sender: TObject);
begin
  ADOQuerySort.SQL.Text := 'SELECT count(*) AS Q FROM programs_groups_connections WHERE category_id = :P1';
  ADOQuerySort.Parameters.Clear;
  ADOQuerySort.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, fMain.ADOQueryCategory.FieldByName('id').AsInteger);
  ADOQuerySort.Open;

  ADOQuerySQL.SQL.Text := 'SELECT * FROM programs_groups_connections WHERE category_id = :P1 AND program_id = :P2';
  ADOQuerySQL.Parameters.Clear;
  ADOQuerySQL.Parameters.CreateParameter('P1', ftInteger, pdInput, 255, fMain.ADOQueryCategory_Personalization.FieldByName('id').AsInteger);
  ADOQuerySQL.Parameters.CreateParameter('P2', ftInteger, pdInput, 255, fMain.ADOQueryDiseases.FieldByName('id').AsInteger);
  ADOQuerySQL.Open;

  if ADOQuerySQL.RecordCount = 1 then
  begin
    ShowMessage('Вече е добавена тази програма!');
  end else
  begin
    ADOQuerySQL.Insert;
    ADOQuerySQL.FieldByName('category_id').AsInteger := fMain.ADOQueryCategory_Personalization.FieldByName('id').AsInteger;
    ADOQuerySQL.FieldByName('program_id').AsInteger := fMain.ADOQueryDiseases.FieldByName('id').AsInteger;
    ADOQuerySQL.FieldByName('sort').AsInteger := ADOQuerySort.FieldByName('Q').AsInteger + 1;
    ADOQuerySQL.Post;
    ShowMessage('Успешно добавена програма!');
  end;

end;

procedure TfEdit.Button4Click(Sender: TObject);
begin
  with fMain do
  begin
        EditSearch.Text := '';
        ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases ORDER BY name_bg';
        ADOQueryDiseases.Open;
  end;
end;

procedure TfEdit.ButtonAddGroupClick(Sender: TObject);
begin
with fMain do
begin


ADOQuerySQL.SQL.Text := 'SELECT MAX(id) AS MM FROM category';
ADOQuerySQL.Open;

ADOQueryCategory.Insert;
ADOQueryCategory.FieldByName('ID').AsInteger := ADOQuerySQL.FieldByName('MM').AsInteger +1;
ADOQueryCategory.FieldByName('category_name_BG').AsString := EditGroupNameBG.Text;
ADOQueryCategory.FieldByName('category_name_EN').AsString := EditGroupNameEN.Text;
ADOQueryCategory.FieldByName('favorite').AsInteger := 0;
ADOQueryCategory.FieldByName('repeat').AsInteger := AdvEditRepeatList.IntValue;
ADOQueryCategory.FieldByName('pause_program').AsInteger := AdvEditBreakProgram.IntValue;
ADOQueryCategory.FieldByName('pause_repeat_cycle').AsInteger := AdvEdit_pause_repeat_cycle.IntValue;
ADOQueryCategory.FieldByName('type_id').AsInteger := RadioGroupGroupType.ItemIndex; //0-for all, 1-for personal

if RadioGroupGroupType.ItemIndex = 1 then
ADOQueryCategory.FieldByName('user_id').AsInteger := LoginUser else
ADOQueryCategory.FieldByName('user_id').Clear;

ADOQueryCategory.Post;

ADOQueryCategory.Requery();
ADOQueryCategoryList.Requery();
end;
end;

procedure TfEdit.ButtonChangeFreqClick(Sender: TObject);
begin
with fMain do
begin
  ADOQueryFreq.Edit;
  ADOQueryFreq.FieldByName('time_sec').AsInteger := AdvEditDuration.IntValue;
  ADOQueryFreq.Post;
 // Refresh_Frequences(ADOQueryDiseases.FieldByName('id').AsString);
end;
end;

procedure TfEdit.ButtonRemoveGroupClick(Sender: TObject);
begin

with fMain do
begin
if ADOQueryCategory.RecordCount <= 0 then Exit;

if MessageDlg('Сигурни ли сте, че искате да изтриете тази група: '+
ADOQueryCategory.FieldByName('category_name_EN').AsString +#13+
ADOQueryCategory.FieldByName('category_name_BG').AsString, mtConfirmation, mbYesNo, 0) <> mrYes then Exit;

ADOQuerySQL.SQL.Text := 'UPDATE diseases SET category_id=null WHERE category_id='+ADOQueryCategory.FieldByName('id').AsString;
ADOQuerySQL.ExecSQL;

ADOQueryCategory.Delete;
ADOQueryCategoryList.Requery();
end;

end;

procedure TfEdit.ButtonDeleteGroupClick(Sender: TObject);
begin

  if MessageDlg('Сигурни ли сте, че искате да изтриете тази група?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
     fMain.ADOQueryCategory.Delete;
     ShowMessage('Групата е изтрита!');
  end;

end;

procedure TfEdit.ButtonDeleteProgramClick(Sender: TObject);
begin
with fMain do
begin
if ADOQueryDiseases.RecordCount <= 0 then Exit;

if MessageDlg('Сигурни ли сте, че искате да изтриете тази програма: '+
ADOQueryDiseases.FieldByName('name_en').AsString +#13+
ADOQueryDiseases.FieldByName('name_bg').AsString, mtConfirmation, mbYesNo, 0) <> mrYes then Exit;


ADOQuerySQL.SQL.Text := 'DELETE FROM freq WHERE disease_id='+ADOQueryDiseases.FieldByName('id').AsString;
ADOQuerySQL.ExecSQL;

ADOQueryDiseases.Delete;
                {
ADOQueryCategory.Edit;
ADOQueryCategory.FieldByName('program_count').AsInteger := ADOQueryDiseases.RecordCount;
ADOQueryCategory.Post;  }

ButtonRefreshFreq.Click;
end;
end;

procedure TfEdit.ButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TfEdit.ButtonNewProgramClick(Sender: TObject);
var
tmpID, tmpSort, tmpRecordID : Integer;
begin

  with fMain do
  begin

    add_new_program := 1;


    ADOQuerySQL.SQL.Text := 'SELECT MAX(ID) AS MM, count(ID) AS tmpSort FROM diseases WHERE id >= 61000';
    ADOQuerySQL.Open;
    tmpID := ADOQuerySQL.FieldByName('MM').AsInteger + 1;
    tmpSort := ADOQuerySQL.FieldByName('tmpSort').AsInteger + 1;

    if tmpID <= 61000 then tmpID := 61000;



    ADOQuerySQL.SQL.Text := 'SELECT * FROM diseases WHERE id=0 ';
    ADOQuerySQL.Open;

    ADOQuerySQL.Insert;
    ADOQuerySQL.FieldByName('ID').AsInteger := tmpID;
//    ADOQuerySQL.FieldByName('category_id').AsInteger := ADOQueryCategory.FieldByName('id').AsInteger;
    ADOQuerySQL.FieldByName('description_en').AsString := EditDescriptionEN.Text;
    ADOQuerySQL.FieldByName('description_bg').AsString := EditDescriptionBG.Text;
    ADOQuerySQL.FieldByName('name_en').AsString := EditProgramEN.Text;
    ADOQuerySQL.FieldByName('name_bg').AsString := EditProgramBG.Text;
    ADOQuerySQL.FieldByName('favorite').AsInteger := 0;
    ADOQuerySQL.FieldByName('sort').AsInteger := tmpSort;
    ADOQuerySQL.Post;

    tmpRecordID := ADOQuerySQL.FieldByName('ID').AsInteger;

    ButtonShowProgramsClick(nil);

    //ADOQueryDiseases.Requery();
    ADOQueryDiseases.Locate('id', tmpRecordID, []);


    ButtonRefreshFreq.Click;
  end;

end;

procedure TfEdit.ButtonRefreshFreqClick(Sender: TObject);
begin
with fMain do
begin

  ADOQueryFreq.Close;
  if ADOQueryDiseases.RecordCount >= 1 then
  begin
    ADOQueryFreq.SQL.Text := 'SELECT * FROM freq WHERE disease_id='+ADOQueryDiseases.FieldByName('id').AsString+' ORDER BY orderno';
    ADOQueryFreq.Open;
  end;

end;
end;

procedure TfEdit.ButtonSaveProgramClick(Sender: TObject);
begin
with fMain do
begin

  ADOQueryDiseases.Edit;
  //ADOQueryDiseases.FieldByName('description_bg').AsString := EditDescriptionBG.Text;

  ADOQueryDiseases.FieldByName('description_en').AsString := EditDescriptionEN.Text;
  ADOQueryDiseases.FieldByName('description_bg').AsString := EditDescriptionBG.Text;
  ADOQueryDiseases.FieldByName('name_en').AsString := EditProgramEN.Text;
  ADOQueryDiseases.FieldByName('name_bg').AsString := EditProgramBG.Text;

  ADOQueryDiseases.Post;





end;
end;

procedure TfEdit.Button_freq_addClick(Sender: TObject);
var
tmpD : string;
begin
with fMain do
begin
if ADOQueryDiseases.RecordCount <= 0 then
begin
  ShowMessage('Моля, изберете програма?');
  Exit;
end;

if AdvEditFreqQ.FloatValue <= 0 then
begin
  ShowMessage('Въведете честота!');
  Exit;
end;
      {
if AdvEdit_time.FloatValue <= 0 then
begin
  ShowMessage('Въведете време/продължителност на тази честота!');
  Exit;
end;  }

if AdvEditFreqQ.FloatValue >= 2000000 then
begin
  ShowMessage('Честотния генератор не може да генерира повече от 2Mhz');
  Exit;
end;

if MessageDlg('Искате ли да добавите нова честота?', mtConfirmation, mbYesNo, 0) <> mrYes then Exit;

ADOQuerySQL.SQL.Text := 'SELECT MAX(orderno) AS Q FROM freq WHERE disease_id='+ADOQueryDiseases.FieldByName('id').AsString;
ADOQuerySQL.Open;


  ADOQueryFreq.Insert;
  ADOQueryFreq.FieldByName('disease_id').AsInteger := ADOQueryDiseases.FieldByName('id').AsInteger;
  ADOQueryFreq.FieldByName('freq').AsFloat := AdvEditFreqQ.FloatValue;
  ADOQueryFreq.FieldByName('time_sec').AsInteger := AdvEditDuration.IntValue;
  ADOQueryFreq.FieldByName('orderno').AsInteger := ADOQuerySQL.FieldByName('Q').AsInteger + 1;
  ADOQueryFreq.Post;


end;
end;

procedure TfEdit.Button_freq_removeClick(Sender: TObject);
begin
with fMain do
begin
if ADOQueryFreq.RecordCount <= 0 then Exit;


if (ADOQueryFreq.RecordCount = 1) AND (ADOQueryDiseases.FieldByName('favorite').AsInteger >= 1) then
begin
  if MessageDlg('Тази програма е избрана в "бързи програми". Ако изтриете и последната честота тази програма ще бъде премахната от бързи програми.'+#13+
  'Желаете ли да изтриете последната честота или не.', mtConfirmation, mbYesNo, 0) <> mrYes then Exit;

  ADOQuerySQL.SQL.Text := 'UPDATE diseases SET favorite=null WHERE id='+ADOQueryDiseases.FieldByName('id').AsString;
  ADOQuerySQL.ExecSQL;
end else
begin
  if MessageDlg('Сигурни ли сте, че искате да изтриета тази честота: '+
  ADOQueryFreq.FieldByName('freq').AsString, mtConfirmation, mbYesNo, 0) <> mrYes then Exit;
end;

ADOQueryFreq.Delete;

ADOQueryDiseases.Edit;
ADOQueryDiseases.FieldByName('freq_count').AsInteger := ADOQueryFreq.RecordCount;
ADOQueryDiseases.Post;

end;
end;

procedure TfEdit.CheckBoxCategoryClick(Sender: TObject);
begin
cxGridDBTableView3.OptionsData.Editing := CheckBoxCategory.Checked;
end;

procedure TfEdit.CheckBoxDiseasesClick(Sender: TObject);
begin
cxGrid1DBTableView1.OptionsData.Editing := CheckBoxDiseases.Checked;
end;

procedure TfEdit.CheckBoxEditClick(Sender: TObject);
begin

  cxGridDBTableView3.OptionsData.Editing := CheckBoxEdit.Checked;
  cxGrid1DBTableView1.OptionsData.Editing := CheckBoxEdit.Checked;
  cxGridDBTableView1.OptionsData.Editing := CheckBoxEdit.Checked;


end;

procedure TfEdit.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
with fMain do
begin

  ButtonRefreshFreqClick(nil);

  EditDescriptionEN.Text  := ADOQueryDiseases.FieldByName('description_en').AsString;
  EditDescriptionBG.Text  := ADOQueryDiseases.FieldByName('description_bg').AsString;
  EditProgramEN.Text  := ADOQueryDiseases.FieldByName('name_en').AsString;
  EditProgramBG.Text  := ADOQueryDiseases.FieldByName('name_bg').AsString;

end;
end;

procedure TfEdit.cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  AdvEditDuration.IntValue := fMain.ADOQueryFreq.FieldByName('time_sec').AsInteger;
end;

procedure TfEdit.cxGridDBTableView1Column3GetDisplayText(
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

procedure TfEdit.cxGridDBTableView2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ButtonShowProgramsRightClick(nil);
end;

procedure TfEdit.cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ButtonShowProgramsClick(nil);
end;

procedure TfEdit.EditSearchKeyPress(Sender: TObject; var Key: Char);
begin
with fMain do
begin
      ADOQueryDiseases.SQL.Text := 'SELECT * FROM v_diseases WHERE name_en LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' OR name_bg LIKE '+#39+'%'+EditSearch.Text+'%'+#39+
                                                          ' OR description_en LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' OR description_bg LIKE '+#39+'%'+EditSearch.Text+'%'+#39+' ORDER BY name_bg';
      ADOQueryDiseases.Open;
end;
end;

procedure TfEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
fEdit := nil;
end;

procedure TfEdit.FormResize(Sender: TObject);
var
tmpWidth, Col1, Col2 : Integer;
begin
     {
  tmpWidth := cxGrid1.ClientWidth - cxGrid1DBTableView1Prevod.Width - cxGrid1DBTableView1Quantity.Width - 40;

  tmpWidth := tmpWidth div 5;

  //cxGrid1DBTableView1CategoryBG.Width := tmpWidth;
  cxGrid1DBTableView1name_bg.Width := tmpWidth;
  cxGrid1DBTableView1name_en.Width := tmpWidth;
  cxGrid1DBTableView1description_bg.Width := tmpWidth;
  cxGrid1DBTableView1description_EN.Width := tmpWidth;
   }

end;

procedure TfEdit.FormShow(Sender: TObject);
var
OrderCategory : string;
begin
with fMain do
begin
  if LoginUser = 1 then //admin
  cxGridDBTableView3User_access.Visible := True else
  cxGridDBTableView3User_access.Visible := False;

  add_new_program := 0;

  if fMain.RadioGroupMainLanguage.ItemIndex=0 then
  fEdit.Caption := 'Редактиране' else
  fEdit.Caption := 'Editing';

  RadioGroupLanguage.ItemIndex := fMain.RadioGroupMainLanguage.ItemIndex;
  RadioGroupLanguageClick(nil);

//  ADOQueryDiseases.Open;



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




  ADOQueryCategory_Personalization.SQL.Text := ADOQueryCategory.SQL.Text;
  ADOQueryCategory_Personalization.Open;

  ADOQueryCategoryList.SQL.Text := ADOQueryCategory.SQL.Text;
  ADOQueryCategoryList.Open;

  ButtonShowAllClick(nil);

end;
end;

procedure TfEdit.RadioGroupLanguageClick(Sender: TObject);
begin
with fMain do
begin
  case RadioGroupLanguage.ItemIndex of
  0:ADOQueryCategory.SQL.Text := 'SELECT * FROM category ORDER BY category_name_BG';
  1:ADOQueryCategory.SQL.Text := 'SELECT * FROM category ORDER BY category_name_EN';
  end;
  ADOQueryCategory.Open;


  ADOQueryCategoryList.SQL.Text := ADOQueryCategory.SQL.Text;
  ADOQueryCategoryList.Open;

  case RadioGroupLanguage.ItemIndex of
  0:begin
      ButtonShowAll.Hint := 'Покажи всички';
      ButtonLink.Hint := 'Привържи към група';
      ButtonUnlink.Hint := 'Отвържи от група';
      ButtonAddGroup.Caption := 'Добави група';
      ButtonRemoveGroup.Caption := 'Изтрий група';
      CheckBoxCategory.Caption := 'Редактиране на групи';
      CheckBoxDiseases.Caption := 'Редактиране на програми';
      ButtonSaveProgram.Caption := 'ЗАПИС ОПИСАНИЕТО';
      ButtonNewProgram.Caption := 'Добави програма';
      ButtonDeleteProgram.Caption := 'Изтрий програма';
      AdvEditFreqQ.LabelCaption := 'Честота';
      AdvEditDuration.LabelCaption := 'Сек.';
      cxGridDBTableView1Column1.Caption := 'Честота';
      cxGridDBTableView1Column3.Caption := 'Сек.';
      Button_freq_add.Caption := 'Добави честота';
      Button_freq_remove.Caption := 'Изтрий честота';
      cxGridDBTableView3category_name.Caption := 'Категория';
      cxgrdbclmnGridDBTableView3Column2.Caption := 'БР.';
      //cxGrid1DBTableView1CategoryBG.Caption := 'Категория';
      cxGrid1DBTableView1name_bg.Caption := 'Програма';
      cxGrid1DBTableView1description_bg.Caption := 'Описание';
      cxGrid1DBTableView1Column1.Caption := 'Превод';
      cxGrid1DBTableView1Quantity.Caption := 'БР.';

      AdvEditFreq.LabelCaption := 'Продължителност сек.';
      ButtonChangeFreq.Caption := 'Промени';
      cxGrid1DBTableView1Prevod.Caption := 'Превод';


  end;
  1:begin
      ButtonShowAll.Hint := 'Show all';
      ButtonLink.Hint := 'Attach to a group';
      ButtonUnlink.Hint := 'Detach  a group';
      ButtonAddGroup.Caption := 'Add group';
      ButtonRemoveGroup.Caption := 'Remove group';
      CheckBoxCategory.Caption := 'Edit group';
      CheckBoxDiseases.Caption := 'Edit program';
      ButtonSaveProgram.Caption := 'SAVE DESCRIPTION';
      ButtonNewProgram.Caption := 'Add program';
      ButtonDeleteProgram.Caption := 'Remove program';
      AdvEditFreqQ.LabelCaption := 'Freq.';
      AdvEditDuration.LabelCaption := 'Sec.';
      cxGridDBTableView1Column1.Caption := 'Freq.';
      cxGridDBTableView1Column3.Caption := 'Sec.';
      Button_freq_add.Caption := 'Add frequence';
      Button_freq_remove.Caption := 'Remove frequence';
      cxGridDBTableView3category_name.Caption := 'Category BG';
      cxgrdbclmnGridDBTableView3Column2.Caption := 'Q.';
   //   cxGrid1DBTableView1CategoryBG.Caption := 'Category BG';
      cxGrid1DBTableView1name_bg.Caption := 'Program BG';
      cxGrid1DBTableView1description_bg.Caption := 'Description BG';
      cxGrid1DBTableView1Column1.Caption := 'Translate';
      cxGrid1DBTableView1Quantity.Caption := 'Q.';

      AdvEditFreq.LabelCaption := 'Duration in sec.';
      ButtonChangeFreq.Caption := 'Change';
      cxGrid1DBTableView1Prevod.Caption := 'Translate';
  end;
  end;


end;
end;

end.
