object frm_Relatorio: Tfrm_Relatorio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio'
  ClientHeight = 137
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Relatorio: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 137
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 140
    object lblNome: TLabel
      Left = 17
      Top = 150
      Width = 52
      Height = 19
      AutoSize = False
      Caption = 'Nome: '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbldtInicio: TLabel
      Left = 33
      Top = 71
      Width = 49
      Height = 16
      Caption = 'Inicio: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbldtFinal: TLabel
      Left = 268
      Top = 71
      Width = 44
      Height = 16
      Caption = 'Final: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnGerar: TButton
      Left = 160
      Top = 99
      Width = 165
      Height = 33
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = btnGerarClick
    end
    object edtNome: TEdit
      Left = 76
      Top = 147
      Width = 361
      Height = 27
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object chkTodos: TCheckBox
      Left = 442
      Top = 154
      Width = 51
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 2
      Visible = False
      OnClick = chkTodosClick
    end
    object rgTipoRelatorio: TRadioGroup
      Left = 1
      Top = 1
      Width = 498
      Height = 41
      Align = alTop
      Caption = 'Tipo Relat'#243'rio'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Acumulado'
        'Discriminado')
      TabOrder = 3
    end
    object dtInicial: TDateTimePicker
      Left = 84
      Top = 68
      Width = 121
      Height = 21
      Date = 42684.385989756940000000
      Time = 42684.385989756940000000
      TabOrder = 4
    end
    object dtFin: TDateTimePicker
      Left = 316
      Top = 68
      Width = 121
      Height = 21
      Date = 42684.385989756940000000
      Time = 42684.385989756940000000
      TabOrder = 5
    end
  end
  object DsAcumulado: TDataSource
    DataSet = CDSAcumulado
    Left = 104
    Top = 244
  end
  object DsDiscriminado: TDataSource
    DataSet = CDSDiscriminado
    Left = 440
    Top = 232
  end
  object DTSAcumulado: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10#9'VEN_DATA, VEN_OBSERVACAO, ITE_PRO_DESCRICAO, ITE_QTDE'#13 +
      #10'FROM '#13#10#9'VENDA V '#13#10'INNER JOIN '#13#10#9'ITEM_VENDA I ON V.VEN_ID = I.VE' +
      'N_ID'#13#10'WHERE'#13#10#9'VEN_DATA BETWEEN :DT_INI AND :DT_FIN'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FIN'
        ParamType = ptInput
      end>
    SQLConnection = DMRet.Con
    Left = 24
    Top = 186
    object DTSAcumuladoVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
    object DTSAcumuladoVEN_OBSERVACAO: TStringField
      FieldName = 'VEN_OBSERVACAO'
      Size = 70
    end
    object DTSAcumuladoITE_PRO_DESCRICAO: TStringField
      FieldName = 'ITE_PRO_DESCRICAO'
      Size = 50
    end
    object DTSAcumuladoITE_QTDE: TFMTBCDField
      FieldName = 'ITE_QTDE'
      Precision = 12
      Size = 2
    end
  end
  object DSPAcumulado: TDataSetProvider
    DataSet = DTSAcumulado
    Options = [poFetchDetailsOnDemand, poAutoRefresh, poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 187
  end
  object CDSAcumulado: TClientDataSet
    Aggregates = <>
    IndexName = 'DEFAULT_ORDER'
    PacketRecords = 50
    Params = <
      item
        DataType = ftDate
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FIN'
        ParamType = ptInput
      end>
    ProviderName = 'DSPAcumulado'
    Left = 26
    Top = 244
    object CDSAcumuladoVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
    object CDSAcumuladoVEN_OBSERVACAO: TStringField
      FieldName = 'VEN_OBSERVACAO'
      Size = 70
    end
    object CDSAcumuladoITE_PRO_DESCRICAO: TStringField
      FieldName = 'ITE_PRO_DESCRICAO'
      Size = 50
    end
    object CDSAcumuladoITE_QTDE: TFMTBCDField
      FieldName = 'ITE_QTDE'
      Precision = 12
      Size = 2
    end
  end
  object SQLDiscriminado: TSQLDataSet
    SchemaName = 'sa'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10#9'VEN_DATA, ITE_REFERENCIA, ITE_PRO_DESCRICAO, SUM(ITE_Q' +
      'TDE) AS QTDE, SUM(ITE_QTDE)/10 AS QTDE_COPO'#13#10'FROM '#13#10#9'VENDA V '#13#10'I' +
      'NNER JOIN '#13#10#9'ITEM_VENDA I ON V.VEN_ID = I.VEN_ID'#13#10'WHERE'#13#10#9'VEN_DA' +
      'TA BETWEEN :DT_INI AND :DT_FIN'#13#10'GROUP BY'#13#10'               VEN_DAT' +
      'A, ITE_REFERENCIA, ITE_PRO_DESCRICAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIN'
        ParamType = ptInput
      end>
    SQLConnection = DMRet.Con
    Left = 352
    Top = 178
    object SQLDiscriminadoITE_REFERENCIA: TStringField
      FieldName = 'ITE_REFERENCIA'
      Size = 9
    end
    object SQLDiscriminadoITE_PRO_DESCRICAO: TStringField
      FieldName = 'ITE_PRO_DESCRICAO'
      Size = 50
    end
    object SQLDiscriminadoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 32
      Size = 2
    end
    object SQLDiscriminadoQTDE_COPO: TFMTBCDField
      FieldName = 'QTDE_COPO'
      Precision = 32
      Size = 6
    end
    object SQLDiscriminadoVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
  end
  object DSPDiscriminado: TDataSetProvider
    DataSet = SQLDiscriminado
    Options = [poFetchDetailsOnDemand, poAutoRefresh, poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 432
    Top = 179
  end
  object CDSDiscriminado: TClientDataSet
    Aggregates = <>
    IndexName = 'DEFAULT_ORDER'
    PacketRecords = 50
    Params = <
      item
        DataType = ftDateTime
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIN'
        ParamType = ptInput
      end>
    ProviderName = 'DSPDiscriminado'
    Left = 354
    Top = 236
    object CDSDiscriminadoITE_REFERENCIA: TStringField
      FieldName = 'ITE_REFERENCIA'
      Size = 9
    end
    object CDSDiscriminadoITE_PRO_DESCRICAO: TStringField
      FieldName = 'ITE_PRO_DESCRICAO'
      Size = 50
    end
    object CDSDiscriminadoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 32
      Size = 2
    end
    object CDSDiscriminadoQTDE_COPO: TFMTBCDField
      FieldName = 'QTDE_COPO'
      Precision = 32
      Size = 6
    end
    object CDSDiscriminadoVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
  end
  object repAcumulado: TppReport
    AutoStop = False
    DataPipeline = pipAcumulado
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279400
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 176
    Top = 187
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipAcumulado'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'Relat'#243'rio FETEC - 2016'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 7673
        mmLeft = 9525
        mmTop = 3175
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1319
        mmLeft = 0
        mmTop = 12434
        mmWidth = 203730
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Obs:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 1588
        mmTop = 795
        mmWidth = 9789
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'VEN_OBSERVACAO'
        DataPipeline = pipAcumulado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAcumulado'
        mmHeight = 4498
        mmLeft = 12963
        mmTop = 795
        mmWidth = 79440
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        Caption = 'Produto: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 93927
        mmTop = 265
        mmWidth = 17990
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'ITE_PRO_DESCRICAO'
        DataPipeline = pipAcumulado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAcumulado'
        mmHeight = 4498
        mmLeft = 112520
        mmTop = 264
        mmWidth = 50025
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Caption = 'Qtde: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 163535
        mmTop = 265
        mmWidth = 12171
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'ITE_QTDE'
        DataPipeline = pipAcumulado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAcumulado'
        mmHeight = 4498
        mmLeft = 176235
        mmTop = 265
        mmWidth = 25380
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'VEN_DATA'
      DataPipeline = pipAcumulado
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipAcumulado'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label2'
          Caption = 'Data: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5027
          mmLeft = 1588
          mmTop = 265
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText1: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText1'
          DataField = 'VEN_DATA'
          DataPipeline = pipAcumulado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipAcumulado'
          mmHeight = 4498
          mmLeft = 14280
          mmTop = 265
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine3: TppLine
          DesignLayer = ppDesignLayer1
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 1319
          mmLeft = 0
          mmTop = 5026
          mmWidth = 203730
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel6: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label6'
          Caption = 'Total Qtde: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5027
          mmLeft = 152383
          mmTop = 1325
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc1: TppDBCalc
          DesignLayer = ppDesignLayer1
          UserName = 'DBCalc1'
          DataField = 'ITE_QTDE'
          DataPipeline = pipAcumulado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'pipAcumulado'
          mmHeight = 4498
          mmLeft = 176213
          mmTop = 1325
          mmWidth = 25413
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine2: TppLine
          DesignLayer = ppDesignLayer1
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1319
          mmLeft = 0
          mmTop = 0
          mmWidth = 203730
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object pipAcumulado: TppDBPipeline
    DataSource = DsAcumulado
    UserName = 'pipAcumulado'
    Left = 245
    Top = 187
    object pipAcumuladoppField1: TppField
      FieldAlias = 'VEN_DATA'
      FieldName = 'VEN_DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pipAcumuladoppField2: TppField
      FieldAlias = 'VEN_OBSERVACAO'
      FieldName = 'VEN_OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pipAcumuladoppField3: TppField
      FieldAlias = 'ITE_PRO_DESCRICAO'
      FieldName = 'ITE_PRO_DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pipAcumuladoppField4: TppField
      FieldAlias = 'ITE_QTDE'
      FieldName = 'ITE_QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object repDiscriminado: TppReport
    AutoStop = False
    DataPipeline = pipDiscriminado
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279400
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 360
    Top = 283
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipDiscriminado'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Caption = 'Relat'#243'rio FETEC - 2016'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 7673
        mmLeft = 9525
        mmTop = 3175
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1319
        mmLeft = 0
        mmTop = 12434
        mmWidth = 203730
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label4'
        Caption = 'Produto: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 529
        mmTop = 265
        mmWidth = 17990
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText3'
        DataField = 'ITE_PRO_DESCRICAO'
        DataPipeline = pipDiscriminado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipDiscriminado'
        mmHeight = 4498
        mmLeft = 19052
        mmTop = 265
        mmWidth = 76727
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label5'
        Caption = 'Qtde: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 97367
        mmTop = 265
        mmWidth = 12171
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText4'
        DataField = 'QTDE'
        DataPipeline = pipDiscriminado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipDiscriminado'
        mmHeight = 4498
        mmLeft = 110067
        mmTop = 265
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        DataField = 'QTDE_COPO'
        DataPipeline = pipDiscriminado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipDiscriminado'
        mmHeight = 4498
        mmLeft = 165384
        mmTop = 265
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label8'
        Caption = 'Qtde Copos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 136790
        mmTop = 0
        mmWidth = 26723
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'VEN_DATA'
      DataPipeline = pipDiscriminado
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipDiscriminado'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label2'
          Caption = 'Data: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5027
          mmLeft = 1588
          mmTop = 265
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText8: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText1'
          DataField = 'VEN_DATA'
          DataPipeline = pipDiscriminado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipDiscriminado'
          mmHeight = 4498
          mmLeft = 14280
          mmTop = 265
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLine5: TppLine
          DesignLayer = ppDesignLayer2
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 1319
          mmLeft = 0
          mmTop = 5026
          mmWidth = 203730
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel12: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label6'
          Caption = 'Total Qtde: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5027
          mmLeft = 86253
          mmTop = 1323
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBCalc2: TppDBCalc
          DesignLayer = ppDesignLayer2
          UserName = 'DBCalc1'
          DataField = 'QTDE'
          DataPipeline = pipDiscriminado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          DataPipelineName = 'pipDiscriminado'
          mmHeight = 4498
          mmLeft = 110065
          mmTop = 1323
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLine6: TppLine
          DesignLayer = ppDesignLayer2
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1319
          mmLeft = 0
          mmTop = 0
          mmWidth = 203730
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel13: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label13'
          Caption = 'Total Copos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5027
          mmLeft = 136790
          mmTop = 1323
          mmWidth = 26722
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBCalc3: TppDBCalc
          DesignLayer = ppDesignLayer2
          UserName = 'DBCalc2'
          DataField = 'QTDE_COPO'
          DataPipeline = pipDiscriminado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          DataPipelineName = 'pipDiscriminado'
          mmHeight = 4498
          mmLeft = 165360
          mmTop = 1319
          mmWidth = 25405
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object pipDiscriminado: TppDBPipeline
    DataSource = DsDiscriminado
    UserName = 'pipDiscriminado'
    Left = 441
    Top = 283
    object pipDiscriminadoppField1: TppField
      FieldAlias = 'ITE_REFERENCIA'
      FieldName = 'ITE_REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pipDiscriminadoppField2: TppField
      FieldAlias = 'ITE_PRO_DESCRICAO'
      FieldName = 'ITE_PRO_DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pipDiscriminadoppField3: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pipDiscriminadoppField4: TppField
      FieldAlias = 'QTDE_COPO'
      FieldName = 'QTDE_COPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pipDiscriminadoppField5: TppField
      FieldAlias = 'VEN_DATA'
      FieldName = 'VEN_DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
end
