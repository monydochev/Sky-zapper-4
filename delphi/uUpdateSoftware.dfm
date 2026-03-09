object fUpdateSoftware: TfUpdateSoftware
  Left = 0
  Top = 0
  Width = 1246
  Height = 719
  AutoScroll = True
  Caption = #1054#1073#1085#1086#1074#1103#1074#1072#1085#1077
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
  object Label10: TLabel
    Left = 8
    Top = 127
    Width = 500
    Height = 19
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087#1088#1086#1084#1077#1085#1080#1090#1077' '#1074' '#1085#1086#1074#1080#1090#1077' '#1074#1077#1088#1089#1080#1080' '#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1072#1090#1072' SKY Zapper'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object HTMLabel1: THTMLabel
    Left = 720
    Top = 129
    Width = 502
    Height = 17
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    HTMLText.Strings = (
      
        '<a href="http://cloud.sky.bg/options.html">'#1057#1074#1072#1083#1080' '#1087#1086#1089#1083#1077#1076#1085#1072' '#1074#1077#1088#1089#1080#1103 +
        ' '#1086#1090' '#1090#1091#1082': http://cloud.sky.bg/options.html</a> ')
    ParentFont = False
    Transparent = True
    Version = '2.1.0.0'
  end
  object ButtonCheckNewVersion: TButton
    Left = 8
    Top = 8
    Width = 255
    Height = 56
    Caption = #1055#1088#1086#1074#1077#1088#1080' '#1079#1072' '#1085#1086#1074#1072' '#1074#1077#1088#1089#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 29
    Images = fMain.ImageList1
    ParentFont = False
    TabOrder = 0
    WordWrap = True
    OnClick = ButtonCheckNewVersionClick
  end
  object MemoNewVersions: TMemo
    Left = 8
    Top = 152
    Width = 1217
    Height = 463
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ButtonDownloadNewVesrions: TButton
    Left = 269
    Top = 8
    Width = 180
    Height = 56
    Caption = #1054#1041#1053#1054#1042#1048
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 28
    Images = fMain.ImageList1
    ParentFont = False
    TabOrder = 2
    Visible = False
    WordWrap = True
    OnClick = ButtonDownloadNewVesrionsClick
  end
  object GroupBox1: TGroupBox
    Left = 596
    Top = 5
    Width = 629
    Height = 118
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 238
      Height = 19
      Caption = #1040#1076#1088#1077#1089' '#1079#1072' '#1089#1074#1072#1083#1103#1085#1077' '#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 60
      Width = 250
      Height = 19
      Caption = #1040#1076#1088#1077#1089' '#1079#1072' '#1089#1074#1072#1083#1103#1085#1077' '#1085#1072' '#1073#1072#1079#1072#1090#1072' '#1076#1072#1085#1085#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EditURL_program: TEdit
      Left = 8
      Top = 28
      Width = 606
      Height = 27
      TabOrder = 0
    end
    object EditURL_DB: TEdit
      Left = 8
      Top = 82
      Width = 606
      Height = 27
      TabOrder = 1
    end
    object CheckBoxUpdateDatabase: TCheckBox
      Left = 434
      Top = 62
      Width = 180
      Height = 17
      Caption = #1054#1073#1085#1086#1074#1080' '#1073#1072#1079#1072#1090#1072' '#1076#1072#1085#1085#1080
      Checked = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object CheckBoxUpdateSoftware: TCheckBox
      Left = 434
      Top = 5
      Width = 180
      Height = 17
      Caption = #1054#1073#1085#1086#1074#1080' '#1087#1088#1086#1075#1088#1072#1084#1072#1090#1072
      Checked = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
    end
  end
  object RadioGroupLanguage: TRadioGroup
    Left = 480
    Top = 8
    Width = 109
    Height = 65
    Caption = 'Language'
    ItemIndex = 0
    Items.Strings = (
      'Bulgarian'
      'English')
    TabOrder = 4
    Visible = False
    OnClick = RadioGroupLanguageClick
  end
  object ButtonExit: TButton
    Left = 1093
    Top = 621
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
    TabOrder = 5
    OnClick = ButtonExitClick
  end
end
