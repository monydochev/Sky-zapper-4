unit uUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  Vcl.StdCtrls, Data.Win.ADODB, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.ExtCtrls;

type
  TfUsers = class(TForm)
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3Column2: TcxGridDBColumn;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    ButtonFilterGroup: TButton;
    DataSourceCustomGroup: TDataSource;
    ADOQueryUsers: TADOQuery;
    Label3: TLabel;
    EditName: TEdit;
    ButtonAddGroup: TButton;
    ButtonDeleteGroup: TButton;
    ButtonExit: TButton;
    RadioGroupLanguage: TRadioGroup;
    CheckBoxEdit: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ButtonAddGroupClick(Sender: TObject);
    procedure RadioGroupLanguageClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonDeleteGroupClick(Sender: TObject);
    procedure CheckBoxEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUsers: TfUsers;

implementation
uses uMain;

{$R *.dfm}

procedure TfUsers.ButtonAddGroupClick(Sender: TObject);
begin

  if EditName.Text <> '' then
  begin
    ADOQueryUsers.Insert;
    ADOQueryUsers.FieldByName('name').AsString := EditName.Text;
    ADOQueryUsers.FieldByName('power_options').AsString := '100% сила';
    ADOQueryUsers.Post;
//    ButtonFilterGroupClick(nil);
  end else
  begin

    if RadioGroupLanguage.ItemIndex=0 then
    ShowMessage('Моля, въведете име!') else
    ShowMessage('Please enter a name!');

  end;
  EditName.Text := '';

end;

procedure TfUsers.ButtonDeleteGroupClick(Sender: TObject);
begin

  if RadioGroupLanguage.ItemIndex=0 then
  begin
    if MessageDlg('Сигурни ли сте, че искате да изтриете тази група?', mtConfirmation, mbYesNo, 0) <> mrYes then exit;
  end else
  begin
    if MessageDlg('Are you sure you want to delete this group?', mtConfirmation, mbYesNo, 0) <> mrYes then exit;
  end;


  ADOQueryUsers.Delete;
  //ButtonFilterGroup.Click;
end;

procedure TfUsers.ButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TfUsers.CheckBoxEditClick(Sender: TObject);
begin

cxGridDBTableView3.OptionsData.Editing := CheckBoxEdit.Checked;

end;

procedure TfUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  fUsers := nil;
end;

procedure TfUsers.FormShow(Sender: TObject);
begin

  RadioGroupLanguage.ItemIndex := fMain.RadioGroupMainLanguage.ItemIndex;
  RadioGroupLanguageClick(nil);

  ADOQueryUsers.SQL.Text := 'SELECT * FROM Users ORDER BY name';
  ADOQueryUsers.Open;

end;

procedure TfUsers.RadioGroupLanguageClick(Sender: TObject);
begin

{
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


}
end;

end.
