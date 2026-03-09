object fLogin: TfLogin
  Left = 1497
  Top = 682
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103
  ClientHeight = 127
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 66
    Top = 11
    Width = 29
    Height = 19
    Caption = #1048#1084#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 41
    Top = 39
    Width = 54
    Height = 19
    Caption = #1055#1072#1088#1086#1083#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bt_OK: TButton
    Left = 104
    Top = 94
    Width = 81
    Height = 25
    Caption = #1042#1061#1054#1044
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Bt_OKClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 104
    Top = 8
    Width = 193
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'id'
    ListField = 'name'
    ListSource = fMain.DataSourceUsers
    ParentFont = False
    TabOrder = 1
    OnClick = DBLookupComboBox1Click
  end
  object MaskEdit1: TMaskEdit
    Left = 104
    Top = 38
    Width = 193
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = ''
    OnKeyPress = MaskEdit1KeyPress
  end
  object Bt_cancel: TButton
    Left = 216
    Top = 94
    Width = 81
    Height = 25
    Caption = #1048#1047#1061#1054#1044
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Bt_cancelClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 144
    Width = 369
    Height = 281
    TabOrder = 4
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1KONTR_ID: TcxGridDBColumn
        DataBinding.FieldName = 'KONTR_ID'
      end
      object cxGrid1DBTableView1KONTR_IME: TcxGridDBColumn
        DataBinding.FieldName = 'KONTR_IME'
        Width = 295
      end
      object cxGrid1DBTableView1KONTR_NICK: TcxGridDBColumn
        DataBinding.FieldName = 'KONTR_NICK'
        Width = 254
      end
      object cxGrid1DBTableView1KONTR_TELEFON: TcxGridDBColumn
        DataBinding.FieldName = 'KONTR_TELEFON'
        Width = 125
      end
      object cxGrid1DBTableView1KONTR_BELEZKI: TcxGridDBColumn
        DataBinding.FieldName = 'KONTR_BELEZKI'
        Width = 151
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT * FROM KONTRAGENTI WHERE KONTR_TIP_POTREBITEL=1 ORDER BY ' +
        'KONTR_IME'
      '')
    Left = 56
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 24
    Top = 64
  end
end
