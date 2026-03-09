object fSrebarnaVoda: TfSrebarnaVoda
  Left = 0
  Top = 0
  Width = 1192
  Height = 844
  AutoScroll = True
  Caption = #1057#1088#1077#1073#1098#1088#1085#1072' '#1074#1086#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object LabelRemainTime: TLabel
    Left = 21
    Top = 178
    Width = 127
    Height = 19
    Caption = #1054#1089#1090#1072#1074#1072#1097#1086' '#1074#1088#1077#1084#1077':'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelExpectTime: TLabel
    Left = 21
    Top = 197
    Width = 125
    Height = 19
    Caption = #1054#1095#1072#1082#1074#1072#1085#1086' '#1074#1088#1077#1084#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelPower: TLabel
    Left = 21
    Top = 216
    Width = 97
    Height = 19
    Caption = #1048#1079#1093#1086#1076#1077#1085' '#1090#1086#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelMessage: TLabel
    Left = 24
    Top = 399
    Width = 797
    Height = 230
    Caption = 
      #1053#1077' '#1087#1088#1086#1090#1080#1095#1072' '#1090#1086#1082' '#1084#1077#1078#1076#1091' '#1089#1088#1077#1073#1098#1088#1085#1080#1090#1077' '#1077#1083#1077#1082#1090#1088#1086#1076#1080', '#1084#1086#1083#1103' '#1087#1088#1086#1074#1077#1088#1077#1090#1077':'#13#10'- '#1076#1072 +
      #1083#1080' '#1082#1072#1087#1072#1082#1072' '#1077' '#1074#1098#1088#1093#1091' '#1095#1072#1096#1072#1090#1072'.'#13#10'- '#1076#1072#1083#1080' '#1080#1084#1072' '#1074#1086#1076#1072' '#1074' '#1095#1072#1096#1072#1090#1072'.'#13#10'- '#1076#1072#1083#1080' '#1080#1084#1072 +
      ' '#1087#1088#1077#1082#1098#1089#1085#1072#1090' '#1082#1072#1073#1077#1083'.'#13#10'- '#1076#1072#1083#1080' '#1089#1072' '#1074#1082#1083#1102#1095#1077#1085#1080' '#1073#1091#1082#1089#1080#1090#1077' '#1082#1098#1084' '#1091#1088#1077#1076#1072'. '#13#10#13#10#1042#1098#1079 +
      #1084#1086#1078#1085#1086' '#1077' '#1074#1089#1080#1095#1082#1086' '#1087#1086'-'#1075#1086#1088#1077' '#1086#1087#1080#1089#1072#1085#1086' '#1076#1072' '#1077' '#1085#1072#1088#1077#1076', '#1072' '#1074#1089#1098#1097#1085#1086#1089#1090' '#1074#1086#1076#1072#1090#1072' '#1076#1072' ' +
      #1077' '#1084#1085#1086#1075#1086' '#1085#1080#1089#1082#1086' '#1084#1080#1085#1077#1088#1072#1083#1080#1079#1080#1088#1072#1085#1072'. '#1042' '#1090#1086#1079#1080' '#1089#1083#1091#1095#1072#1081' '#1090#1088#1103#1073#1074#1072' '#1076#1072' '#1076#1086#1073#1072#1074#1080#1090#1077' '#1085 +
      #1072#1081'-'#1076#1086#1073#1088#1077' '#1097#1080#1087#1082#1072' '#1089#1086#1076#1072', '#1080#1083#1080' '#1077#1074#1077#1085#1090#1091#1072#1083#1085#1086' '#1097#1080#1087#1082#1072' '#1089#1086#1083' '#1080' '#1076#1072' '#1088#1072#1079#1082#1083#1072#1090#1080#1090#1077' '#1095#1072 +
      #1096#1072#1090#1072'. '#1057#1083#1077#1076' '#1090#1086#1074#1072' '#1089#1090#1072#1088#1090#1080#1088#1072#1090#1077' '#1087#1088#1086#1075#1088#1072#1084#1072#1090#1072' '#1079#1072' '#1089#1088#1077#1073#1098#1088#1085#1072' '#1074#1086#1076#1072' '#1086#1090#1085#1086#1074#1086'.'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object LabelAlert: TLabel
    Left = 21
    Top = 338
    Width = 98
    Height = 19
    Caption = #1057#1098#1086#1073#1097#1077#1085#1080#1077
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object RadioGroupCurrentSetPoint: TRadioGroup
    Left = 325
    Top = 24
    Width = 102
    Height = 212
    Caption = #1058#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      '2 mA'
      '5 mA'
      '8 mA'
      '11 mA'
      '14 mA'
      '17 mA'
      '20 mA')
    ParentFont = False
    TabOrder = 0
    OnClick = RadioGroupSilverConcentrationClick
  end
  object RadioGroupSilverConcentration: TRadioGroup
    Left = 21
    Top = 24
    Width = 128
    Height = 131
    Caption = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      '0.2 mg/l'
      '0.5 mg/l'
      '1.5 mg/l'
      '10 mg/l')
    ParentFont = False
    TabOrder = 1
    OnClick = RadioGroupSilverConcentrationClick
  end
  object RadioGroupWaterQ: TRadioGroup
    Left = 162
    Top = 24
    Width = 150
    Height = 131
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1086#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      '200 ml'
      '500 ml'
      '1000 ml'
      '2000 ml')
    ParentFont = False
    TabOrder = 2
    OnClick = RadioGroupSilverConcentrationClick
  end
  object ButtonStart: TButton
    Left = 21
    Top = 257
    Width = 128
    Height = 54
    Caption = #1057#1058#1040#1056#1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 0
    Images = fMain.ImageList1
    ParentFont = False
    TabOrder = 3
    OnClick = ButtonStartClick
  end
  object ButtonRead: TButton
    Left = 651
    Top = 27
    Width = 182
    Height = 33
    Caption = #1055#1088#1086#1095#1077#1090#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = ButtonReadClick
  end
  object ButtonWrite: TButton
    Left = 651
    Top = 66
    Width = 182
    Height = 33
    Caption = #1047#1072#1087#1072#1079#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnClick = ButtonWriteClick
  end
  object ButtonStop: TButton
    Left = 302
    Top = 257
    Width = 125
    Height = 54
    Caption = #1057#1058#1054#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 1
    Images = fMain.ImageList1
    ParentFont = False
    TabOrder = 6
    OnClick = ButtonStopClick
  end
  object RadioGroupLanguage: TRadioGroup
    Left = 507
    Top = 24
    Width = 110
    Height = 65
    Caption = 'Language'
    ItemIndex = 0
    Items.Strings = (
      'Bulgarian'
      'English')
    TabOrder = 7
    Visible = False
    OnClick = RadioGroupLanguageClick
  end
  object ButtonExit: TButton
    Left = 700
    Top = 258
    Width = 133
    Height = 54
    Caption = #1048#1047#1061#1054#1044
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 11
    Images = fMain.ImageList1
    ParentFont = False
    TabOrder = 8
    OnClick = ButtonExitClick
  end
  object TimerRemaindTime: TTimer
    Enabled = False
    OnTimer = TimerRemaindTimeTimer
    Left = 461
    Top = 16
  end
end
