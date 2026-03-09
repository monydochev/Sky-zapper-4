object fOptions: TfOptions
  Left = 0
  Top = 0
  Width = 1246
  Height = 718
  AutoScroll = True
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelAlert: TLabel
    Left = 8
    Top = 625
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1226
    Height = 619
    ActivePage = TabSheet4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1097#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 11
        Width = 1201
        Height = 571
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Labelt1_program_save: TLabel
          Left = 640
          Top = 9
          Width = 353
          Height = 19
          Caption = #1055#1088#1086#1075#1088#1072#1084#1080' '#1079#1072#1087#1072#1079#1077#1085#1080' '#1079#1072' '#1073#1098#1088#1079#1086' '#1080#1079#1073#1080#1088#1072#1085#1077' '#1086#1090' '#1073#1091#1090#1086#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LabelCloudAddress: TLabel
          Left = 72
          Top = 316
          Width = 301
          Height = 19
          Caption = #1040#1076#1088#1077#1089' '#1079#1072' '#1082#1086#1084#1091#1085#1080#1082#1072#1094#1080#1103' '#1089' CLOUD '#1091#1089#1083#1091#1075#1072#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LabelFactoryPIN: TLabel
          Left = 72
          Top = 385
          Width = 111
          Height = 19
          Caption = #1060#1072#1073#1088#1080#1095#1077#1085' '#1055#1048#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LabelAdditionalPIN: TLabel
          Left = 72
          Top = 435
          Width = 145
          Height = 19
          Caption = #1044#1086#1087#1098#1083#1085#1080#1090#1077#1083#1077#1085' '#1055#1048#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 455
          Top = 316
          Width = 29
          Height = 19
          Caption = 'Port'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ButtonGeneralSave: TButton
          Left = 72
          Top = 505
          Width = 170
          Height = 56
          Caption = #1047#1040#1055#1048#1064#1048' '#1053#1040#1057#1058#1056#1054#1049#1050#1048
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 12
          Images = fMain.ImageList1
          ParentFont = False
          TabOrder = 0
          WordWrap = True
          OnClick = ButtonGeneralSaveClick
        end
        object AdvEdit_duration: TAdvEdit
          Left = 72
          Top = 233
          Width = 40
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelCaption = #1042#1088#1077#1084#1077#1090#1088#1072#1077#1085#1077' '#1085#1072' '#1074#1089#1103#1082#1072' '#1095#1077#1089#1090#1086#1090#1072' ('#1089#1077#1082'.)'
          LabelPosition = lpRightCenter
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -16
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '0'
          Visible = True
          Version = '3.4.7.0'
        end
        object RadioGroupZumer: TRadioGroup
          Left = 72
          Top = 15
          Width = 377
          Height = 82
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1079#1072' '#1079#1074#1091#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            #1041#1077#1079' '#1079#1074#1091#1082
            #1055#1088#1080' '#1089#1084#1103#1085#1072' '#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1072
            #1055#1088#1080' '#1089#1084#1103#1085#1072' '#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1072' '#1080' '#1095#1077#1089#1090#1086#1090#1072)
          ParentFont = False
          TabOrder = 2
        end
        object AdvEditSweep: TAdvEdit
          Left = 72
          Top = 269
          Width = 40
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelCaption = #1042#1088#1077#1084#1077' '#1079#1072' '#1087#1083#1072#1074#1077#1085' '#1087#1088#1077#1093#1086#1076' '#1084#1077#1078#1076#1091' '#1076#1074#1077' '#1095#1077#1089#1090#1086#1090#1080' ('#1089#1077#1082'.)'
          LabelPosition = lpRightCenter
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -16
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '0'
          Visible = True
          Version = '3.4.7.0'
        end
        object RadioGroupSearch: TRadioGroup
          Left = 72
          Top = 112
          Width = 377
          Height = 85
          Caption = #1058#1098#1088#1089#1077#1085#1077' '#1074':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            #1043#1088#1091#1087#1072', '#1087#1088#1086#1075#1088#1072#1084#1072' '#1080' '#1086#1087#1080#1089#1072#1085#1080#1077
            #1055#1088#1086#1075#1088#1072#1084#1072' '#1080' '#1086#1087#1080#1089#1072#1085#1080#1077
            #1043#1088#1091#1087#1072' '#1080' '#1086#1087#1080#1089#1072#1085#1080#1077)
          ParentFont = False
          TabOrder = 4
        end
        object ButtonGeneralRead: TButton
          Left = 267
          Top = 505
          Width = 170
          Height = 56
          Caption = #1055#1056#1054#1063#1045#1058#1048' '#1053#1040#1057#1058#1056#1054#1049#1050#1048
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 13
          Images = fMain.ImageList1
          ParentFont = False
          TabOrder = 5
          WordWrap = True
          OnClick = ButtonGeneralReadClick
        end
        object MemoPrograms: TMemo
          Left = 640
          Top = 30
          Width = 561
          Height = 395
          PopupMenu = PopupMenu1
          ScrollBars = ssBoth
          TabOrder = 6
        end
        object EditCloud_URL: TEdit
          Left = 72
          Top = 335
          Width = 377
          Height = 21
          TabOrder = 7
        end
        object RadioGroupLanguage: TRadioGroup
          Left = 494
          Top = 15
          Width = 75
          Height = 53
          Caption = 'Language'
          ItemIndex = 0
          Items.Strings = (
            'Bulgarian'
            'English')
          TabOrder = 8
          Visible = False
          OnClick = RadioGroupLanguageClick
        end
        object EditFactoryPIN: TEdit
          Left = 72
          Top = 404
          Width = 105
          Height = 21
          TabOrder = 9
        end
        object EditAdditionalPIN: TEdit
          Left = 72
          Top = 454
          Width = 105
          Height = 21
          TabOrder = 10
        end
        object EditCloud_PORT: TEdit
          Left = 455
          Top = 335
          Width = 65
          Height = 21
          TabOrder = 11
        end
        object RadioGroupFreqOptions: TRadioGroup
          Left = 640
          Top = 435
          Width = 377
          Height = 62
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1079#1072' '#1095#1077#1089#1090#1086#1090#1080#1090#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            #1042#1089#1103#1082#1072' '#1095#1077#1089#1090#1086#1090#1072' '#1080#1084#1072' '#1089#1074#1086#1077' '#1089#1086#1073#1089#1090#1074#1077#1085#1086' '#1074#1088#1077#1084#1077'.'
            #1042#1089#1103#1082#1072' '#1095#1077#1089#1090#1086#1090#1072' '#1077' '#1089' '#1077#1076#1085#1072#1082#1074#1086' '#1075#1083#1086#1073#1072#1083#1085#1086' '#1074#1088#1077#1084#1077'.')
          ParentFont = False
          TabOrder = 12
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'WiFi - '#1041#1077#1079#1078#1080#1095#1085#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LabelWiFiNetworks: TLabel
        Left = 14
        Top = 59
        Width = 125
        Height = 19
        Caption = #1041#1077#1079#1078#1080#1095#1085#1080' '#1084#1088#1077#1078#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelWiFiPassword: TLabel
        Left = 14
        Top = 228
        Width = 258
        Height = 19
        Caption = #1055#1072#1088#1086#1083#1072' '#1079#1072' '#1074#1088#1098#1079#1082#1072' ('#1040#1082#1086' '#1080#1084#1072' '#1090#1072#1082#1072#1074#1072')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelHotSpot1: TLabel
        Left = 808
        Top = 19
        Width = 370
        Height = 38
        Caption = 
          'Hotspot '#1077' '#1073#1077#1079#1078#1080#1095#1085#1072' '#1084#1088#1077#1078#1072' '#1079#1072' '#1074#1088#1098#1079#1082#1072' '#1086#1090' '#1090#1077#1083#1077#1092#1086#1085', '#1090#1072#1073#1083#1077#1090', '#1083#1072#1087#1090#1086#1087' '#1080#1083 +
          #1080' '#1076#1088#1091#1075#1080' '#1084#1086#1073#1080#1083#1085#1080' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object LabelHotSpot2: TLabel
        Left = 808
        Top = 69
        Width = 328
        Height = 38
        Caption = 
          '* '#1040#1082#1086' '#1085#1077' '#1089#1077' '#1074#1098#1088#1078#1077#1090#1077' '#1082#1098#1084' '#1090#1072#1079#1080' '#1084#1088#1077#1078#1072', '#1097#1077' '#1089#1077' '#1080#1079#1082#1083#1102#1095#1080' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086' '#1085#1072 +
          ' 5-'#1090#1072' '#1084#1080#1085#1091#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object ButtonRecieveNetworks: TButton
        Left = 14
        Top = 3
        Width = 271
        Height = 56
        Caption = #1055#1086#1083#1091#1095#1072#1074#1072#1085#1077' '#1085#1072' '#1073#1077#1079#1078#1080#1095#1085#1080' '#1084#1088#1077#1078#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 17
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = ButtonRecieveNetworksClick
      end
      object ComboBoxcbb1_1: TComboBox
        Left = 293
        Top = 84
        Width = 56
        Height = 27
        TabOrder = 1
        Visible = False
      end
      object EditPassword: TEdit
        Left = 14
        Top = 248
        Width = 271
        Height = 27
        TabOrder = 2
      end
      object ButtonConnectNetwork: TButton
        Left = 14
        Top = 278
        Width = 271
        Height = 56
        Caption = #1057#1074#1098#1088#1079#1074#1072#1085#1077' '#1082#1098#1084' '#1073#1077#1079#1078#1080#1095#1085#1072' '#1084#1088#1077#1078#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 19
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 3
        WordWrap = True
        OnClick = ButtonConnectNetworkClick
      end
      object ButtonReadIP: TButton
        Left = 461
        Top = 3
        Width = 268
        Height = 56
        Caption = #1055#1088#1086#1095#1080#1090#1072#1085#1077' '#1085#1072' '#1083#1086#1082#1072#1083#1085#1086' IP '#1080' '#1084#1088#1077#1078#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 18
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 4
        WordWrap = True
        OnClick = ButtonReadIPClick
      end
      object MemoIP: TMemo
        Left = 461
        Top = 81
        Width = 268
        Height = 147
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object cxGrid1: TcxGrid
        Left = 3
        Top = 416
        Width = 1212
        Height = 172
        TabOrder = 6
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSourceNetworks
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxgrdbclmnGridDBTableView1status: TcxGridDBColumn
            DataBinding.FieldName = 'status'
            Width = 129
          end
          object cxgrdbclmnGridDBTableView1config: TcxGridDBColumn
            DataBinding.FieldName = 'config'
            Width = 117
          end
          object cxgrdbclmnGridDBTableView1ip: TcxGridDBColumn
            DataBinding.FieldName = 'ip'
            Width = 130
          end
          object cxgrdbclmnGridDBTableView1netmask: TcxGridDBColumn
            DataBinding.FieldName = 'netmask'
            Width = 130
          end
          object cxgrdbclmnGridDBTableView1gateway: TcxGridDBColumn
            DataBinding.FieldName = 'gateway'
            Width = 130
          end
          object cxgrdbclmnGridDBTableView1dns1: TcxGridDBColumn
            DataBinding.FieldName = 'dns1'
            Width = 130
          end
          object cxgrdbclmnGridDBTableView1dns2: TcxGridDBColumn
            DataBinding.FieldName = 'dns2'
            Width = 130
          end
          object cxgrdbclmnGridDBTableView1ssid: TcxGridDBColumn
            DataBinding.FieldName = 'ssid'
            Width = 130
          end
          object cxgrdbclmnGridDBTableView1password: TcxGridDBColumn
            DataBinding.FieldName = 'password'
            Width = 130
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object ButtonReadSaveNetworks: TButton
        Left = 14
        Top = 352
        Width = 271
        Height = 56
        Caption = #1055#1088#1086#1095#1080#1090#1072#1085#1077' '#1085#1072' '#1079#1072#1087#1072#1079#1072#1085#1080' '#1084#1088#1077#1078#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 20
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 7
        WordWrap = True
        OnClick = ButtonReadSaveNetworksClick
      end
      object RadioGroupHotspot: TRadioGroup
        Left = 889
        Top = 188
        Width = 122
        Height = 74
        Caption = 'Hotspot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.Strings = (
          #1048#1079#1082#1083#1102#1095#1077#1085#1086
          #1042#1082#1083#1102#1095#1077#1085#1086)
        ParentFont = False
        TabOrder = 8
        Visible = False
      end
      object ButtonHotspotRead: TButton
        Left = 1017
        Top = 232
        Width = 97
        Height = 30
        Caption = #1055#1088#1086#1095#1077#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Visible = False
        OnClick = ButtonHotspotReadClick
      end
      object ButtonHotSpotTurnOn: TButton
        Left = 808
        Top = 113
        Width = 161
        Height = 56
        Caption = #1042#1082#1083#1102#1095#1080' HotSpot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 21
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 10
        WordWrap = True
        OnClick = ButtonHotSpotTurnOnClick
      end
      object cxGrid2: TcxGrid
        Left = 14
        Top = 84
        Width = 273
        Height = 146
        TabOrder = 11
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSourceMreji
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.GroupByBox = False
          object cxGridDBTableView2name: TcxGridDBColumn
            Caption = #1041#1077#1079#1078#1080#1095#1085#1080' '#1084#1088#1077#1078#1080
            DataBinding.FieldName = 'name'
            Width = 200
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
      object CheckBoxWiFi: TCheckBox
        Left = 461
        Top = 238
        Width = 409
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080' WiFi '#1087#1088#1080' '#1089#1090#1072#1088#1090#1080#1088#1072#1085#1077' '#1085#1072' '#1079#1072#1087#1077#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object CheckBoxAP: TCheckBox
        Left = 461
        Top = 259
        Width = 385
        Height = 17
        Caption = #1048#1079#1082#1083#1102#1095#1080' AP '#1089#1083#1077#1076' '#1089#1090#1072#1088#1090#1080#1088#1072#1085#1077' '#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object AdvEditAP_sec: TAdvEdit
        Left = 461
        Top = 282
        Width = 40
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = 
          #1042#1088#1077#1084#1077#1090#1088#1072#1077#1085#1077' '#1079#1072' '#1080#1079#1082#1083#1102#1095#1074#1072#1085#1077' '#1085#1072' AP '#1089#1083#1077#1076' '#1079#1072#1087#1086#1095#1074#1072#1085#1077' '#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1072' ('#1089#1077#1082'.' +
          ')'
        LabelPosition = lpRightCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -16
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Font.Charset = DEFAULT_CHARSET
        Lookup.Font.Color = clWindowText
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Arial'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        Text = '0'
        Visible = True
        Version = '3.4.7.0'
      end
      object ButtonWiFiSave: TButton
        Left = 1017
        Top = 352
        Width = 161
        Height = 56
        Caption = #1047#1072#1087#1080#1096#1080
        ImageIndex = 12
        Images = fMain.ImageList1
        TabOrder = 15
        OnClick = ButtonWiFiSaveClick
      end
      object AdvEditAP_no_activity_sec: TAdvEdit
        Left = 461
        Top = 313
        Width = 40
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1042#1088#1077#1084#1077#1090#1088#1072#1077#1085#1077' '#1079#1072' '#1080#1079#1082#1083#1102#1095#1074#1072#1085#1077' '#1085#1072' AP '#1087#1088#1080' '#1085#1077#1072#1082#1090#1080#1074#1085#1086#1089#1090' ('#1089#1077#1082'.)'
        LabelPosition = lpRightCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -16
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Font.Charset = DEFAULT_CHARSET
        Lookup.Font.Color = clWindowText
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Arial'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        Text = '0'
        Visible = True
        Version = '3.4.7.0'
      end
      object ButtonHotSpotTurnOff: TButton
        Left = 1017
        Top = 113
        Width = 161
        Height = 56
        Caption = #1048#1079#1082#1083#1102#1095#1080' HotSpot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 22
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 17
        WordWrap = True
        OnClick = ButtonHotSpotTurnOffClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1085#1072' '#1084#1086#1097#1085#1086#1089#1090#1090#1072
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox3: TGroupBox
        Left = 2
        Top = 2
        Width = 1213
        Height = 571
        TabOrder = 0
        object Label4: TLabel
          Left = 223
          Top = 34
          Width = 18
          Height = 19
          Caption = 'Hz'
        end
        object Label5: TLabel
          Left = 223
          Top = 65
          Width = 16
          Height = 19
          Caption = '%'
        end
        object Label6: TLabel
          Left = 291
          Top = 34
          Width = 16
          Height = 19
          Caption = '%'
        end
        object Label7: TLabel
          Left = 291
          Top = 65
          Width = 16
          Height = 19
          Caption = '%'
        end
        object LabelStep: TLabel
          Left = 67
          Top = 170
          Width = 313
          Height = 33
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelDescription: TLabel
          Left = 67
          Top = 263
          Width = 313
          Height = 112
          AutoSize = False
          Caption = 
            #1047#1072' '#1076#1072' '#1085#1072#1087#1088#1072#1074#1080#1090#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1072' '#1085#1072' '#1084#1086#1097#1085#1086#1089#1090#1090#1072' '#1085#1072' '#1047#1072#1087#1077#1088#1072' '#1089#1087#1088#1103#1084#1086' '#1042#1072#1096#1080#1090#1077' '#1083 +
            #1080#1095#1085#1080' '#1091#1089#1077#1097#1072#1085#1080#1103' '#1085#1072#1090#1080#1089#1085#1077#1090#1077' '#1073#1091#1090#1086#1085#1072' "'#1047#1072#1087#1086#1095#1085#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1072' '#1085#1072' '#1084#1086#1097#1085#1086#1089#1090#1090#1072'" ' +
            #1080' '#1074#1079#1077#1084#1077#1090#1077' '#1088#1098#1082#1086#1093#1074#1072#1090#1082#1080#1090#1077'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object AdvEdit_frequence: TAdvEdit
          Left = 149
          Top = 31
          Width = 66
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelCaption = #1063#1077#1089#1090#1086#1090#1072
          LabelPosition = lpLeftCenter
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          TabOrder = 0
          Text = '5000'
          Visible = True
          Version = '3.4.7.0'
        end
        object AdvEdit_power: TAdvEdit
          Left = 149
          Top = 62
          Width = 66
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelCaption = #1052#1086#1097#1085#1086#1089#1090
          LabelPosition = lpLeftCenter
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -16
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = '100'
          Visible = True
          Version = '3.4.7.0'
        end
        object AdvEdit_interval: TAdvEdit
          Left = 149
          Top = 93
          Width = 66
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelCaption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1089#1077#1082'.'
          LabelPosition = lpLeftCenter
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          TabOrder = 2
          Text = '5'
          Visible = True
          Version = '3.4.7.0'
        end
        object AdvEdit_frequence_interval: TAdvEdit
          Left = 243
          Top = 31
          Width = 40
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelCaption = #1057#1090#1098#1087#1082#1072
          LabelPosition = lpTopLeft
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          TabOrder = 3
          Text = '10'
          Visible = True
          Version = '3.4.7.0'
        end
        object AdvEdit_power_interval: TAdvEdit
          Left = 243
          Top = 62
          Width = 40
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelPosition = lpLeftCenter
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          Text = '5'
          Visible = True
          Version = '3.4.7.0'
        end
        object ButtonCalibrateFrequence: TButton
          Left = 434
          Top = 27
          Width = 170
          Height = 56
          Caption = #1058#1077#1089#1090' '#1087#1086' '#1095#1077#1089#1090#1086#1090#1072
          ImageIndex = 23
          Images = fMain.ImageList1
          TabOrder = 5
          Visible = False
          WordWrap = True
          OnClick = ButtonCalibrateFrequenceClick
        end
        object ButtonCalibratePower: TButton
          Left = 434
          Top = 89
          Width = 170
          Height = 56
          Caption = #1058#1077#1089#1090' '#1087#1086' '#1084#1086#1097#1085#1086#1089#1090
          ImageIndex = 24
          Images = fMain.ImageList1
          TabOrder = 6
          Visible = False
          WordWrap = True
          OnClick = ButtonCalibratePowerClick
        end
        object ButtonStopCalibration: TButton
          Left = 218
          Top = 378
          Width = 150
          Height = 56
          Caption = #1057#1087#1088#1080
          ImageIndex = 1
          Images = fMain.ImageList1
          TabOrder = 7
          WordWrap = True
          OnClick = ButtonStopCalibrationClick
        end
        object RadioGroupMove: TRadioGroup
          Left = 243
          Top = 95
          Width = 145
          Height = 69
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            #1059#1074#1077#1083#1080#1095#1072#1074#1072#1085#1077
            #1053#1072#1084#1072#1083#1103#1074#1072#1085#1077)
          ParentFont = False
          TabOrder = 8
          Visible = False
        end
        object ButtonBegin: TButton
          Left = 67
          Top = 200
          Width = 358
          Height = 57
          Caption = #1047#1072#1087#1086#1095#1085#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1072' '#1085#1072' '#1084#1086#1097#1085#1086#1089#1090#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ImageIndex = 14
          Images = fMain.ImageList1
          ParentFont = False
          TabOrder = 9
          WordWrap = True
          OnClick = ButtonBeginClick
        end
        object ButtonOK_no_more: TButton
          Left = 62
          Top = 378
          Width = 150
          Height = 56
          Caption = #1054#1050' '#1076#1086' '#1090#1091#1082
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ImageIndex = 27
          Images = fMain.ImageList1
          ParentFont = False
          TabOrder = 10
          WordWrap = True
          OnClick = ButtonOK_no_moreClick
        end
        object ButtonNextStep: TButton
          Left = 374
          Top = 378
          Width = 150
          Height = 56
          Caption = #1057#1083#1077#1076#1074#1072#1097#1072' '#1089#1090#1098#1087#1082#1072
          Enabled = False
          ImageIndex = 27
          Images = fMain.ImageList1
          TabOrder = 11
          WordWrap = True
          OnClick = ButtonNextStepClick
        end
        object MemoLogPower: TMemo
          Left = 624
          Top = 7
          Width = 586
          Height = 500
          PopupMenu = PopupMenu1
          ScrollBars = ssBoth
          TabOrder = 12
        end
        object ButtonFactoryReset: TButton
          Left = 892
          Top = 512
          Width = 318
          Height = 56
          Caption = #1060#1072#1073#1088#1080#1095#1085#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
          ImageIndex = 28
          Images = fMain.ImageList1
          TabOrder = 13
          OnClick = ButtonFactoryResetClick
        end
        object ButtonTestDevice: TButton
          Left = 434
          Top = 150
          Width = 170
          Height = 56
          Caption = #1058#1077#1089#1090' '#1085#1072' '#1091#1088#1077#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ImageIndex = 25
          Images = fMain.ImageList1
          ParentFont = False
          TabOrder = 14
          WordWrap = True
          OnClick = ButtonTestDeviceClick
        end
        object ButtonStopTest: TButton
          Left = 624
          Top = 535
          Width = 170
          Height = 30
          Caption = #1057#1090#1086#1087' '#1085#1072' '#1090#1077#1089#1090#1072
          TabOrder = 15
          Visible = False
          OnClick = ButtonCalibratePowerClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '...'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grpFirmware: TGroupBox
        Left = 8
        Top = 11
        Width = 1207
        Height = 571
        TabOrder = 0
        object MemoFirmwareLog: TMemo
          Left = 4
          Top = 174
          Width = 1200
          Height = 387
          PopupMenu = PopupMenu1
          TabOrder = 0
        end
        object ButtonFirmware: TButton
          Left = 498
          Top = 89
          Width = 181
          Height = 56
          Caption = #1047#1072#1087#1080#1096#1080' Firmware'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 15
          Images = fMain.ImageList1
          ParentFont = False
          TabOrder = 1
          WordWrap = True
          OnClick = ButtonFirmwareClick
        end
        object ButtonAVR_Dude: TButton
          Left = 266
          Top = 180
          Width = 201
          Height = 25
          Caption = 'ButtonAVR_Dude'
          TabOrder = 2
          Visible = False
          OnClick = ButtonAVR_DudeClick
        end
        object Edit1: TEdit
          Left = 9
          Top = 20
          Width = 483
          Height = 27
          TabOrder = 3
        end
        object ButtonFirmwareFile: TButton
          Left = 498
          Top = 18
          Width = 181
          Height = 56
          Caption = #1048#1079#1073#1077#1088#1080' '#1092#1072#1081#1083
          ImageIndex = 16
          Images = fMain.ImageList1
          TabOrder = 4
          OnClick = ButtonFirmwareFileClick
        end
        object ComboBoxLoader: TComboBox
          Left = 345
          Top = 53
          Width = 89
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object AdvEditDelay: TAdvEdit
          Left = 9
          Top = 52
          Width = 34
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelCaption = #1048#1079#1095#1072#1082#1074#1072#1085#1077' '#1089#1077#1082#1091#1085#1076#1080' (1..7)'
          LabelPosition = lpRightCenter
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -16
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Text = '3'
          Visible = True
          Version = '3.4.7.0'
        end
        object AdvEditTry: TAdvEdit
          Left = 9
          Top = 82
          Width = 34
          Height = 27
          DefaultHandling = True
          EditAlign = eaRight
          EditType = etNumeric
          EmptyTextStyle = []
          LabelCaption = #1050#1086#1083#1082#1086' '#1086#1087#1080#1090#1072' '#1079#1072' '#1088#1072#1079#1087#1086#1079#1085#1072#1074#1072#1085#1077' (1..7)'
          LabelPosition = lpRightCenter
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -16
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Text = '3'
          Visible = True
          Version = '3.4.7.0'
        end
        object ComboBoxStandartPorts: TComboBox
          Left = 345
          Top = 89
          Width = 89
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1044#1077#1073#1098#1075#1074#1072#1085#1077
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grpDebugOptions: TGroupBox
        Left = 1
        Top = 14
        Width = 1212
        Height = 585
        TabOrder = 0
        Visible = False
        object Button15: TButton
          Left = 473
          Top = 527
          Width = 213
          Height = 45
          Caption = #1055#1054#1050#1040#1046#1048' '#1044#1040#1053#1053#1048#1058#1045' '#1047#1040' '#1047#1040#1055#1048#1057' '#1042' '#1047#1040#1055#1045#1056
          TabOrder = 0
          WordWrap = True
          OnClick = Button15Click
        end
        object Button13: TButton
          Left = 704
          Top = 527
          Width = 76
          Height = 45
          Caption = #1048#1079#1095#1080#1089#1090#1080' '#1083#1086#1075
          TabOrder = 1
          WordWrap = True
          OnClick = Button13Click
        end
        object cxGrid5: TcxGrid
          Left = 1006
          Top = 31
          Width = 203
          Height = 542
          TabOrder = 2
          object cxGridDBTableView4: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = fMain.DataSourceBuffer
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
            object cxgrdbclmnGridDBTableView4id: TcxGridDBColumn
              DataBinding.FieldName = 'id'
              SortIndex = 0
              SortOrder = soAscending
              Width = 39
            end
            object cxgrdbclmnGridDBTableView4dec: TcxGridDBColumn
              DataBinding.FieldName = 'dec'
              Width = 41
            end
            object cxgrdbclmnGridDBTableView4hex: TcxGridDBColumn
              DataBinding.FieldName = 'hex'
              Width = 41
            end
            object cxgrdbclmnGridDBTableView4char: TcxGridDBColumn
              DataBinding.FieldName = 'char'
              Width = 44
            end
          end
          object cxGridLevel4: TcxGridLevel
            GridView = cxGridDBTableView4
          end
        end
        object ButtonRead: TButton
          Left = 786
          Top = 527
          Width = 104
          Height = 44
          Caption = #1055#1088#1086#1095#1077#1090#1080' '#1087#1072#1084#1077#1090#1090#1072
          TabOrder = 3
          WordWrap = True
          OnClick = ButtonReadClick
        end
        object grp1: TGroupBox
          Left = -536
          Top = 104
          Width = 185
          Height = 105
          Caption = 'grp1'
          TabOrder = 4
        end
        object Button1: TButton
          Left = 896
          Top = 527
          Width = 104
          Height = 44
          Caption = #1047#1040#1055#1040#1047#1048' '#1042':'
          TabOrder = 5
          OnClick = Button1Click
        end
        object MemoMainLogRX_D: TMemo
          Left = 11
          Top = 31
          Width = 225
          Height = 538
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 6
        end
        object MemoMainLogTX_D: TMemo
          Left = 242
          Top = 31
          Width = 225
          Height = 538
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 7
        end
        object MemoMainLogEvent_D: TMemo
          Left = 473
          Top = 31
          Width = 527
          Height = 490
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 8
        end
        object CheckBoxRX_D: TCheckBox
          Left = 12
          Top = 13
          Width = 89
          Height = 17
          Caption = #1055#1086#1083#1091#1095#1072#1074#1072#1085#1077
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 9
        end
        object CheckBoxTX_D: TCheckBox
          Left = 242
          Top = 13
          Width = 82
          Height = 17
          Caption = #1048#1079#1087#1088#1072#1097#1072#1085#1077
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 10
        end
        object CheckBoxMessage_D: TCheckBox
          Left = 473
          Top = 13
          Width = 145
          Height = 17
          Caption = #1057#1098#1086#1073#1097#1077#1085#1080#1077' '#1080' '#1089#1098#1073#1080#1090#1080#1103
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 11
        end
      end
    end
  end
  object Button5: TButton
    Left = 800
    Top = 646
    Width = 171
    Height = 25
    Caption = 'set freq default'
    TabOrder = 1
    Visible = False
    OnClick = Button5Click
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
    TabOrder = 2
    OnClick = ButtonExitClick
  end
  object TimerFrequence: TTimer
    Enabled = False
    OnTimer = TimerFrequenceTimer
    Left = 2
    Top = 232
  end
  object TimerPower: TTimer
    Enabled = False
    OnTimer = TimerPowerTimer
    Left = 3
    Top = 263
  end
  object OpenDialogFirmware: TOpenDialog
    DefaultExt = '*.hex'
    Filter = 'Firmware files|*.hex'
    Left = 318
    Top = 484
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 483
    object N1: TMenuItem
      Caption = #1048#1079#1087#1088#1072#1090#1080' '#1083#1086#1075' 1 '#1087#1086' '#1080'-'#1084#1077#1081#1083
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 600
    Top = 407
    object N21: TMenuItem
      Caption = #1048#1079#1087#1088#1072#1090#1080' '#1083#1086#1075' 2 '#1087#1086' '#1080'-'#1084#1077#1081#1083
      OnClick = N21Click
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'file.eeprom'
    Left = 560
    Top = 408
  end
  object DataSourceNetworks: TDataSource
    DataSet = vtNetworks
    Left = 12
    Top = 384
  end
  object vtNetworks: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'status'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'config'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ip'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'netmask'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'gateway'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dns1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dns2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ssid'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'password'
        DataType = ftString
        Size = 20
      end>
    Left = 44
    Top = 384
    Data = {
      04000900060073746174757301001400000000000600636F6E66696701001400
      0000000002006970010014000000000007006E65746D61736B01001400000000
      0007006761746577617901001400000000000400646E73310100140000000000
      0400646E73320100140000000000040073736964010014000000000008007061
      7373776F72640100140000000000000000000000}
  end
  object DataSourceMreji: TDataSource
    DataSet = vtMreji
    Left = 12
    Top = 184
  end
  object vtMreji: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'name'
        DataType = ftString
        Size = 20
      end>
    Left = 44
    Top = 184
    Data = {0400010004006E616D650100140000000000000000000000}
  end
  object TimerWiFiRead: TTimer
    Enabled = False
    OnTimer = TimerWiFiReadTimer
    Left = 172
    Top = 193
  end
end
