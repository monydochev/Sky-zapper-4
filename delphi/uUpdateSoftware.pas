unit uUpdateSoftware;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ComObj, XMLIntf, XMLDoc, IdHTTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, Vcl.ExtCtrls, HTMLabel, ShlObj, ActiveX;

type
  TfUpdateSoftware = class(TForm)
    ButtonCheckNewVersion: TButton;
    Label10: TLabel;
    MemoNewVersions: TMemo;
    ButtonDownloadNewVesrions: TButton;
    GroupBox1: TGroupBox;
    EditURL_program: TEdit;
    EditURL_DB: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CheckBoxUpdateDatabase: TCheckBox;
    CheckBoxUpdateSoftware: TCheckBox;
    RadioGroupLanguage: TRadioGroup;
    HTMLabel1: THTMLabel;
    ButtonExit: TButton;
    procedure ButtonCheckNewVersionClick(Sender: TObject);
    procedure ButtonDownloadNewVesrionsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RadioGroupLanguageClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUpdateSoftware: TfUpdateSoftware;

implementation
uses uMain;

{$R *.dfm}


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







procedure TfUpdateSoftware.ButtonCheckNewVersionClick(Sender: TObject);
Var
 ms:TMemoryStream;
 tmpProg,
 tmpDB:Single;
 s:string;
 i0,i1 : Integer;
 LDocument: IXMLDocument;
 LNodeElement, LNode: IXMLNode;
 I: Integer;
begin




  if (FileExists(xPath+'\libeay32.dll')=False) OR (FileExists(xPath+'\ssleay32.dll')=False) then
  begin
    if RadioGroupLanguage.ItemIndex=0 then
    MemoNewVersions.Lines.Add('Липсват важни файлове за свалянето на нова версия!') else
    MemoNewVersions.Lines.Add('Important files are missing to download a new version!');
    Exit
  end;




  ms := TMemoryStream.Create;
  fMain.IdHTTP1.get('https://zapper.sky.bg/software/new_versions.xml',ms);
  ms.SaveToFile(xPath+'\new_versions.xml');
  ms.Free;

  if FileExists(xPath+'\new_versions.xml')=False then
  begin
    if RadioGroupLanguage.ItemIndex=0 then
    MemoNewVersions.Lines.Add('Не може да свали файла за проверка на версиите.') else
    MemoNewVersions.Lines.Add('Could not download version checker file.');
    Exit;
  end;


    MemoNewVersions.Clear;
    if RadioGroupLanguage.ItemIndex=0 then
    begin
      MemoNewVersions.Lines.Add('Различните версии, ще се публикуват на адрес: https://zapper.sky.bg/downloads.php');
      MemoNewVersions.Lines.Add('Можете да го отворите със стандартен интернет браузер: Chrome, Firefox, Opera, Internet Explorer и други.');
    end else
    begin
      MemoNewVersions.Lines.Add('The different versions will be published at: https://zapper.sky.bg/downloads.php');
      MemoNewVersions.Lines.Add('You can open it with a standard Internet browser: Chrome, Firefox, Opera, Internet Explorer and others.');
    end;
    MemoNewVersions.Lines.Add('');

    LDocument := TXMLDocument.Create(nil);
    LDocument.LoadFromFile(xPath+'\new_versions.xml');
    LNodeElement := LDocument.Node.ChildNodes['catalog'];

    if RadioGroupLanguage.ItemIndex=0 then
    begin
      MemoNewVersions.Lines.Add('Текуща версия на програмата: '+FloatToStr(program_version)+' последна версия: '+LDocument.Node.ChildNodes['catalog'].Attributes['last_version']);
      MemoNewVersions.Lines.Add('Текуща версия на базата данни: '+FloatToStr(database_version)+ ' последна версия: '+LDocument.Node.ChildNodes['catalog'].Attributes['last_version_db']);
    end else
    begin
      MemoNewVersions.Lines.Add('Current program version: '+FloatToStr(program_version)+' last version: '+LDocument.Node.ChildNodes['catalog'].Attributes['last_version']);
      MemoNewVersions.Lines.Add('Current database version: '+FloatToStr(database_version)+ ' last version: '+LDocument.Node.ChildNodes['catalog'].Attributes['last_version_db']);
    end;


    EditURL_program.Text := LDocument.Node.ChildNodes['catalog'].Attributes['program_download'];
    EditURL_DB.Text := LDocument.Node.ChildNodes['catalog'].Attributes['database_download'];


    new_prog := LDocument.Node.ChildNodes['catalog'].Attributes['last_version'];
    new_db :=  LDocument.Node.ChildNodes['catalog'].Attributes['last_version_db'];


    CheckBoxUpdateSoftware.Visible := False;
    CheckBoxUpdateDatabase.Visible := False;
    CheckBoxUpdateSoftware.Checked := False;
    CheckBoxUpdateDatabase.Checked := False;

    //ShowMessage('program_version: '+FloatToStr(program_version)+' new_prog:'+FloatToStr(new_prog));
    //ShowMessage('database_version: '+FloatToStr(database_version)+' new_db:'+FloatToStr(new_db));

    if new_prog > program_version then
    begin
      CheckBoxUpdateSoftware.Visible := True;
      CheckBoxUpdateSoftware.Checked := True;
    end;

    if new_db > database_version then
    begin
      CheckBoxUpdateDatabase.Visible := True;
      CheckBoxUpdateDatabase.Checked := True;
    end;





    if (CheckBoxUpdateSoftware.Checked = False) AND (CheckBoxUpdateDatabase.Checked = False) then
    begin
      //MemoNewVersions.Clear;
      if RadioGroupLanguage.ItemIndex=0 then
      MemoNewVersions.Lines.Add('Няма нови ъпдейти.') else
      MemoNewVersions.Lines.Add('There are no new updates.');

      ButtonDownloadNewVesrions.Visible := False;
      Exit;
    end else
    begin

      if RadioGroupLanguage.ItemIndex=0 then
      begin
        if (CheckBoxUpdateSoftware.Checked) AND (CheckBoxUpdateDatabase.Checked) then ButtonDownloadNewVesrions.Caption := 'UPDATE THE SOFTWARE AND DATABASE' else
        if (CheckBoxUpdateSoftware.Checked) then ButtonDownloadNewVesrions.Caption := 'ОБНОВИ ПРОГРАМАТА' else
        if (CheckBoxUpdateDatabase.Checked) then ButtonDownloadNewVesrions.Caption := 'ОБНОВИ БАЗАТА';
      end else
      begin
        if (CheckBoxUpdateSoftware.Checked) AND (CheckBoxUpdateDatabase.Checked) then ButtonDownloadNewVesrions.Caption := 'UPDATE THE SOFTWARE AND THE BASE' else
        if (CheckBoxUpdateSoftware.Checked) then ButtonDownloadNewVesrions.Caption := 'REFRESH THE PROGRAM' else
        if (CheckBoxUpdateDatabase.Checked) then ButtonDownloadNewVesrions.Caption := 'REFRESH DATABASE';
      end;

      ButtonDownloadNewVesrions.Visible := True;
    end;


    if (new_prog > program_version) OR (new_db > database_version) then
    GroupBox1.Visible := True else
    GroupBox1.Visible := True;




    for i0 := 0 to LNodeElement.ChildNodes.Count - 1 do
    begin
            MemoNewVersions.Lines.Add('---------------------------------------------------------------------------------------------------------------------------------------------------');
            MemoNewVersions.Lines.Add(
            'Версия на програмата: '+LNodeElement.ChildNodes[i0].Attributes['program_version']+
            ' Версия на базата данни: '+LNodeElement.ChildNodes[i0].Attributes['database_version']+
            ' Обновена на дата: '+LNodeElement.ChildNodes[i0].Attributes['release_date']);
            MemoNewVersions.Lines.Add('---------------------------------------------------------------------------------------------------------------------------------------------------');

            LNode := LNodeElement.ChildNodes[i0];
            for i1 := 0 to LNode.ChildNodes.Count - 1 do
            begin
              MemoNewVersions.Lines.Add(IntToStr(i1+1)+' - '+LNode.ChildNodes[i1].Text);
            end;

            MemoNewVersions.Lines.Add('');
            MemoNewVersions.Lines.Add('');
            MemoNewVersions.Lines.Add('');
    end;
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

procedure TfUpdateSoftware.ButtonDownloadNewVesrionsClick(Sender: TObject);
Var
 ms:TMemoryStream;
 tmpProg,
 tmpDB:Double;
 _program, _database, _SSL1, _SSL2, _URL_PATH : string;
begin
  MemoNewVersions.Clear;
  _program := xPath+'\SKY_Zapper'+FloatToStr(new_prog)+'.exe';
  _database := xPath+'\SKY_Zapper'+FloatToStr(new_prog)+'.mdb';

  _SSL1 := xPath+'\libeay32.dll';
  _SSL2 := xPath+'\ssleay32.dll';

  _URL_PATH := ExtractFileDir(EditURL_program.Text);



  if (CheckBoxUpdateSoftware.Checked) OR (CheckBoxUpdateDatabase.Checked) then
  begin
      ms := TMemoryStream.Create;
      fMain.IdHTTP1.get(EditURL_program.Text,ms);
      ms.SaveToFile(_program);
      ms.Free;
      if FileExists(_program)=False then
      MemoNewVersions.Lines.Add('Не може да свали новата програма от адрес: '+EditURL_program.Text) else
      MemoNewVersions.Lines.Add('Успешно свалена новата програма в: '+#13+_program);

      ms := TMemoryStream.Create;
      fMain.IdHTTP1.get(EditURL_DB.Text,ms);
      fMain.ADOConnectionMDB.Close;
      ms.SaveToFile(_database);
      ms.Free;
      if FileExists(_database)=False then
      MemoNewVersions.Lines.Add('Не може да свали новата база данни от адрес: '+EditURL_DB.Text) else
      MemoNewVersions.Lines.Add('Успешно свалена новата база данни в: '+#13+_database);


      MemoNewVersions.Lines.Add('');

      if CreateDesktopShellLink(_program, 'SKY Zapper '+FloatToStr(new_prog)) then
      MemoNewVersions.Lines.Add('Успешно създаване на пряк път от (Desktop / Работен плот) към новата програма: '+#13+_program) else
      MemoNewVersions.Lines.Add('Неуспешно създаване на пряк път до: '+_program);

      MemoNewVersions.Lines.Add('Изключете старата програма и потърсете на Вашият (Desktop / Работен плот) за нова иконка с име "SKY Zapper '+FloatToStr(new_prog)+'" '+#13+ ' към новата версия: '+_program);
  end;

end;

procedure TfUpdateSoftware.ButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TfUpdateSoftware.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
fUpdateSoftware := nil;
end;

procedure TfUpdateSoftware.FormShow(Sender: TObject);
begin

  if fMain.RadioGroupMainLanguage.ItemIndex=0 then
  fUpdateSoftware.Caption := 'Обновяване' else
  fUpdateSoftware.Caption := 'Update';

  RadioGroupLanguage.ItemIndex := fMain.RadioGroupMainLanguage.ItemIndex;
  RadioGroupLanguageClick(nil);
end;

procedure TfUpdateSoftware.RadioGroupLanguageClick(Sender: TObject);
begin
  if RadioGroupLanguage.ItemIndex=0 then
  begin
     ButtonCheckNewVersion.Caption := 'Провери за нова версия';
     ButtonDownloadNewVesrions.Caption := 'ОБНОВИ';
     Label10.Caption := 'Описание на промените в новите версии на програмата SKY Zapper';
     HTMLabel1.HTMLText.Text := '<a href="http://cloud.sky.bg/options.html">Свали последна версия от тук: http://cloud.sky.bg/options.html</a>';
     ButtonExit.Caption := 'ЗАТВОРИ';
  end else
  begin
     ButtonCheckNewVersion.Caption := 'Check for a new version ';
     ButtonDownloadNewVesrions.Caption := 'UPDATES';
     Label10.Caption := 'Description of the changes in the new versions of the SKY Zapper program ';
     HTMLabel1.HTMLText.Text := '<a href="http://cloud.sky.bg/options.html">Download latest version from here: http://cloud.sky.bg/options.html</a>';
     ButtonExit.Caption := 'CLOSE';

  end;
end;

end.
