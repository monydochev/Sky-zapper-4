unit uSrebarnaVoda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfSrebarnaVoda = class(TForm)
    RadioGroupCurrentSetPoint: TRadioGroup;
    RadioGroupSilverConcentration: TRadioGroup;
    RadioGroupWaterQ: TRadioGroup;
    ButtonStart: TButton;
    ButtonRead: TButton;
    ButtonWrite: TButton;
    ButtonStop: TButton;
    TimerRemaindTime: TTimer;
    LabelRemainTime: TLabel;
    LabelExpectTime: TLabel;
    LabelPower: TLabel;
    LabelMessage: TLabel;
    LabelAlert: TLabel;
    RadioGroupLanguage: TRadioGroup;
    ButtonExit: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonReadClick(Sender: TObject);
    procedure ButtonWriteClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerRemaindTimeTimer(Sender: TObject);
    procedure RadioGroupSilverConcentrationClick(Sender: TObject);
    procedure RadioGroupLanguageClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSrebarnaVoda: TfSrebarnaVoda;
  save:Byte;
implementation
uses uMain;

{$R *.dfm}

procedure TfSrebarnaVoda.ButtonStartClick(Sender: TObject);
var
b1,b2,b3,b4:Byte;
tmpCurrentSetPoint:Byte;
WaterQ, i : Word;
begin
with fMain do
begin
  if Check_Connect(1) = False then Exit;
  if Check_SilverWater(1) = False then Exit;

//ShowMessage(' START SilverWaterOn: '+IntToStr(_SilverWaterOn));

  PREPARE_BUFF;

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 16;
  USB_Buffer[4] := _SilverWaterOn;
  USB_Buffer[5] := 1; //start

  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 5);
    PARSE_BUFF('Команда за стартиране сребърна вода', 5);
  end else
  begin
    SendBufferToLAN(5);
    LAN_PARSE_BUFF('LAN - Команда за стартиране сребърна вода', 5);
  end;





  if Connection_Type = 0 then //0-USB, 1-LAN
  SleepSky(300);

  ButtonReadClick(nil);

  TimerRemaindTime.Interval := 3000;
  TimerRemaindTime.Enabled := True;



  if Assigned(fSrebarnaVoda) then
  begin

    //Логване на информация
    case RadioGroupcurrentSetPoint.ItemIndex of
    0: tmpCurrentSetPoint := 2;
    1: tmpCurrentSetPoint := 5;
    2: tmpCurrentSetPoint := 8;
    3: tmpCurrentSetPoint := 11;
    4: tmpCurrentSetPoint := 14;
    5: tmpCurrentSetPoint := 17;
    6: tmpCurrentSetPoint := 20;
    end;

    case RadioGroupWaterQ.ItemIndex of
    0: WaterQ := 200;
    1: WaterQ := 500;
    2: WaterQ := 1000;
    end;

    b1 := tmpCurrentSetPoint;
    b2 := WaterQ;
    b3 := WaterQ shr 8;
    b4 := RadioGroupSilverConcentration.ItemIndex;

    SEND_Cloud([3, 0, 26, 95, 0, 0, 0, 0, 3, b1, b2, b3, b4, m_b1, m_b2, m_b3, m_b4]);

  end;

end;
end;

procedure TfSrebarnaVoda.ButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TfSrebarnaVoda.ButtonReadClick(Sender: TObject);
var i:integer;
begin
with fMain do
begin

  if Check_Connect(1) = False then Exit;
  if Check_SilverWater(1) = False then Exit;

  PREPARE_BUFF;
  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 9;
  USB_Buffer[4] := 0;
  USB_Buffer[5] := 255;

  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 5);
    PARSE_BUFF('Команда за прочитане сребърна вода', 5);
  end else
  begin
    SendBufferToLAN(5);
    LAN_PARSE_BUFF('LAN - Команда за прочитане сребърна вода', 5);
  end;





end;
end;

procedure TfSrebarnaVoda.ButtonWriteClick(Sender: TObject);
var
tmpCurrentSetPoint, tmpConcentracia:Byte;
WaterQ,i : Word;
begin
  with fMain do
  begin
    if Check_Connect(1) = False then Exit;
    if Check_SilverWater(1) = False then Exit;

    if save = 1 then
    begin
        case RadioGroupcurrentSetPoint.ItemIndex of
        0: tmpCurrentSetPoint := 2;
        1: tmpCurrentSetPoint := 5;
        2: tmpCurrentSetPoint := 8;
        3: tmpCurrentSetPoint := 11;
        4: tmpCurrentSetPoint := 14;
        5: tmpCurrentSetPoint := 17;
        6: tmpCurrentSetPoint := 20;
        end;

        case RadioGroupWaterQ.ItemIndex of
        0: WaterQ := 200;
        1: WaterQ := 500;
        2: WaterQ := 1000;
        3: WaterQ := 2000;
        end;

        case RadioGroupSilverConcentration.ItemIndex of
        0: tmpConcentracia := 2;
        1: tmpConcentracia := 5;
        2: tmpConcentracia := 15;
        3: tmpConcentracia := 100;
        end;

        PREPARE_BUFF;
        USB_Buffer[1] := 0;
        USB_Buffer[2] := 0;
        USB_Buffer[3] := 16;
        USB_Buffer[4] := _SilverWaterStartByte;
        USB_Buffer[5] := tmpCurrentSetPoint;
        USB_Buffer[6] := WaterQ;
        USB_Buffer[7] := WaterQ shr 8;
        USB_Buffer[8] := tmpConcentracia;

        if Connection_Type = 0 then //0-USB, 1-LAN
        begin
          VaComm1.WriteBuf(USB_Buffer, 8);
          PARSE_BUFF('Команда настройка на сребърна вода', 8);
        end else
        begin
          SendBufferToLAN(8);
          LAN_PARSE_BUFF('LAN - Команда настройка на сребърна вода', 8);
        end;

        //ButtonReadClick(nil);
    end;

  end;

end;

procedure TfSrebarnaVoda.ButtonStopClick(Sender: TObject);
var i:integer;
begin
with fMain do
begin

  TimerRemaindTime.Enabled := False;

  if Check_Connect(1) = False then Exit;
  if Check_SilverWater(1) = False then Exit;


  PREPARE_BUFF;
//  ShowMessage(' STOP SilverWaterOn: '+IntToStr(_SilverWaterOn));

  USB_Buffer[1] := 0;
  USB_Buffer[2] := 0;
  USB_Buffer[3] := 16;
  USB_Buffer[4] := _SilverWaterOn;
  USB_Buffer[5] := 0; //stop


  if Connection_Type = 0 then //0-USB, 1-LAN
  begin
    VaComm1.WriteBuf(USB_Buffer, 5);
    PARSE_BUFF('USB - Команда спиране за спиране на сребърна вода', 5);
  end else
  begin
    SendBufferToLAN(5);
    LAN_PARSE_BUFF('LAN - Команда спиране за спиране на сребърна вода', 5);
  end;

  SleepSky(300);
  ButtonReadClick(nil);

  if Assigned(fSrebarnaVoda) then
  begin

    LabelPower.Visible := True;
    LabelExpectTime.Visible := True;
    LabelRemainTime.Visible := True;

    RadioGroupCurrentSetPoint.Enabled := True;
    RadioGroupWaterQ.Enabled := True;
    RadioGroupSilverConcentration.Enabled := True;

    TimerRemaindTime.Enabled := False;
    LabelMessage.Visible := False;

  end;


  SEND_Cloud([3, 0, 26, 92, 0, 0, 0, 0, 3, m_b1, m_b2, m_b3, m_b4]);


end;
end;

procedure TfSrebarnaVoda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=caFree;
  fSrebarnaVoda := nil;
end;

procedure TfSrebarnaVoda.FormShow(Sender: TObject);
begin

  if fMain.RadioGroupMainLanguage.ItemIndex=0 then
  fSrebarnaVoda.Caption := 'Сребърна вода' else
  fSrebarnaVoda.Caption := 'Silver water';

 RadioGroupLanguage.ItemIndex := fMain.RadioGroupMainLanguage.ItemIndex;
 RadioGroupLanguageClick(nil);

save := 0;

if Check_SilverWater(0) then
ButtonReadClick(nil);

save := 1;
end;

procedure TfSrebarnaVoda.RadioGroupLanguageClick(Sender: TObject);
begin

  if RadioGroupLanguage.ItemIndex=0 then
  begin
    RadioGroupSilverConcentration.Caption := 'Концентрация';
    RadioGroupWaterQ.Caption := 'Количество вода';
    RadioGroupCurrentSetPoint.Caption := 'Ток';
    LabelRemainTime.Caption := 'Оставащо време:';
    LabelExpectTime.Caption := 'Очаквано време:';
    LabelPower.Caption := 'Изходен ток';
    LabelMessage.Caption :=
    'Не протича ток между сребърните електроди, моля проверете: '+
    '- дали има вода в чашата.'+
    '- дали има прекъснат кабел.'+
    '- дали са включени буксите към уреда.'+
    'Възможно е всичко по-горе описано да е наред, а всъщност водата да е много ниско минерализирана.'+
    'В този случай трябва да добавите най-добре щипка сода, или евентуално щипка сол и да разклатите чашата.'+
    'След това стартирате програмата за сребърна вода отново.';

    ButtonRead.Caption := 'Прочети настройки';
    ButtonWrite.Caption := 'Запази настройки';
    ButtonStart.Caption := 'СТАРТ';
    ButtonStop.Caption := 'СТОП';
    ButtonExit.Caption := 'ЗАТВОРИ';
  end else
  begin
    RadioGroupSilverConcentration.Caption := 'Concentration';
    RadioGroupWaterQ.Caption := 'Water';
    RadioGroupCurrentSetPoint.Caption := 'Current';
    LabelRemainTime.Caption := 'Remaining time:';
    LabelExpectTime.Caption := 'Estimated time:';
    LabelPower.Caption := 'Output current';
    LabelMessage.Caption :=
    'No current flows between the silver electrodes, please check: '+
    '- whether there is water in the glass.'+
    '- whether there is a broken cable .'+
    '- whether the sockets are connected to the appliance.'+
    'It is possible that everything described above is OK, but in fact the water is very low mineralized.'+
    'In this case, you should best add a pinch of soda, or possibly a pinch of salt, and shake the glass. '+
    'Then start the silver water program again.';

    ButtonRead.Caption := 'Read settings';
    ButtonWrite.Caption := 'Save settings';
    ButtonStart.Caption := 'START';
    ButtonStop.Caption := 'STOP';
    ButtonExit.Caption := 'CLOSE';
  end;

end;

procedure TfSrebarnaVoda.RadioGroupSilverConcentrationClick(Sender: TObject);
begin

  if save = 1 then
  begin
    ButtonWriteClick(nil);
    SleepSky(300);
   // TimerRemaindTime.Enabled := True;
    ButtonReadClick(nil);

  end;

end;

procedure TfSrebarnaVoda.TimerRemaindTimeTimer(Sender: TObject);
begin

  try
    ButtonReadClick(nil);
  except
  ShowMessage('ERROR READ Silver water');

  end;

end;

end.
