object fChangePassword: TfChangePassword
  Left = 423
  Top = 529
  Caption = #1057#1084#1103#1085#1072' '#1085#1072' '#1087#1072#1088#1086#1083#1072
  ClientHeight = 150
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 69
    Height = 13
    Caption = #1057#1090#1072#1088#1072' '#1087#1072#1088#1086#1083#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 65
    Height = 13
    Caption = #1053#1086#1074#1072' '#1087#1072#1088#1086#1083#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 65
    Height = 13
    Caption = #1053#1086#1074#1072' '#1087#1072#1088#1086#1083#1072
  end
  object Edit_OLD_PASSWORD: TEdit
    Left = 104
    Top = 16
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object Edit_New_Password: TEdit
    Left = 104
    Top = 48
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Edit_Retry_Password: TEdit
    Left = 104
    Top = 80
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 111
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 111
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 16
    Top = 112
  end
  object ADOQuery2: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM USERS_CONFIG')
    Left = 48
    Top = 112
  end
end
