object fCustomGroups: TfCustomGroups
  Left = 0
  Top = 0
  Width = 2072
  Height = 1008
  AutoScroll = True
  Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1080#1079#1080#1088#1072#1085#1080' '#1075#1088#1091#1087#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object cxGrid4: TcxGrid
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 289
    Height = 801
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 0
    object cxGridDBTableView3: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = cxGridDBTableView3CellClick
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
      object cxGridDBTableView3Column2: TcxGridDBColumn
        Caption = #1057#1086#1088#1090' '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'sort'
        HeaderAlignmentHorz = taCenter
        Width = 58
      end
      object cxGridDBTableView3Column1: TcxGridDBColumn
        Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1080#1079#1080#1088#1072#1085#1072' '#1075#1088#1091#1087#1072
        DataBinding.FieldName = 'name'
        Width = 178
      end
    end
    object cxGridLevel3: TcxGridLevel
      GridView = cxGridDBTableView3
    end
  end
  object cxGrid2: TcxGrid
    AlignWithMargins = True
    Left = 304
    Top = 5
    Width = 862
    Height = 801
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 1
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = cxGridDBTableView1CellClick
      DataController.DataSource = DataSourceCustomProgram
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
      object cxGridDBTableView1ColumnSort: TcxGridDBColumn
        Caption = #1057#1086#1088#1090' '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'sort'
        HeaderAlignmentHorz = taCenter
        Width = 58
      end
      object cxGridDBTableView1ColumnProgram: TcxGridDBColumn
        Caption = #1055#1088#1086#1075#1088#1072#1084#1072
        DataBinding.FieldName = 'name_bg'
        Width = 402
      end
      object cxGridDBTableView1ColumnRepeate: TcxGridDBColumn
        Caption = #1055#1086#1074#1090#1072#1088#1103#1085#1077' '#1073#1088#1086#1081
        DataBinding.FieldName = 'program_count'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object cxGridDBTableView1ColumnPause: TcxGridDBColumn
        Caption = #1055#1086#1095#1080#1074#1082#1072' '#1089#1077#1082'.'
        DataBinding.FieldName = 'program_pause'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object ButtonFilterGroup: TButton
    Left = 24
    Top = 219
    Width = 169
    Height = 35
    Caption = 'ButtonFilterGroup'
    TabOrder = 2
    Visible = False
    OnClick = ButtonFilterGroupClick
  end
  object Button1: TButton
    Left = 1885
    Top = 570
    Width = 194
    Height = 25
    Caption = #1047#1072#1087#1072#1084#1077#1090#1080' '#1087#1088#1086#1075#1088#1072#1084#1072
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 1885
    Top = 601
    Width = 194
    Height = 25
    Caption = #1047#1072#1087#1072#1084#1077#1090#1080' '#1095#1077#1089#1090#1086#1090#1072
    TabOrder = 4
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 2184
    Top = 601
    Width = 66
    Height = 25
    Caption = #1055#1091#1089#1085#1080
    TabOrder = 5
    Visible = False
    OnClick = Button3Click
  end
  object ButtonPrepareBuffer: TButton
    Left = 1896
    Top = 664
    Width = 101
    Height = 25
    Caption = '1.  '#1073#1091#1092#1077#1088#1072
    TabOrder = 6
    Visible = False
    OnClick = ButtonPrepareBufferClick
  end
  object ButtonSendingBuffer: TButton
    Left = 1896
    Top = 716
    Width = 101
    Height = 25
    Caption = '3. Send next'
    TabOrder = 7
    Visible = False
    OnClick = ButtonSendingBufferClick
  end
  object AdvEditBlockPos: TAdvEdit
    Left = 2003
    Top = 718
    Width = 57
    Height = 27
    DefaultHandling = True
    EditAlign = eaRight
    EditType = etNumeric
    EmptyTextStyle = []
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
    TabOrder = 8
    Text = '0'
    Visible = False
    Version = '3.4.7.0'
  end
  object AdvEditBlockMax: TAdvEdit
    Left = 2066
    Top = 718
    Width = 57
    Height = 27
    DefaultHandling = True
    EditAlign = eaRight
    EditType = etNumeric
    EmptyTextStyle = []
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
    TabOrder = 9
    Text = '0'
    Visible = False
    Version = '3.4.7.0'
  end
  object ButtonFinished: TButton
    Left = 1896
    Top = 743
    Width = 101
    Height = 25
    Caption = '4. Stop buffer'
    TabOrder = 10
    Visible = False
    OnClick = ButtonFinishedClick
  end
  object ButtonStartSendingBuffer: TButton
    Left = 1896
    Top = 690
    Width = 101
    Height = 25
    Caption = '2. Start buffer'
    TabOrder = 11
    Visible = False
    OnClick = ButtonStartSendingBufferClick
  end
  object AdvEditBufferCount: TAdvEdit
    Left = 2003
    Top = 666
    Width = 57
    Height = 27
    DefaultHandling = True
    EditAlign = eaRight
    EditType = etNumeric
    EmptyTextStyle = []
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
    TabOrder = 12
    Text = '170'
    Visible = False
    Version = '3.4.7.0'
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 823
    Width = 2056
    Height = 146
    Align = alBottom
    TabOrder = 13
    object Label1: TLabel
      Left = 849
      Top = 86
      Width = 125
      Height = 19
      Caption = #1042#1077#1088#1089#1080#1103' '#1085#1072' '#1073#1072#1079#1072#1090#1072
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 21
      Width = 841
      Height = 123
      Align = alLeft
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 7
        Width = 32
        Height = 19
        Caption = #1048#1052#1045
      end
      object ButtonAddGroup: TButton
        Left = 8
        Top = 63
        Width = 127
        Height = 54
        Caption = #1044#1086#1073#1072#1074#1080' '#1089#1087#1080#1089#1098#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 7
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = ButtonAddGroupClick
      end
      object EditGroupName: TEdit
        Left = 8
        Top = 30
        Width = 265
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object CheckBoxEdit: TCheckBox
        Left = 154
        Top = 7
        Width = 114
        Height = 21
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1072#1085#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        WordWrap = True
        OnClick = CheckBoxEditClick
      end
      object ButtonPlay: TButton
        Left = 411
        Top = 5
        Width = 135
        Height = 54
        Caption = #1055#1091#1089#1085#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 3
        WordWrap = True
        OnClick = ButtonPlayClick
      end
      object ButtonPause: TButton
        Left = 701
        Top = 5
        Width = 135
        Height = 54
        Caption = #1055#1072#1091#1079#1072
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 2
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 4
        Visible = False
        OnClick = ButtonPauseClick
      end
      object ButtonStop: TButton
        Left = 555
        Top = 5
        Width = 135
        Height = 54
        Caption = #1057#1090#1086#1087
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 5
        OnClick = ButtonStopClick
      end
      object AdvEditBreakProgram: TAdvEdit
        Left = 279
        Top = 90
        Width = 48
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1042#1088#1077#1084#1077#1090#1088#1072#1077#1085#1077' '#1079#1072' '#1087#1086#1095#1080#1074#1082#1072' '#1084#1077#1078#1076#1091' '#1087#1088#1086#1075#1088#1072#1084#1080#1090#1077' '#1074' '#1089#1077#1082#1091#1085#1076#1080
        LabelPosition = lpRightCenter
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
        TabOrder = 6
        Text = '10'
        Visible = True
        Version = '3.4.7.0'
      end
      object AdvEditRepeatList: TAdvEdit
        Left = 279
        Top = 62
        Width = 48
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1050#1086#1083#1082#1086' '#1094#1080#1082#1098#1083#1072' '#1076#1072' '#1087#1086#1074#1090#1086#1088#1080' '#1089#1087#1080#1089#1098#1082#1072' '#1089' '#1087#1088#1086#1075#1088#1072#1084#1080
        LabelPosition = lpRightCenter
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
        TabOrder = 7
        Text = '3'
        Visible = True
        Version = '3.4.7.0'
      end
      object ButtonDeleteGroup: TButton
        Left = 138
        Top = 63
        Width = 135
        Height = 54
        Caption = #1055#1088#1077#1084#1072#1093#1085#1080' '#1089#1087#1080#1089#1098#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 8
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 8
        WordWrap = True
        OnClick = ButtonDeleteGroupClick
      end
      object ButtonSavePrograms: TButton
        Left = 279
        Top = 5
        Width = 123
        Height = 54
        Caption = #1044#1054#1041#1040#1042#1048' '#1055#1056#1054#1043#1056#1040#1052#1048#1058#1045' '#1042' '#1047#1040#1055#1045#1056#1040
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        WordWrap = True
        OnClick = ButtonSaveProgramsClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 1484
      Top = 21
      Width = 570
      Height = 123
      Align = alRight
      TabOrder = 1
      object LabelProgram: TLabel
        Left = 9
        Top = 23
        Width = 71
        Height = 19
        Caption = #1055#1088#1086#1075#1088#1072#1084#1072
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LabelGroupName: TLabel
        Left = 9
        Top = 3
        Width = 52
        Height = 19
        Caption = #1057#1087#1080#1089#1098#1082
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LabelProgramFreq: TLabel
        Left = 9
        Top = 43
        Width = 59
        Height = 19
        Caption = #1063#1077#1089#1090#1086#1090#1080
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LabelPause: TLabel
        Left = 9
        Top = 63
        Width = 62
        Height = 19
        Caption = #1055#1086#1095#1080#1074#1082#1072
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LabelTimeProgram: TLabel
        Left = 483
        Top = 14
        Width = 66
        Height = 19
        Alignment = taRightJustify
        Caption = '00:00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelTimeElipsed: TLabel
        Left = 483
        Top = 40
        Width = 66
        Height = 19
        Alignment = taRightJustify
        Caption = '00:00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ButtonExit: TButton
        Left = 416
        Top = 64
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
        TabOrder = 0
        OnClick = ButtonExitClick
      end
    end
    object RadioGroupLanguage: TRadioGroup
      Left = 849
      Top = 15
      Width = 147
      Height = 65
      Caption = #1045#1079#1080#1082' / Language'
      ItemIndex = 0
      Items.Strings = (
        'Bulgarian'
        'English')
      TabOrder = 2
      Visible = False
    end
    object EditMajor: TEdit
      Left = 849
      Top = 116
      Width = 25
      Height = 27
      TabOrder = 3
      Text = '2'
      Visible = False
    end
    object EditMinor: TEdit
      Left = 880
      Top = 116
      Width = 25
      Height = 27
      TabOrder = 4
      Text = '1'
      Visible = False
    end
    object MemoPersonalList: TMemo
      Left = 1002
      Top = 24
      Width = 299
      Height = 96
      TabOrder = 5
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 1174
    Top = 5
    Width = 705
    Height = 811
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 14
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 695
      Height = 81
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 0
      object LabelSearch: TLabel
        Left = 73
        Top = 10
        Width = 66
        Height = 19
        Caption = #1058#1098#1088#1089#1077#1085#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EditSearch: TEdit
        Left = 72
        Top = 35
        Width = 251
        Height = 27
        TabOrder = 0
        OnChange = EditSearchChange
      end
      object ButtonSearch: TButton
        Left = 329
        Top = 35
        Width = 72
        Height = 27
        Caption = #1058#1098#1088#1089#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = ButtonSearchClick
      end
      object AdvEditDuration: TAdvEdit
        Left = 464
        Top = 22
        Width = 46
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1055#1088#1086#1076#1098#1083#1078#1080#1090#1077#1083#1085#1086#1089#1090' '#1089#1077#1082#1091#1085#1076#1080
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
        TabOrder = 2
        Text = '0'
        Visible = True
        Version = '3.4.7.0'
      end
      object ButtonChangeFreq: TButton
        Left = 517
        Top = 22
        Width = 83
        Height = 27
        Caption = #1055#1088#1086#1084#1077#1085#1080
        TabOrder = 3
        OnClick = ButtonChangeFreqClick
      end
      object ButtonChangeAll: TButton
        Left = 464
        Top = 53
        Width = 136
        Height = 25
        Caption = #1042#1089#1080#1095#1082#1080
        TabOrder = 4
        OnClick = ButtonChangeAllClick
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 90
      Width = 67
      Height = 714
      Align = alLeft
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 1
      object ButtonAddProgram: TButton
        Left = 4
        Top = 48
        Width = 52
        Height = 54
        Hint = #1044#1054#1041#1040#1042#1048' '#1050#1066#1052' '#1058#1040#1047#1048' '#1043#1056#1059#1055#1040
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 9
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = ButtonAddProgramClick
      end
      object ButtonRemoveProgram: TButton
        Left = 4
        Top = 216
        Width = 52
        Height = 54
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 10
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 1
        WordWrap = True
        OnClick = ButtonRemoveProgramClick
      end
    end
    object cxGrid3: TcxGrid
      AlignWithMargins = True
      Left = 472
      Top = 90
      Width = 226
      Height = 714
      Align = alRight
      TabOrder = 2
      object cxGridDBTableView2: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = cxGridDBTableView2CellClick
        DataController.DataSource = fMain.DataSourceFreq
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = cxGridDBColumn1
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 45
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1063#1077#1089#1090#1086#1090#1072
          DataBinding.FieldName = 'freq'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '# ###.##'
          HeaderAlignmentHorz = taCenter
          Width = 120
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1057#1077#1082'.'
          DataBinding.FieldName = 'time_sec'
          OnGetDisplayText = cxGridDBColumn2GetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = 'Sort'
          DataBinding.FieldName = 'orderno'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 36
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView2
      end
    end
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 76
      Top = 90
      Width = 390
      Height = 714
      Align = alClient
      TabOrder = 3
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = cxGrid1DBTableView1CellClick
        DataController.DataSource = fMain.DataSourceDiseases
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
          end
          item
            Kind = skCount
            Column = cxGrid1DBTableView1name_bg
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 45
        object cxGridDBTableGrid1DBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
        end
        object cxGrid1DBTableView1name_en: TcxGridDBColumn
          Caption = 'Program'
          DataBinding.FieldName = 'name_en'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 305
        end
        object cxGrid1DBTableView1name_bg: TcxGridDBColumn
          Caption = #1055#1088#1086#1075#1088#1072#1084#1072
          DataBinding.FieldName = 'name_bg'
          HeaderAlignmentHorz = taCenter
          Width = 305
        end
        object cxgrdbclmnGrid1DBTableView1Column1: TcxGridDBColumn
          Caption = #1041#1056'.'
          DataBinding.FieldName = 'freq_count'
          HeaderAlignmentHorz = taCenter
          Width = 43
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object ButtonRefreshFreq: TButton
      Left = 224
      Top = 217
      Width = 183
      Height = 25
      Caption = 'ButtonRefreshFreq'
      TabOrder = 4
      Visible = False
      OnClick = ButtonRefreshFreqClick
    end
  end
  object DataSourceCustomGroup: TDataSource
    DataSet = ADOQueryCustomGroup
    Left = 50
    Top = 128
  end
  object ADOQueryCustomGroup: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 82
    Top = 128
  end
  object DataSourceCustomProgram: TDataSource
    DataSet = ADOQueryCustomProgram
    Left = 328
    Top = 128
  end
  object ADOQueryCustomProgram: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 360
    Top = 128
  end
  object ADOQuerySQL: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 458
    Top = 176
  end
  object TimerElipsed: TTimer
    Enabled = False
    OnTimer = TimerElipsedTimer
    Left = 64
    Top = 312
  end
  object ADOQueryCategory_BUFFER: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 330
    Top = 176
  end
  object ADOQueryDiseases_BUFFER: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 368
    Top = 176
  end
  object ADOQueryFreq_BUFFER: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 400
    Top = 176
  end
end
