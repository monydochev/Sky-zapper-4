object fUsers: TfUsers
  Left = 0
  Top = 0
  Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080
  ClientHeight = 719
  ClientWidth = 1367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 544
    Top = 15
    Width = 21
    Height = 13
    Caption = #1048#1052#1045
  end
  object cxGrid4: TcxGrid
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 516
    Height = 284
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 0
    object cxGridDBTableView3: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSourceCustomGroup
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 45
      object cxGridDBTableView3Column1: TcxGridDBColumn
        Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080
        DataBinding.FieldName = 'name'
        Width = 178
      end
      object cxGridDBTableView3Column2: TcxGridDBColumn
        Caption = #1052#1086#1097#1085#1086#1089#1090' '#1076#1072#1085#1085#1080
        DataBinding.FieldName = 'power_options'
        HeaderAlignmentHorz = taCenter
        Width = 186
      end
    end
    object cxGridLevel3: TcxGridLevel
      GridView = cxGridDBTableView3
    end
  end
  object ButtonFilterGroup: TButton
    Left = 24
    Top = 219
    Width = 169
    Height = 35
    Caption = 'ButtonFilterGroup'
    TabOrder = 1
    Visible = False
  end
  object EditName: TEdit
    Left = 544
    Top = 38
    Width = 321
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ButtonAddGroup: TButton
    Left = 544
    Top = 71
    Width = 127
    Height = 54
    Caption = #1044#1086#1073#1072#1074#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 7
    Images = fMain.ImageList1
    ParentFont = False
    TabOrder = 3
    WordWrap = True
    OnClick = ButtonAddGroupClick
  end
  object ButtonDeleteGroup: TButton
    Left = 730
    Top = 71
    Width = 135
    Height = 54
    Caption = #1055#1088#1077#1084#1072#1093#1085#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 8
    Images = fMain.ImageList1
    ParentFont = False
    TabOrder = 4
    WordWrap = True
    OnClick = ButtonDeleteGroupClick
  end
  object ButtonExit: TButton
    Left = 732
    Top = 219
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
  object RadioGroupLanguage: TRadioGroup
    Left = 544
    Top = 227
    Width = 121
    Height = 62
    Caption = 'Language'
    ItemIndex = 0
    Items.Strings = (
      'Bulgarian'
      'English')
    TabOrder = 6
    Visible = False
    OnClick = RadioGroupLanguageClick
  end
  object CheckBoxEdit: TCheckBox
    Left = 551
    Top = 175
    Width = 114
    Height = 21
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1072#1085#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    WordWrap = True
    OnClick = CheckBoxEditClick
  end
  object DataSourceCustomGroup: TDataSource
    DataSet = ADOQueryUsers
    Left = 50
    Top = 128
  end
  object ADOQueryUsers: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 82
    Top = 128
  end
end
