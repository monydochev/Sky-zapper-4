object fEdit: TfEdit
  Left = 0
  Top = 0
  Width = 1869
  Height = 990
  VertScrollBar.Position = 2
  AutoScroll = True
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1072#1085#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label6: TLabel
    Left = 1260
    Top = 621
    Width = 60
    Height = 19
    Caption = #1058#1098#1088#1089#1077#1085#1077
  end
  object cxGrid1: TcxGrid
    Left = 462
    Top = 6
    Width = 718
    Height = 777
    TabOrder = 0
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
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 45
      object cxGrid1DBTableView1name_bg: TcxGridDBColumn
        Caption = #1055#1088#1086#1075#1088#1072#1084#1072
        DataBinding.FieldName = 'name_bg'
        HeaderAlignmentHorz = taCenter
        Width = 216
      end
      object cxGrid1DBTableView1name_en: TcxGridDBColumn
        Caption = 'Program EN'
        DataBinding.FieldName = 'name_en'
        HeaderAlignmentHorz = taCenter
        Width = 249
      end
      object cxGrid1DBTableView1description_bg: TcxGridDBColumn
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        DataBinding.FieldName = 'description_bg'
        HeaderAlignmentHorz = taCenter
        Width = 246
      end
      object cxGrid1DBTableView1description_EN: TcxGridDBColumn
        Caption = 'Description EN'
        DataBinding.FieldName = 'description_En'
        HeaderAlignmentHorz = taCenter
        Width = 212
      end
      object cxGrid1DBTableView1Prevod: TcxGridDBColumn
        Caption = #1055#1088#1077#1074#1086#1076
        DataBinding.FieldName = 'ok'
        HeaderAlignmentHorz = taCenter
        Width = 44
      end
      object cxGrid1DBTableView1Quantity: TcxGridDBColumn
        Caption = #1041#1056'.'
        DataBinding.FieldName = 'freq_count'
        HeaderAlignmentHorz = taCenter
        Width = 39
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ButtonRefreshFreq: TButton
    Left = 780
    Top = 112
    Width = 245
    Height = 41
    Caption = 'ButtonRefreshFreq'
    TabOrder = 1
    Visible = False
    OnClick = ButtonRefreshFreqClick
  end
  object Button19: TButton
    Left = 595
    Top = 308
    Width = 110
    Height = 43
    Caption = #1053#1072#1075#1086#1088#1077
    TabOrder = 2
    Visible = False
    OnClick = Button19Click
  end
  object Button24: TButton
    Left = 711
    Top = 308
    Width = 114
    Height = 43
    Caption = #1053#1072#1076#1086#1083#1091
    TabOrder = 3
    Visible = False
    OnClick = Button24Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 789
    Width = 1836
    Height = 162
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 4
    object Label3: TLabel
      Left = 842
      Top = 67
      Width = 20
      Height = 19
      Caption = 'BG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 842
      Top = 99
      Width = 20
      Height = 19
      Caption = 'EN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 842
      Top = 5
      Width = 20
      Height = 19
      Caption = 'BG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 842
      Top = 33
      Width = 20
      Height = 19
      Caption = 'EN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object CheckBoxCategory: TCheckBox
      Left = 8
      Top = 4
      Width = 205
      Height = 18
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1072#1085#1077' '#1085#1072' '#1075#1088#1091#1087#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = CheckBoxCategoryClick
    end
    object CheckBoxDiseases: TCheckBox
      Left = 1158
      Top = 4
      Width = 214
      Height = 21
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1072#1085#1077' '#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = CheckBoxDiseasesClick
    end
    object EditDescriptionEN: TEdit
      Left = 868
      Top = 93
      Width = 504
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EditDescriptionBG: TEdit
      Left = 868
      Top = 62
      Width = 504
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object ButtonNewProgram: TButton
      Left = 1378
      Top = 2
      Width = 135
      Height = 54
      Caption = #1044#1086#1073#1072#1074#1080' '#1087#1088#1086#1075#1088#1072#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 7
      Images = fMain.ImageList1
      ParentFont = False
      TabOrder = 4
      WordWrap = True
      OnClick = ButtonNewProgramClick
    end
    object ButtonDeleteProgram: TButton
      Left = 1378
      Top = 62
      Width = 135
      Height = 54
      Caption = #1048#1079#1090#1088#1080#1081' '#1087#1088#1086#1075#1088#1072#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 8
      Images = fMain.ImageList1
      ParentFont = False
      TabOrder = 5
      WordWrap = True
      OnClick = ButtonDeleteProgramClick
    end
    object ButtonSaveProgram: TButton
      Left = 1158
      Top = 31
      Width = 214
      Height = 25
      Caption = #1047#1040#1055#1048#1064#1048
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = ButtonSaveProgramClick
    end
    object RadioGroupLanguage: TRadioGroup
      Left = 524
      Top = 4
      Width = 82
      Height = 54
      Caption = 'Language'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Bulgarian'
        'English')
      ParentFont = False
      TabOrder = 7
      Visible = False
      OnClick = RadioGroupLanguageClick
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 20
      Width = 201
      Height = 16
      Caption = #1057#1082#1088#1080#1081' '#1087#1088#1080#1074#1098#1088#1079#1072#1085#1080#1090#1077' '#1075#1088'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Visible = False
      WordWrap = True
    end
    object ButtonAddGroup: TButton
      Left = 242
      Top = 2
      Width = 135
      Height = 54
      Caption = #1044#1086#1073#1072#1074#1080' '#1075#1088#1091#1087#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 7
      Images = fMain.ImageList1
      ParentFont = False
      TabOrder = 9
      WordWrap = True
      OnClick = ButtonAddGroupClick
    end
    object ButtonRemoveGroup: TButton
      Left = 383
      Top = 2
      Width = 135
      Height = 54
      Caption = #1048#1079#1090#1088#1080#1081' '#1075#1088#1091#1087#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 8
      Images = fMain.ImageList1
      ParentFont = False
      TabOrder = 10
      WordWrap = True
      OnClick = ButtonRemoveGroupClick
    end
    object EditProgramEN: TEdit
      Left = 868
      Top = 30
      Width = 277
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object EditProgramBG: TEdit
      Left = 868
      Top = 2
      Width = 277
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 841
      Height = 158
      Align = alLeft
      TabOrder = 13
      object Label5: TLabel
        Left = 8
        Top = 2
        Width = 76
        Height = 19
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      end
      object Label7: TLabel
        Left = 8
        Top = 46
        Width = 63
        Height = 19
        Caption = 'Category'
      end
      object CheckBoxEdit: TCheckBox
        Left = 167
        Top = 2
        Width = 114
        Height = 21
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1072#1085#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = CheckBoxEditClick
      end
      object AdvEditBreakProgram: TAdvEdit
        Left = 287
        Top = 31
        Width = 48
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1055#1086#1095#1080#1074#1082#1072' '#1084#1077#1078#1076#1091' '#1087#1088#1086#1075#1088#1072#1084#1080#1090#1077' / '#1089#1077#1082'.'
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
        TabOrder = 1
        Text = '10'
        Visible = True
        Version = '3.4.7.0'
      end
      object AdvEditRepeatList: TAdvEdit
        Left = 287
        Top = 3
        Width = 48
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1050#1086#1083#1082#1086' '#1087#1086#1074#1090#1086#1088#1077#1085#1080#1103' / '#1073#1088'.'
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
        TabOrder = 2
        Text = '3'
        Visible = True
        Version = '3.4.7.0'
      end
      object AdvEdit_pause_repeat_cycle: TAdvEdit
        Left = 287
        Top = 59
        Width = 48
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1055#1086#1095#1080#1074#1082#1072' '#1084#1077#1078#1076#1091' '#1075#1088#1091#1087#1080#1090#1077' / '#1089#1077#1082'.'
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
        TabOrder = 3
        Text = '300'
        Visible = True
        Version = '3.4.7.0'
      end
      object Button1: TButton
        Left = 5
        Top = 98
        Width = 135
        Height = 54
        Caption = #1044#1086#1073#1072#1074#1080' '#1075#1088#1091#1087#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 7
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 4
        WordWrap = True
        OnClick = ButtonAddGroupClick
      end
      object ButtonDeleteGroup: TButton
        Left = 146
        Top = 98
        Width = 135
        Height = 54
        Caption = #1055#1088#1077#1084#1072#1093#1085#1080' '#1075#1088#1091#1087#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 8
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 5
        WordWrap = True
        OnClick = ButtonDeleteGroupClick
      end
      object RadioGroupGroupType: TRadioGroup
        Left = 287
        Top = 93
        Width = 218
        Height = 59
        ItemIndex = 1
        Items.Strings = (
          #1047#1072' '#1074#1089#1080#1095#1082#1080' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080
          #1057#1072#1084#1086' '#1079#1072' '#1084#1086#1103#1090' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083)
        TabOrder = 6
      end
      object EditGroupNameBG: TEdit
        Left = 8
        Top = 21
        Width = 273
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object EditGroupNameEN: TEdit
        Left = 8
        Top = 65
        Width = 273
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
    object GroupBox2: TGroupBox
      Left = 1598
      Top = 0
      Width = 234
      Height = 158
      Align = alRight
      TabOrder = 14
      object ButtonExit: TButton
        Left = 3
        Top = 101
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
  end
  object Panel2: TPanel
    Left = 0
    Top = -2
    Width = 456
    Height = 461
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 5
    object cxGrid4: TcxGrid
      Left = 0
      Top = 0
      Width = 377
      Height = 451
      TabOrder = 0
      object cxGridDBTableView3: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = cxGridDBTableView3CellClick
        DataController.DataSource = fMain.DataSourceCategory
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
            Column = cxGridDBTableView3category_name
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Editing = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 45
        object cxGridDBTableView3category_name: TcxGridDBColumn
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          DataBinding.FieldName = 'category_name_BG'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 160
        end
        object cxGridDBTableView3Column1: TcxGridDBColumn
          Caption = 'Category EN'
          DataBinding.FieldName = 'category_name_EN'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object cxgrdbclmnGridDBTableView3Column2: TcxGridDBColumn
          Caption = #1041#1056'.'
          DataBinding.FieldName = 'program_count'
          HeaderAlignmentHorz = taCenter
          Width = 33
        end
        object cxGridDBTableView3Column2: TcxGridDBColumn
          Caption = #1055#1086#1074#1090#1086#1088#1080
          DataBinding.FieldName = 'repeat'
          Width = 70
        end
        object cxGridDBTableView3Column3: TcxGridDBColumn
          Caption = #1055#1072#1091#1079#1072' '#1087#1088#1086#1075'.'
          DataBinding.FieldName = 'pause_program'
          Width = 58
        end
        object cxGridDBTableView3Column4: TcxGridDBColumn
          Caption = #1055#1072#1091#1079#1072' '#1075#1088#1091#1087#1072
          DataBinding.FieldName = 'pause_repeat_cycle'
          Width = 54
        end
        object cxGridDBTableView3Column5: TcxGridDBColumn
          Caption = #1058#1080#1087
          DataBinding.FieldName = 'type_id'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = fMain.DataSourceGroupType
          Width = 150
        end
        object cxGridDBTableView3User_access: TcxGridDBColumn
          Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083
          DataBinding.FieldName = 'user_id'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'name'
            end>
          Properties.ListSource = fMain.DataSourceUsers
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = cxGridDBTableView3
      end
    end
    object ButtonShowPrograms: TButton
      Left = 32
      Top = 112
      Width = 249
      Height = 41
      Caption = 'ButtonShowPrograms'
      TabOrder = 1
      Visible = False
      OnClick = ButtonShowProgramsClick
    end
    object Panel6: TPanel
      Left = 384
      Top = 0
      Width = 68
      Height = 451
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 2
      object ButtonLink: TButton
        Left = 3
        Top = 188
        Width = 57
        Height = 60
        Hint = #1055#1088#1080#1074#1098#1088#1078#1080' '#1082#1098#1084' '#1075#1088#1091#1087#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 9
        Images = fMain.ImageList1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        WordWrap = True
        OnClick = ButtonLinkClick
      end
      object ButtonUnlink: TButton
        Left = 3
        Top = 332
        Width = 57
        Height = 60
        Hint = #1054#1090#1074#1098#1088#1078#1080' '#1086#1090' '#1075#1088#1091#1087#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 10
        Images = fMain.ImageList1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        WordWrap = True
        OnClick = ButtonUnlinkClick
      end
    end
  end
  object Panel5: TPanel
    Left = 1643
    Top = -2
    Width = 193
    Height = 791
    Align = alRight
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 6
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 183
      Height = 73
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 0
      object AdvEditFreq: TAdvEdit
        Left = 12
        Top = 24
        Width = 33
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1055#1088#1086#1076#1098#1083#1078#1080#1090#1077#1083#1085#1086#1089#1090' '#1089#1077#1082'.'
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
        TabOrder = 0
        Text = '0'
        Visible = True
        Version = '3.4.7.0'
      end
      object ButtonChangeFreq: TButton
        Left = 51
        Top = 24
        Width = 93
        Height = 27
        Caption = #1055#1088#1086#1084#1077#1085#1080
        TabOrder = 1
        OnClick = ButtonChangeFreqClick
      end
    end
    object cxGrid2: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 82
      Width = 183
      Height = 521
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = cxGridDBTableView1CellClick
        DataController.DataSource = fMain.DataSourceFreq
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = cxGridDBTableView1Column1
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
        object cxGridDBTableView1Column1: TcxGridDBColumn
          Caption = #1063#1077#1089#1090#1086#1090#1072
          DataBinding.FieldName = 'freq'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 85
        end
        object cxGridDBTableView1Column3: TcxGridDBColumn
          Caption = #1057#1077#1082'.'
          DataBinding.FieldName = 'time_sec'
          OnGetDisplayText = cxGridDBTableView1Column3GetDisplayText
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 609
      Width = 183
      Height = 175
      Align = alBottom
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 2
      object AdvEditFreqQ: TAdvEdit
        Left = 3
        Top = 23
        Width = 78
        Height = 27
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etFloat
        EmptyTextStyle = []
        Precision = 2
        LabelCaption = #1063#1077#1089#1090#1086#1090#1072
        LabelPosition = lpTopLeft
        LabelAlwaysEnabled = True
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
        TabOrder = 0
        Text = '0.00'
        Visible = True
        Version = '3.4.7.0'
      end
      object Button_freq_add: TButton
        Left = 2
        Top = 54
        Width = 136
        Height = 54
        Caption = #1044#1086#1073#1072#1074#1080' '#1095#1077#1089#1090#1086#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 7
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 1
        WordWrap = True
        OnClick = Button_freq_addClick
      end
      object Button_freq_remove: TButton
        Left = 2
        Top = 113
        Width = 135
        Height = 54
        Caption = #1048#1079#1090#1088#1080#1081' '#1095#1077#1089#1090#1086#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 8
        Images = fMain.ImageList1
        ParentFont = False
        TabOrder = 2
        WordWrap = True
        OnClick = Button_freq_removeClick
      end
      object AdvEditDuration: TAdvEdit
        Left = 87
        Top = 22
        Width = 48
        Height = 27
        Hint = '0 - '#1055#1086#1076#1088#1072#1079#1073#1080#1088#1072#1085#1077' 180'#1089#1077#1082'. '#1086#1073#1097#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        DefaultHandling = True
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelCaption = #1057#1077#1082#1091#1085#1076#1080
        LabelPosition = lpTopLeft
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '0'
        Visible = True
        Version = '3.4.7.0'
      end
    end
  end
  object cxGrid3: TcxGrid
    Left = 1260
    Top = 3
    Width = 377
    Height = 602
    TabOrder = 7
    object cxGridDBTableView2: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = cxGridDBTableView2CellClick
      DataController.DataSource = fMain.DataSourceCategory_Personalization
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
          Column = cxGridDBColumn1
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 45
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        DataBinding.FieldName = 'category_name_BG'
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 160
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = 'Category EN'
        DataBinding.FieldName = 'category_name_EN'
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1041#1056'.'
        DataBinding.FieldName = 'program_count'
        HeaderAlignmentHorz = taCenter
        Width = 33
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView2
    end
  end
  object Panel7: TPanel
    Left = 1186
    Top = 10
    Width = 68
    Height = 445
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 8
    object Button2: TButton
      Left = 3
      Top = 326
      Width = 57
      Height = 60
      Hint = #1055#1088#1080#1074#1098#1088#1078#1080' '#1082#1098#1084' '#1075#1088#1091#1087#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 9
      Images = fMain.ImageList1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      WordWrap = True
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 3
      Top = 182
      Width = 57
      Height = 60
      Hint = #1054#1090#1074#1098#1088#1078#1080' '#1086#1090' '#1075#1088#1091#1087#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 10
      Images = fMain.ImageList1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      WordWrap = True
      OnClick = Button3Click
    end
    object ButtonShowAll: TButton
      Left = 3
      Top = 4
      Width = 57
      Height = 60
      Hint = #1055#1086#1082#1072#1078#1080' '#1074#1089#1080#1095#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 6
      Images = fMain.ImageList1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      WordWrap = True
      OnClick = ButtonShowAllClick
    end
  end
  object EditSearch: TEdit
    Left = 1260
    Top = 646
    Width = 205
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnKeyPress = EditSearchKeyPress
  end
  object Button4: TButton
    Left = 1482
    Top = 650
    Width = 156
    Height = 29
    Caption = #1055#1086#1082#1072#1078#1080' '#1074#1089#1080#1095#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = Button4Click
  end
  object ButtonShowProgramsRight: TButton
    Left = 1344
    Top = 104
    Width = 265
    Height = 41
    Caption = 'ButtonShowProgramsRight'
    TabOrder = 11
    Visible = False
    OnClick = ButtonShowProgramsRightClick
  end
  object cxGrid5: TcxGrid
    Left = 0
    Top = 463
    Width = 456
    Height = 326
    TabOrder = 12
    object cxGridDBTableView4: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = cxGrid1DBTableView1CellClick
      DataController.DataSource = fMain.DataSourcePrograms
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
        end
        item
          Kind = skCount
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 45
      object cxGridDBColumn5: TcxGridDBColumn
        Caption = #1055#1088#1086#1075#1088#1072#1084#1072
        DataBinding.FieldName = 'name_bg'
        HeaderAlignmentHorz = taCenter
        Width = 158
      end
      object cxGridDBColumn6: TcxGridDBColumn
        Caption = 'Program EN'
        DataBinding.FieldName = 'name_en'
        HeaderAlignmentHorz = taCenter
        Width = 159
      end
    end
    object cxGridLevel4: TcxGridLevel
      GridView = cxGridDBTableView4
    end
  end
  object ADOQuerySQL: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 186
    Top = 168
  end
  object ADOQuerySort: TADOQuery
    Connection = fMain.ADOConnectionMDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM custom_groups')
    Left = 186
    Top = 200
  end
end
