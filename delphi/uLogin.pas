unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  IdBaseComponent, IdComponent, IdIPWatch, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfLogin = class(TForm)
    Bt_OK: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Bt_cancel: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1KONTR_ID: TcxGridDBColumn;
    cxGrid1DBTableView1KONTR_IME: TcxGridDBColumn;
    cxGrid1DBTableView1KONTR_NICK: TcxGridDBColumn;
    cxGrid1DBTableView1KONTR_TELEFON: TcxGridDBColumn;
    cxGrid1DBTableView1KONTR_BELEZKI: TcxGridDBColumn;
    procedure Bt_OKClick(Sender: TObject);
    procedure Bt_cancelClick(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
     OK_LOG:Boolean;  
    { Public declarations }
  end;


var
  fLogin: TfLogin;

implementation
uses uMain, DateUtils,math;

{$R *.dfm}




procedure TfLogin.Bt_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree; fLogin:=nil;
end;



procedure TfLogin.Bt_OKClick(Sender: TObject);
begin


  if DBLookupComboBox1.Text = '' then
  begin
    ShowMessage('Изберете потребител');
    Exit;
  end;

  if fMain.ADOQueryUsers.FieldByName('pass').AsString = MaskEdit1.Text then
  begin
    LoginUser := fMain.ADOQueryUsers.FieldByName('id').AsInteger;
    LoginName := fMain.ADOQueryUsers.FieldByName('name').AsString;
    Close;
  end else
  begin
    ShowMessage('Грешна парола!');
  end;



end;



procedure TfLogin.FormShow(Sender: TObject);
begin

MaskEdit1.SetFocus;
end;


procedure TfLogin.DBLookupComboBox1Click(Sender: TObject);
begin MaskEdit1.SetFocus; end;

procedure TfLogin.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
IF Key = #27 THEN fMain.Close;
if key = #13 then Bt_OK.Click;
end;

end.
