unit uChangePassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TfChangePassword = class(TForm)
    Edit_OLD_PASSWORD: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit_New_Password: TEdit;
    Label3: TLabel;
    Edit_Retry_Password: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fChangePassword: TfChangePassword;

implementation
uses uMain;
{$R *.DFM}

procedure TfChangePassword.FormCreate(Sender: TObject);
begin

    ADOQuery2.SQL.Text:='SELECT * FROM Users WHERE ID = '+IntToStr(LoginUser);
    ADOQuery2.Open;

    {
    if ADOQuery2.RecNo <= 0 then
    begin
      ADOQuery2.Insert;
      ADOQuery2.FieldByName('POTREBITEL_ID').AsInteger:=GLOBAL_USER_id;
      ADOQuery2.Post;
    end;
    }

end;

procedure TfChangePassword.BitBtn1Click(Sender: TObject);
begin



  if ADOQuery2.FieldByName('pass').AsString <> Edit_OLD_PASSWORD.Text then
  begin
    ShowMessage('Грешна стара парола.');
    Edit_OLD_PASSWORD.Text:='';
    Exit;
  end;

  if Edit_New_Password.Text <> Edit_Retry_Password.Text then
  begin
    ShowMessage('Новата парола не е въведена правилно в двете полета.');
    Edit_New_Password.Text:='';
    Edit_Retry_Password.Text:='';
    Exit;
  end;


   if (ADOQuery2.FieldByName('pass').AsString = Edit_New_Password.Text) then
   begin
     ShowMessage('Старата и новата парола, трябва да са различни!');
     Exit;
   end;



  if (ADOQuery2.FieldByName('pass').AsString = Edit_OLD_PASSWORD.Text) AND
  (ADOQuery2.FieldByName('pass').AsString <> Edit_New_Password.Text) AND
  (Edit_New_Password.Text = Edit_Retry_Password.Text)  then
  begin
    ADOQuery2.Edit;
    ADOQuery2.FieldByName('pass').AsString := Edit_New_Password.Text;
    ADOQuery2.Post;
    fMain.ADOQueryUsers.Requery();
    ShowMessage('Паролата Ви е приета успешно.');
    close;
  end else
  begin
  {
    ShowMessage('1. Въведете коректно старата парола!'+#13+
                '2. Въведете новата парола два пъти!'+#13+
                '3. Старата и новата парола, трябва да са различни!');
                }
  end;


end;

procedure TfChangePassword.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfChangePassword.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree; fChangePassword:=nil;
end;

end.
