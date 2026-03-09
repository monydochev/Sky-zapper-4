program SKY_Zapper;

uses
  Forms,
  SysUtils,
  uMain in 'uMain.pas' {fMain},
  uOptions in 'uOptions.pas' {fOptions},
  uEdit in 'uEdit.pas' {fEdit},
  uProgram in 'uProgram.pas' {fProgram},
  uSrebarnaVoda in 'uSrebarnaVoda.pas' {fSrebarnaVoda},
  uUpdateSoftware in 'uUpdateSoftware.pas' {fUpdateSoftware},
  uCutomGroups in 'uCutomGroups.pas' {fCustomGroups},
  uLogin in 'uLogin.pas' {fLogin},
  uChangePassword in 'uChangePassword.pas' {fChangePassword},
  uUsers in 'uUsers.pas' {fUsers};

{$R *.res}

begin
  Application.Initialize;

  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ' ';
  FormatSettings.ShortDateFormat := 'H:mm';
  FormatSettings.LongTimeFormat := 'H:mm:ss';
  FormatSettings.DateSeparator := '.';
  FormatSettings.ShortDateFormat := 'd.M.yyyy';
  FormatSettings.LongDateFormat := 'dd MMMM yyyy';

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
