object DM_RelProduto: TDM_RelProduto
  OldCreateOrder = False
  Height = 557
  Width = 1059
  object pip_ProdPisCofins: TppDBPipeline
    DataSource = dts_ProdPisCofins
    UserName = 'pipGeralS1'
    Left = 100
    Top = 54
  end
  object qry_ProdPisCofins: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'atv'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'PROID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'StEnt'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'StSai'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'NAT_CODIGO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      #9'PRO_REFERENCIA, PRO_DESCRICAO, STPC_CODIGO, '
      #9'STPC_CODIGO_SAI, PRO_ALIQPIS, PRO_ALIQCOFINS, '
      #9'PRO_ALIQPIS_SAI, PRO_ALIQCOFINS_SAI, PRO_CODIGONBM,'
      '                NAT_BC_CODIGO, NAT_CODIGO'
      'FROM '
      #9'PRODUTO'
      'WHERE'
      '              (pro_ativo like :atv ) and  '
      '              CONVERT(VARCHAR(10), PRO_ID) LIKE :PROID and'
      '              CONVERT(VARCHAR(10), STPC_CODIGO) LIKE :StEnt and'
      
        '              CONVERT(VARCHAR(10), STPC_CODIGO_SAI) LIKE :StSai ' +
        'and'
      
        '              isnull(CONVERT(VARCHAR(10), NAT_CODIGO),'#39#39') LIKE :' +
        'NAT_CODIGO'
      'ORDER BY '
      #9'PRO_DESCRICAO')
    Left = 98
    Top = 98
    object qry_ProdPisCofinsPRO_REFERENCIA: TStringField
      DisplayLabel = 'Referencia'
      DisplayWidth = 12
      FieldName = 'PRO_REFERENCIA'
    end
    object qry_ProdPisCofinsPRO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'PRO_DESCRICAO'
      Size = 90
    end
    object qry_ProdPisCofinsSTPC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. ST Ent.'
      FieldName = 'STPC_CODIGO'
    end
    object qry_ProdPisCofinsPRO_ALIQPIS: TBCDField
      DisplayLabel = 'Aliq. Pis Ent.'
      DisplayWidth = 12
      FieldName = 'PRO_ALIQPIS'
      DisplayFormat = '#.##0,00'
      Precision = 7
      Size = 3
    end
    object qry_ProdPisCofinsPRO_ALIQCOFINS: TBCDField
      DisplayLabel = 'Aliq. Cof. Ent.'
      DisplayWidth = 12
      FieldName = 'PRO_ALIQCOFINS'
      DisplayFormat = '#.##0,00'
      Precision = 7
      Size = 3
    end
    object qry_ProdPisCofinsSTPC_CODIGO_SAI: TIntegerField
      DisplayLabel = 'C'#243'd. St Sai.'
      FieldName = 'STPC_CODIGO_SAI'
    end
    object qry_ProdPisCofinsPRO_ALIQPIS_SAI: TBCDField
      DisplayLabel = 'Aliq. Pis Sai.'
      DisplayWidth = 12
      FieldName = 'PRO_ALIQPIS_SAI'
      DisplayFormat = '#.##0,00'
      Precision = 7
      Size = 3
    end
    object qry_ProdPisCofinsPRO_ALIQCOFINS_SAI: TBCDField
      DisplayLabel = 'Aliq. Cof. Sai.'
      DisplayWidth = 12
      FieldName = 'PRO_ALIQCOFINS_SAI'
      DisplayFormat = '#.##0,00'
      Precision = 7
      Size = 3
    end
    object qry_ProdPisCofinsPRO_CODIGONBM: TStringField
      DisplayLabel = 'NCM'
      DisplayWidth = 9
      FieldName = 'PRO_CODIGONBM'
      Size = 8
    end
    object qry_ProdPisCofinsNAT_BC_CODIGO: TSmallintField
      DisplayLabel = 'Nat. Credito'
      DisplayWidth = 15
      FieldName = 'NAT_BC_CODIGO'
    end
    object qry_ProdPisCofinsNAT_CODIGO: TSmallintField
      DisplayLabel = 'Nat. Receita'
      DisplayWidth = 15
      FieldName = 'NAT_CODIGO'
    end
  end
  object dts_ProdPisCofins: TDataSource
    DataSet = qry_ProdPisCofins
    Left = 96
    Top = 140
  end
  object pp_ProdPisCofins: TppReport
    AutoStop = False
    DataPipeline = pip_ProdPisCofins
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 100
    Top = 10
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_ProdPisCofins'
    object ppTitleBand6: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand6: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppLabel53: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto - Pis/Cofins'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 58473
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText35: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText63'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 57870
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 265
        mmTop = 21167
        mmWidth = 264161
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel55: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Descricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 16933
        mmWidth = 80963
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel56: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Caption = 'ST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 105040
        mmTop = 16404
        mmWidth = 8467
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel58: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Aliq. PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 114829
        mmTop = 16669
        mmWidth = 15346
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel59: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        AutoSize = False
        Caption = 'NCM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246063
        mmTop = 16669
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppLine9: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 265
        mmTop = 11113
        mmWidth = 264055
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel60: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label110'
        AutoSize = False
        Caption = 'Referencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 16933
        mmWidth = 18256
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel61: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label61'
        AutoSize = False
        Caption = 'Aliq. COFINS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 131498
        mmTop = 16669
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel73: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label73'
        AutoSize = False
        Caption = 'ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 105040
        mmTop = 12435
        mmWidth = 65881
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel75: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label75'
        AutoSize = False
        Caption = 'SAIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 12700
        mmWidth = 66940
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel57: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label57'
        AutoSize = False
        Caption = 'ST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 16933
        mmWidth = 8467
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel62: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label62'
        AutoSize = False
        Caption = 'Aliq. PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 186796
        mmTop = 16669
        mmWidth = 15346
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel63: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label63'
        AutoSize = False
        Caption = 'Aliq. COFINS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 203465
        mmTop = 16669
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel111: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label111'
        AutoSize = False
        Caption = 'Nat. Receita'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 225161
        mmTop = 16669
        mmWidth = 18785
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel112: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label112'
        AutoSize = False
        Caption = 'Nat. Credito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 16669
        mmWidth = 18256
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable13: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable13'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 236538
        mmTop = 5292
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable14: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable14'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 246063
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand6: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText46: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pip_ProdPisCofins
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 265
        mmWidth = 80963
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText48: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'STPC_CODIGO'
        DataPipeline = pip_ProdPisCofins
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3725
        mmLeft = 105040
        mmTop = 265
        mmWidth = 8467
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText49: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        DataField = 'STPC_CODIGO_SAI'
        DataPipeline = pip_ProdPisCofins
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3725
        mmLeft = 177007
        mmTop = 265
        mmWidth = 8467
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText50: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        DataField = 'PRO_ALIQCOFINS'
        DataPipeline = pip_ProdPisCofins
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3725
        mmLeft = 131498
        mmTop = 265
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText51: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText11'
        DataField = 'PRO_CODIGONBM'
        DataPipeline = pip_ProdPisCofins
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3704
        mmLeft = 246063
        mmTop = 265
        mmWidth = 18521
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText52: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText79'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pip_ProdPisCofins
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText53: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText101'
        DataField = 'PRO_ALIQPIS'
        DataPipeline = pip_ProdPisCofins
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3725
        mmLeft = 114829
        mmTop = 265
        mmWidth = 15346
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText54: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText102'
        DataField = 'PRO_ALIQCOFINS_SAI'
        DataPipeline = pip_ProdPisCofins
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3725
        mmLeft = 203465
        mmTop = 265
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText55: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText55'
        DataField = 'PRO_ALIQPIS_SAI'
        DataPipeline = pip_ProdPisCofins
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3725
        mmLeft = 186796
        mmTop = 265
        mmWidth = 15346
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText47: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'NAT_CODIGO'
        DataPipeline = pip_ProdPisCofins
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3725
        mmLeft = 225161
        mmTop = 265
        mmWidth = 18785
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText58: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText58'
        DataField = 'NAT_BC_CODIGO'
        DataPipeline = pip_ProdPisCofins
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdPisCofins'
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 265
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand6: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList23: TppParameterList
    end
  end
  object Dts_ContagemDia: TDataSource
    DataSet = qryContagemDia
    Left = 191
    Top = 140
  end
  object ppContagemDia: TppReport
    AutoStop = False
    DataPipeline = pipContagemDia
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 192
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipContagemDia'
    object ppTitleBand11: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand10: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel116: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto - Levantamento Di'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1323
        mmTop = 5821
        mmWidth = 100013
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine29: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line11'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 1323
        mmTop = 10583
        mmWidth = 198438
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText84: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText56'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 67479
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel118: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label35'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 12965
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel119: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label36'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 17727
        mmTop = 12965
        mmWidth = 75671
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel120: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label37'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 94192
        mmTop = 12965
        mmWidth = 5027
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel121: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label38'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 101336
        mmTop = 12965
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel122: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label122'
        AutoSize = False
        Caption = 'Pr. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 115094
        mmTop = 12965
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel124: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Pr. Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 12965
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel125: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label125'
        AutoSize = False
        Caption = '| Seg | Ter | Qua | Qui | Sex | Sab | Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 12965
        mmWidth = 55827
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine79: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line10'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 17463
        mmWidth = 204788
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable19: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable19'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable20: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable20'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand10: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppDBText85: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText30'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipContagemDia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContagemDia'
        mmHeight = 3344
        mmLeft = 529
        mmTop = 1588
        mmWidth = 16669
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText86: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText31'
        DataField = 'pro_descricao'
        DataPipeline = pipContagemDia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContagemDia'
        mmHeight = 3344
        mmLeft = 17727
        mmTop = 1588
        mmWidth = 74877
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText87: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText32'
        DataField = 'pro_unidade'
        DataPipeline = pipContagemDia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContagemDia'
        mmHeight = 3344
        mmLeft = 94192
        mmTop = 1588
        mmWidth = 5027
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText88: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText33'
        DataField = 'pro_estoque'
        DataPipeline = pipContagemDia
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipContagemDia'
        mmHeight = 3344
        mmLeft = 100277
        mmTop = 1588
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText90: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText90'
        DataField = 'pro_vlrcusto'
        DataPipeline = pipContagemDia
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipContagemDia'
        mmHeight = 3344
        mmLeft = 115623
        mmTop = 1588
        mmWidth = 13758
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText91: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText901'
        DataField = 'pro_vlrvenda'
        DataPipeline = pipContagemDia
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipContagemDia'
        mmHeight = 3344
        mmLeft = 131498
        mmTop = 1588
        mmWidth = 13758
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel126: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label2'
        AutoSize = False
        Caption = 
          '.........|........|..........|........|.........|..........|....' +
          '.....|'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3344
        mmLeft = 146050
        mmTop = 1588
        mmWidth = 55827
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand9: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup9: TppGroup
      BreakName = 'DEP_DESCRICAO'
      DataPipeline = pipContagemDia
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipContagemDia'
      NewFile = False
      object ppGroupHeaderBand9: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppDBText89: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText28'
          DataField = 'DEP_DESCRICAO'
          DataPipeline = pipContagemDia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipContagemDia'
          mmHeight = 3704
          mmLeft = 39952
          mmTop = 4498
          mmWidth = 107421
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel123: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label77'
          AutoSize = False
          Caption = 'Departamento ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 4498
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLine76: TppLine
          DesignLayer = ppDesignLayer2
          UserName = 'Line23'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 1323
          mmTop = 8731
          mmWidth = 204259
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList6: TppParameterList
    end
  end
  object qryContagemDia: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dep_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select dep_descricao, pro_ean1, pro_referencia, '
      
        'pro_descricao, pro_vlrcusto, pro_vlrvenda, pro_unidade, pro_esto' +
        'que'
      ' '
      'from produto p, departamento d'
      'where d.dep_id = p.dep_id and'
      '(convert(varchar(10),d.dep_id) like :dep_id)'
      'and p.pro_ativo = '#39'A'#39
      '     '
      'Order by dep_descricao, pro_descricao')
    Left = 191
    Top = 98
    object StringField1: TStringField
      FieldName = 'dep_descricao'
      Size = 90
    end
    object StringField2: TStringField
      FieldName = 'pro_ean1'
    end
    object StringField3: TStringField
      FieldName = 'pro_referencia'
    end
    object StringField4: TStringField
      FieldName = 'pro_descricao'
      Size = 90
    end
    object StringField5: TStringField
      FieldName = 'pro_unidade'
      Size = 10
    end
    object BCDField1: TBCDField
      FieldName = 'pro_estoque'
      Precision = 15
      Size = 3
    end
    object qryContagemDiapro_vlrcusto: TBCDField
      FieldName = 'pro_vlrcusto'
      Precision = 15
      Size = 3
    end
    object qryContagemDiapro_vlrvenda: TBCDField
      FieldName = 'pro_vlrvenda'
      Precision = 15
      Size = 3
    end
  end
  object pipContagemDia: TppDBPipeline
    DataSource = Dts_ContagemDia
    UserName = 'pipContagemDia'
    Left = 192
    Top = 53
  end
  object Dts_Fornecedor: TDataSource
    DataSet = qryFornecedor
    Left = 429
    Top = 140
  end
  object qryFornecedor: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'for_id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select for_nome, pro_ean1, pro_referencia, '
      'pro_descricao, pro_unidade, pro_estoque, pro_vlrcusto,'
      '(pro_estoque * pro_vlrcusto) as total,'
      'PRO_VLRVENDA, PRO_VLRPRAZO'
      ' '
      'from produto p, fornecedores f'
      'where f.for_id = p.for_id and'
      '             (f.for_id like :for_id)  and p.pro_ativo = '#39'A'#39
      ''
      ''
      'Group by for_nome, pro_descricao,pro_ean1, pro_referencia, '
      
        'pro_unidade, pro_estoque, pro_vlrcusto, PRO_VLRVENDA, PRO_VLRPRA' +
        'ZO'
      ''
      'Order by for_nome, pro_descricao,pro_ean1, pro_referencia, '
      'pro_unidade, pro_estoque, pro_vlrcusto'
      ''
      '')
    Left = 430
    Top = 96
    object qryFornecedorfor_nome: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'for_nome'
      Size = 40
    end
    object qryFornecedorpro_ean1: TStringField
      FieldName = 'pro_ean1'
      Visible = False
    end
    object qryFornecedorpro_referencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      DisplayWidth = 10
      FieldName = 'pro_referencia'
    end
    object qryFornecedorpro_descricao: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 50
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qryFornecedorpro_unidade: TStringField
      DisplayLabel = 'UN'
      DisplayWidth = 3
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qryFornecedorpro_estoque: TBCDField
      DisplayLabel = 'Est. Atual'
      DisplayWidth = 10
      FieldName = 'pro_estoque'
      DisplayFormat = '#.##0,000'
      Precision = 15
      Size = 3
    end
    object qryFornecedorpro_vlrcusto: TBCDField
      DisplayLabel = 'Pr. Custo'
      DisplayWidth = 10
      FieldName = 'pro_vlrcusto'
      DisplayFormat = '#.##0,000'
      Precision = 15
      Size = 3
    end
    object qryFornecedortotal: TBCDField
      DisplayLabel = 'Pr. Total'
      DisplayWidth = 10
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#.##0,000'
      Precision = 31
      Size = 6
    end
    object qryFornecedorPRO_VLRVENDA: TBCDField
      DisplayLabel = 'Pr. Vista'
      DisplayWidth = 10
      FieldName = 'PRO_VLRVENDA'
      DisplayFormat = '#.##0,000'
      Precision = 20
      Size = 10
    end
    object qryFornecedorPRO_VLRPRAZO: TBCDField
      DisplayLabel = 'Pr. Prazo'
      DisplayWidth = 10
      FieldName = 'PRO_VLRPRAZO'
      DisplayFormat = '#.##0,000'
      Precision = 20
      Size = 10
    end
  end
  object pipFornecedor: TppDBPipeline
    DataSource = Dts_Fornecedor
    UserName = 'pipFornecedor'
    Left = 430
    Top = 52
  end
  object ppFornecedor: TppReport
    AutoStop = False
    DataPipeline = pipFornecedor
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 430
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipFornecedor'
    object ppTitleBand9: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand9: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel101: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto c/ Estoque por Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1323
        mmTop = 5821
        mmWidth = 80963
        BandType = 0
        LayerName = Foreground2
      end
      object ppDBText72: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText56'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 67479
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel104: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label35'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 11642
        mmWidth = 19315
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel105: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label36'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 11642
        mmWidth = 94986
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel106: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label37'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 117740
        mmTop = 11642
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel107: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label38'
        AutoSize = False
        Caption = 'Est. Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 11642
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel108: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'ppLabelEstFisico'
        AutoSize = False
        Caption = 'Est. F'#237'sico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 181240
        mmTop = 11642
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine71: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line23'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1323
        mmTop = 10054
        mmWidth = 197909
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine72: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line25'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1323
        mmTop = 10583
        mmWidth = 197644
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine73: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line10'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1323
        mmTop = 16140
        mmWidth = 198438
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine74: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line14'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1323
        mmTop = 16668
        mmWidth = 198438
        BandType = 0
        LayerName = Foreground2
      end
      object lbl_CustoFornec: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'lbl_CustoFornec'
        AutoSize = False
        Caption = 'Pr. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 11642
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground2
      end
      object lbl_TotalFornec: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'lbl_TotalFornec'
        AutoSize = False
        Caption = 'Pr. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 11642
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable17: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable17'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable18: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable18'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand9: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText73: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText30'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipFornecedor'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText74: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText31'
        DataField = 'pro_descricao'
        DataPipeline = pipFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipFornecedor'
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 265
        mmWidth = 94192
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText76: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText32'
        DataField = 'pro_unidade'
        DataPipeline = pipFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipFornecedor'
        mmHeight = 3704
        mmLeft = 117740
        mmTop = 265
        mmWidth = 7408
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText77: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText33'
        DataField = 'pro_estoque'
        DataPipeline = pipFornecedor
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipFornecedor'
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 265
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText126: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText126'
        DataField = 'pro_vlrcusto'
        DataPipeline = pipFornecedor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipFornecedor'
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 529
        mmWidth = 17992
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText127: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText127'
        DataField = 'total'
        DataPipeline = pipFornecedor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipFornecedor'
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 529
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine70: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line67'
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 5292
        mmWidth = 203200
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppFooterBand8: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup7: TppGroup
      BreakName = 'for_nome'
      DataPipeline = pipFornecedor
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipFornecedor'
      NewFile = False
      object ppGroupHeaderBand7: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText78: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'DBText28'
          DataField = 'for_nome'
          DataPipeline = pipFornecedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipFornecedor'
          mmHeight = 3704
          mmLeft = 27517
          mmTop = 2117
          mmWidth = 142346
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel109: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label77'
          AutoSize = False
          Caption = 'Fornecedor ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 2117
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine4: TppLine
          DesignLayer = ppDesignLayer3
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLabel156: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label156'
          Caption = 'Total Geral ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 124090
          mmTop = 1058
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBCalc8: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc8'
          DataField = 'total'
          DataPipeline = pipFornecedor
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipFornecedor'
          mmHeight = 3704
          mmLeft = 163513
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine2: TppLine
          DesignLayer = ppDesignLayer3
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
      end
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'Foreground2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object dts_Compra: TDataSource
    DataSet = qry_Compra
    Left = 500
    Top = 140
  end
  object qry_Compra: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    OnCalcFields = qry_CompraCalcFields
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'DT_INI'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DT_FIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'PRO_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'DEP_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'SEC_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'MRC_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      ' SELECT '
      '    P.PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_UNIDADE,'
      
        '    PRO_EMBUNIDADE, P.DEP_ID, DEP_DESCRICAO, P.SEC_ID, SEC_DESCR' +
        'ICAO,'
      '    ISNULL(MRC_DESCRICAO, '#39'SEM MARCA'#39') AS MRC_DESCRICAO,'
      
        '    CAST(ISNULL(P.PRO_ESTOQUE,0) AS NUMERIC(15,3)) AS PRO_ESTOQU' +
        'E,'
      
        '    CAST(ISNULL(P.PRO_VLRCUSTO,0) AS NUMERIC(15,3)) AS PRO_VLRCU' +
        'STO,'
      
        '    CAST(ISNULL(P.PRO_CUSTONOTA,0) AS NUMERIC(15,3)) AS PRO_CUST' +
        'ONOTA,'
      '    CAST(ISNULL(SUM(QTDE_SAIDA),0) AS NUMERIC(15,3)) AS SAIDA,'
      '    CASE'
      '        WHEN ISNULL(SUM(QTDE_SAIDA),0) = 0 THEN 0'
      #9'ELSE (ISNULL(SUM(QTDE_SAIDA),0) / 2)'
      '    END MEDIA,'
      '    CASE'
      
        '        WHEN PRO_ESTOQUE > (ISNULL(SUM(QTDE_SAIDA),0) / 2) * 3 T' +
        'HEN 0'
      #9'ELSE ((ISNULL(SUM(QTDE_SAIDA),0) / 2) * 3) - PRO_ESTOQUE'
      '    END SUGESTAO'
      ' FROM'
      '    PRODUTO P'
      ' INNER JOIN'
      '    DEPARTAMENTO D ON P.DEP_ID = D.DEP_ID'
      ' LEFT JOIN'
      '    SECAO S ON P.SEC_ID = S.SEC_ID'
      ' LEFT JOIN'
      '    MARCA M ON P.MRC_ID = M.MRC_ID'
      ' LEFT JOIN'
      '    VW_PRODUTO_EXTRATO V ON P.PRO_ID = V.PRO_ID'
      ' WHERE'
      '    V.DATA BETWEEN :DT_INI AND :DT_FIN AND'
      '    CONVERT(VARCHAR(10), P.PRO_ID) LIKE :PRO_ID AND'
      '    CONVERT(VARCHAR(10), P.DEP_ID) LIKE :DEP_ID AND'
      '    CONVERT(VARCHAR(10), ISNULL(P.SEC_ID, '#39#39')) LIKE :SEC_ID AND'
      '    CONVERT(VARCHAR(10), ISNULL(P.MRC_ID, '#39#39')) LIKE :MRC_ID'
      ' GROUP BY'
      
        '    P.PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_UNIDADE, PRO_EM' +
        'BUNIDADE,'
      
        '    P.DEP_ID, DEP_DESCRICAO, P.SEC_ID, SEC_DESCRICAO, MRC_DESCRI' +
        'CAO,'
      '    P.PRO_ESTOQUE, P.PRO_VLRCUSTO, P.PRO_CUSTONOTA')
    Left = 500
    Top = 96
    object qry_CompraPRO_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_ID'
      ReadOnly = True
      Visible = False
    end
    object qry_CompraPRO_REFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      DisplayWidth = 15
      FieldName = 'PRO_REFERENCIA'
      Size = 15
    end
    object qry_CompraPRO_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 90
      FieldName = 'PRO_DESCRICAO'
      Size = 90
    end
    object qry_CompraPRO_UNIDADE: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 8
      FieldName = 'PRO_UNIDADE'
      Size = 8
    end
    object qry_CompraPRO_EMBUNIDADE: TStringField
      DisplayLabel = 'Embalagem'
      FieldName = 'PRO_EMBUNIDADE'
      Size = 10
    end
    object qry_CompraDEP_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Cod. Dep.'
      FieldName = 'DEP_ID'
      Visible = False
    end
    object qry_CompraDEP_DESCRICAO: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEP_DESCRICAO'
      Size = 40
    end
    object qry_CompraSEC_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Cod. Se'#231#227'o'
      FieldName = 'SEC_ID'
      Visible = False
    end
    object qry_CompraSEC_DESCRICAO: TStringField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'SEC_DESCRICAO'
      Size = 40
    end
    object qry_CompraMRC_DESCRICAO: TStringField
      DisplayLabel = 'Marca/Fabricante'
      FieldName = 'MRC_DESCRICAO'
      ReadOnly = True
      Size = 40
    end
    object qry_CompraPRO_ESTOQUE: TBCDField
      DisplayLabel = 'Estoque'
      FieldName = 'PRO_ESTOQUE'
      ReadOnly = True
      DisplayFormat = '#.###0,000'
      Precision = 15
      Size = 3
    end
    object qry_CompraPRO_VLRCUSTO: TBCDField
      DisplayLabel = 'Custo'
      DisplayWidth = 16
      FieldName = 'PRO_VLRCUSTO'
      ReadOnly = True
      DisplayFormat = '#.##0,00'
      Precision = 15
      Size = 3
    end
    object qry_CompraPRO_CUSTONOTA: TBCDField
      DisplayLabel = 'Custo Real'
      DisplayWidth = 16
      FieldName = 'PRO_CUSTONOTA'
      ReadOnly = True
      DisplayFormat = '#.##0,00'
      Precision = 15
      Size = 3
    end
    object qry_CompraSAIDA: TBCDField
      DisplayLabel = 'Sa'#237'da'
      DisplayWidth = 16
      FieldName = 'SAIDA'
      ReadOnly = True
      DisplayFormat = '#.##0,00'
      Precision = 15
      Size = 3
    end
    object qry_CompraMEDIA: TFMTBCDField
      DisplayLabel = 'M'#233'dia'
      DisplayWidth = 16
      FieldName = 'MEDIA'
      ReadOnly = True
      DisplayFormat = '#.##0,00'
      Precision = 15
      Size = 6
    end
    object qry_CompraSUGESTAO: TFMTBCDField
      DisplayLabel = 'Sugest'#227'o'
      DisplayWidth = 16
      FieldName = 'SUGESTAO'
      ReadOnly = True
      DisplayFormat = '#.##0,00'
      Precision = 15
      Size = 6
    end
    object qry_CompraTotal: TFloatField
      DisplayWidth = 16
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '#.##0,00'
      Calculated = True
    end
  end
  object pip_Compra: TppDBPipeline
    DataSource = dts_Compra
    UserName = 'pip_Compra'
    Left = 500
    Top = 52
  end
  object Rep_Compra: TppReport
    AutoStop = False
    DataPipeline = pip_Compra
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 500
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_Compra'
    object ppTitleBand7: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand8: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Relat'#243'rio de M'#233'dia / Movimenta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 1323
        mmTop = 5821
        mmWidth = 67204
        BandType = 0
        LayerName = Foreground3
      end
      object ppDBText75: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText68'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4995
        mmLeft = 1323
        mmTop = 529
        mmWidth = 24045
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel130: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label1'
        Caption = 'Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 5821
        mmWidth = 12277
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel133: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label133'
        Caption = 'Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 9790
        mmWidth = 12277
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine35: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line113'
        Pen.Style = psDot
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15610
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel97: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label221'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 17198
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel98: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label220'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 17198
        mmWidth = 98690
        BandType = 0
        LayerName = Foreground3
      end
      object regCabecMedMov: TppRegion
        DesignLayer = ppDesignLayer4
        UserName = 'regCabecMedMov'
        Pen.Mode = pmNop
        mmHeight = 4233
        mmLeft = 107950
        mmTop = 16933
        mmWidth = 94721
        BandType = 0
        LayerName = Foreground3
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel99: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label2'
          AutoSize = False
          Caption = 'UN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 17198
          mmWidth = 6879
          BandType = 0
          LayerName = Foreground3
        end
        object ppLabel114: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 124884
          mmTop = 17198
          mmWidth = 12435
          BandType = 0
          LayerName = Foreground3
        end
        object lblCompraCusto: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'lblCompraCusto'
          AutoSize = False
          Caption = 'Custo Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 138907
          mmTop = 17198
          mmWidth = 16404
          BandType = 0
          LayerName = Foreground3
        end
        object ppLabel103: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Media'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 156634
          mmTop = 17198
          mmWidth = 13758
          BandType = 0
          LayerName = Foreground3
        end
        object ppLabel117: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label117'
          AutoSize = False
          Caption = 'Sugest'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 17198
          mmWidth = 14552
          BandType = 0
          LayerName = Foreground3
        end
        object ppLabel102: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 187590
          mmTop = 17198
          mmWidth = 14552
          BandType = 0
          LayerName = Foreground3
        end
      end
      object lblUnComp: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'lblUnComp'
        AutoSize = False
        Caption = 'UN Comp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 99748
        mmTop = 16933
        mmWidth = 15346
        BandType = 0
        LayerName = Foreground3
      end
      object regDatePagMedMov: TppRegion
        DesignLayer = ppDesignLayer4
        UserName = 'regDatePagMedMov'
        Pen.Mode = pmNop
        mmHeight = 8467
        mmLeft = 175419
        mmTop = 0
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground3
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppSystemVariable11: TppSystemVariable
          DesignLayer = ppDesignLayer4
          UserName = 'SystemVariable11'
          VarType = vtPrintDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3260
          mmLeft = 175419
          mmTop = 5292
          mmWidth = 25950
          BandType = 0
          LayerName = Foreground3
        end
      end
    end
    object ppDetailBand8: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText83: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText14'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pip_Compra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Compra'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 265
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText117: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText15'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pip_Compra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Compra'
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 265
        mmWidth = 98690
        BandType = 4
        LayerName = Foreground3
      end
      object regItensMedMov: TppRegion
        DesignLayer = ppDesignLayer4
        UserName = 'regItensMedMov'
        Pen.Mode = pmNop
        mmHeight = 3969
        mmLeft = 107950
        mmTop = 0
        mmWidth = 94986
        BandType = 4
        LayerName = Foreground3
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppDBText118: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'DBText118'
          DataField = 'PRO_UNIDADE'
          DataPipeline = pip_Compra
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3598
          mmLeft = 116681
          mmTop = 265
          mmWidth = 6879
          BandType = 4
          LayerName = Foreground3
        end
        object ppDBText121: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'DBText121'
          DataField = 'pro_estoque'
          DataPipeline = pip_Compra
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3598
          mmLeft = 124884
          mmTop = 265
          mmWidth = 12435
          BandType = 4
          LayerName = Foreground3
        end
        object ppDBText123: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'DBText123'
          DataField = 'MEDIA'
          DataPipeline = pip_Compra
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3598
          mmLeft = 156634
          mmTop = 265
          mmWidth = 13758
          BandType = 4
          LayerName = Foreground3
        end
        object dbtCompraSugestao: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'dbtCompraSugestao'
          DataField = 'SUGESTAO'
          DataPipeline = pip_Compra
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3598
          mmLeft = 171715
          mmTop = 265
          mmWidth = 14552
          BandType = 4
          LayerName = Foreground3
        end
        object ppDBText119: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'DBText119'
          DataField = 'Total'
          DataPipeline = pip_Compra
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3598
          mmLeft = 187590
          mmTop = 265
          mmWidth = 14552
          BandType = 4
          LayerName = Foreground3
        end
        object dbtCompraCusto: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'dbtCompraCusto'
          DataField = 'pro_custonota'
          DataPipeline = pip_Compra
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3598
          mmLeft = 138907
          mmTop = 265
          mmWidth = 16404
          BandType = 4
          LayerName = Foreground3
        end
      end
      object edtUnComp: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'edtUnComp'
        DataField = 'PRO_EMBUNIDADE'
        DataPipeline = pip_Compra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pip_Compra'
        mmHeight = 3598
        mmLeft = 99748
        mmTop = 265
        mmWidth = 15346
        BandType = 4
        LayerName = Foreground3
      end
    end
    object ppFooterBand10: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine36: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line36'
        Pen.Style = psInsideFrame
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 203200
        BandType = 8
        LayerName = Foreground3
      end
      object ppSystemVariable12: TppSystemVariable
        DesignLayer = ppDesignLayer4
        UserName = 'SystemVariable12'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 1852
        mmWidth = 16404
        BandType = 8
        LayerName = Foreground3
      end
    end
    object ppSummaryBand13: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object regTotalMedMov: TppRegion
        DesignLayer = ppDesignLayer4
        UserName = 'regTotalMedMov'
        Pen.Mode = pmNop
        mmHeight = 5292
        mmLeft = 141552
        mmTop = 265
        mmWidth = 61383
        BandType = 7
        LayerName = Foreground3
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel150: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'lblUnComp1'
          AutoSize = False
          Caption = 'Total- >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 1852
          mmWidth = 13494
          BandType = 7
          LayerName = Foreground3
        end
        object dbcCompraSugestao: TppDBCalc
          DesignLayer = ppDesignLayer4
          UserName = 'dbcCompraSugestao'
          DataField = 'SUGESTAO'
          DataPipeline = pip_Compra
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pip_Compra'
          mmHeight = 3704
          mmLeft = 167482
          mmTop = 1852
          mmWidth = 16669
          BandType = 7
          LayerName = Foreground3
        end
        object ppDBCalc10: TppDBCalc
          DesignLayer = ppDesignLayer4
          UserName = 'dbcCompraSugestao1'
          DataField = 'Total'
          DataPipeline = pip_Compra
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3704
          mmLeft = 185473
          mmTop = 1852
          mmWidth = 16669
          BandType = 7
          LayerName = Foreground3
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DEP_DESCRICAO'
      DataPipeline = pip_Compra
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group19'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_Compra'
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel96: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label219'
          AutoSize = False
          Caption = 'Departamento ------->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3725
          mmLeft = 2381
          mmTop = 1852
          mmWidth = 30956
          BandType = 3
          GroupNo = 0
          LayerName = Foreground3
        end
        object ppDBText122: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'DBText181'
          DataField = 'dep_descricao'
          DataPipeline = pip_Compra
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3704
          mmLeft = 36248
          mmTop = 2117
          mmWidth = 96838
          BandType = 3
          GroupNo = 0
          LayerName = Foreground3
        end
        object ppLine34: TppLine
          DesignLayer = ppDesignLayer4
          UserName = 'Line112'
          Pen.Style = psInsideFrame
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground3
        end
        object ppLine55: TppLine
          DesignLayer = ppDesignLayer4
          UserName = 'Line55'
          Pen.Style = psInsideFrame
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6615
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground3
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup17: TppGroup
      BreakName = 'SEC_DESCRICAO'
      DataPipeline = pip_Compra
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group17'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_Compra'
      NewFile = False
      object ppGroupHeaderBand17: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel159: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label159'
          AutoSize = False
          Caption = 'Se'#231#227'o ------------------>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3725
          mmLeft = 2381
          mmTop = 529
          mmWidth = 30956
          BandType = 3
          GroupNo = 1
          LayerName = Foreground3
        end
        object ppLine54: TppLine
          DesignLayer = ppDesignLayer4
          UserName = 'Line54'
          Pen.Style = psInsideFrame
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5292
          mmWidth = 203200
          BandType = 3
          GroupNo = 1
          LayerName = Foreground3
        end
        object ppDBText170: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'DBText170'
          DataField = 'SEC_DESCRICAO'
          DataPipeline = pip_Compra
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3704
          mmLeft = 36248
          mmTop = 529
          mmWidth = 96838
          BandType = 3
          GroupNo = 1
          LayerName = Foreground3
        end
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup23: TppGroup
      BreakName = 'MRC_DESCRICAO'
      DataPipeline = pip_Compra
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group23'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_Compra'
      NewFile = False
      object ppGroupHeaderBand23: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel95: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label95'
          AutoSize = False
          Caption = 'Marca/Fabricante --->'
          Font.Charset = ANSI_CHARSET
          Font.Color = 26367
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3725
          mmLeft = 2381
          mmTop = 529
          mmWidth = 30956
          BandType = 3
          GroupNo = 2
          LayerName = Foreground3
        end
        object ppDBText120: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'DBText1701'
          DataField = 'MRC_DESCRICAO'
          DataPipeline = pip_Compra
          Font.Charset = ANSI_CHARSET
          Font.Color = 26367
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pip_Compra'
          mmHeight = 3725
          mmLeft = 36248
          mmTop = 529
          mmWidth = 96838
          BandType = 3
          GroupNo = 2
          LayerName = Foreground3
        end
        object lnMediaMovMarcaHeader: TppLine
          DesignLayer = ppDesignLayer4
          UserName = 'lnMediaMovMarcaHeader'
          Pen.Style = psInsideFrame
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5292
          mmWidth = 203200
          BandType = 3
          GroupNo = 2
          LayerName = Foreground3
        end
      end
      object ppGroupFooterBand23: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'Foreground3'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList20: TppParameterList
    end
  end
  object Dts_ProdNaoMovto: TDataSource
    DataSet = qry_ProdNaoMovto
    Left = 800
    Top = 140
  end
  object qry_ProdNaoMovto: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'prod'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'tipo'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtini'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtfim'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_ESTOQUE, PRO_U' +
        'LTVENDA, PRO_ATIVO FROM PRODUTO '
      'WHERE'
      '   CONVERT(VARCHAR(10), PRO_ID) LIKE :prod and'
      '   (PRO_ATIVO like :tipo) and '
      
        '   pro_id not in (select pro_id from VW_PRODUTO_EXTRATO WHERE  D' +
        'ATA BETWEEN :dtini AND :dtfim)'
      'order by '
      '    PRO_ATIVO,  pro_descricao')
    Left = 799
    Top = 95
    object qry_ProdNaoMovtoPRO_ID: TAutoIncField
      FieldName = 'PRO_ID'
      ReadOnly = True
      Visible = False
    end
    object qry_ProdNaoMovtoPRO_REFERENCIA: TStringField
      DisplayLabel = 'Referencia'
      DisplayWidth = 15
      FieldName = 'PRO_REFERENCIA'
    end
    object qry_ProdNaoMovtoPRO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'PRO_DESCRICAO'
      Size = 120
    end
    object qry_ProdNaoMovtoPRO_ESTOQUE: TBCDField
      DisplayLabel = 'Estoque'
      FieldName = 'PRO_ESTOQUE'
      DisplayFormat = '#.##0,000'
      Precision = 15
      Size = 3
    end
    object qry_ProdNaoMovtoPRO_ULTVENDA: TDateTimeField
      DisplayLabel = 'Data Ult. Venda'
      DisplayWidth = 15
      FieldName = 'PRO_ULTVENDA'
      OnGetText = qry_ProdNaoMovtoPRO_ULTVENDAGetText
      DisplayFormat = 'DD/MM/yyyy'
    end
    object qry_ProdNaoMovtoPRO_ATIVO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'PRO_ATIVO'
      OnGetText = qry_ProdNaoMovtoPRO_ATIVOGetText
      Size = 1
    end
  end
  object pip_ProdNaoMovto: TppDBPipeline
    DataSource = Dts_ProdNaoMovto
    UserName = 'pip_ProdNaoMovto'
    Left = 799
    Top = 51
    object pip_ProdNaoMovtoppField1: TppField
      FieldAlias = 'PRO_ID'
      FieldName = 'PRO_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pip_ProdNaoMovtoppField2: TppField
      FieldAlias = 'PRO_REFERENCIA'
      FieldName = 'PRO_REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pip_ProdNaoMovtoppField3: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pip_ProdNaoMovtoppField4: TppField
      FieldAlias = 'PRO_ESTOQUE'
      FieldName = 'PRO_ESTOQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pip_ProdNaoMovtoppField5: TppField
      FieldAlias = 'PRO_ULTVENDA'
      FieldName = 'PRO_ULTVENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pip_ProdNaoMovtoppField6: TppField
      FieldAlias = 'PRO_ATIVO'
      FieldName = 'PRO_ATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object pp_ProdNaoMovto: TppReport
    AutoStop = False
    DataPipeline = pip_ProdNaoMovto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 800
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_ProdNaoMovto'
    object ppTitleBand19: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand24: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel87: TppLabel
        DesignLayer = ppDesignLayer5
        UserName = 'Label41'
        Caption = 'Relat'#243'rio de Produtos n'#227'o Movimentados no per'#237'odo de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 84402
        BandType = 0
        LayerName = Foreground4
      end
      object ppDBText81: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText60'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 794
        mmWidth = 62442
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel162: TppLabel
        DesignLayer = ppDesignLayer5
        UserName = 'Label43'
        AutoSize = False
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 11641
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel163: TppLabel
        DesignLayer = ppDesignLayer5
        UserName = 'Label44'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 24875
        mmTop = 11641
        mmWidth = 83079
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel165: TppLabel
        DesignLayer = ppDesignLayer5
        UserName = 'Label46'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147171
        mmTop = 11641
        mmWidth = 18785
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel167: TppLabel
        DesignLayer = ppDesignLayer5
        UserName = 'Label233'
        AutoSize = False
        Caption = 'Data Ultima Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 168869
        mmTop = 11641
        mmWidth = 30427
        BandType = 0
        LayerName = Foreground4
      end
      object ppSystemVariable41: TppSystemVariable
        DesignLayer = ppDesignLayer5
        UserName = 'SystemVariable41'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground4
      end
      object ppSystemVariable42: TppSystemVariable
        DesignLayer = ppDesignLayer5
        UserName = 'SystemVariable42'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine19: TppLine
        DesignLayer = ppDesignLayer5
        UserName = 'Line19'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 529
        mmTop = 15875
        mmWidth = 202407
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine21: TppLine
        DesignLayer = ppDesignLayer5
        UserName = 'Line21'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 529
        mmTop = 9780
        mmWidth = 202407
        BandType = 0
        LayerName = Foreground4
      end
    end
    object ppDetailBand25: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText210: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText38'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pip_ProdNaoMovto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_ProdNaoMovto'
        mmHeight = 3705
        mmLeft = 530
        mmTop = 793
        mmWidth = 23289
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText211: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText39'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pip_ProdNaoMovto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_ProdNaoMovto'
        mmHeight = 3705
        mmLeft = 24877
        mmTop = 793
        mmWidth = 116946
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText213: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText401'
        DataField = 'PRO_ULTVENDA'
        DataPipeline = pip_ProdNaoMovto
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_ProdNaoMovto'
        mmHeight = 3705
        mmLeft = 168869
        mmTop = 793
        mmWidth = 30431
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText214: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText187'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pip_ProdNaoMovto
        DisplayFormat = '#####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ProdNaoMovto'
        mmHeight = 3705
        mmLeft = 146113
        mmTop = 793
        mmWidth = 19579
        BandType = 4
        LayerName = Foreground4
      end
    end
    object ppFooterBand20: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup24: TppGroup
      BreakName = 'PRO_ATIVO'
      DataPipeline = pip_ProdNaoMovto
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group24'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_ProdNaoMovto'
      NewFile = False
      object ppGroupHeaderBand24: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLine88: TppLine
          DesignLayer = ppDesignLayer5
          UserName = 'Line88'
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 1323
          mmTop = 8467
          mmWidth = 199761
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLabel272: TppLabel
          DesignLayer = ppDesignLayer5
          UserName = 'Label272'
          AutoSize = False
          Caption = 'Situa'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 3969
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBText59: TppDBText
          DesignLayer = ppDesignLayer5
          UserName = 'DBText59'
          OnGetText = ppDBText59GetText
          AutoSize = True
          DataField = 'PRO_ATIVO'
          DataPipeline = pip_ProdNaoMovto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pip_ProdNaoMovto'
          mmHeight = 3969
          mmLeft = 19844
          mmTop = 3969
          mmWidth = 17462
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
      end
      object ppGroupFooterBand24: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers5: TppDesignLayers
      object ppDesignLayer5: TppDesignLayer
        UserName = 'Foreground4'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList25: TppParameterList
    end
  end
  object dsRelDepto: TDataSource
    DataSet = qryRelDepto
    Left = 722
    Top = 140
  end
  object qryRelDepto: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dep_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end>
    SQL.Strings = (
      'select dep_descricao, '
      '       sum(pro_estoque)  as estoque, '
      '       sum(pro_estoque * pro_vlrcusto) as custo,'
      '       sum(pro_estoque * pro_vlrmedio) as medio'
      'from '
      '       departamento d, produto p'
      'where'
      '       d.dep_id = p.dep_id and pro_ativo = '#39'A'#39' and'
      '       ((convert(varchar(5),d.dep_id) like :dep_id)) and'
      '       pro_estoque > 0'
      'group by'
      '       dep_descricao'
      'order by'
      '       dep_descricao')
    Left = 720
    Top = 95
    object qryRelDeptodep_descricao: TStringField
      FieldName = 'dep_descricao'
      Size = 90
    end
    object qryRelDeptoestoque: TBCDField
      FieldName = 'estoque'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object qryRelDeptocusto: TBCDField
      FieldName = 'custo'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object qryRelDeptomedio: TBCDField
      FieldName = 'medio'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
  end
  object ppRelDepto: TppReport
    AutoStop = False
    DataPipeline = pipRelDepto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 719
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipRelDepto'
    object ppHeaderBand19: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object ppLabel210: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label210'
        AutoSize = False
        Caption = 'Departamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 13229
        mmWidth = 84931
        BandType = 0
        LayerName = Foreground5
      end
      object ppLabel212: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label212'
        AutoSize = False
        Caption = 'Total Acum. Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 87577
        mmTop = 13229
        mmWidth = 37042
        BandType = 0
        LayerName = Foreground5
      end
      object ppLabel213: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label213'
        AutoSize = False
        Caption = 'Total Acum. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 13229
        mmWidth = 37042
        BandType = 0
        LayerName = Foreground5
      end
      object ppLabel214: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label214'
        AutoSize = False
        Caption = 'Total Acum. M'#233'dio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 13229
        mmWidth = 37042
        BandType = 0
        LayerName = Foreground5
      end
      object ppLabel209: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label209'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto c/ Totais - Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1323
        mmTop = 7408
        mmWidth = 90223
        BandType = 0
        LayerName = Foreground5
      end
      object ppDBText173: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText601'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 2910
        mmWidth = 67479
        BandType = 0
        LayerName = Foreground5
      end
      object ppLine107: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line107'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 17463
        mmWidth = 201084
        BandType = 0
        LayerName = Foreground5
      end
      object ppLine109: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line109'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 11906
        mmWidth = 201084
        BandType = 0
        LayerName = Foreground5
      end
      object ppSystemVariable35: TppSystemVariable
        DesignLayer = ppDesignLayer6
        UserName = 'SystemVariable35'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground5
      end
      object ppSystemVariable36: TppSystemVariable
        DesignLayer = ppDesignLayer6
        UserName = 'SystemVariable36'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground5
      end
    end
    object ppDetailBand20: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText168: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText168'
        DataField = 'dep_descricao'
        DataPipeline = pipRelDepto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelDepto'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 529
        mmWidth = 84931
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText169: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText169'
        DataField = 'estoque'
        DataPipeline = pipRelDepto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRelDepto'
        mmHeight = 3175
        mmLeft = 87577
        mmTop = 529
        mmWidth = 37042
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText171: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText171'
        DataField = 'custo'
        DataPipeline = pipRelDepto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRelDepto'
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 529
        mmWidth = 37042
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText172: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText172'
        DataField = 'medio'
        DataPipeline = pipRelDepto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRelDepto'
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 529
        mmWidth = 37042
        BandType = 4
        LayerName = Foreground5
      end
    end
    object ppFooterBand17: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLine108: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line108'
        Pen.Color = clGray
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 5821
        mmWidth = 200555
        BandType = 8
        LayerName = Foreground5
      end
      object ppSystemVariable39: TppSystemVariable
        DesignLayer = ppDesignLayer6
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 27940
        BandType = 8
        LayerName = Foreground5
      end
      object ppSystemVariable40: TppSystemVariable
        DesignLayer = ppDesignLayer6
        UserName = 'SystemVariable2'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 186267
        mmTop = 1323
        mmWidth = 15610
        BandType = 8
        LayerName = Foreground5
      end
    end
    object ppSummaryBand6: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppDBCalc27: TppDBCalc
        DesignLayer = ppDesignLayer6
        UserName = 'DBCalc27'
        DataField = 'estoque'
        DataPipeline = pipRelDepto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRelDepto'
        mmHeight = 4057
        mmLeft = 87577
        mmTop = 1588
        mmWidth = 37042
        BandType = 7
        LayerName = Foreground5
      end
      object ppDBCalc28: TppDBCalc
        DesignLayer = ppDesignLayer6
        UserName = 'DBCalc28'
        DataField = 'custo'
        DataPipeline = pipRelDepto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRelDepto'
        mmHeight = 4057
        mmLeft = 125942
        mmTop = 1588
        mmWidth = 37042
        BandType = 7
        LayerName = Foreground5
      end
      object ppDBCalc29: TppDBCalc
        DesignLayer = ppDesignLayer6
        UserName = 'DBCalc29'
        DataField = 'medio'
        DataPipeline = pipRelDepto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRelDepto'
        mmHeight = 4057
        mmLeft = 164307
        mmTop = 1588
        mmWidth = 37042
        BandType = 7
        LayerName = Foreground5
      end
    end
    object ppDesignLayers6: TppDesignLayers
      object ppDesignLayer6: TppDesignLayer
        UserName = 'Foreground5'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList12: TppParameterList
    end
  end
  object pipRelDepto: TppDBPipeline
    DataSource = dsRelDepto
    UserName = 'pipRelDepto'
    Left = 720
    Top = 51
  end
  object dts_aliqfor: TDataSource
    DataSet = qry_aliqfor
    Left = 661
    Top = 140
  end
  object qry_aliqfor: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'for_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'naf_codfiscal'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select '
      '    for_nome, '
      '    pro_referencia, '
      '    pro_descricao, '
      '    pro_unidade, '
      '    pro_estoque, '
      '    pro_vlrcusto, '
      '    pro_vlrmedio,'
      '    pro_vlrvenda, '
      '    naf_aliquota,'
      '    naf_descricao'
      'from '
      '   produto p, fornecedores f, natureza_fiscal n'
      'where '
      '  f.for_id = p.for_id and'
      '  ((convert(varchar(5),f.for_id) like :for_id)) and'
      '  (n.naf_codfiscal like :naf_codfiscal) and'
      '  n.naf_codfiscal = p.naf_codfiscal and p.pro_ativo = '#39'A'#39' and'
      '  p.pro_estoque > 0'
      'Order by for_nome, naf_descricao, pro_descricao')
    Left = 661
    Top = 95
    object qry_aliqforfor_nome: TStringField
      FieldName = 'for_nome'
      Size = 40
    end
    object qry_aliqforpro_referencia: TStringField
      FieldName = 'pro_referencia'
    end
    object qry_aliqforpro_descricao: TStringField
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qry_aliqforpro_unidade: TStringField
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qry_aliqforpro_estoque: TBCDField
      FieldName = 'pro_estoque'
      Precision = 15
      Size = 3
    end
    object qry_aliqforpro_vlrcusto: TBCDField
      FieldName = 'pro_vlrcusto'
      Precision = 15
      Size = 3
    end
    object qry_aliqforpro_vlrmedio: TBCDField
      FieldName = 'pro_vlrmedio'
      Precision = 15
      Size = 3
    end
    object qry_aliqforpro_vlrvenda: TBCDField
      FieldName = 'pro_vlrvenda'
      Precision = 15
      Size = 3
    end
    object qry_aliqfornaf_aliquota: TBCDField
      FieldName = 'naf_aliquota'
      Precision = 15
      Size = 3
    end
    object qry_aliqfornaf_descricao: TStringField
      FieldName = 'naf_descricao'
      Size = 90
    end
  end
  object pipAliqFor: TppDBPipeline
    DataSource = dts_aliqfor
    UserName = 'pipAliqFor'
    Left = 661
    Top = 51
    object pipAliqForppField1: TppField
      FieldAlias = 'for_nome'
      FieldName = 'for_nome'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pipAliqForppField2: TppField
      FieldAlias = 'pro_referencia'
      FieldName = 'pro_referencia'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object pipAliqForppField3: TppField
      FieldAlias = 'pro_descricao'
      FieldName = 'pro_descricao'
      FieldLength = 90
      DisplayWidth = 90
      Position = 2
    end
    object pipAliqForppField4: TppField
      FieldAlias = 'pro_unidade'
      FieldName = 'pro_unidade'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object pipAliqForppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'pro_estoque'
      FieldName = 'pro_estoque'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
    object pipAliqForppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'pro_vlrcusto'
      FieldName = 'pro_vlrcusto'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 5
    end
    object pipAliqForppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'pro_vlrmedio'
      FieldName = 'pro_vlrmedio'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 6
    end
    object pipAliqForppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'pro_vlrvenda'
      FieldName = 'pro_vlrvenda'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 7
    end
    object pipAliqForppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'naf_aliquota'
      FieldName = 'naf_aliquota'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 8
    end
    object pipAliqForppField10: TppField
      FieldAlias = 'naf_descricao'
      FieldName = 'naf_descricao'
      FieldLength = 90
      DisplayWidth = 90
      Position = 9
    end
  end
  object ppAliqFor: TppReport
    AutoStop = False
    DataPipeline = pipAliqFor
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 661
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipAliqFor'
    object ppHeaderBand15: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppDBText134: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText62'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 265
        mmWidth = 67479
        BandType = 0
        LayerName = Foreground6
      end
      object ppLabel166: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto - Natureza Fiscal / Al'#237'quota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 4763
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground6
      end
      object ppLine62: TppLine
        DesignLayer = ppDesignLayer7
        UserName = 'Line20'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 794
        mmLeft = 1588
        mmTop = 9790
        mmWidth = 196057
        BandType = 0
        LayerName = Foreground6
      end
      object ppLabel169: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label69'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 11642
        mmWidth = 24606
        BandType = 0
        LayerName = Foreground6
      end
      object ppLabel170: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label70'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 11377
        mmWidth = 79640
        BandType = 0
        LayerName = Foreground6
      end
      object ppLabel171: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label71'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 110331
        mmTop = 11642
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground6
      end
      object ppLabel172: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label72'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 119856
        mmTop = 11642
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground6
      end
      object ppLabel173: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label601'
        AutoSize = False
        Caption = 'Pr. M'#233'dio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 11642
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground6
      end
      object ppLabel174: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label74'
        AutoSize = False
        Caption = 'Pr. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 137848
        mmTop = 11642
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground6
      end
      object ppLabel176: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label79'
        AutoSize = False
        Caption = 'Pr. Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 11642
        mmWidth = 15346
        BandType = 0
        LayerName = Foreground6
      end
      object ppLine89: TppLine
        DesignLayer = ppDesignLayer7
        UserName = 'Line89'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 794
        mmLeft = 1588
        mmTop = 16140
        mmWidth = 196057
        BandType = 0
        LayerName = Foreground6
      end
      object ppSystemVariable31: TppSystemVariable
        DesignLayer = ppDesignLayer7
        UserName = 'SystemVariable31'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 163777
        mmTop = 5027
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground6
      end
      object ppSystemVariable32: TppSystemVariable
        DesignLayer = ppDesignLayer7
        UserName = 'SystemVariable32'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173302
        mmTop = 529
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground6
      end
    end
    object ppDetailBand16: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText135: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText2'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipAliqFor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 265
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText136: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText13'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipAliqFor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 265
        mmWidth = 79904
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText137: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText20'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pipAliqFor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3175
        mmLeft = 109538
        mmTop = 265
        mmWidth = 7408
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText138: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText29'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pipAliqFor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3175
        mmLeft = 119592
        mmTop = 265
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText139: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText37'
        DataField = 'PRO_VLRCUSTO'
        DataPipeline = pipAliqFor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 265
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText140: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText47'
        DataField = 'PRO_VLRMEDIO'
        DataPipeline = pipAliqFor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3175
        mmLeft = 159279
        mmTop = 265
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText141: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText57'
        DataField = 'pro_vlrvenda'
        DataPipeline = pipAliqFor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3175
        mmLeft = 181505
        mmTop = 265
        mmWidth = 14552
        BandType = 4
        LayerName = Foreground6
      end
    end
    object ppSummaryBand5: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel179: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label179'
        Caption = 'Total Geral ----->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 87842
        mmTop = 1588
        mmWidth = 22648
        BandType = 7
        LayerName = Foreground6
      end
      object ppDBCalc23: TppDBCalc
        DesignLayer = ppDesignLayer7
        UserName = 'DBCalc23'
        DataField = 'pro_estoque'
        DataPipeline = pipAliqFor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3704
        mmLeft = 115094
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground6
      end
      object ppDBCalc24: TppDBCalc
        DesignLayer = ppDesignLayer7
        UserName = 'DBCalc24'
        AutoSize = True
        DataField = 'pro_vlrcusto'
        DataPipeline = pipAliqFor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3725
        mmLeft = 127826
        mmTop = 1588
        mmWidth = 24045
        BandType = 7
        LayerName = Foreground6
      end
      object ppDBCalc25: TppDBCalc
        DesignLayer = ppDesignLayer7
        UserName = 'DBCalc25'
        AutoSize = True
        DataField = 'pro_vlrmedio'
        DataPipeline = pipAliqFor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3725
        mmLeft = 149129
        mmTop = 1852
        mmWidth = 25231
        BandType = 7
        LayerName = Foreground6
      end
      object ppDBCalc26: TppDBCalc
        DesignLayer = ppDesignLayer7
        UserName = 'DBCalc26'
        DataField = 'pro_vlrvenda'
        DataPipeline = pipAliqFor
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliqFor'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 1323
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground6
      end
      object ppLine50: TppLine
        DesignLayer = ppDesignLayer7
        UserName = 'Line50'
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1323
        mmTop = 265
        mmWidth = 196586
        BandType = 7
        LayerName = Foreground6
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'for_nome'
      DataPipeline = pipAliqFor
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipAliqFor'
      NewFile = False
      object ppGroupHeaderBand14: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBText143: TppDBText
          DesignLayer = ppDesignLayer7
          UserName = 'DBText61'
          AutoSize = True
          DataField = 'for_nome'
          DataPipeline = pipAliqFor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'TIMES NEW ROMAN'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipAliqFor'
          mmHeight = 3704
          mmLeft = 29369
          mmTop = 3175
          mmWidth = 100277
          BandType = 3
          GroupNo = 0
          LayerName = Foreground6
        end
        object ppLine63: TppLine
          DesignLayer = ppDesignLayer7
          UserName = 'Line24'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 794
          mmTop = 7673
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
          LayerName = Foreground6
        end
        object ppLabel177: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label80'
          AutoSize = False
          Caption = 'Fornecedor  ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 3175
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
          LayerName = Foreground6
        end
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppLabel168: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label93'
          Caption = 'Total Fornecedor ----->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 1852
          mmWidth = 30480
          BandType = 5
          GroupNo = 0
          LayerName = Foreground6
        end
        object ppDBCalc22: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc201'
          DataField = 'pro_estoque'
          DataPipeline = pipAliqFor
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipAliqFor'
          mmHeight = 3704
          mmLeft = 114829
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground6
        end
        object ppDBCalc16: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc44'
          AutoSize = True
          DataField = 'pro_vlrcusto'
          DataPipeline = pipAliqFor
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipAliqFor'
          mmHeight = 3725
          mmLeft = 127562
          mmTop = 1852
          mmWidth = 24045
          BandType = 5
          GroupNo = 0
          LayerName = Foreground6
        end
        object ppDBCalc15: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc43'
          AutoSize = True
          DataField = 'pro_vlrmedio'
          DataPipeline = pipAliqFor
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipAliqFor'
          mmHeight = 3725
          mmLeft = 148865
          mmTop = 2117
          mmWidth = 25231
          BandType = 5
          GroupNo = 0
          LayerName = Foreground6
        end
        object ppDBCalc21: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc21'
          DataField = 'pro_vlrvenda'
          DataPipeline = pipAliqFor
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipAliqFor'
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground6
        end
        object ppLine61: TppLine
          DesignLayer = ppDesignLayer7
          UserName = 'Line64'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 1588
          mmTop = 529
          mmWidth = 196586
          BandType = 5
          GroupNo = 0
          LayerName = Foreground6
        end
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'naf_descricao'
      DataPipeline = pipAliqFor
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipAliqFor'
      NewFile = False
      object ppGroupHeaderBand15: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLabel175: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label801'
          AutoSize = False
          Caption = 'Natureza Fiscal ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 4233
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
          LayerName = Foreground6
        end
        object ppDBText142: TppDBText
          DesignLayer = ppDesignLayer7
          UserName = 'DBText142'
          AutoSize = True
          DataField = 'naf_descricao'
          DataPipeline = pipAliqFor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'TIMES NEW ROMAN'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipAliqFor'
          mmHeight = 3704
          mmLeft = 33867
          mmTop = 4233
          mmWidth = 116152
          BandType = 3
          GroupNo = 1
          LayerName = Foreground6
        end
        object ppLine87: TppLine
          DesignLayer = ppDesignLayer7
          UserName = 'Line203'
          Weight = 0.500000000000000000
          mmHeight = 794
          mmLeft = 529
          mmTop = 8467
          mmWidth = 196057
          BandType = 3
          GroupNo = 1
          LayerName = Foreground6
        end
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel178: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label22'
          Caption = 'Total da Aliquota ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 78846
          mmTop = 794
          mmWidth = 29845
          BandType = 5
          GroupNo = 1
          LayerName = Foreground6
        end
        object ppDBCalc20: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc20'
          DataField = 'pro_estoque'
          DataPipeline = pipAliqFor
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipAliqFor'
          mmHeight = 3704
          mmLeft = 115359
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground6
        end
        object ppDBCalc18: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = 'pro_vlrcusto'
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          LookAhead = True
          mmHeight = 3725
          mmLeft = 127826
          mmTop = 794
          mmWidth = 24045
          BandType = 5
          GroupNo = 1
          LayerName = Foreground6
        end
        object ppDBCalc17: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = 'pro_vlrmedio'
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          LookAhead = True
          mmHeight = 3725
          mmLeft = 148601
          mmTop = 794
          mmWidth = 25231
          BandType = 5
          GroupNo = 1
          LayerName = Foreground6
        end
        object ppDBCalc19: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc19'
          DataField = 'pro_vlrvenda'
          DataPipeline = pipAliqFor
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipAliqFor'
          mmHeight = 3704
          mmLeft = 178859
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground6
        end
        object ppLine5: TppLine
          DesignLayer = ppDesignLayer7
          UserName = 'Line1'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 3440
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 1
          LayerName = Foreground6
        end
      end
    end
    object ppDesignLayers7: TppDesignLayers
      object ppDesignLayer7: TppDesignLayer
        UserName = 'Foreground6'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList9: TppParameterList
    end
  end
  object DsAlteracaoPreco: TDataSource
    DataSet = qryAlteracaoPreco
    Left = 585
    Top = 139
  end
  object qryAlteracaoPreco: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'dt_ini'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dt_fim'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dep_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select '
      #9'pro_dtaltpreco,pro_referencia, dep_descricao, pro_descricao, '
      '       '#9'pro_unidade, pro_estoqmin, pro_vlrcusto, pro_margem, '
      
        '       '#9'pro_vlrvenda, pro_vlrprazo, pro_custonota, NAF_ALIQUOTA,' +
        ' PRO_EAN1'
      'from '
      #9'produto p,  NATUREZA_FISCAL n, DEPARTAMENTO d'
      'where '
      
        #9'convert(datetime, convert(varchar, pro_dtaltPreco,102)) between' +
        ' :dt_ini and :dt_fim and'
      #9'convert(varchar(10),p.dep_id) like :dep_id and'
      #9'p.NAF_CODFISCAL = n.NAF_CODFISCAL and'
      #9'p.dep_id = d.dep_id and'
      #9'pro_dtaltpreco is not null'
      'Order by '
      #9'dep_descricao, pro_descricao')
    Left = 584
    Top = 95
    object qryAlteracaoPrecopro_dtaltpreco: TDateTimeField
      FieldName = 'pro_dtaltpreco'
    end
    object qryAlteracaoPrecopro_referencia: TStringField
      FieldName = 'pro_referencia'
    end
    object qryAlteracaoPrecodep_descricao: TStringField
      FieldName = 'dep_descricao'
      Size = 90
    end
    object qryAlteracaoPrecopro_descricao: TStringField
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qryAlteracaoPrecopro_unidade: TStringField
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qryAlteracaoPrecopro_estoqmin: TBCDField
      FieldName = 'pro_estoqmin'
      Precision = 15
      Size = 3
    end
    object qryAlteracaoPrecopro_vlrcusto: TBCDField
      FieldName = 'pro_vlrcusto'
      Precision = 15
      Size = 3
    end
    object qryAlteracaoPrecopro_margem: TBCDField
      FieldName = 'pro_margem'
      Precision = 15
      Size = 3
    end
    object qryAlteracaoPrecopro_vlrvenda: TBCDField
      FieldName = 'pro_vlrvenda'
      Precision = 15
      Size = 3
    end
    object qryAlteracaoPrecopro_vlrprazo: TBCDField
      FieldName = 'pro_vlrprazo'
      Precision = 15
      Size = 3
    end
    object qryAlteracaoPrecopro_custonota: TBCDField
      FieldName = 'pro_custonota'
      Precision = 15
      Size = 3
    end
    object qryAlteracaoPrecoNAF_ALIQUOTA: TBCDField
      FieldName = 'NAF_ALIQUOTA'
      Precision = 15
      Size = 3
    end
    object qryAlteracaoPrecoPRO_EAN1: TStringField
      FieldName = 'PRO_EAN1'
    end
  end
  object pipAlteracaoPreco: TppDBPipeline
    DataSource = DsAlteracaoPreco
    UserName = 'pipAlteracaoPreco'
    Left = 583
    Top = 52
  end
  object ppAlteracaoPreco: TppReport
    AutoStop = False
    DataPipeline = pipAlteracaoPreco
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 582
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipAlteracaoPreco'
    object ppHeaderBand17: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabel182: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto - Altera'#231#227'o de Pre'#231'os'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 83873
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText152: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText63'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 60791
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel191: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Descricao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 11113
        mmWidth = 77523
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel192: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label5'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 107421
        mmTop = 10848
        mmWidth = 5821
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel193: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label193'
        AutoSize = False
        Caption = 'Custo Real'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 11113
        mmWidth = 17992
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel196: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Pr.Custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 11113
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel197: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Margem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 11113
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel198: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Pr.Vista'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 11113
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel199: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Pr.Prazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 11113
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel200: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Aliq'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 194998
        mmTop = 11113
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel201: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label110'
        AutoSize = False
        Caption = 'Referencia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 11113
        mmWidth = 25665
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine98: TppLine
        DesignLayer = ppDesignLayer8
        UserName = 'Line2'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 3175
        mmTop = 9790
        mmWidth = 199761
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine100: TppLine
        DesignLayer = ppDesignLayer8
        UserName = 'Line69'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 3175
        mmTop = 15875
        mmWidth = 199761
        BandType = 0
        LayerName = Foreground7
      end
      object ppSystemVariable29: TppSystemVariable
        DesignLayer = ppDesignLayer8
        UserName = 'SystemVariable29'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground7
      end
      object ppSystemVariable30: TppSystemVariable
        DesignLayer = ppDesignLayer8
        UserName = 'SystemVariable30'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground7
      end
    end
    object ppDetailBand18: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText153: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText3'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipAlteracaoPreco
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 28046
        mmTop = 265
        mmWidth = 77788
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText154: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText4'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pipAlteracaoPreco
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 107421
        mmTop = 0
        mmWidth = 5821
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText158: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText8'
        DataField = 'PRO_VLRCUSTO'
        DataPipeline = pipAlteracaoPreco
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 115888
        mmTop = 265
        mmWidth = 13758
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText159: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText9'
        DataField = 'PRO_MARGEM'
        DataPipeline = pipAlteracaoPreco
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 150813
        mmTop = 265
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText160: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText10'
        DataField = 'PRO_VLRVENDA'
        DataPipeline = pipAlteracaoPreco
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 164836
        mmTop = 265
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText161: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText11'
        DataField = 'PRO_VLRPRAZO'
        DataPipeline = pipAlteracaoPreco
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 179388
        mmTop = 265
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText162: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText1'
        DataField = 'NAF_ALIQUOTA'
        DataPipeline = pipAlteracaoPreco
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 194734
        mmTop = 265
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText163: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText79'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipAlteracaoPreco
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 1323
        mmTop = 265
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText155: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText155'
        DataField = 'pro_custonota'
        DataPipeline = pipAlteracaoPreco
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 131763
        mmTop = 265
        mmWidth = 17463
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText41: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText41'
        DataField = 'PRO_EAN1'
        DataPipeline = pipAlteracaoPreco
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pipAlteracaoPreco'
        mmHeight = 3302
        mmLeft = 1588
        mmTop = 265
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground7
      end
    end
    object ppFooterBand15: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
    end
    object ppGroup16: TppGroup
      BreakName = 'dep_descricao'
      DataPipeline = pipAlteracaoPreco
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipAlteracaoPreco'
      NewFile = False
      object ppGroupHeaderBand16: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLine95: TppLine
          DesignLayer = ppDesignLayer8
          UserName = 'Line1'
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 1323
          mmTop = 7673
          mmWidth = 201613
          BandType = 3
          GroupNo = 0
          LayerName = Foreground7
        end
        object ppDBText164: TppDBText
          DesignLayer = ppDesignLayer8
          UserName = 'DBText82'
          DataField = 'dep_descricao'
          DataPipeline = pipAlteracaoPreco
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipAlteracaoPreco'
          mmHeight = 3704
          mmLeft = 43127
          mmTop = 2910
          mmWidth = 109273
          BandType = 3
          GroupNo = 0
          LayerName = Foreground7
        end
        object ppLabel202: TppLabel
          DesignLayer = ppDesignLayer8
          UserName = 'Label113'
          AutoSize = False
          Caption = 'Departamento/Se'#231#227'o ---->'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 2910
          mmWidth = 39952
          BandType = 3
          GroupNo = 0
          LayerName = Foreground7
        end
      end
      object ppGroupFooterBand16: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers8: TppDesignLayers
      object ppDesignLayer8: TppDesignLayer
        UserName = 'Foreground7'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList11: TppParameterList
    end
  end
  object Dts_DtUltimaVenda: TDataSource
    DataSet = qry_DtUltimaVenda
    Left = 283
    Top = 140
  end
  object qry_DtUltimaVenda: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dt_inic'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dt_fina'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'pro_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select pro_referencia,pro_descricao, pro_unidade, pro_ultvenda'
      'from produto '
      'where '
      '(pro_ultvenda between :dt_inic and :dt_fina) and'
      'convert(varchar(10),pro_id) like :pro_id')
    Left = 283
    Top = 97
    object qry_DtUltimaVendapro_referencia: TStringField
      FieldName = 'pro_referencia'
    end
    object qry_DtUltimaVendapro_descricao: TStringField
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qry_DtUltimaVendapro_unidade: TStringField
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qry_DtUltimaVendapro_ultvenda: TDateTimeField
      FieldName = 'pro_ultvenda'
    end
  end
  object pip_DtUltimaVenda: TppDBPipeline
    DataSource = Dts_DtUltimaVenda
    UserName = 'pip_DtUltimaVenda'
    Left = 281
    Top = 53
  end
  object pp_DtUltimaVenda: TppReport
    AutoStop = False
    DataPipeline = pip_DtUltimaVenda
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 283
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_DtUltimaVenda'
    object ppTitleBand4: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppLabel40: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto - Data da '#218'ltima Venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 83873
        BandType = 0
        LayerName = Foreground8
      end
      object ppDBText32: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText63'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 60791
        BandType = 0
        LayerName = Foreground8
      end
      object ppLabel51: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label2'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 144992
        mmTop = 11377
        mmWidth = 5821
        BandType = 0
        LayerName = Foreground8
      end
      object ppLabel43: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Descricao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 11377
        mmWidth = 108215
        BandType = 0
        LayerName = Foreground8
      end
      object ppLabel50: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label1101'
        AutoSize = False
        Caption = 'Referencia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 11377
        mmWidth = 25665
        BandType = 0
        LayerName = Foreground8
      end
      object ppLabel45: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data da '#218'ltima Venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 167746
        mmTop = 11377
        mmWidth = 33073
        BandType = 0
        LayerName = Foreground8
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line1'
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 10319
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground8
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line2'
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 16140
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground8
      end
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer9
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground8
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer9
        UserName = 'SystemVariable2'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground8
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText34: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText6'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pip_DtUltimaVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_DtUltimaVenda'
        mmHeight = 4233
        mmLeft = 145257
        mmTop = 529
        mmWidth = 5821
        BandType = 4
        LayerName = Foreground8
      end
      object ppDBText33: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText7'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pip_DtUltimaVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_DtUltimaVenda'
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 794
        mmWidth = 108479
        BandType = 4
        LayerName = Foreground8
      end
      object ppDBText42: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText8'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pip_DtUltimaVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_DtUltimaVenda'
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 794
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground8
      end
      object ppDBText27: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText1'
        DataField = 'pro_ultvenda'
        DataPipeline = pip_DtUltimaVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_DtUltimaVenda'
        mmHeight = 4233
        mmLeft = 168011
        mmTop = 529
        mmWidth = 33073
        BandType = 4
        LayerName = Foreground8
      end
    end
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers9: TppDesignLayers
      object ppDesignLayer9: TppDesignLayer
        UserName = 'Foreground8'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList17: TppParameterList
    end
  end
  object dts_lote: TDataSource
    DataSet = qry_lote
    Left = 19
    Top = 141
  end
  object qry_lote: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'descricao'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select l.*, p.pro_descricao, p.pro_registro_ms '
      'from lote l '
      'inner join produto p on (p.pro_id = l.pro_id)'
      'where '
      '(lot_quant > 0) and'
      'convert(varchar(10), p.pro_id) like :descricao'
      'order by p.pro_descricao, l.lot_data')
    Left = 20
    Top = 97
    object qry_loteLOT_ID: TAutoIncField
      FieldName = 'LOT_ID'
      ReadOnly = True
    end
    object qry_lotePRO_ID: TIntegerField
      FieldName = 'PRO_ID'
    end
    object qry_loteLOT_LOTE: TStringField
      FieldName = 'LOT_LOTE'
      Size = 15
    end
    object qry_loteLOT_QUANT: TBCDField
      FieldName = 'LOT_QUANT'
      Precision = 11
      Size = 3
    end
    object qry_loteLOT_DATA: TDateTimeField
      FieldName = 'LOT_DATA'
    end
    object qry_lotepro_descricao: TStringField
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qry_lotepro_registro_ms: TStringField
      FieldName = 'pro_registro_ms'
    end
  end
  object pip_lote: TppDBPipeline
    DataSource = dts_lote
    UserName = 'pip_lote'
    Left = 21
    Top = 53
    object pip_loteppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOT_ID'
      FieldName = 'LOT_ID'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object pip_loteppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_ID'
      FieldName = 'PRO_ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object pip_loteppField3: TppField
      FieldAlias = 'LOT_LOTE'
      FieldName = 'LOT_LOTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object pip_loteppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOT_QUANT'
      FieldName = 'LOT_QUANT'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 12
      Position = 3
    end
    object pip_loteppField5: TppField
      FieldAlias = 'LOT_DATA'
      FieldName = 'LOT_DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pip_loteppField6: TppField
      FieldAlias = 'pro_descricao'
      FieldName = 'pro_descricao'
      FieldLength = 90
      DisplayWidth = 90
      Position = 5
    end
    object pip_loteppField7: TppField
      FieldAlias = 'pro_registro_ms'
      FieldName = 'pro_registro_ms'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
  end
  object Rep_lote: TppReport
    AutoStop = False
    DataPipeline = pip_lote
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 23
    Top = 8
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_lote'
    object ppTitleBand13: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand14: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppLabel135: TppLabel
        DesignLayer = ppDesignLayer10
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produtos p/ LOTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 5821
        mmWidth = 63500
        BandType = 0
        LayerName = Foreground9
      end
      object ppDBText92: TppDBText
        DesignLayer = ppDesignLayer10
        UserName = 'DBText56'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 64177
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel138: TppLabel
        DesignLayer = ppDesignLayer10
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Registro MS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 1058
        mmTop = 11377
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel141: TppLabel
        DesignLayer = ppDesignLayer10
        UserName = 'Label161'
        AutoSize = False
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 29104
        mmTop = 11377
        mmWidth = 17992
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel143: TppLabel
        DesignLayer = ppDesignLayer10
        UserName = 'Label163'
        AutoSize = False
        Caption = 'Estoque Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 120121
        mmTop = 11642
        mmWidth = 23548
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel144: TppLabel
        DesignLayer = ppDesignLayer10
        UserName = 'Label160'
        AutoSize = False
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 147109
        mmTop = 11377
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel146: TppLabel
        DesignLayer = ppDesignLayer10
        UserName = 'ppLabelEstFisico1'
        AutoSize = False
        Caption = 'Data Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 171980
        mmTop = 11377
        mmWidth = 26988
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine22: TppLine
        DesignLayer = ppDesignLayer10
        UserName = 'Line60'
        Pen.Style = psDot
        ParentWidth = True
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 10319
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine41: TppLine
        DesignLayer = ppDesignLayer10
        UserName = 'Line67'
        Pen.Style = psDot
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15610
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground9
      end
      object ppSystemVariable23: TppSystemVariable
        DesignLayer = ppDesignLayer10
        UserName = 'SystemVariable23'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground9
      end
      object ppSystemVariable24: TppSystemVariable
        DesignLayer = ppDesignLayer10
        UserName = 'SystemVariable24'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground9
      end
    end
    object ppDetailBand15: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText131: TppDBText
        DesignLayer = ppDesignLayer10
        UserName = 'DBText3'
        DataField = 'pro_registro_ms'
        DataPipeline = pip_lote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_lote'
        mmHeight = 3598
        mmLeft = 0
        mmTop = 529
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText132: TppDBText
        DesignLayer = ppDesignLayer10
        UserName = 'DBText1'
        DataField = 'pro_descricao'
        DataPipeline = pip_lote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_lote'
        mmHeight = 3598
        mmLeft = 28046
        mmTop = 529
        mmWidth = 87842
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText133: TppDBText
        DesignLayer = ppDesignLayer10
        UserName = 'DBText8'
        DataField = 'LOT_QUANT'
        DataPipeline = pip_lote
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_lote'
        mmHeight = 3598
        mmLeft = 119063
        mmTop = 529
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText156: TppDBText
        DesignLayer = ppDesignLayer10
        UserName = 'DBText301'
        DataField = 'LOT_LOTE'
        DataPipeline = pip_lote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_lote'
        mmHeight = 3598
        mmLeft = 146050
        mmTop = 529
        mmWidth = 20638
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText157: TppDBText
        DesignLayer = ppDesignLayer10
        UserName = 'DBText2'
        DataField = 'LOT_DATA'
        DataPipeline = pip_lote
        DisplayFormat = 'mm/dd/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_lote'
        mmHeight = 3598
        mmLeft = 171186
        mmTop = 529
        mmWidth = 26723
        BandType = 4
        LayerName = Foreground9
      end
    end
    object ppFooterBand13: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup13: TppGroup
      BreakName = 'PRO_ID'
      DataPipeline = pip_lote
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_lote'
      NewFile = False
      object ppGroupHeaderBand13: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLine42: TppLine
          DesignLayer = ppDesignLayer10
          UserName = 'Line601'
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 265
          mmWidth = 203200
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppLabel149: TppLabel
          DesignLayer = ppDesignLayer10
          UserName = 'Label10'
          Caption = 'Total--->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 96573
          mmTop = 794
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBCalc1: TppDBCalc
          DesignLayer = ppDesignLayer10
          UserName = 'DBCalc1'
          DataField = 'LOT_QUANT'
          DataPipeline = pip_lote
          DisplayFormat = '#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_lote'
          mmHeight = 3969
          mmLeft = 119327
          mmTop = 794
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
      end
    end
    object ppDesignLayers10: TppDesignLayers
      object ppDesignLayer10: TppDesignLayer
        UserName = 'Foreground9'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList22: TppParameterList
    end
  end
  object ppCombustivel: TppReport
    AutoStop = False
    DataPipeline = pipCombustivel
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 8890
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 677
    Top = 192
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipCombustivel'
    object ppTitleBand10: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel127: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label120'
        AutoSize = False
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 21696
        mmWidth = 24606
        BandType = 1
        LayerName = Foreground10
      end
      object ppLabel128: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label121'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 28840
        mmTop = 21696
        mmWidth = 79640
        BandType = 1
        LayerName = Foreground10
      end
      object ppLabel129: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label123'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 21696
        mmWidth = 13229
        BandType = 1
        LayerName = Foreground10
      end
      object ppLabel131: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label124'
        AutoSize = False
        Caption = 'Pr. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 150548
        mmTop = 21696
        mmWidth = 14552
        BandType = 1
        LayerName = Foreground10
      end
      object ppLabel132: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label126'
        AutoSize = False
        Caption = 'Tot.Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 21696
        mmWidth = 15081
        BandType = 1
        LayerName = Foreground10
      end
      object ppLine78: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line29'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 19844
        mmWidth = 196850
        BandType = 1
        LayerName = Foreground10
      end
      object ppLine80: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line31'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 20373
        mmWidth = 196850
        BandType = 1
        LayerName = Foreground10
      end
      object ppLine81: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line34'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 26194
        mmWidth = 196850
        BandType = 1
        LayerName = Foreground10
      end
      object ppLine82: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line76'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 26458
        mmWidth = 196850
        BandType = 1
        LayerName = Foreground10
      end
      object ppLabel145: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label145'
        AutoSize = False
        Caption = 'Relat'#243'rio de Combust'#237'veis - Invent'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1058
        mmTop = 5292
        mmWidth = 72231
        BandType = 1
        LayerName = Foreground10
      end
      object ppDBText106: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText106'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1058
        mmTop = 794
        mmWidth = 64177
        BandType = 1
        LayerName = Foreground10
      end
      object ppSystemVariable21: TppSystemVariable
        DesignLayer = ppDesignLayer11
        UserName = 'SystemVariable21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 1588
        mmWidth = 14817
        BandType = 1
        LayerName = Foreground10
      end
      object ppSystemVariable22: TppSystemVariable
        DesignLayer = ppDesignLayer11
        UserName = 'SystemVariable22'
        ReprintOnOverFlow = True
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 179917
        mmTop = 1323
        mmWidth = 16669
        BandType = 1
        LayerName = Foreground10
      end
      object ppDBText107: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText107'
        DataField = 'EMP_CGC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 18521
        mmTop = 10054
        mmWidth = 43392
        BandType = 1
        LayerName = Foreground10
      end
      object ppDBText108: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText108'
        DataField = 'EMP_INSCRICAOESTADUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 107950
        mmTop = 10319
        mmWidth = 52388
        BandType = 1
        LayerName = Foreground10
      end
      object ppLabel147: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label147'
        AutoSize = False
        Caption = 'CGC/CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 10319
        mmWidth = 16669
        BandType = 1
        LayerName = Foreground10
      end
      object ppLabel148: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label148'
        AutoSize = False
        Caption = 'Insc. Estadual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 84402
        mmTop = 10583
        mmWidth = 22225
        BandType = 1
        LayerName = Foreground10
      end
    end
    object ppDetailBand11: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText100: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText88'
        AutoSize = True
        DataField = 'tan_codigo'
        DataPipeline = pipCombustivel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipCombustivel'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 529
        mmWidth = 1693
        BandType = 4
        LayerName = Foreground10
      end
      object ppDBText101: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText89'
        AutoSize = True
        DataField = 'com_descricao'
        DataPipeline = pipCombustivel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipCombustivel'
        mmHeight = 4233
        mmLeft = 28575
        mmTop = 529
        mmWidth = 29210
        BandType = 4
        LayerName = Foreground10
      end
      object ppDBText102: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText91'
        AutoSize = True
        DataField = 'ESTOQUE'
        DataPipeline = pipCombustivel
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipCombustivel'
        mmHeight = 4233
        mmLeft = 124143
        mmTop = 529
        mmWidth = 7620
        BandType = 4
        LayerName = Foreground10
      end
      object ppDBText103: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText93'
        AutoSize = True
        DataField = 'com_precusto'
        DataPipeline = pipCombustivel
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipCombustivel'
        mmHeight = 4233
        mmLeft = 158644
        mmTop = 529
        mmWidth = 5927
        BandType = 4
        LayerName = Foreground10
      end
      object ppDBText104: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText87'
        AutoSize = True
        DataField = 'custo'
        DataPipeline = pipCombustivel
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipCombustivel'
        mmHeight = 4233
        mmLeft = 190658
        mmTop = 794
        mmWidth = 5927
        BandType = 4
        LayerName = Foreground10
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLabel134: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label130'
        Caption = 'Total Geral ---->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 127529
        mmTop = 3704
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground10
      end
      object ppDBCalc47: TppDBCalc
        DesignLayer = ppDesignLayer11
        UserName = 'DBCalc48'
        AutoSize = True
        DataField = 'custo'
        DataPipeline = pipCombustivel
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipCombustivel'
        mmHeight = 3725
        mmLeft = 180255
        mmTop = 3704
        mmWidth = 16595
        BandType = 7
        LayerName = Foreground10
      end
      object ppLine83: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line79'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 1588
        mmWidth = 194998
        BandType = 7
        LayerName = Foreground10
      end
    end
    object ppDesignLayers11: TppDesignLayers
      object ppDesignLayer11: TppDesignLayer
        UserName = 'Foreground10'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList5: TppParameterList
    end
  end
  object RepGeralDisc: TppReport
    AutoStop = False
    DataPipeline = pipGeralDisc
    PassSetting = psTwoPass
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 360
    Top = 7
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipGeralDisc'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object lbl_DescricaoFiltros: TppLabel
        DesignLayer = ppDesignLayer12
        UserName = 'lbl_DescricaoFiltros'
        AutoSize = False
        Caption = 'Relatorio de Produtos - Geral'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 5027
        mmWidth = 166423
        BandType = 0
        LayerName = Foreground11
      end
      object ppDBText68: TppDBText
        DesignLayer = ppDesignLayer12
        UserName = 'DBText68'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3725
        mmLeft = 0
        mmTop = 529
        mmWidth = 35391
        BandType = 0
        LayerName = Foreground11
      end
      object ppLine33: TppLine
        DesignLayer = ppDesignLayer12
        UserName = 'Line33'
        ParentWidth = True
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 9790
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground11
      end
      object Geral_Desc_1: TppLabel
        DesignLayer = ppDesignLayer12
        UserName = 'Geral_Desc_1'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 20373
        mmTop = 10848
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground11
      end
      object Geral_Ref_1: TppLabel
        DesignLayer = ppDesignLayer12
        UserName = 'Geral_Ref_1'
        Anchors = [atLeft, atBottom]
        AutoSize = False
        Caption = 'Ref.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10848
        mmWidth = 17727
        BandType = 0
        LayerName = Foreground11
      end
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer12
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15610
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground11
      end
      object regCabecalho: TppRegion
        DesignLayer = ppDesignLayer12
        UserName = 'regCabecalho'
        Pen.Mode = pmNop
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 10848
        mmWidth = 103452
        BandType = 0
        LayerName = Foreground11
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel20: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label202'
          AutoSize = False
          Caption = 'Estoque'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 117211
          mmTop = 10848
          mmWidth = 15081
          BandType = 0
          LayerName = Foreground11
        end
        object ppLabel18: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label3'
          CharWrap = True
          Anchors = [atLeft, atBottom]
          AutoSize = False
          Caption = 'Pr. Vista'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 133351
          mmTop = 10848
          mmWidth = 16404
          BandType = 0
          LayerName = Foreground11
        end
        object ppLabel19: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Pr. Prazo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 150549
          mmTop = 10848
          mmWidth = 16669
          BandType = 0
          LayerName = Foreground11
        end
        object ppLabel21: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Pr. Atacado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 168276
          mmTop = 10848
          mmWidth = 16404
          BandType = 0
          LayerName = Foreground11
        end
        object ppLabel115: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'ppLabel115'
          Anchors = [atTop, atRight]
          AutoSize = False
          Caption = 'Total Venda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 185474
          mmTop = 10848
          mmWidth = 17463
          BandType = 0
          LayerName = Foreground11
        end
        object ppLabel17: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label1'
          AutoSize = False
          Caption = 'UN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 96838
          mmTop = 10848
          mmWidth = 6615
          BandType = 0
          LayerName = Foreground11
        end
        object ppLabel31: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Qtde UN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 103982
          mmTop = 10848
          mmWidth = 11377
          BandType = 0
          LayerName = Foreground11
        end
      end
      object lblFabric: TppLabel
        DesignLayer = ppDesignLayer12
        UserName = 'lblFabric'
        AutoSize = False
        Caption = 'Fabricante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 60854
        mmTop = 10848
        mmWidth = 32015
        BandType = 0
        LayerName = Foreground11
      end
      object ppSystemVariable9: TppSystemVariable
        DesignLayer = ppDesignLayer12
        UserName = 'SystemVariable1'
        Anchors = [atLeft, atTop, atRight]
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169334
        mmTop = 529
        mmWidth = 31750
        BandType = 0
        LayerName = Foreground11
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer12
        UserName = 'DBText14'
        DataField = 'pro_referencia'
        DataPipeline = pipGeralDisc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipGeralDisc'
        mmHeight = 3302
        mmLeft = 0
        mmTop = 1058
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground11
      end
      object ppLine110: TppLine
        DesignLayer = ppDesignLayer12
        UserName = 'Line110'
        Pen.Style = psDot
        Pen.Width = 0
        ParentWidth = True
        mmHeight = 265
        mmLeft = 0
        mmTop = 5292
        mmWidth = 203200
        BandType = 4
        LayerName = Foreground11
      end
      object regItens: TppRegion
        DesignLayer = ppDesignLayer12
        UserName = 'regItens'
        Pen.Mode = pmNop
        mmHeight = 3440
        mmLeft = 99484
        mmTop = 1058
        mmWidth = 109009
        BandType = 4
        LayerName = Foreground11
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppDBText16: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText2'
          DataField = 'PRO_UNIDADE'
          DataPipeline = pipGeralDisc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3440
          mmLeft = 96838
          mmTop = 1058
          mmWidth = 6615
          BandType = 4
          LayerName = Foreground11
        end
        object ppDBText36: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText36'
          DataField = 'pro_quant_unid'
          DataPipeline = pipGeralDisc
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3440
          mmLeft = 103982
          mmTop = 1058
          mmWidth = 11377
          BandType = 4
          LayerName = Foreground11
        end
        object ppDBText19: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText3'
          DataField = 'PRO_ESTOQUE'
          DataPipeline = pipGeralDisc
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3440
          mmLeft = 117211
          mmTop = 1058
          mmWidth = 15081
          BandType = 4
          LayerName = Foreground11
        end
        object ppDBText17: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText4'
          DataField = 'PRO_VLRVENDA'
          DataPipeline = pipGeralDisc
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3440
          mmLeft = 133351
          mmTop = 1058
          mmWidth = 16404
          BandType = 4
          LayerName = Foreground11
        end
        object ppDBText18: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText5'
          DataField = 'PRO_VLRPRAZO'
          DataPipeline = pipGeralDisc
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3440
          mmLeft = 150549
          mmTop = 1058
          mmWidth = 16669
          BandType = 4
          LayerName = Foreground11
        end
        object ppDBText21: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText6'
          DataField = 'pro_vlratacado'
          DataPipeline = pipGeralDisc
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3440
          mmLeft = 168540
          mmTop = 1058
          mmWidth = 16404
          BandType = 4
          LayerName = Foreground11
        end
        object ppDBText22: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText7'
          DataField = 'total_custo'
          DataPipeline = pipGeralDisc
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3440
          mmLeft = 185209
          mmTop = 1058
          mmWidth = 17727
          BandType = 4
          LayerName = Foreground11
        end
        object var_mcontagem: TppVariable
          OnPrint = var_mcontagemPrint
          DesignLayer = ppDesignLayer12
          UserName = 'var_mcontagem'
          BlankWhenZero = False
          CalcOrder = 0
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 185738
          mmTop = 1058
          mmWidth = 17463
          BandType = 4
          LayerName = Foreground11
        end
        object var_mTotal: TppVariable
          OnPrint = var_mTotalPrint
          DesignLayer = ppDesignLayer12
          UserName = 'var_mTotal'
          BlankWhenZero = False
          CalcOrder = 1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 185474
          mmTop = 1058
          mmWidth = 17463
          BandType = 4
          LayerName = Foreground11
        end
      end
      object dbtxtFabric: TppDBText
        DesignLayer = ppDesignLayer12
        UserName = 'dbtxtFabric'
        DataField = 'MRC_DESCRICAO'
        DataPipeline = pipGeralDisc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipGeralDisc'
        mmHeight = 3302
        mmLeft = 57415
        mmTop = 1058
        mmWidth = 32015
        BandType = 4
        LayerName = Foreground11
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer12
        UserName = 'DBText15'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipGeralDisc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipGeralDisc'
        mmHeight = 2910
        mmLeft = 19315
        mmTop = 1323
        mmWidth = 76200
        BandType = 4
        LayerName = Foreground11
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine75: TppLine
        DesignLayer = ppDesignLayer12
        UserName = 'Line75'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 203200
        BandType = 8
        LayerName = Foreground11
      end
      object ppSystemVariable10: TppSystemVariable
        DesignLayer = ppDesignLayer12
        UserName = 'SystemVariable2'
        ReprintOnOverFlow = True
        Anchors = [atLeft, atTop, atRight]
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 1058
        mmWidth = 26723
        BandType = 8
        LayerName = Foreground11
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLine16: TppLine
        DesignLayer = ppDesignLayer12
        UserName = 'Line16'
        ParentWidth = True
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 1588
        mmWidth = 203200
        BandType = 7
        LayerName = Foreground11
      end
      object regTotal: TppRegion
        DesignLayer = ppDesignLayer12
        UserName = 'regTotal'
        Pen.Mode = pmNop
        mmHeight = 4233
        mmLeft = 83079
        mmTop = 3175
        mmWidth = 120121
        BandType = 7
        LayerName = Foreground11
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel24: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Total Geral do Estoque:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 66940
          mmTop = 2910
          mmWidth = 37042
          BandType = 7
          LayerName = Foreground11
        end
        object ppDBCalc14: TppDBCalc
          DesignLayer = ppDesignLayer12
          UserName = 'DBCalc1'
          DataField = 'pro_estoque'
          DataPipeline = pipGeralDisc
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 4233
          mmLeft = 104775
          mmTop = 2910
          mmWidth = 22225
          BandType = 7
          LayerName = Foreground11
        end
        object ppDBCalc7: TppDBCalc
          DesignLayer = ppDesignLayer12
          UserName = 'DBCalc2'
          DataField = 'total_venda'
          DataPipeline = pipGeralDisc
          DisplayFormat = '#,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 4233
          mmLeft = 180975
          mmTop = 3175
          mmWidth = 21960
          BandType = 7
          LayerName = Foreground11
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DEP_DESCRICAO'
      DataPipeline = pipGeralDisc
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipGeralDisc'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText12: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText12'
          DataField = 'DEP_DESCRICAO'
          DataPipeline = pipGeralDisc
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3704
          mmLeft = 22490
          mmTop = 2117
          mmWidth = 98690
          BandType = 3
          GroupNo = 0
          LayerName = Foreground11
        end
        object ppLine32: TppLine
          DesignLayer = ppDesignLayer12
          UserName = 'Line32'
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground11
        end
        object ppLabel30: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label30'
          AutoSize = False
          Caption = 'Departamento:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3725
          mmLeft = 0
          mmTop = 2117
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
          LayerName = Foreground11
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'sec_id'
      DataPipeline = pipGeralDisc
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipGeralDisc'
      NewFile = False
      object ppGroupHeaderBand8: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel16: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label302'
          AutoSize = False
          Caption = 'Se'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3725
          mmLeft = 265
          mmTop = 3175
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
          LayerName = Foreground11
        end
        object ppDBText25: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText1'
          DataField = 'sec_descricao'
          DataPipeline = pipGeralDisc
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3704
          mmLeft = 10848
          mmTop = 3175
          mmWidth = 110861
          BandType = 3
          GroupNo = 1
          LayerName = Foreground11
        end
        object ppLine28: TppLine
          DesignLayer = ppDesignLayer12
          UserName = 'Line28'
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 7144
          mmWidth = 203200
          BandType = 3
          GroupNo = 1
          LayerName = Foreground11
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'for_id'
      DataPipeline = pipGeralDisc
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipGeralDisc'
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBText80: TppDBText
          DesignLayer = ppDesignLayer12
          UserName = 'DBText80'
          DataField = 'for_nome'
          DataPipeline = pipGeralDisc
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pipGeralDisc'
          mmHeight = 3725
          mmLeft = 16669
          mmTop = 2910
          mmWidth = 97102
          BandType = 3
          GroupNo = 2
          LayerName = Foreground11
        end
        object ppLabel76: TppLabel
          DesignLayer = ppDesignLayer12
          UserName = 'Label304'
          AutoSize = False
          Caption = 'Fonecedor:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3725
          mmLeft = 265
          mmTop = 2910
          mmWidth = 16140
          BandType = 3
          GroupNo = 2
          LayerName = Foreground11
        end
        object ppLine13: TppLine
          DesignLayer = ppDesignLayer12
          UserName = 'Line13'
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6879
          mmWidth = 203200
          BandType = 3
          GroupNo = 2
          LayerName = Foreground11
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers12: TppDesignLayers
      object ppDesignLayer12: TppDesignLayer
        UserName = 'Foreground11'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object repExtratoEnt: TppReport
    AutoStop = False
    DataPipeline = pipExtratoEnt
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 525
    Top = 192
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipExtratoEnt'
    object ppTitleBand8: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand13: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer13
        UserName = 'Label13'
        Caption = 'Extrato de Produtos / Entradas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 43603
        BandType = 0
        LayerName = Foreground12
      end
      object ppSystemVariable27: TppSystemVariable
        DesignLayer = ppDesignLayer13
        UserName = 'SystemVariable9'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 5292
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground12
      end
      object ppSystemVariable28: TppSystemVariable
        DesignLayer = ppDesignLayer13
        UserName = 'SystemVariable10'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 180479
        mmTop = 794
        mmWidth = 14520
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel39: TppLabel
        DesignLayer = ppDesignLayer13
        UserName = 'Label39'
        AutoSize = False
        Caption = 'Per'#237'odo de 01/09/2009 '#224' 30/09/2009'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 70115
        mmTop = 5292
        mmWidth = 53446
        BandType = 0
        LayerName = Foreground12
      end
      object ppDBText26: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 60791
        BandType = 0
        LayerName = Foreground12
      end
    end
    object ppDetailBand14: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppDBText28: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText14'
        DataField = 'pro_referencia'
        DataPipeline = pipExtratoEnt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipExtratoEnt'
        mmHeight = 4233
        mmLeft = 1059
        mmTop = 1058
        mmWidth = 25136
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText30: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText15'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipExtratoEnt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipExtratoEnt'
        mmHeight = 4233
        mmLeft = 26988
        mmTop = 1058
        mmWidth = 78581
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText31: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText16'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pipExtratoEnt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipExtratoEnt'
        mmHeight = 4233
        mmLeft = 106892
        mmTop = 1058
        mmWidth = 5291
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText38: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText19'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pipExtratoEnt
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipExtratoEnt'
        mmHeight = 4233
        mmLeft = 171980
        mmTop = 1058
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText39: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText17'
        DataField = 'VLR_ENTRADA'
        DataPipeline = pipExtratoEnt
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipExtratoEnt'
        mmHeight = 4233
        mmLeft = 152400
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText125: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText18'
        DataField = 'DATA_ENTRADA'
        DataPipeline = pipExtratoEnt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipExtratoEnt'
        mmHeight = 4233
        mmLeft = 113771
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText128: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText4'
        DataField = 'QTD_ENTRADA'
        DataPipeline = pipExtratoEnt
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipExtratoEnt'
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText40: TppDBText
        DesignLayer = ppDesignLayer13
        UserName = 'DBText1'
        DataField = 'PRO_DEPOSITO'
        DataPipeline = pipExtratoEnt
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pipExtratoEnt'
        mmHeight = 4233
        mmLeft = 188119
        mmTop = 1058
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground12
      end
    end
    object ppFooterBand12: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup12: TppGroup
      BreakName = 'FOR_ID'
      DataPipeline = pipExtratoEnt
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipExtratoEnt'
      NewFile = False
      object ppGroupHeaderBand12: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppDBText130: TppDBText
          DesignLayer = ppDesignLayer13
          UserName = 'DBText12'
          DataField = 'FOR_NOME'
          DataPipeline = pipExtratoEnt
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipExtratoEnt'
          mmHeight = 4233
          mmLeft = 21431
          mmTop = 1058
          mmWidth = 107421
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLine53: TppLine
          DesignLayer = ppDesignLayer13
          UserName = 'Line5'
          Pen.Style = psDot
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 265
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel44: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Label30'
          AutoSize = False
          Caption = 'Fornecedor:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel28: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Geral_Ref_1'
          Anchors = [atLeft, atBottom]
          AutoSize = False
          Caption = 'Refer.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 1059
          mmTop = 7408
          mmWidth = 25136
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel25: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Geral_Desc_1'
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 26988
          mmTop = 7408
          mmWidth = 78846
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel27: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Label17'
          AutoSize = False
          Caption = 'UN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 106892
          mmTop = 7408
          mmWidth = 5291
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel33: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Estoque'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 171715
          mmTop = 7408
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel35: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Label18'
          CharWrap = True
          Anchors = [atLeft, atBottom]
          AutoSize = False
          Caption = 'Vlr. Custo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 152400
          mmTop = 7408
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel36: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 113771
          mmTop = 7408
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel37: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Quantidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 133350
          mmTop = 7408
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLine30: TppLine
          DesignLayer = ppDesignLayer13
          UserName = 'Line33'
          Pen.Style = psDot
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 12171
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel26: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Dep'#243'sito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 4233
          mmLeft = 188119
          mmTop = 7408
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLabel38: TppLabel
          DesignLayer = ppDesignLayer13
          UserName = 'Label303'
          AutoSize = False
          Caption = 'Totais ----->>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 106098
          mmTop = 1058
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppDBCalc13: TppDBCalc
          DesignLayer = ppDesignLayer13
          UserName = 'DBCalc13'
          DataField = 'QTD_ENTRADA'
          DataPipeline = pipExtratoEnt
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipExtratoEnt'
          mmHeight = 3598
          mmLeft = 131234
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppDBCalc36: TppDBCalc
          DesignLayer = ppDesignLayer13
          UserName = 'DBCalc36'
          DataField = 'VLR_ENTRADA'
          DataPipeline = pipExtratoEnt
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipExtratoEnt'
          mmHeight = 3598
          mmLeft = 150813
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
      end
    end
    object ppDesignLayers13: TppDesignLayers
      object ppDesignLayer13: TppDesignLayer
        UserName = 'Foreground12'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList21: TppParameterList
    end
  end
  object ppAliq: TppReport
    AutoStop = False
    DataPipeline = pipAliq
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 731
    Top = 191
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipAliq'
    object ppHeaderBand7: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppDBText62: TppDBText
        DesignLayer = ppDesignLayer14
        UserName = 'DBText62'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 265
        mmWidth = 67479
        BandType = 0
        LayerName = Foreground13
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto - Natureza Fiscal / Aliquota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 4763
        mmWidth = 99748
        BandType = 0
        LayerName = Foreground13
      end
      object ppLabel46: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label1'
        AutoSize = False
        Caption = 'CST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 124884
        mmTop = 12435
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground13
      end
      object ppLabel69: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label69'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 12435
        mmWidth = 24606
        BandType = 0
        LayerName = Foreground13
      end
      object ppLabel70: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label70'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 12435
        mmWidth = 86784
        BandType = 0
        LayerName = Foreground13
      end
      object ppLabel71: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label71'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 12435
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground13
      end
      object ppLabel72: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label72'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 12171
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground13
      end
      object ppLabel74: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label74'
        AutoSize = False
        Caption = 'Pre'#231'o Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151871
        mmTop = 12171
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground13
      end
      object ppLabel79: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label79'
        AutoSize = False
        Caption = 'Total Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 174625
        mmTop = 12435
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground13
      end
      object ppLine39: TppLine
        DesignLayer = ppDesignLayer14
        UserName = 'Line39'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 794
        mmTop = 17198
        mmWidth = 196850
        BandType = 0
        LayerName = Foreground13
      end
      object ppLine45: TppLine
        DesignLayer = ppDesignLayer14
        UserName = 'Line45'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 794
        mmTop = 17198
        mmWidth = 196850
        BandType = 0
        LayerName = Foreground13
      end
      object ppLine46: TppLine
        DesignLayer = ppDesignLayer14
        UserName = 'Line46'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 794
        mmTop = 10319
        mmWidth = 196850
        BandType = 0
        LayerName = Foreground13
      end
      object ppSystemVariable15: TppSystemVariable
        DesignLayer = ppDesignLayer14
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167217
        mmTop = 5292
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground13
      end
      object ppSystemVariable16: TppSystemVariable
        DesignLayer = ppDesignLayer14
        UserName = 'SystemVariable2'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 176742
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground13
      end
    end
    object ppDetailBand7: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer14
        UserName = 'DBText2'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipAliq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAliq'
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 794
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground13
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer14
        UserName = 'DBText13'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipAliq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAliq'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 794
        mmWidth = 85990
        BandType = 4
        LayerName = Foreground13
      end
      object ppDBText20: TppDBText
        DesignLayer = ppDesignLayer14
        UserName = 'DBText20'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pipAliq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAliq'
        mmHeight = 3175
        mmLeft = 116681
        mmTop = 794
        mmWidth = 7408
        BandType = 4
        LayerName = Foreground13
      end
      object ppDBText29: TppDBText
        DesignLayer = ppDesignLayer14
        UserName = 'DBText29'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pipAliq
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliq'
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 794
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground13
      end
      object ppDBText37: TppDBText
        DesignLayer = ppDesignLayer14
        UserName = 'DBText37'
        DataField = 'PRO_VLRCUSTO'
        DataPipeline = pipAliq
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliq'
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 794
        mmWidth = 21167
        BandType = 4
        LayerName = Foreground13
      end
      object ppDBText57: TppDBText
        DesignLayer = ppDesignLayer14
        UserName = 'DBText57'
        DataField = 'CUSTO'
        DataPipeline = pipAliq
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliq'
        mmHeight = 3175
        mmLeft = 174625
        mmTop = 794
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground13
      end
      object ppDBText129: TppDBText
        DesignLayer = ppDesignLayer14
        UserName = 'DBText204'
        DataField = 'cst_id'
        DataPipeline = pipAliq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAliq'
        mmHeight = 3175
        mmLeft = 124884
        mmTop = 794
        mmWidth = 7408
        BandType = 4
        LayerName = Foreground13
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel93: TppLabel
        DesignLayer = ppDesignLayer14
        UserName = 'Label93'
        Caption = 'Total Geral ----->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 4498
        mmWidth = 23283
        BandType = 7
        LayerName = Foreground13
      end
      object ppDBCalc44: TppDBCalc
        DesignLayer = ppDesignLayer14
        UserName = 'DBCalc44'
        AutoSize = True
        DataField = 'CUSTO'
        DataPipeline = pipAliq
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAliq'
        mmHeight = 3598
        mmLeft = 176636
        mmTop = 4498
        mmWidth = 19685
        BandType = 7
        LayerName = Foreground13
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'NAF_ALIQUOTA'
      DataPipeline = pipAliq
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipAliq'
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppDBText61: TppDBText
          DesignLayer = ppDesignLayer14
          UserName = 'DBText61'
          AutoSize = True
          DataField = 'NAF_DESCRICAO'
          DataPipeline = pipAliq
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'TIMES NEW ROMAN'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipAliq'
          mmHeight = 3969
          mmLeft = 34660
          mmTop = 8202
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
          LayerName = Foreground13
        end
        object ppLine27: TppLine
          DesignLayer = ppDesignLayer14
          UserName = 'Line27'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 794
          mmTop = 12965
          mmWidth = 196850
          BandType = 3
          GroupNo = 0
          LayerName = Foreground13
        end
        object ppLabel80: TppLabel
          DesignLayer = ppDesignLayer14
          UserName = 'Label80'
          AutoSize = False
          Caption = 'Natureza Fiscal  ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 2646
          mmTop = 8202
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
          LayerName = Foreground13
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel22: TppLabel
          DesignLayer = ppDesignLayer14
          UserName = 'Label22'
          Caption = 'Total Geral da Aliquota ---->'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 132027
          mmTop = 1058
          mmWidth = 38365
          BandType = 5
          GroupNo = 0
          LayerName = Foreground13
        end
        object ppDBCalc6: TppDBCalc
          DesignLayer = ppDesignLayer14
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = 'CUSTO'
          DataPipeline = pipAliq
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          LookAhead = True
          DataPipelineName = 'pipAliq'
          mmHeight = 3598
          mmLeft = 176637
          mmTop = 794
          mmWidth = 19685
          BandType = 5
          GroupNo = 0
          LayerName = Foreground13
        end
        object ppLine64: TppLine
          DesignLayer = ppDesignLayer14
          UserName = 'Line64'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 794
          mmTop = 0
          mmWidth = 197644
          BandType = 5
          GroupNo = 0
          LayerName = Foreground13
        end
      end
    end
    object ppDesignLayers14: TppDesignLayers
      object ppDesignLayer14: TppDesignLayer
        UserName = 'Foreground13'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object pp_AuxiliaInventario: TppReport
    AutoStop = False
    DataPipeline = pip_AuxiliaInventario
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 805
    Top = 191
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_AuxiliaInventario'
    object ppHeaderBand21: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel227: TppLabel
        DesignLayer = ppDesignLayer15
        UserName = 'Label41'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto c/ Totais - Discriminado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 0
        mmTop = 5292
        mmWidth = 152136
        BandType = 0
        LayerName = Foreground14
      end
      object ppDBText182: TppDBText
        DesignLayer = ppDesignLayer15
        UserName = 'DBText60'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 794
        mmWidth = 152136
        BandType = 0
        LayerName = Foreground14
      end
      object ppLine115: TppLine
        DesignLayer = ppDesignLayer15
        UserName = 'Line17'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16140
        mmWidth = 197115
        BandType = 0
        LayerName = Foreground14
      end
      object ppLabel229: TppLabel
        DesignLayer = ppDesignLayer15
        UserName = 'Label43'
        AutoSize = False
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 11642
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground14
      end
      object ppLabel230: TppLabel
        DesignLayer = ppDesignLayer15
        UserName = 'Label44'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 11642
        mmWidth = 106892
        BandType = 0
        LayerName = Foreground14
      end
      object ppLabel231: TppLabel
        DesignLayer = ppDesignLayer15
        UserName = 'Label45'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3725
        mmLeft = 126736
        mmTop = 11642
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground14
      end
      object ppLabel232: TppLabel
        DesignLayer = ppDesignLayer15
        UserName = 'Label46'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 11642
        mmWidth = 17992
        BandType = 0
        LayerName = Foreground14
      end
      object ppLine116: TppLine
        DesignLayer = ppDesignLayer15
        UserName = 'Line18'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 10054
        mmWidth = 197115
        BandType = 0
        LayerName = Foreground14
      end
      object ppLabel233: TppLabel
        DesignLayer = ppDesignLayer15
        UserName = 'Label233'
        AutoSize = False
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 11642
        mmWidth = 17992
        BandType = 0
        LayerName = Foreground14
      end
      object ppLabel234: TppLabel
        DesignLayer = ppDesignLayer15
        UserName = 'Label234'
        AutoSize = False
        Caption = 'Total Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 11642
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground14
      end
      object ppSystemVariable45: TppSystemVariable
        DesignLayer = ppDesignLayer15
        UserName = 'SystemVariable45'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 170657
        mmTop = 5556
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground14
      end
      object ppSystemVariable46: TppSystemVariable
        DesignLayer = ppDesignLayer15
        UserName = 'SystemVariable46'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 529
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground14
      end
    end
    object ppDetailBand22: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText183: TppDBText
        DesignLayer = ppDesignLayer15
        UserName = 'DBText38'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pip_AuxiliaInventario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_AuxiliaInventario'
        mmHeight = 3302
        mmLeft = 0
        mmTop = 529
        mmWidth = 17463
        BandType = 4
        LayerName = Foreground14
      end
      object ppDBText184: TppDBText
        DesignLayer = ppDesignLayer15
        UserName = 'DBText39'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pip_AuxiliaInventario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_AuxiliaInventario'
        mmHeight = 3302
        mmLeft = 18521
        mmTop = 529
        mmWidth = 106892
        BandType = 4
        LayerName = Foreground14
      end
      object ppDBText186: TppDBText
        DesignLayer = ppDesignLayer15
        UserName = 'DBText401'
        DataField = 'PRO_VLRCUSTO'
        DataPipeline = pip_AuxiliaInventario
        DisplayFormat = '#####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_AuxiliaInventario'
        mmHeight = 3302
        mmLeft = 157163
        mmTop = 529
        mmWidth = 17992
        BandType = 4
        LayerName = Foreground14
      end
      object ppDBText187: TppDBText
        DesignLayer = ppDesignLayer15
        UserName = 'DBText187'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pip_AuxiliaInventario
        DisplayFormat = '#####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_AuxiliaInventario'
        mmHeight = 3302
        mmLeft = 137584
        mmTop = 529
        mmWidth = 17992
        BandType = 4
        LayerName = Foreground14
      end
      object ppDBText188: TppDBText
        DesignLayer = ppDesignLayer15
        UserName = 'DBText188'
        DataField = 'TOTAL'
        DataPipeline = pip_AuxiliaInventario
        DisplayFormat = '#####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_AuxiliaInventario'
        mmHeight = 3302
        mmLeft = 176742
        mmTop = 529
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground14
      end
      object ppDBText185: TppDBText
        DesignLayer = ppDesignLayer15
        UserName = 'DBText40'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pip_AuxiliaInventario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_AuxiliaInventario'
        mmHeight = 3302
        mmLeft = 126736
        mmTop = 529
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground14
      end
    end
    object ppFooterBand19: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object ppSummaryBand8: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLabel235: TppLabel
        DesignLayer = ppDesignLayer15
        UserName = 'Label235'
        AutoSize = False
        Caption = 'Total--->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 5027
        mmWidth = 18785
        BandType = 7
        LayerName = Foreground14
      end
      object ppDBCalc32: TppDBCalc
        DesignLayer = ppDesignLayer15
        UserName = 'DBCalc32'
        DataField = 'TOTAL'
        DataPipeline = pip_AuxiliaInventario
        DisplayFormat = '#####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_AuxiliaInventario'
        mmHeight = 3704
        mmLeft = 165365
        mmTop = 5027
        mmWidth = 31221
        BandType = 7
        LayerName = Foreground14
      end
      object ppLine67: TppLine
        DesignLayer = ppDesignLayer15
        UserName = 'Line1'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3969
        mmWidth = 197115
        BandType = 7
        LayerName = Foreground14
      end
    end
    object ppDesignLayers15: TppDesignLayers
      object ppDesignLayer15: TppDesignLayer
        UserName = 'Foreground14'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList14: TppParameterList
    end
  end
  object pp_TabelaSecao: TppReport
    AutoStop = False
    DataPipeline = pip_TabelaSecao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 116
    Top = 192
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_TabelaSecao'
    object ppTitleBand17: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand20: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel216: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Relat'#243'rio Tabela de Pre'#231'o por Se'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 58208
        BandType = 0
        LayerName = Foreground15
      end
      object ppDBText174: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText68'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 60791
        BandType = 0
        LayerName = Foreground15
      end
      object ppLabel220: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label220'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 20373
        mmTop = 11113
        mmWidth = 86254
        BandType = 0
        LayerName = Foreground15
      end
      object ppLabel221: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label221'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 11113
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground15
      end
      object ppLabel222: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label222'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 108744
        mmTop = 11113
        mmWidth = 5292
        BandType = 0
        LayerName = Foreground15
      end
      object ppLabel223: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label223'
        AutoSize = False
        Caption = 'Pre'#231'o Vista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 10848
        mmWidth = 17992
        BandType = 0
        LayerName = Foreground15
      end
      object ppLabel224: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label224'
        AutoSize = False
        Caption = 'Pre'#231'o Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 10848
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground15
      end
      object ppLabel225: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label225'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 119592
        mmTop = 10848
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground15
      end
      object ppLabel226: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label226'
        AutoSize = False
        Caption = 'Total Vista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 10848
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground15
      end
      object ppLine114: TppLine
        DesignLayer = ppDesignLayer16
        UserName = 'Line114'
        Pen.Style = psDot
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15346
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground15
      end
      object ppLine113: TppLine
        DesignLayer = ppDesignLayer16
        UserName = 'Line113'
        Pen.Style = psDot
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9525
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground15
      end
      object ppSystemVariable43: TppSystemVariable
        DesignLayer = ppDesignLayer16
        UserName = 'SystemVariable43'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground15
      end
      object ppSystemVariable44: TppSystemVariable
        DesignLayer = ppDesignLayer16
        UserName = 'SystemVariable44'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground15
      end
    end
    object ppDetailBand21: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText175: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText14'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pip_TabelaSecao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 18785
        BandType = 4
        LayerName = Foreground15
      end
      object ppDBText176: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText15'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pip_TabelaSecao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 21431
        mmTop = 265
        mmWidth = 85461
        BandType = 4
        LayerName = Foreground15
      end
      object ppDBText177: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText16'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pip_TabelaSecao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 108744
        mmTop = 265
        mmWidth = 5027
        BandType = 4
        LayerName = Foreground15
      end
      object ppDBText178: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText17'
        DataField = 'PRO_VLRVENDA'
        DataPipeline = pip_TabelaSecao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 139171
        mmTop = 265
        mmWidth = 17992
        BandType = 4
        LayerName = Foreground15
      end
      object ppDBText179: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText18'
        DataField = 'PRO_VLRPRAZO'
        DataPipeline = pip_TabelaSecao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 265
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground15
      end
      object ppDBText180: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText19'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pip_TabelaSecao
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 265
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground15
      end
      object ppLine111: TppLine
        DesignLayer = ppDesignLayer16
        UserName = 'Line110'
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 5027
        mmWidth = 203200
        BandType = 4
        LayerName = Foreground15
      end
      object ppDBText23: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText1'
        DataField = 'total_venda'
        DataPipeline = pip_TabelaSecao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 183092
        mmTop = 529
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground15
      end
    end
    object ppFooterBand18: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand7: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBCalc30: TppDBCalc
        DesignLayer = ppDesignLayer16
        UserName = 'DBCalc7'
        DataField = 'total_venda'
        DataPipeline = pip_TabelaSecao
        DisplayFormat = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 1323
        mmWidth = 21960
        BandType = 7
        LayerName = Foreground15
      end
      object ppLabel218: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label86'
        AutoSize = False
        Caption = 'Total Geral->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 1323
        mmWidth = 23813
        BandType = 7
        LayerName = Foreground15
      end
      object ppDBCalc38: TppDBCalc
        DesignLayer = ppDesignLayer16
        UserName = 'DBCalc38'
        DataField = 'pro_estoque'
        DataPipeline = pip_TabelaSecao
        DisplayFormat = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_TabelaSecao'
        mmHeight = 3704
        mmLeft = 113771
        mmTop = 1323
        mmWidth = 21960
        BandType = 7
        LayerName = Foreground15
      end
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer16
        UserName = 'Line1101'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 203200
        BandType = 7
        LayerName = Foreground15
      end
    end
    object ppGroup19: TppGroup
      BreakName = 'sec_descricao'
      DataPipeline = pip_TabelaSecao
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group19'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_TabelaSecao'
      NewFile = False
      object ppGroupHeaderBand19: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLabel219: TppLabel
          DesignLayer = ppDesignLayer16
          UserName = 'Label219'
          AutoSize = False
          Caption = 'Se'#231#227'o --->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 3969
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
          LayerName = Foreground15
        end
        object ppDBText181: TppDBText
          DesignLayer = ppDesignLayer16
          UserName = 'DBText181'
          DataField = 'sec_descricao'
          DataPipeline = pip_TabelaSecao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pip_TabelaSecao'
          mmHeight = 4057
          mmLeft = 20373
          mmTop = 3969
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
          LayerName = Foreground15
        end
        object ppLine112: TppLine
          DesignLayer = ppDesignLayer16
          UserName = 'Line112'
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 8731
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground15
        end
      end
      object ppGroupFooterBand19: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppLabel29: TppLabel
          DesignLayer = ppDesignLayer16
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Total Por Se'#231#227'o->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 83079
          mmTop = 1058
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
          LayerName = Foreground15
        end
        object ppDBCalc35: TppDBCalc
          DesignLayer = ppDesignLayer16
          UserName = 'DBCalc35'
          DataField = 'total_venda'
          DataPipeline = pip_TabelaSecao
          DisplayFormat = '#,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_TabelaSecao'
          mmHeight = 3704
          mmLeft = 180446
          mmTop = 1058
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
          LayerName = Foreground15
        end
        object ppDBCalc37: TppDBCalc
          DesignLayer = ppDesignLayer16
          UserName = 'DBCalc37'
          DataField = 'pro_estoque'
          DataPipeline = pip_TabelaSecao
          DisplayFormat = '#,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_TabelaSecao'
          mmHeight = 3704
          mmLeft = 113506
          mmTop = 1058
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
          LayerName = Foreground15
        end
      end
    end
    object ppDesignLayers16: TppDesignLayers
      object ppDesignLayer16: TppDesignLayer
        UserName = 'Foreground15'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList13: TppParameterList
    end
  end
  object pip_TabelaSecao: TppDBPipeline
    DataSource = Dts_TabelaSecao
    UserName = 'pip_TabelaSecao'
    Left = 115
    Top = 236
  end
  object pip_AuxiliaInventario: TppDBPipeline
    DataSource = Dts_AuxiliaInventario
    UserName = 'pip_AuxiliaInventario'
    Left = 805
    Top = 234
  end
  object pipAliq: TppDBPipeline
    DataSource = dtsAliq
    UserName = 'pipAliq'
    Left = 732
    Top = 233
  end
  object pipGeralDisc: TppDBPipeline
    DataSource = dtsGeralDisc
    UserName = 'pipGeralDisc'
    Left = 360
    Top = 50
  end
  object pipCombustivel: TppDBPipeline
    DataSource = Dts_combustivel
    UserName = 'pipCombustivel'
    Left = 678
    Top = 235
  end
  object pipTotais: TppDBPipeline
    DataSource = dtsTotais
    UserName = 'pipTotais'
    Left = 872
    Top = 51
  end
  object ppTotais: TppReport
    AutoStop = False
    DataPipeline = pipTotais
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 871
    Top = 9
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipTotais'
    object ppTitleBand1: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto - Totais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 58473
        BandType = 0
        LayerName = Foreground16
      end
      object ppDBText63: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText63'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 794
        mmWidth = 53446
        BandType = 0
        LayerName = Foreground16
      end
      object ppLine68: TppLine
        DesignLayer = ppDesignLayer17
        UserName = 'Line68'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 529
        mmTop = 9525
        mmWidth = 202407
        BandType = 0
        LayerName = Foreground16
      end
      object ppLine69: TppLine
        DesignLayer = ppDesignLayer17
        UserName = 'Line69'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 529
        mmTop = 15610
        mmWidth = 202407
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Margem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155046
        mmTop = 11113
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Pr.Vista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 11113
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel110: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label110'
        AutoSize = False
        Caption = 'Referencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 11113
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Pr.Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 11113
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Aliq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 197115
        mmTop = 11113
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Descricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 32544
        mmTop = 11113
        mmWidth = 58208
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label5'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 11113
        mmWidth = 5821
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Qtde UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 91017
        mmTop = 11113
        mmWidth = 11377
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109273
        mmTop = 11113
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Est. Min.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 11113
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground16
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer17
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Pr.Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 11113
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground16
      end
      object ppSystemVariable5: TppSystemVariable
        DesignLayer = ppDesignLayer17
        UserName = 'SystemVariable5'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground16
      end
      object ppSystemVariable6: TppSystemVariable
        DesignLayer = ppDesignLayer17
        UserName = 'SystemVariable301'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 183621
        mmTop = 794
        mmWidth = 14520
        BandType = 0
        LayerName = Foreground16
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText3'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipTotais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 31750
        mmTop = 265
        mmWidth = 58738
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText4'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pipTotais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 102659
        mmTop = 265
        mmWidth = 5821
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText5'
        DataField = 'PRO_QUANT_UNID'
        DataPipeline = pipTotais
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 92075
        mmTop = 265
        mmWidth = 8202
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText6'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pipTotais
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 109802
        mmTop = 265
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText7'
        DataField = 'PRO_ESTOQMIN'
        DataPipeline = pipTotais
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 125413
        mmTop = 265
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText8'
        DataField = 'PRO_VLRCUSTO'
        DataPipeline = pipTotais
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 140229
        mmTop = 265
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText9'
        DataField = 'PRO_MARGEM'
        DataPipeline = pipTotais
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 154252
        mmTop = 265
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText10'
        DataField = 'PRO_VLRVENDA'
        DataPipeline = pipTotais
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 168275
        mmTop = 265
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText11'
        DataField = 'PRO_VLRPRAZO'
        DataPipeline = pipTotais
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 182827
        mmTop = 265
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText1'
        DataField = 'NAF_ALIQUOTA'
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 196321
        mmTop = 265
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground16
      end
      object ppDBText79: TppDBText
        DesignLayer = ppDesignLayer17
        UserName = 'DBText79'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipTotais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipTotais'
        mmHeight = 3260
        mmLeft = 265
        mmTop = 265
        mmWidth = 30956
        BandType = 4
        LayerName = Foreground16
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup10: TppGroup
      BreakName = 'dep_descricao'
      DataPipeline = pipTotais
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipTotais'
      NewFile = False
      object ppGroupHeaderBand10: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLine1: TppLine
          DesignLayer = ppDesignLayer17
          UserName = 'Line1'
          Weight = 0.500000000000000000
          mmHeight = 1058
          mmLeft = 1323
          mmTop = 8467
          mmWidth = 199761
          BandType = 3
          GroupNo = 0
          LayerName = Foreground16
        end
        object ppDBText82: TppDBText
          DesignLayer = ppDesignLayer17
          UserName = 'DBText82'
          DataField = 'dep_descricao'
          DataPipeline = pipTotais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipTotais'
          mmHeight = 3704
          mmLeft = 43127
          mmTop = 3969
          mmWidth = 65088
          BandType = 3
          GroupNo = 0
          LayerName = Foreground16
        end
        object ppLabel113: TppLabel
          DesignLayer = ppDesignLayer17
          UserName = 'Label113'
          AutoSize = False
          Caption = 'Departamento/Se'#231#227'o ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 3969
          mmWidth = 39952
          BandType = 3
          GroupNo = 0
          LayerName = Foreground16
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers17: TppDesignLayers
      object ppDesignLayer17: TppDesignLayer
        UserName = 'Foreground16'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryTotais: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dep_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select dep_descricao, pro_ean1, pro_referencia, pro_descricao, p' +
        'ro_unidade, pro_quant_unid, pro_estoque, pro_estoqmin,'
      
        '       pro_vlrcusto, pro_margem, pro_vlrvenda, pro_vlrprazo, NAF' +
        '_ALIQUOTA'
      '  from produto p,  NATUREZA_FISCAL n, DEPARTAMENTO d'
      'where p.NAF_CODFISCAL = n.NAF_CODFISCAL'
      'and p.dep_id = d.dep_id and'
      '           d.dep_id = :dep_id'
      '')
    Left = 872
    Top = 95
    object qryTotaispro_ean1: TStringField
      FieldName = 'pro_ean1'
    end
    object qryTotaispro_referencia: TStringField
      FieldName = 'pro_referencia'
    end
    object qryTotaispro_descricao: TStringField
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qryTotaispro_unidade: TStringField
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qryTotaispro_quant_unid: TBCDField
      FieldName = 'pro_quant_unid'
      Precision = 15
      Size = 3
    end
    object qryTotaispro_estoque: TBCDField
      FieldName = 'pro_estoque'
      Precision = 15
      Size = 3
    end
    object qryTotaispro_estoqmin: TBCDField
      FieldName = 'pro_estoqmin'
      Precision = 15
      Size = 3
    end
    object qryTotaispro_vlrcusto: TBCDField
      FieldName = 'pro_vlrcusto'
      Precision = 15
      Size = 3
    end
    object qryTotaispro_margem: TBCDField
      FieldName = 'pro_margem'
      Precision = 15
      Size = 3
    end
    object qryTotaispro_vlrvenda: TBCDField
      FieldName = 'pro_vlrvenda'
      Precision = 15
      Size = 3
    end
    object qryTotaispro_vlrprazo: TBCDField
      FieldName = 'pro_vlrprazo'
      Precision = 15
      Size = 3
    end
    object qryTotaisNAF_ALIQUOTA: TBCDField
      FieldName = 'NAF_ALIQUOTA'
      Precision = 15
      Size = 3
    end
    object qryTotaisdep_descricao: TStringField
      FieldName = 'dep_descricao'
      Size = 90
    end
  end
  object qry_combustivel: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      #9'T.TAN_CODIGO, T.COM_CODIGO, isnull((select top 1 MED_QTDE from '
      
        #9'MEDICAO where TAN_CODIGO = T.TAN_CODIGO order by MED_DATA desc)' +
        ',0) as ESTOQUE, '
      
        #9'C.COM_PRECUSTO, C.COM_DESCRICAO, (C.COM_PRECUSTO * isnull((sele' +
        'ct top 1 MED_QTDE from '
      
        #9'MEDICAO where TAN_CODIGO = T.TAN_CODIGO order by MED_DATA desc)' +
        ',0)) as CUSTO'
      'from '
      #9'TANQUES T '
      'inner join '
      #9'COMBUSTIVEL C ON T.COM_CODIGO=C.COM_CODIGO'
      'order by '
      #9'T.TAN_CODIGO, T.COM_CODIGO, C.COM_PRECUSTO, C.COM_DESCRICAO')
    Left = 679
    Top = 279
    object qry_combustiveltan_codigo: TIntegerField
      FieldName = 'tan_codigo'
    end
    object qry_combustivelcom_codigo: TIntegerField
      FieldName = 'com_codigo'
    end
    object qry_combustivelESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      ReadOnly = True
      Precision = 15
      Size = 3
    end
    object qry_combustivelcom_precusto: TBCDField
      FieldName = 'com_precusto'
      Precision = 13
    end
    object qry_combustivelcom_descricao: TStringField
      FieldName = 'com_descricao'
      Size = 60
    end
    object qry_combustivelcusto: TBCDField
      FieldName = 'custo'
      ReadOnly = True
      currency = True
      Precision = 32
      Size = 8
    end
  end
  object qryExtratoEnt: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'PRO_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'DT_INICIAL'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DT_FINAL'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DEP_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select'
      #9'PRO_ID, PRO_EAN, PRO_REFERENCIA, PRO_DESCRICAO,'
      #9'PRO_ESTOQUE, PRO_UNIDADE, DATA_ENTRADA,'
      #9'QTD_ENTRADA, VLR_ENTRADA, FOR_ID, FOR_NOME,'
      #9'PRO_DEPOSITO'
      'from'
      #9'VW_EXTRATO_PRODUTO_ENT'
      'where'
      #9'CONVERT(VARCHAR(10), PRO_ID) LIKE :PRO_ID and'
      #9'DATA_ENTRADA between :DT_INICIAL and :DT_FINAL and'
      #9'CONVERT(VARCHAR(10), DEP_ID) LIKE :DEP_ID'
      'order by'
      #9'DATA_ENTRADA')
    Left = 528
    Top = 277
    object qryExtratoEntPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
    end
    object qryExtratoEntPRO_EAN: TStringField
      FieldName = 'PRO_EAN'
    end
    object qryExtratoEntPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
    end
    object qryExtratoEntPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 120
    end
    object qryExtratoEntPRO_ESTOQUE: TBCDField
      FieldName = 'PRO_ESTOQUE'
      Precision = 15
      Size = 3
    end
    object qryExtratoEntPRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
      Size = 10
    end
    object qryExtratoEntDATA_ENTRADA: TDateTimeField
      FieldName = 'DATA_ENTRADA'
    end
    object qryExtratoEntQTD_ENTRADA: TBCDField
      FieldName = 'QTD_ENTRADA'
      Precision = 15
      Size = 3
    end
    object qryExtratoEntVLR_ENTRADA: TBCDField
      FieldName = 'VLR_ENTRADA'
      Precision = 15
      Size = 3
    end
    object qryExtratoEntFOR_ID: TStringField
      FieldName = 'FOR_ID'
      Size = 10
    end
    object qryExtratoEntFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      Size = 40
    end
    object qryExtratoEntPRO_DEPOSITO: TBCDField
      FieldName = 'PRO_DEPOSITO'
      Precision = 15
      Size = 3
    end
  end
  object qryAliq: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dep_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'naf_codfiscal'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'cst_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select '
      '    dep_descricao, '
      '    pro_ean1, '
      '    pro_referencia, '
      '    pro_descricao, '
      '    pro_unidade, '
      '    cst_id, '
      '    pro_estoque, '
      '    pro_vlrcusto, '
      '    pro_vlrmedio,'
      '    (pro_estoque * pro_vlrcusto) as Custo,'
      '    (pro_estoque * pro_vlrmedio) as Medio, '
      '    naf_aliquota,'
      '    naf_descricao'
      'from '
      '   produto p, departamento d, natureza_fiscal f'
      'where '
      '  d.dep_id = p.dep_id and'
      '  ((convert(varchar(5),d.dep_id) like :dep_id)) and'
      '  f.naf_codfiscal = p.naf_codfiscal and'
      
        '  ((convert(varchar(10),f.naf_codfiscal) like :naf_codfiscal)) a' +
        'nd'
      '  ((convert(varchar(10),cst_id) like :cst_id)) and'
      '  p.pro_ativo = '#39'A'#39' and'
      '  p.pro_estoque > 0'
      'Order by naf_aliquota, pro_descricao')
    Left = 732
    Top = 276
    object qryAliqdep_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Departamento'
      DisplayWidth = 30
      FieldName = 'dep_descricao'
      Size = 90
    end
    object qryAliqpro_ean1: TStringField
      DisplayLabel = 'EAN'
      FieldName = 'pro_ean1'
    end
    object qryAliqpro_referencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'pro_referencia'
    end
    object qryAliqpro_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      DisplayWidth = 70
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qryAliqpro_unidade: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 10
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qryAliqpro_estoque: TBCDField
      DisplayLabel = 'Estoque'
      FieldName = 'pro_estoque'
      EditFormat = '#.###0,000'
      Precision = 15
      Size = 3
    end
    object qryAliqpro_vlrcusto: TBCDField
      DisplayLabel = 'Valor Custo'
      FieldName = 'pro_vlrcusto'
      EditFormat = '#.##0,00'
      Precision = 15
      Size = 3
    end
    object qryAliqpro_vlrmedio: TBCDField
      DisplayLabel = 'Valor Custo M'#233'dio'
      FieldName = 'pro_vlrmedio'
      EditFormat = '##.#0,00'
      Precision = 15
      Size = 3
    end
    object qryAliqCusto: TBCDField
      FieldName = 'Custo'
      ReadOnly = True
      EditFormat = '#.##0,00'
      Precision = 31
      Size = 6
    end
    object qryAliqMedio: TBCDField
      FieldName = 'Medio'
      ReadOnly = True
      EditFormat = '#.##0,00'
      Precision = 31
      Size = 6
    end
    object qryAliqnaf_aliquota: TBCDField
      DisplayLabel = 'Al'#237'quota'
      FieldName = 'naf_aliquota'
      EditFormat = '#.##0,00'
      Precision = 15
      Size = 3
    end
    object qryAliqnaf_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Al'#237'quota'
      FieldName = 'naf_descricao'
      Size = 90
    end
    object qryAliqcst_id: TStringField
      DisplayLabel = 'CST/COSN'
      FieldName = 'cst_id'
      Size = 10
    end
  end
  object qry_AuxiliaInvetario: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'PRO_ATIVO'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DT'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'for_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select '
      
        #9'P.PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_UNIDADE,PRO_VLRCUS' +
        'TO,'
      #9'(PRO_ESTOQUE - '
      #9'SUM(SAIDA_DIMINUI) + SUM(SAIDA_AUMENTA) - '
      #9'SUM(ENTRADA_DIMINUI) + SUM(ENTRADA_AUMENTA) - '
      #9'SUM(MOVTO_DIMINUI) + SUM(MOVTO_AUMENTA) + '
      #9'SUM(SERIED_AUMENTA)+ SUM(DETALHE_AUMENTA) - '
      #9'SUM(PRODUCAO_DIMINUI) + SUM(PRODUCAO_AUMENTA)) AS PRO_ESTOQUE,'
      #9'((PRO_ESTOQUE - '
      #9'SUM(SAIDA_DIMINUI) + SUM(SAIDA_AUMENTA) - '
      #9'SUM(ENTRADA_DIMINUI) + SUM(ENTRADA_AUMENTA) - '
      #9'SUM(MOVTO_DIMINUI) + SUM(MOVTO_AUMENTA) + '
      #9'SUM(SERIED_AUMENTA)+ SUM(DETALHE_AUMENTA) - '
      
        #9'SUM(PRODUCAO_DIMINUI) + SUM(PRODUCAO_AUMENTA)) * PRO_VLRCUSTO) ' +
        'as TOTAL'
      ' from'
      #9'VW_ESTOQUE_DATA v'
      ' inner join'
      
        #9'PRODUTO P on (v.pro_id = p.pro_id) and PRO_ATIVO like :PRO_ATIV' +
        'O'
      ' where'
      #9'dt_movto >= :DT and '
      '    convert(varchar(10), p.for_id) like :FOR_ID'
      ' GROUP BY'
      
        #9'P.PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_ESTOQUE, PRO_UNIDA' +
        'DE,PRO_VLRCUSTO'
      ' HAVING'
      #9'(PRO_ESTOQUE - '
      #9'SUM(SAIDA_DIMINUI) + SUM(SAIDA_AUMENTA) - '
      #9'SUM(ENTRADA_DIMINUI) + SUM(ENTRADA_AUMENTA) - '
      #9'SUM(MOVTO_DIMINUI) + SUM(MOVTO_AUMENTA) + '
      #9'SUM(SERIED_AUMENTA)+ SUM(DETALHE_AUMENTA) - '
      #9'SUM(PRODUCAO_DIMINUI) + SUM(PRODUCAO_AUMENTA)) > 0')
    Left = 807
    Top = 276
    object qry_AuxiliaInvetarioPRO_ID: TAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'PRO_ID'
      ReadOnly = True
    end
    object qry_AuxiliaInvetarioPRO_REFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      DisplayWidth = 15
      FieldName = 'PRO_REFERENCIA'
    end
    object qry_AuxiliaInvetarioPRO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 55
      FieldName = 'PRO_DESCRICAO'
      Size = 120
    end
    object qry_AuxiliaInvetarioPRO_UNIDADE: TStringField
      Alignment = taCenter
      DisplayLabel = 'Unidade'
      DisplayWidth = 8
      FieldName = 'PRO_UNIDADE'
      Size = 10
    end
    object qry_AuxiliaInvetarioPRO_ESTOQUE: TFMTBCDField
      DisplayLabel = 'Estoque'
      DisplayWidth = 12
      FieldName = 'PRO_ESTOQUE'
      ReadOnly = True
      DisplayFormat = '#.###0.000'
      Precision = 38
      Size = 3
    end
    object qry_AuxiliaInvetarioPRO_VLRCUSTO: TBCDField
      DisplayLabel = 'Custo'
      DisplayWidth = 12
      FieldName = 'PRO_VLRCUSTO'
      DisplayFormat = '#.##0.00'
      Precision = 15
      Size = 3
    end
    object qry_AuxiliaInvetarioTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      DisplayWidth = 12
      FieldName = 'TOTAL'
      ReadOnly = True
      DisplayFormat = '#.##0.00'
      Precision = 38
      Size = 6
    end
  end
  object qry_TabelaSecao: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'sec_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'select sec_descricao, pro_ean1, pro_referencia, pro_descricao, p' +
        'ro_unidade,'
      'pro_vlrvenda, pro_vlrprazo, pro_vlrcusto, pro_estoque,'
      '(pro_estoque * pro_vlrvenda) as total_venda,'
      '(pro_estoque * pro_vlrcusto) as total_custo'
      'from produto p, secao s'
      'where s.sec_id = p.dep_id and'
      '           convert(varchar(10), s.sec_id) like :sec_id'
      'Order by sec_descricao, pro_descricao')
    Left = 115
    Top = 278
    object qry_TabelaSecaosec_descricao: TStringField
      FieldName = 'sec_descricao'
    end
    object qry_TabelaSecaopro_ean1: TStringField
      FieldName = 'pro_ean1'
    end
    object qry_TabelaSecaopro_referencia: TStringField
      FieldName = 'pro_referencia'
    end
    object qry_TabelaSecaopro_descricao: TStringField
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qry_TabelaSecaopro_unidade: TStringField
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qry_TabelaSecaopro_vlrvenda: TBCDField
      FieldName = 'pro_vlrvenda'
      Precision = 15
      Size = 3
    end
    object qry_TabelaSecaopro_vlrprazo: TBCDField
      FieldName = 'pro_vlrprazo'
      Precision = 15
      Size = 3
    end
    object qry_TabelaSecaopro_estoque: TBCDField
      FieldName = 'pro_estoque'
      Precision = 15
      Size = 3
    end
    object qry_TabelaSecaototal_venda: TBCDField
      FieldName = 'total_venda'
      ReadOnly = True
      Precision = 31
      Size = 6
    end
    object qry_TabelaSecaopro_vlrcusto: TBCDField
      FieldName = 'pro_vlrcusto'
      Precision = 15
      Size = 3
    end
    object qry_TabelaSecaototal_custo: TBCDField
      FieldName = 'total_custo'
      ReadOnly = True
      Precision = 31
      Size = 6
    end
  end
  object Dts_TabelaSecao: TDataSource
    DataSet = qry_TabelaSecao
    Left = 116
    Top = 320
  end
  object Dts_AuxiliaInventario: TDataSource
    DataSet = qry_AuxiliaInvetario
    Left = 810
    Top = 321
  end
  object dtsAliq: TDataSource
    DataSet = qryAliq
    Left = 732
    Top = 321
  end
  object dsExtratoEnt: TDataSource
    DataSet = qryExtratoEnt
    Left = 529
    Top = 322
  end
  object dtsGeralDisc: TDataSource
    DataSet = qryGeralDisc
    Left = 363
    Top = 138
  end
  object Dts_combustivel: TDataSource
    DataSet = qry_combustivel
    Left = 681
    Top = 323
  end
  object dtsTotais: TDataSource
    DataSet = qryTotais
    Left = 873
    Top = 140
  end
  object ppMovimentacao: TppReport
    AutoStop = False
    DataPipeline = pipMovimentacao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 210
    Top = 192
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipMovimentacao'
    object ppHeaderBand12: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabel34: TppLabel
        DesignLayer = ppDesignLayer18
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Relat'#243'rio Movimenta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 58208
        BandType = 0
        LayerName = Foreground17
      end
      object ppDBText96: TppDBText
        DesignLayer = ppDesignLayer18
        UserName = 'DBText68'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 57870
        BandType = 0
        LayerName = Foreground17
      end
      object ppLabel54: TppLabel
        DesignLayer = ppDesignLayer18
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 11377
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground17
      end
      object ppLabel67: TppLabel
        DesignLayer = ppDesignLayer18
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 11377
        mmWidth = 88371
        BandType = 0
        LayerName = Foreground17
      end
      object ppLabel68: TppLabel
        DesignLayer = ppDesignLayer18
        UserName = 'Label17'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 125677
        mmTop = 11377
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground17
      end
      object ppLabel81: TppLabel
        DesignLayer = ppDesignLayer18
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Qtde Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 134673
        mmTop = 11377
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground17
      end
      object ppLabel82: TppLabel
        DesignLayer = ppDesignLayer18
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Qtde Saida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 11377
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground17
      end
      object ppLine49: TppLine
        DesignLayer = ppDesignLayer18
        UserName = 'Line33'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1323
        mmLeft = 794
        mmTop = 15875
        mmWidth = 205317
        BandType = 0
        LayerName = Foreground17
      end
      object ppLine48: TppLine
        DesignLayer = ppDesignLayer18
        UserName = 'Line32'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 9790
        mmWidth = 202671
        BandType = 0
        LayerName = Foreground17
      end
      object ppSystemVariable25: TppSystemVariable
        DesignLayer = ppDesignLayer18
        UserName = 'SystemVariable25'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground17
      end
      object ppSystemVariable26: TppSystemVariable
        DesignLayer = ppDesignLayer18
        UserName = 'SystemVariable26'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground17
      end
    end
    object ppDetailBand13: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText98: TppDBText
        DesignLayer = ppDesignLayer18
        UserName = 'DBText14'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipMovimentacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipMovimentacao'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground17
      end
      object ppDBText99: TppDBText
        DesignLayer = ppDesignLayer18
        UserName = 'DBText15'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipMovimentacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipMovimentacao'
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 265
        mmWidth = 100542
        BandType = 4
        LayerName = Foreground17
      end
      object ppDBText105: TppDBText
        DesignLayer = ppDesignLayer18
        UserName = 'DBText16'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pipMovimentacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipMovimentacao'
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 265
        mmWidth = 7673
        BandType = 4
        LayerName = Foreground17
      end
      object ppDBText111: TppDBText
        DesignLayer = ppDesignLayer18
        UserName = 'DBText17'
        DataField = 'QTDE_ENTRADA'
        DataPipeline = pipMovimentacao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipMovimentacao'
        mmHeight = 3704
        mmLeft = 136525
        mmTop = 265
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground17
      end
      object ppDBText113: TppDBText
        DesignLayer = ppDesignLayer18
        UserName = 'DBText18'
        DataField = 'QTDE_SAIDA'
        DataPipeline = pipMovimentacao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipMovimentacao'
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 265
        mmWidth = 18521
        BandType = 4
        LayerName = Foreground17
      end
    end
    object ppFooterBand11: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup11: TppGroup
      BreakName = 'dep_descricao'
      DataPipeline = pipMovimentacao
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipMovimentacao'
      NewFile = False
      object ppGroupHeaderBand11: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine47: TppLine
          DesignLayer = ppDesignLayer18
          UserName = 'Line6'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 1323
          mmTop = 11377
          mmWidth = 205052
          BandType = 3
          GroupNo = 0
          LayerName = Foreground17
        end
        object ppDBText115: TppDBText
          DesignLayer = ppDesignLayer18
          UserName = 'DBText12'
          DataField = 'DEP_DESCRICAO'
          DataPipeline = pipMovimentacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipMovimentacao'
          mmHeight = 3704
          mmLeft = 32279
          mmTop = 6350
          mmWidth = 73290
          BandType = 3
          GroupNo = 0
          LayerName = Foreground17
        end
        object ppLabel85: TppLabel
          DesignLayer = ppDesignLayer18
          UserName = 'Label30'
          AutoSize = False
          Caption = 'Departamento ----> '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 6350
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
          LayerName = Foreground17
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLabel88: TppLabel
          DesignLayer = ppDesignLayer18
          UserName = 'Label88'
          Caption = 'Totais ----->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 115359
          mmTop = 1323
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
          LayerName = Foreground17
        end
        object ppDBCalc9: TppDBCalc
          DesignLayer = ppDesignLayer18
          UserName = 'DBCalc9'
          DataField = 'QTDE_ENTRADA'
          DataPipeline = pipMovimentacao
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipMovimentacao'
          mmHeight = 3704
          mmLeft = 137054
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground17
        end
        object ppDBCalc11: TppDBCalc
          DesignLayer = ppDesignLayer18
          UserName = 'DBCalc101'
          DataField = 'QTDE_SAIDA'
          DataPipeline = pipMovimentacao
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipMovimentacao'
          mmHeight = 3704
          mmLeft = 160602
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground17
        end
        object ppLine37: TppLine
          DesignLayer = ppDesignLayer18
          UserName = 'Line7'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 4763
          mmTop = 265
          mmWidth = 205317
          BandType = 5
          GroupNo = 0
          LayerName = Foreground17
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'sec_descricao'
      DataPipeline = pipMovimentacao
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipMovimentacao'
      NewFile = False
      object ppGroupHeaderBand6: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBText24: TppDBText
          DesignLayer = ppDesignLayer18
          UserName = 'DBText1'
          DataField = 'sec_descricao'
          DataPipeline = pipMovimentacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipMovimentacao'
          mmHeight = 3704
          mmLeft = 32015
          mmTop = 1588
          mmWidth = 73290
          BandType = 3
          GroupNo = 1
          LayerName = Foreground17
        end
        object ppLabel15: TppLabel
          DesignLayer = ppDesignLayer18
          UserName = 'Label301'
          AutoSize = False
          Caption = 'Se'#231#227'o ----> '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 1588
          mmWidth = 29898
          BandType = 3
          GroupNo = 1
          LayerName = Foreground17
        end
        object ppLine6: TppLine
          DesignLayer = ppDesignLayer18
          UserName = 'Line1'
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 6085
          mmWidth = 205317
          BandType = 3
          GroupNo = 1
          LayerName = Foreground17
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers18: TppDesignLayers
      object ppDesignLayer18: TppDesignLayer
        UserName = 'Foreground17'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList8: TppParameterList
    end
  end
  object qryMovimentacao: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dtini'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtfim'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dep_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end>
    SQL.Strings = (
      'select p.sec_id, sec_descricao, p.dep_id, dep_descricao, '
      ' v.pro_id, p.pro_referencia, p.pro_descricao, pro_unidade,'
      'sum(qtde_entrada) as QTDE_ENTRADA,'
      'sum(qtde_saida) as QTDE_SAIDA'
      'from VW_PRODUTO_EXTRATO v'
      'inner join produto p on (p.pro_id = v.pro_id)'
      'inner join departamento d on (p.dep_id = d.dep_id)'
      'left join secao s on (p.sec_id = s.sec_id)'
      'where '
      '    data between :dtini and :dtfim and'
      '    convert(varchar(5),d.dep_id) like :dep_id'
      
        'group by p.sec_id, sec_descricao, v.pro_id, p.dep_id, dep_descri' +
        'cao, '
      '         p.pro_referencia, p.pro_descricao, pro_unidade'
      'Order by dep_descricao, p.pro_descricao')
    Left = 208
    Top = 278
    object qryMovimentacaosec_id: TIntegerField
      FieldName = 'sec_id'
      Visible = False
    end
    object qryMovimentacaosec_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Se'#231#227'o'
      FieldName = 'sec_descricao'
    end
    object qryMovimentacaodep_id: TIntegerField
      FieldName = 'dep_id'
      Visible = False
    end
    object qryMovimentacaodep_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Departamento'
      DisplayWidth = 20
      FieldName = 'dep_descricao'
      Size = 90
    end
    object qryMovimentacaopro_id: TIntegerField
      FieldName = 'pro_id'
      Visible = False
    end
    object qryMovimentacaopro_referencia: TStringField
      DisplayLabel = 'Referencia'
      DisplayWidth = 14
      FieldName = 'pro_referencia'
    end
    object qryMovimentacaopro_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      DisplayWidth = 50
      FieldName = 'pro_descricao'
      Size = 120
    end
    object qryMovimentacaopro_unidade: TStringField
      DisplayLabel = 'UN'
      DisplayWidth = 5
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qryMovimentacaoQTDE_ENTRADA: TFMTBCDField
      DisplayLabel = 'Qtde Entrada'
      DisplayWidth = 12
      FieldName = 'QTDE_ENTRADA'
      ReadOnly = True
      Precision = 38
      Size = 3
    end
    object qryMovimentacaoQTDE_SAIDA: TFMTBCDField
      DisplayLabel = 'Qtde Saida'
      DisplayWidth = 12
      FieldName = 'QTDE_SAIDA'
      ReadOnly = True
      Precision = 38
      Size = 3
    end
  end
  object DtsMovimentacao: TDataSource
    DataSet = qryMovimentacao
    Left = 208
    Top = 320
  end
  object Dts_AtivoInativo: TDataSource
    DataSet = qry_AtivoInativo
    Left = 298
    Top = 320
  end
  object qry_AtivoInativo: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pro_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from produto where (convert(varchar(5),pro_id) like :pr' +
        'o_id)')
    Left = 298
    Top = 278
    object qry_AtivoInativoPRO_ID: TAutoIncField
      FieldName = 'PRO_ID'
      ReadOnly = True
    end
    object qry_AtivoInativoPRO_EAN1: TStringField
      FieldName = 'PRO_EAN1'
    end
    object qry_AtivoInativoPRO_EAN2: TStringField
      FieldName = 'PRO_EAN2'
    end
    object qry_AtivoInativoPRO_EAN3: TStringField
      FieldName = 'PRO_EAN3'
    end
    object qry_AtivoInativoPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
    end
    object qry_AtivoInativoCST_ID: TStringField
      FieldName = 'CST_ID'
      Size = 10
    end
    object qry_AtivoInativoNAF_CODFISCAL: TStringField
      FieldName = 'NAF_CODFISCAL'
      Size = 10
    end
    object qry_AtivoInativoDEP_ID: TIntegerField
      FieldName = 'DEP_ID'
    end
    object qry_AtivoInativoPRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
      Size = 10
    end
    object qry_AtivoInativoPRO_QUANT_UNID: TBCDField
      FieldName = 'PRO_QUANT_UNID'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_ESTOQUE: TBCDField
      FieldName = 'PRO_ESTOQUE'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_ESTOQMIN: TBCDField
      FieldName = 'PRO_ESTOQMIN'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRCUSTO: TBCDField
      FieldName = 'PRO_VLRCUSTO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRPREPOS: TBCDField
      FieldName = 'PRO_VLRPREPOS'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRMEDIO: TBCDField
      FieldName = 'PRO_VLRMEDIO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRPRAZO: TBCDField
      FieldName = 'PRO_VLRPRAZO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_ULTCOMP: TDateTimeField
      FieldName = 'PRO_ULTCOMP'
    end
    object qry_AtivoInativoPRO_ULTVENDA: TDateTimeField
      FieldName = 'PRO_ULTVENDA'
    end
    object qry_AtivoInativoPRO_QTDEULTCOM: TBCDField
      FieldName = 'PRO_QTDEULTCOM'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_DTALTPRECO: TDateTimeField
      FieldName = 'PRO_DTALTPRECO'
    end
    object qry_AtivoInativoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 90
    end
    object qry_AtivoInativoPRO_MARGEM: TBCDField
      FieldName = 'PRO_MARGEM'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_COMISSAO: TBCDField
      FieldName = 'PRO_COMISSAO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRVENDA: TBCDField
      FieldName = 'PRO_VLRVENDA'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_OBSERVACOES: TStringField
      FieldName = 'PRO_OBSERVACOES'
      Size = 254
    end
    object qry_AtivoInativoPRO_BALANCA: TStringField
      FieldName = 'PRO_BALANCA'
      Size = 1
    end
    object qry_AtivoInativoPRO_CODBALANCA: TStringField
      FieldName = 'PRO_CODBALANCA'
      Size = 10
    end
    object qry_AtivoInativoPRO_RESUMIDO: TStringField
      FieldName = 'PRO_RESUMIDO'
      Size = 30
    end
    object qry_AtivoInativoPRO_ITA: TIntegerField
      FieldName = 'PRO_ITA'
    end
    object qry_AtivoInativoPRO_VALIDADE: TDateTimeField
      FieldName = 'PRO_VALIDADE'
    end
    object qry_AtivoInativoPRO_ESTOQUE_DEP: TBCDField
      FieldName = 'PRO_ESTOQUE_DEP'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRCUSTO_DEP: TBCDField
      FieldName = 'PRO_VLRCUSTO_DEP'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_ATIVO: TStringField
      FieldName = 'PRO_ATIVO'
      Size = 1
    end
    object qry_AtivoInativoPRO_CUSTONOTA: TBCDField
      FieldName = 'PRO_CUSTONOTA'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRATACADO: TBCDField
      FieldName = 'PRO_VLRATACADO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_MARGEMPRAZO: TBCDField
      FieldName = 'PRO_MARGEMPRAZO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRCALCSUBST: TBCDField
      FieldName = 'PRO_VLRCALCSUBST'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_VLRALIQSUBST: TBCDField
      FieldName = 'PRO_VLRALIQSUBST'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativopro_icmscompra: TBCDField
      FieldName = 'pro_icmscompra'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativopro_icmsvenda: TBCDField
      FieldName = 'pro_icmsvenda'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_PESOLIQUIDO: TBCDField
      FieldName = 'PRO_PESOLIQUIDO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_PESOBRUTO: TBCDField
      FieldName = 'PRO_PESOBRUTO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_CODIGONBM: TStringField
      FieldName = 'PRO_CODIGONBM'
      Size = 10
    end
    object qry_AtivoInativopro_vlrmedioant: TBCDField
      FieldName = 'pro_vlrmedioant'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativoPRO_ORIGEM: TIntegerField
      FieldName = 'PRO_ORIGEM'
    end
    object qry_AtivoInativoCFS_ID: TStringField
      FieldName = 'CFS_ID'
      Size = 1
    end
    object qry_AtivoInativopro_descmax: TBCDField
      FieldName = 'pro_descmax'
      Precision = 5
      Size = 3
    end
    object qry_AtivoInativoPRO_DATACADASTRO: TDateTimeField
      FieldName = 'PRO_DATACADASTRO'
    end
    object qry_AtivoInativoLAB_ID: TIntegerField
      FieldName = 'LAB_ID'
    end
    object qry_AtivoInativoPRO_VLRMINIMO: TBCDField
      FieldName = 'PRO_VLRMINIMO'
      Precision = 15
      Size = 3
    end
    object qry_AtivoInativopro_gaveta: TStringField
      FieldName = 'pro_gaveta'
      Size = 10
    end
    object qry_AtivoInativoFOR_ID: TIntegerField
      FieldName = 'FOR_ID'
    end
  end
  object pipAtivoInativo: TppDBPipeline
    DataSource = Dts_AtivoInativo
    UserName = 'pipAtivoInativo'
    Left = 299
    Top = 236
  end
  object ppAtivoInativo: TppReport
    AutoStop = False
    DataPipeline = pipAtivoInativo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 299
    Top = 192
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipAtivoInativo'
    object ppTitleBand14: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand16: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel180: TppLabel
        DesignLayer = ppDesignLayer19
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Relat'#243'rio de Estoque por Produto - Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5556
        mmWidth = 67204
        BandType = 0
        LayerName = Foreground18
      end
      object ppDBText144: TppDBText
        DesignLayer = ppDesignLayer19
        UserName = 'DBText71'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 60791
        BandType = 0
        LayerName = Foreground18
      end
      object ppLine93: TppLine
        DesignLayer = ppDesignLayer19
        UserName = 'Line1'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 794
        mmTop = 10848
        mmWidth = 199761
        BandType = 0
        LayerName = Foreground18
      end
      object ppLine94: TppLine
        DesignLayer = ppDesignLayer19
        UserName = 'Line2'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 794
        mmTop = 11377
        mmWidth = 199761
        BandType = 0
        LayerName = Foreground18
      end
      object ppLabel183: TppLabel
        DesignLayer = ppDesignLayer19
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 12435
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground18
      end
      object ppLabel184: TppLabel
        DesignLayer = ppDesignLayer19
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 12435
        mmWidth = 76729
        BandType = 0
        LayerName = Foreground18
      end
      object ppLabel185: TppLabel
        DesignLayer = ppDesignLayer19
        UserName = 'Label3'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 121709
        mmTop = 12435
        mmWidth = 5821
        BandType = 0
        LayerName = Foreground18
      end
      object ppLabel186: TppLabel
        DesignLayer = ppDesignLayer19
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Qtde/Unid'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 97896
        mmTop = 12435
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground18
      end
      object ppLabel187: TppLabel
        DesignLayer = ppDesignLayer19
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Qtde Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 12435
        mmWidth = 20638
        BandType = 0
        LayerName = Foreground18
      end
      object ppLabel188: TppLabel
        DesignLayer = ppDesignLayer19
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Est. M'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 154252
        mmTop = 12435
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground18
      end
      object ppLabel189: TppLabel
        DesignLayer = ppDesignLayer19
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Pre'#231'o Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 12435
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground18
      end
      object ppLine96: TppLine
        DesignLayer = ppDesignLayer19
        UserName = 'Line96'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 16933
        mmWidth = 200025
        BandType = 0
        LayerName = Foreground18
      end
      object ppLine97: TppLine
        DesignLayer = ppDesignLayer19
        UserName = 'Line97'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 17463
        mmWidth = 200025
        BandType = 0
        LayerName = Foreground18
      end
      object ppSystemVariable33: TppSystemVariable
        DesignLayer = ppDesignLayer19
        UserName = 'SystemVariable33'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground18
      end
      object ppSystemVariable34: TppSystemVariable
        DesignLayer = ppDesignLayer19
        UserName = 'SystemVariable34'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground18
      end
    end
    object ppDetailBand17: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText145: TppDBText
        DesignLayer = ppDesignLayer19
        UserName = 'DBText21'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipAtivoInativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAtivoInativo'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground18
      end
      object ppDBText146: TppDBText
        DesignLayer = ppDesignLayer19
        UserName = 'DBText22'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipAtivoInativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAtivoInativo'
        mmHeight = 3598
        mmLeft = 19844
        mmTop = 794
        mmWidth = 76729
        BandType = 4
        LayerName = Foreground18
      end
      object ppDBText147: TppDBText
        DesignLayer = ppDesignLayer19
        UserName = 'DBText23'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pipAtivoInativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipAtivoInativo'
        mmHeight = 3598
        mmLeft = 119327
        mmTop = 794
        mmWidth = 12171
        BandType = 4
        LayerName = Foreground18
      end
      object ppDBText148: TppDBText
        DesignLayer = ppDesignLayer19
        UserName = 'DBText24'
        DataField = 'PRO_QUANT_UNID'
        DataPipeline = pipAtivoInativo
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAtivoInativo'
        mmHeight = 3598
        mmLeft = 98161
        mmTop = 1058
        mmWidth = 16404
        BandType = 4
        LayerName = Foreground18
      end
      object ppDBText149: TppDBText
        DesignLayer = ppDesignLayer19
        UserName = 'DBText25'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pipAtivoInativo
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAtivoInativo'
        mmHeight = 3598
        mmLeft = 135996
        mmTop = 794
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground18
      end
      object ppDBText150: TppDBText
        DesignLayer = ppDesignLayer19
        UserName = 'DBText26'
        DataField = 'PRO_ESTOQMIN'
        DataPipeline = pipAtivoInativo
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAtivoInativo'
        mmHeight = 3598
        mmLeft = 157163
        mmTop = 794
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground18
      end
      object ppDBText151: TppDBText
        DesignLayer = ppDesignLayer19
        UserName = 'DBText27'
        DataField = 'PRO_VLRCUSTO'
        DataPipeline = pipAtivoInativo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipAtivoInativo'
        mmHeight = 3598
        mmLeft = 179917
        mmTop = 794
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground18
      end
    end
    object ppFooterBand14: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers19: TppDesignLayers
      object ppDesignLayer19: TppDesignLayer
        UserName = 'Foreground18'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList10: TppParameterList
    end
  end
  object Dts_Promocao: TDataSource
    DataSet = qry_Promocao
    Left = 31
    Top = 320
  end
  object qry_Promocao: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    BeforeOpen = qry_PromocaoBeforeOpen
    Parameters = <>
    Left = 30
    Top = 277
  end
  object pip_Promocao: TppDBPipeline
    DataSource = Dts_Promocao
    CloseDataSource = True
    UserName = 'pip_Promocao'
    Left = 30
    Top = 235
  end
  object pp_Promocao: TppReport
    AutoStop = False
    DataPipeline = pip_Promocao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 31
    Top = 192
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_Promocao'
    object ppHeaderBand23: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppDBText197: TppDBText
        DesignLayer = ppDesignLayer20
        UserName = 'DBText62'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 265
        mmWidth = 67479
        BandType = 0
        LayerName = Foreground19
      end
      object ppLabel245: TppLabel
        DesignLayer = ppDesignLayer20
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto com Promo'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1323
        mmTop = 4763
        mmWidth = 61648
        BandType = 0
        LayerName = Foreground19
      end
      object ppLabel249: TppLabel
        DesignLayer = ppDesignLayer20
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 11113
        mmWidth = 24606
        BandType = 0
        LayerName = Foreground19
      end
      object ppLabel250: TppLabel
        DesignLayer = ppDesignLayer20
        UserName = 'Label701'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 26988
        mmTop = 11113
        mmWidth = 79640
        BandType = 0
        LayerName = Foreground19
      end
      object ppLabel252: TppLabel
        DesignLayer = ppDesignLayer20
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 116417
        mmTop = 11113
        mmWidth = 16933
        BandType = 0
        LayerName = Foreground19
      end
      object ppLabel253: TppLabel
        DesignLayer = ppDesignLayer20
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Data Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 11113
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground19
      end
      object ppLabel254: TppLabel
        DesignLayer = ppDesignLayer20
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Pre'#231'o Promo'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 11113
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground19
      end
      object ppLine120: TppLine
        DesignLayer = ppDesignLayer20
        UserName = 'Line120'
        Pen.Style = psDot
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 9525
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground19
      end
      object ppLine122: TppLine
        DesignLayer = ppDesignLayer20
        UserName = 'Line1201'
        Pen.Style = psDot
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 15610
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground19
      end
      object ppSystemVariable49: TppSystemVariable
        DesignLayer = ppDesignLayer20
        UserName = 'SystemVariable49'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 4763
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground19
      end
      object ppSystemVariable50: TppSystemVariable
        DesignLayer = ppDesignLayer20
        UserName = 'SystemVariable50'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 265
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground19
      end
    end
    object ppDetailBand24: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText199: TppDBText
        DesignLayer = ppDesignLayer20
        UserName = 'DBText199'
        DataField = 'pro_referencia'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 529
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground19
      end
      object ppDBText200: TppDBText
        DesignLayer = ppDesignLayer20
        UserName = 'DBText200'
        DataField = 'pro_descricao'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 26723
        mmTop = 529
        mmWidth = 79904
        BandType = 4
        LayerName = Foreground19
      end
      object ppDBText201: TppDBText
        DesignLayer = ppDesignLayer20
        UserName = 'DBText1'
        DataField = 'pro_promocao_dtini'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 116417
        mmTop = 529
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground19
      end
      object ppDBText202: TppDBText
        DesignLayer = ppDesignLayer20
        UserName = 'DBText202'
        DataField = 'pro_promocao_dtfim'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 143140
        mmTop = 529
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground19
      end
      object ppDBText203: TppDBText
        DesignLayer = ppDesignLayer20
        UserName = 'DBText203'
        DataField = 'pro_promocao_vlr'
        DataPipeline = pip_Promocao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 167217
        mmTop = 529
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground19
      end
    end
    object ppSummaryBand10: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel255: TppLabel
        DesignLayer = ppDesignLayer20
        UserName = 'Label240'
        Caption = 'Total Geral ----->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 141552
        mmTop = 529
        mmWidth = 23453
        BandType = 7
        LayerName = Foreground19
      end
      object ppDBCalc34: TppDBCalc
        DesignLayer = ppDesignLayer20
        UserName = 'DBCalc33'
        DataField = 'pro_promocao_vlr'
        DataPipeline = pip_Promocao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3598
        mmLeft = 166952
        mmTop = 529
        mmWidth = 25929
        BandType = 7
        LayerName = Foreground19
      end
    end
    object ppDesignLayers20: TppDesignLayers
      object ppDesignLayer20: TppDesignLayer
        UserName = 'Foreground19'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList16: TppParameterList
    end
  end
  object pp_ProdCst: TppReport
    AutoStop = False
    DataPipeline = pip_ProdCst
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 604
    Top = 190
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_ProdCst'
    object ppHeaderBand22: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppDBText189: TppDBText
        DesignLayer = ppDesignLayer21
        UserName = 'DBText62'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 265
        mmWidth = 67479
        BandType = 0
        LayerName = Foreground20
      end
      object ppLabel236: TppLabel
        DesignLayer = ppDesignLayer21
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto - Por CST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1323
        mmTop = 4763
        mmWidth = 61383
        BandType = 0
        LayerName = Foreground20
      end
      object ppLabel241: TppLabel
        DesignLayer = ppDesignLayer21
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 11113
        mmWidth = 24606
        BandType = 0
        LayerName = Foreground20
      end
      object ppLabel242: TppLabel
        DesignLayer = ppDesignLayer21
        UserName = 'Label701'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 26988
        mmTop = 11113
        mmWidth = 79640
        BandType = 0
        LayerName = Foreground20
      end
      object ppLabel243: TppLabel
        DesignLayer = ppDesignLayer21
        UserName = 'Label2'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 11113
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground20
      end
      object ppLabel244: TppLabel
        DesignLayer = ppDesignLayer21
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 121709
        mmTop = 11113
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground20
      end
      object ppLabel247: TppLabel
        DesignLayer = ppDesignLayer21
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Pr. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 11113
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground20
      end
      object ppLabel246: TppLabel
        DesignLayer = ppDesignLayer21
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Total Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 174361
        mmTop = 11113
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground20
      end
      object ppLine117: TppLine
        DesignLayer = ppDesignLayer21
        UserName = 'Line20'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 794
        mmLeft = 3175
        mmTop = 9525
        mmWidth = 196057
        BandType = 0
        LayerName = Foreground20
      end
      object ppLine118: TppLine
        DesignLayer = ppDesignLayer21
        UserName = 'Line24'
        Pen.Style = psDot
        Weight = 0.500000000000000000
        mmHeight = 265
        mmLeft = 3175
        mmTop = 10054
        mmWidth = 196057
        BandType = 0
        LayerName = Foreground20
      end
      object ppLine31: TppLine
        DesignLayer = ppDesignLayer21
        UserName = 'Line1'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.500000000000000000
        mmHeight = 1058
        mmLeft = 1588
        mmTop = 15875
        mmWidth = 196057
        BandType = 0
        LayerName = Foreground20
      end
      object ppSystemVariable47: TppSystemVariable
        DesignLayer = ppDesignLayer21
        UserName = 'SystemVariable47'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166688
        mmTop = 5292
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground20
      end
      object ppSystemVariable48: TppSystemVariable
        DesignLayer = ppDesignLayer21
        UserName = 'SystemVariable48'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 176213
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground20
      end
    end
    object ppDetailBand23: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText190: TppDBText
        DesignLayer = ppDesignLayer21
        UserName = 'DBText1'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pip_ProdCst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_ProdCst'
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground20
      end
      object ppDBText191: TppDBText
        DesignLayer = ppDesignLayer21
        UserName = 'DBText2'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pip_ProdCst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_ProdCst'
        mmHeight = 3260
        mmLeft = 26723
        mmTop = 1058
        mmWidth = 79904
        BandType = 4
        LayerName = Foreground20
      end
      object ppDBText192: TppDBText
        DesignLayer = ppDesignLayer21
        UserName = 'DBText201'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pip_ProdCst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_ProdCst'
        mmHeight = 3260
        mmLeft = 108215
        mmTop = 1058
        mmWidth = 7673
        BandType = 4
        LayerName = Foreground20
      end
      object ppDBText193: TppDBText
        DesignLayer = ppDesignLayer21
        UserName = 'DBText3'
        DataField = 'PRO_ESTOQUE'
        DataPipeline = pip_ProdCst
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ProdCst'
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 1058
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground20
      end
      object ppDBText194: TppDBText
        DesignLayer = ppDesignLayer21
        UserName = 'DBText4'
        DataField = 'PRO_VLRCUSTO'
        DataPipeline = pip_ProdCst
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ProdCst'
        mmHeight = 3260
        mmLeft = 147109
        mmTop = 1058
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground20
      end
      object ppDBText196: TppDBText
        DesignLayer = ppDesignLayer21
        UserName = 'DBText6'
        DataField = 'total'
        DataPipeline = pip_ProdCst
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ProdCst'
        mmHeight = 3260
        mmLeft = 174096
        mmTop = 1058
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground20
      end
    end
    object ppSummaryBand9: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel240: TppLabel
        DesignLayer = ppDesignLayer21
        UserName = 'Label240'
        Caption = 'Total Geral ----->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 529
        mmWidth = 22648
        BandType = 7
        LayerName = Foreground20
      end
      object ppDBCalc33: TppDBCalc
        DesignLayer = ppDesignLayer21
        UserName = 'DBCalc33'
        DataField = 'total'
        DataPipeline = pip_ProdCst
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ProdCst'
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 529
        mmWidth = 24871
        BandType = 7
        LayerName = Foreground20
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'cst_id'
      DataPipeline = pip_ProdCst
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_ProdCst'
      NewFile = False
      object ppGroupHeaderBand18: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel239: TppLabel
          DesignLayer = ppDesignLayer21
          UserName = 'Label80'
          AutoSize = False
          Caption = 'CST ---->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 2117
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
          LayerName = Foreground20
        end
        object ppDBText198: TppDBText
          DesignLayer = ppDesignLayer21
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'cst_id'
          DataPipeline = pip_ProdCst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'TIMES NEW ROMAN'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pip_ProdCst'
          mmHeight = 3704
          mmLeft = 16404
          mmTop = 2117
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
          LayerName = Foreground20
        end
        object ppDBText195: TppDBText
          DesignLayer = ppDesignLayer21
          UserName = 'DBText195'
          AutoSize = True
          DataField = 'cst_descricao'
          DataPipeline = pip_ProdCst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'TIMES NEW ROMAN'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pip_ProdCst'
          mmHeight = 3704
          mmLeft = 26988
          mmTop = 2117
          mmWidth = 65617
          BandType = 3
          GroupNo = 0
          LayerName = Foreground20
        end
        object ppLine121: TppLine
          DesignLayer = ppDesignLayer21
          UserName = 'Line121'
          Weight = 0.500000000000000000
          mmHeight = 794
          mmLeft = 529
          mmTop = 6615
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
          LayerName = Foreground20
        end
      end
      object ppGroupFooterBand18: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBCalc40: TppDBCalc
          DesignLayer = ppDesignLayer21
          UserName = 'DBCalc21'
          DataField = 'total'
          DataPipeline = pip_ProdCst
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_ProdCst'
          mmHeight = 3704
          mmLeft = 166423
          mmTop = 2381
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
          LayerName = Foreground20
        end
        object ppLine119: TppLine
          DesignLayer = ppDesignLayer21
          UserName = 'Line64'
          ParentWidth = True
          Weight = 0.500000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          LayerName = Foreground20
        end
        object ppLabel238: TppLabel
          DesignLayer = ppDesignLayer21
          UserName = 'Label179'
          Caption = 'Total por CST ----->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 137848
          mmTop = 2381
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
          LayerName = Foreground20
        end
      end
    end
    object ppDesignLayers21: TppDesignLayers
      object ppDesignLayer21: TppDesignLayer
        UserName = 'Foreground20'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList15: TppParameterList
    end
  end
  object pip_ProdCst: TppDBPipeline
    DataSource = Dts_ProdCst
    UserName = 'pip_ProdCst'
    Left = 606
    Top = 234
  end
  object qry_ProdCst: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dep_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'cst_id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select '
      '    p.cst_id,'
      '    cst_descricao, '
      '    pro_referencia, '
      '    pro_descricao, '
      '    pro_unidade, '
      '    pro_estoque, '
      '    pro_vlrcusto, '
      '    (pro_vlrcusto * pro_estoque) as total'
      'from '
      '   produto p, cst c'
      'where  '
      
        '  p.cst_id = c.cst_id and pro_ativo = '#39'A'#39' and convert(varchar(10' +
        '),dep_id) like :dep_id'
      '  and (p.cst_id like :cst_id)'
      'Order by p.cst_id,pro_descricao')
    Left = 607
    Top = 276
    object qry_ProdCstpro_referencia: TStringField
      FieldName = 'pro_referencia'
    end
    object qry_ProdCstpro_descricao: TStringField
      FieldName = 'pro_descricao'
      Size = 90
    end
    object qry_ProdCstpro_unidade: TStringField
      FieldName = 'pro_unidade'
      Size = 10
    end
    object qry_ProdCstpro_estoque: TBCDField
      FieldName = 'pro_estoque'
      Precision = 15
      Size = 3
    end
    object qry_ProdCstpro_vlrcusto: TBCDField
      FieldName = 'pro_vlrcusto'
      Precision = 15
      Size = 3
    end
    object qry_ProdCsttotal: TBCDField
      FieldName = 'total'
      ReadOnly = True
      Precision = 31
      Size = 6
    end
    object qry_ProdCstcst_id: TStringField
      FieldName = 'cst_id'
      Size = 10
    end
    object qry_ProdCstcst_descricao: TStringField
      FieldName = 'cst_descricao'
      Size = 90
    end
  end
  object Dts_ProdCst: TDataSource
    DataSet = qry_ProdCst
    Left = 608
    Top = 321
  end
  object qryGeralDisc: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dep_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pro_descricao'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 120
        Value = Null
      end>
    SQL.Strings = (
      
        'select dep_descricao, sec_id, p.for_id, for_nome, pro_ean1, pro_' +
        'referencia, pro_descricao, pro_resumido, pro_quant_unid, pro_uni' +
        'dade,'
      
        'pro_vlrvenda, pro_vlrprazo, pro_estoque, pro_vlrcusto, pro_custo' +
        'nota, pro_vlrmedio, pro_estoqmin, '
      '(pro_estoque * pro_vlrvenda) as total_venda, pro_vlratacado,'
      
        '(pro_estoque * pro_vlrcusto) as total_custo,  (pro_estoque * pro' +
        '_custonota) as total_custo_real,'
      '(pro_estoque * pro_vlrmedio) as total_medio,'
      
        'cst_id, pro_gaveta,  naf_aliquota, pro_estoqmax, (pro_estoqmax -' +
        ' pro_estoque) as sugestao,'
      
        'pro_codfab1, PRO_CODIGONBM, pro_balanca,PRO_CODBALANCA, PRO_EMBU' +
        'NIDADE, M.MRC_DESCRICAO, p.pro_comissao, CES_CODIGO'
      
        'from produto p, departamento d, natureza_fiscal n, fornecedores ' +
        'f, marca m'
      'where d.dep_id = p.dep_id and'
      '      n.naf_codfiscal = p.naf_codfiscal and '
      '      p.for_id = f.for_id and'
      
        '      d.dep_id like :dep_id and pro_descricao like :pro_descrica' +
        'o'
      'Order by dep_descricao, pro_descricao, pro_resumido')
    Left = 361
    Top = 94
    object qryGeralDiscdep_descricao: TStringField
      DisplayLabel = 'Departamento'
      DisplayWidth = 30
      FieldName = 'dep_descricao'
      Size = 90
    end
    object qryGeralDiscsec_descricao: TStringField
      DisplayLabel = 'Se'#231#227'o'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'sec_descricao'
      LookupDataSet = DM_Geral.qryCadSecao
      LookupKeyFields = 'SEC_ID'
      LookupResultField = 'SEC_DESCRICAO'
      KeyFields = 'sec_id'
      Size = 50
      Lookup = True
    end
    object qryGeralDiscpro_ean1: TStringField
      DisplayLabel = 'Cod. EAN'
      DisplayWidth = 20
      FieldName = 'pro_ean1'
    end
    object qryGeralDiscpro_referencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      DisplayWidth = 15
      FieldName = 'pro_referencia'
    end
    object qryGeralDiscpro_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 150
      FieldName = 'pro_descricao'
      Size = 150
    end
    object qryGeralDiscMRC_DESCRICAO: TStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'MRC_DESCRICAO'
      Size = 40
    end
    object qryGeralDiscpro_unidade: TStringField
      Alignment = taCenter
      DisplayLabel = 'UN'
      DisplayWidth = 3
      FieldName = 'pro_unidade'
      Size = 3
    end
    object qryGeralDiscpro_quant_unid: TBCDField
      DisplayLabel = 'Qtde UN'
      DisplayWidth = 9
      FieldName = 'pro_quant_unid'
      DisplayFormat = '##.##0,000'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_estoque: TBCDField
      DisplayLabel = 'Estoque'
      DisplayWidth = 9
      FieldName = 'pro_estoque'
      DisplayFormat = '##.##0,000'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscPRO_EMBUNIDADE: TStringField
      DisplayLabel = 'UN Comp.'
      FieldName = 'PRO_EMBUNIDADE'
      Size = 10
    end
    object qryGeralDiscpro_estoqmin: TBCDField
      DisplayLabel = 'Estoque Min.'
      DisplayWidth = 13
      FieldName = 'pro_estoqmin'
      DisplayFormat = '##.##0,000'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_estoqmax: TBCDField
      DisplayLabel = 'Estoque Max.'
      DisplayWidth = 13
      FieldName = 'pro_estoqmax'
      DisplayFormat = '##.##0,000'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_vlrvenda: TBCDField
      DisplayLabel = 'Pr. Vista'
      DisplayWidth = 10
      FieldName = 'pro_vlrvenda'
      DisplayFormat = '##.##0,00'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_vlrprazo: TBCDField
      DisplayLabel = 'Pr. Prazo'
      DisplayWidth = 10
      FieldName = 'pro_vlrprazo'
      DisplayFormat = '##.##0,00'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_vlrcusto: TBCDField
      DisplayLabel = 'Pr. Custo'
      DisplayWidth = 10
      FieldName = 'pro_vlrcusto'
      DisplayFormat = '##.##0,00'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_custonota: TBCDField
      DisplayLabel = 'Custo Real'
      DisplayWidth = 10
      FieldName = 'pro_custonota'
      DisplayFormat = '##.##0,00'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_vlrmedio: TBCDField
      DisplayLabel = 'Pr. Medio'
      DisplayWidth = 10
      FieldName = 'pro_vlrmedio'
      DisplayFormat = '##.##0,00'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_vlratacado: TBCDField
      DisplayLabel = 'Pr. Atacado'
      DisplayWidth = 10
      FieldName = 'pro_vlratacado'
      DisplayFormat = '##.##0,00'
      Precision = 15
      Size = 3
    end
    object qryGeralDisctotal_venda: TBCDField
      DisplayLabel = 'Total Venda'
      DisplayWidth = 10
      FieldName = 'total_venda'
      ReadOnly = True
      DisplayFormat = '##.##0,00'
      Precision = 31
      Size = 6
    end
    object qryGeralDisctotal_custo: TBCDField
      DisplayLabel = 'Total Custo'
      DisplayWidth = 10
      FieldName = 'total_custo'
      ReadOnly = True
      DisplayFormat = '##.##0,00'
      Precision = 31
      Size = 6
    end
    object qryGeralDisctotal_custo_real: TBCDField
      DisplayLabel = 'Total Custo Real'
      DisplayWidth = 14
      FieldName = 'total_custo_real'
      ReadOnly = True
      DisplayFormat = '##.##0,00'
      Precision = 31
      Size = 6
    end
    object qryGeralDisctotal_medio: TBCDField
      DisplayLabel = 'Total Medio'
      DisplayWidth = 10
      FieldName = 'total_medio'
      ReadOnly = True
      DisplayFormat = '##.##0,00'
      Precision = 31
      Size = 6
    end
    object qryGeralDisccst_id: TStringField
      DisplayLabel = 'CST'
      DisplayWidth = 10
      FieldName = 'cst_id'
      Size = 10
    end
    object qryGeralDiscsugestao: TBCDField
      DisplayLabel = 'Sugest'#227'o'
      DisplayWidth = 10
      FieldName = 'sugestao'
      ReadOnly = True
      DisplayFormat = '##.##0,000'
      Precision = 16
      Size = 3
    end
    object qryGeralDiscnaf_aliquota: TBCDField
      DisplayLabel = 'Al'#237'quota'
      DisplayWidth = 8
      FieldName = 'naf_aliquota'
      DisplayFormat = '##.##0,00'
      Precision = 15
      Size = 3
    end
    object qryGeralDiscpro_gaveta: TStringField
      DisplayLabel = 'Gaveta'
      FieldName = 'pro_gaveta'
      Size = 10
    end
    object qryGeralDiscsec_id: TIntegerField
      FieldName = 'sec_id'
    end
    object qryGeralDiscpro_codfab1: TStringField
      DisplayLabel = 'Cod. Fabric.'
      FieldName = 'pro_codfab1'
    end
    object qryGeralDiscPRO_CODIGONBM: TStringField
      DisplayLabel = 'Cod. NCM'
      FieldName = 'PRO_CODIGONBM'
      Size = 8
    end
    object qryGeralDiscfor_id: TIntegerField
      FieldName = 'for_id'
    end
    object qryGeralDiscfor_nome: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'for_nome'
      Size = 40
    end
    object qryGeralDiscPRO_CODBALANCA: TStringField
      DisplayLabel = 'C'#243'digo da Balan'#231'a'
      FieldName = 'PRO_CODBALANCA'
      Size = 10
    end
    object qryGeralDiscpro_comissao: TBCDField
      DisplayLabel = 'Comis.(%)'
      DisplayWidth = 10
      FieldName = 'pro_comissao'
      DisplayFormat = '#.##0,00'
      Precision = 13
      Size = 3
    end
    object qryGeralDiscpro_resumido: TStringField
      FieldName = 'pro_resumido'
      Size = 50
    end
    object qryGeralDiscCES_CODIGO: TStringField
      FieldName = 'CES_CODIGO'
      Size = 10
    end
  end
  object qryExtratoAcum: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'dtini'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtfim'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'pro_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'DEP_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '    PRO_ID, REFERENCIA, DESCRICAO,'
      '    SUM(QTDE_ENTRADA) AS ENTRADA,'
      '    SUM(QTDE_SAIDA) AS SAIDA, SISTEMA'
      'from'
      '    VW_PRODUTO_EXTRATO'
      'where'
      '    DATA BETWEEN :DTINI AND :DTFIM AND'
      '    CONVERT(VARCHAR(10), PRO_ID) LIKE :PRO_ID AND'
      '    CONVERT(VARCHAR(10), DEP_ID) LIKE :DEP_ID'
      'group by'
      '    PRO_ID, REFERENCIA, DESCRICAO, SISTEMA'
      'order by'
      '    SISTEMA, DESCRICAO')
    Left = 388
    Top = 278
    object qryExtratoAcumPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
    end
    object qryExtratoAcumREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qryExtratoAcumDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object qryExtratoAcumENTRADA: TBCDField
      FieldName = 'ENTRADA'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object qryExtratoAcumSAIDA: TBCDField
      FieldName = 'SAIDA'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object qryExtratoAcumSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Size = 25
    end
  end
  object dts_extrato: TDataSource
    DataSet = qryExtrato
    Left = 468
    Top = 321
  end
  object dtsExtratoAcum: TDataSource
    DataSet = qryExtratoAcum
    Left = 389
    Top = 321
  end
  object pip_ExtratoAcum: TppDBPipeline
    DataSource = dtsExtratoAcum
    UserName = 'pip_ExtratoAcum'
    Left = 386
    Top = 237
  end
  object Rep_ExtratoAcum: TppReport
    AutoStop = False
    DataPipeline = pip_ExtratoAcum
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 387
    Top = 193
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_ExtratoAcum'
    object ppTitleBand5: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand5: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppDBText64: TppDBText
        DesignLayer = ppDesignLayer22
        UserName = 'DBText64'
        Color = clGreen
        DataField = 'DESCRICAO'
        DataPipeline = pip_extrato
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 11906
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground21
      end
      object ppDBText66: TppDBText
        DesignLayer = ppDesignLayer22
        UserName = 'DBText66'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 60791
        BandType = 0
        LayerName = Foreground21
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label14'
        Caption = 'Extrato Movimenta'#231#227'o de Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 67204
        BandType = 0
        LayerName = Foreground21
      end
      object ppLabel32: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Produto:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1852
        mmTop = 11906
        mmWidth = 18256
        BandType = 0
        LayerName = Foreground21
      end
      object ppLabel41: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Saldo Inicial ------->'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4057
        mmLeft = 121973
        mmTop = 11642
        mmWidth = 40746
        BandType = 0
        LayerName = Foreground21
      end
      object ppLine15: TppLine
        DesignLayer = ppDesignLayer22
        UserName = 'Line15'
        Pen.Style = psDot
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 10054
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground21
      end
      object ppLine18: TppLine
        DesignLayer = ppDesignLayer22
        UserName = 'Line1'
        Pen.Style = psDot
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 16669
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground21
      end
      object ppSystemVariable7: TppSystemVariable
        DesignLayer = ppDesignLayer22
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172244
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground21
      end
      object ppSystemVariable8: TppSystemVariable
        DesignLayer = ppDesignLayer22
        UserName = 'SystemVariable2'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground21
      end
      object ppVariable1: TppVariable
        DesignLayer = ppDesignLayer22
        UserName = 'Variable1'
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVariable2Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 167482
        mmTop = 11377
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground21
      end
      object ppLabel89: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label89'
        AutoSize = False
        Caption = 'Qtde. Entrada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 24077
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground21
      end
      object ppLabel91: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label91'
        AutoSize = False
        Caption = 'Qtde. Saida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 97102
        mmTop = 23813
        mmWidth = 23548
        BandType = 0
        LayerName = Foreground21
      end
      object ppLine24: TppLine
        DesignLayer = ppDesignLayer22
        UserName = 'Line2'
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 27781
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground21
      end
    end
    object ppDetailBand5: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText69: TppDBText
        DesignLayer = ppDesignLayer22
        UserName = 'DBText69'
        OnGetText = ppDBText69GetText
        DataField = 'SAIDA'
        DataPipeline = pip_ExtratoAcum
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ExtratoAcum'
        mmHeight = 4233
        mmLeft = 97102
        mmTop = 265
        mmWidth = 23813
        BandType = 4
        LayerName = Foreground21
      end
      object ppDBText70: TppDBText
        DesignLayer = ppDesignLayer22
        UserName = 'DBText70'
        OnGetText = ppDBText70GetText
        DataField = 'ENTRADA'
        DataPipeline = pip_ExtratoAcum
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ExtratoAcum'
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 265
        mmWidth = 24342
        BandType = 4
        LayerName = Foreground21
      end
      object ppDBText67: TppDBText
        DesignLayer = ppDesignLayer22
        UserName = 'DBText67'
        DataField = 'SISTEMA'
        DataPipeline = pip_ExtratoAcum
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_ExtratoAcum'
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 529
        mmWidth = 64294
        BandType = 4
        LayerName = Foreground21
      end
    end
    object ppFooterBand5: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand12: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object ppLine26: TppLine
        DesignLayer = ppDesignLayer22
        UserName = 'Line26'
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 7
        LayerName = Foreground21
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer22
        UserName = 'DBCalc2'
        DataField = 'ENTRADA'
        DataPipeline = pip_ExtratoAcum
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ExtratoAcum'
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 6879
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground21
      end
      object ppDBCalc3: TppDBCalc
        DesignLayer = ppDesignLayer22
        UserName = 'DBCalc3'
        DataField = 'SAIDA'
        DataPipeline = pip_ExtratoAcum
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_ExtratoAcum'
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 11642
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground21
      end
      object ppLabel42: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label42'
        AutoSize = False
        Caption = 'Total Saidas ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 60061
        mmTop = 11642
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground21
      end
      object ppLabel48: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label48'
        AutoSize = False
        Caption = 'Total Entradas ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 60061
        mmTop = 6879
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground21
      end
      object ppLabel52: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label52'
        AutoSize = False
        Caption = 'Saldo Atual ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 21696
        mmWidth = 54240
        BandType = 7
        LayerName = Foreground21
      end
      object ppLabel139: TppLabel
        DesignLayer = ppDesignLayer22
        UserName = 'Label139'
        AutoSize = False
        Caption = 'Saldo no Periodo ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 16669
        mmWidth = 54240
        BandType = 7
        LayerName = Foreground21
      end
      object ppVariable3: TppVariable
        DesignLayer = ppDesignLayer22
        UserName = 'Variable3'
        OnGetText = ppVariable3GetText
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 16669
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground21
      end
      object var_MovtoAcum_EstoqueAtualAcum: TppVariable
        OnPrint = var_MovtoAcum_EstoqueAtualAcumPrint
        DesignLayer = ppDesignLayer22
        UserName = 'var_MovtoAcum_EstoqueAtualAcum'
        BlankWhenZero = False
        CalcOrder = 1
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 21696
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground21
      end
    end
    object ppDesignLayers22: TppDesignLayers
      object ppDesignLayer22: TppDesignLayer
        UserName = 'Foreground21'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList19: TppParameterList
    end
  end
  object Rep_Extrato: TppReport
    AutoStop = False
    DataPipeline = pip_extrato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 468
    Top = 194
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_extrato'
    object ppTitleBand3: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 18256
      mmPrintPosition = 0
      object ppLabel47: TppLabel
        DesignLayer = ppDesignLayer23
        UserName = 'Label47'
        Caption = 'Extrato Movimenta'#231#227'o de Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 67204
        BandType = 0
        LayerName = Foreground22
      end
      object ppDBText65: TppDBText
        DesignLayer = ppDesignLayer23
        UserName = 'DBText65'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 60791
        BandType = 0
        LayerName = Foreground22
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer23
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172224
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground22
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer23
        UserName = 'SystemVariable101'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground22
      end
      object ppLabel49: TppLabel
        DesignLayer = ppDesignLayer23
        UserName = 'Label49'
        AutoSize = False
        Caption = 'Produto:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1852
        mmTop = 11906
        mmWidth = 18256
        BandType = 0
        LayerName = Foreground22
      end
      object ppLabel86: TppLabel
        DesignLayer = ppDesignLayer23
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Saldo Inicial ------->'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4057
        mmLeft = 121973
        mmTop = 11642
        mmWidth = 40746
        BandType = 0
        LayerName = Foreground22
      end
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer23
        UserName = 'Line2'
        Pen.Style = psDot
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 10054
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground22
      end
      object ppVariable2: TppVariable
        DesignLayer = ppDesignLayer23
        UserName = 'Variable3'
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVariable2Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 167482
        mmTop = 11377
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground22
      end
      object ppDBText60: TppDBText
        DesignLayer = ppDesignLayer23
        UserName = 'DBText2'
        Color = clGreen
        DataField = 'DESCRICAO'
        DataPipeline = pip_extrato
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 11906
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground22
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer23
        UserName = 'Line3'
        Pen.Style = psDot
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 16669
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground22
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText43: TppDBText
        DesignLayer = ppDesignLayer23
        UserName = 'DBText4'
        DataField = 'DATA'
        DataPipeline = pip_extrato
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 89694
        mmTop = 529
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground22
      end
      object ppDBText44: TppDBText
        DesignLayer = ppDesignLayer23
        UserName = 'DBText18'
        OnGetText = ppDBText44GetText
        DataField = 'ENTRADA'
        DataPipeline = pip_extrato
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 112977
        mmTop = 529
        mmWidth = 26458
        BandType = 4
        LayerName = Foreground22
      end
      object ppDBText45: TppDBText
        DesignLayer = ppDesignLayer23
        UserName = 'DBText27'
        OnGetText = ppDBText45GetText
        DataField = 'SAIDA'
        DataPipeline = pip_extrato
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 529
        mmWidth = 25135
        BandType = 4
        LayerName = Foreground22
      end
      object ppDBText93: TppDBText
        DesignLayer = ppDesignLayer23
        UserName = 'DBText3'
        DataField = 'DOCTO'
        DataPipeline = pip_extrato
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 529
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground22
      end
      object ppDBText94: TppDBText
        DesignLayer = ppDesignLayer23
        UserName = 'DBText94'
        OnGetText = ppDBText45GetText
        DataField = 'ETG_ID'
        DataPipeline = pip_extrato
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 3598
        mmLeft = 171186
        mmTop = 529
        mmWidth = 25135
        BandType = 4
        LayerName = Foreground22
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand11: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel64: TppLabel
        DesignLayer = ppDesignLayer23
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Total Entradas ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 4498
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground22
      end
      object ppLabel77: TppLabel
        DesignLayer = ppDesignLayer23
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Saldo Atual ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 19315
        mmWidth = 54240
        BandType = 7
        LayerName = Foreground22
      end
      object ppLabel78: TppLabel
        DesignLayer = ppDesignLayer23
        UserName = 'Label78'
        AutoSize = False
        Caption = 'Saldo no Periodo ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 14288
        mmWidth = 54240
        BandType = 7
        LayerName = Foreground22
      end
      object ppVariable10: TppVariable
        DesignLayer = ppDesignLayer23
        UserName = 'Variable10'
        OnGetText = ppVariable10GetText
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 14288
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground22
      end
      object var_MovtoDisc_EstoqueAtual: TppVariable
        OnPrint = var_MovtoDisc_EstoqueAtualPrint
        DesignLayer = ppDesignLayer23
        UserName = 'var_MovtoDisc_EstoqueAtual'
        BlankWhenZero = False
        CalcOrder = 1
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 118004
        mmTop = 19315
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground22
      end
      object ppLabel137: TppLabel
        DesignLayer = ppDesignLayer23
        UserName = 'Label137'
        AutoSize = False
        Caption = 'Total Saidas ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 9260
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground22
      end
      object ppLine20: TppLine
        DesignLayer = ppDesignLayer23
        UserName = 'Line4'
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 3175
        mmWidth = 203200
        BandType = 7
        LayerName = Foreground22
      end
      object ppDBCalc5: TppDBCalc
        DesignLayer = ppDesignLayer23
        UserName = 'DBCalc1'
        DataField = 'SAIDA'
        DataPipeline = pip_extrato
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 9260
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground22
      end
      object ppDBCalc4: TppDBCalc
        DesignLayer = ppDesignLayer23
        UserName = 'DBCalc4'
        DataField = 'ENTRADA'
        DataPipeline = pip_extrato
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 4498
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground22
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'SISTEMA'
      DataPipeline = pip_extrato
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_extrato'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBText56: TppDBText
          DesignLayer = ppDesignLayer23
          UserName = 'DBText1'
          DataField = 'SISTEMA'
          DataPipeline = pip_extrato
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pip_extrato'
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 1852
          mmWidth = 64294
          BandType = 3
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppLine17: TppLine
          DesignLayer = ppDesignLayer23
          UserName = 'Line1'
          Pen.Width = 0
          ParentWidth = True
          Position = lpBottom
          Weight = 0.250000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 5821
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppLabel90: TppLabel
          DesignLayer = ppDesignLayer23
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 89694
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppLabel92: TppLabel
          DesignLayer = ppDesignLayer23
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Qtde. Entrada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 112977
          mmTop = 1852
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppLabel94: TppLabel
          DesignLayer = ppDesignLayer23
          UserName = 'Label35'
          AutoSize = False
          Caption = 'Qtde. Saida'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 144198
          mmTop = 1588
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppLabel140: TppLabel
          DesignLayer = ppDesignLayer23
          UserName = 'Label140'
          AutoSize = False
          Caption = 'Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 67733
          mmTop = 1588
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppLabel142: TppLabel
          DesignLayer = ppDesignLayer23
          UserName = 'Label142'
          AutoSize = False
          Caption = 'N'#186' Entrega'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3598
          mmLeft = 171186
          mmTop = 1588
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
          LayerName = Foreground22
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppLabel100: TppLabel
          DesignLayer = ppDesignLayer23
          UserName = 'Label36'
          AutoSize = False
          Caption = 'Total ------>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 88900
          mmTop = 1323
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppDBCalc41: TppDBCalc
          DesignLayer = ppDesignLayer23
          UserName = 'DBCalc17'
          DataField = 'ENTRADA'
          DataPipeline = pip_extrato
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_extrato'
          mmHeight = 3704
          mmLeft = 112977
          mmTop = 1323
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppDBCalc42: TppDBCalc
          DesignLayer = ppDesignLayer23
          UserName = 'DBCalc24'
          DataField = 'SAIDA'
          DataPipeline = pip_extrato
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_extrato'
          mmHeight = 3704
          mmLeft = 144198
          mmTop = 1323
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
          LayerName = Foreground22
        end
        object ppLine23: TppLine
          DesignLayer = ppDesignLayer23
          UserName = 'Line6'
          Pen.Width = 0
          ParentWidth = True
          Position = lpBottom
          Weight = 0.250000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 0
          LayerName = Foreground22
        end
      end
    end
    object ppDesignLayers23: TppDesignLayers
      object ppDesignLayer23: TppDesignLayer
        UserName = 'Foreground22'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList18: TppParameterList
    end
  end
  object pip_extrato: TppDBPipeline
    DataSource = dts_extrato
    UserName = 'pip_extrato'
    Left = 467
    Top = 237
  end
  object qry_SaldoInicial: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'dtini'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'pro_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'DEP_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select'
      
        '    P.PRO_ESTOQUE - SUM(QTDE_ENTRADA) + SUM(QTDE_SAIDA) AS SALDO' +
        'INICIAL'
      'from'
      '    VW_PRODUTO_EXTRATO V'
      'inner join'
      '    PRODUTO P on P.PRO_ID = V.PRO_ID'
      'where'
      '    DATA >= :DTINI AND'
      '    CONVERT(VARCHAR(10), P.PRO_ID) LIKE :PRO_ID AND'
      '    CONVERT(VARCHAR(10), P.DEP_ID) LIKE :DEP_ID'
      'group by'
      '    P.PRO_ESTOQUE')
    Left = 431
    Top = 278
    object qry_SaldoInicialSaldoInicial: TBCDField
      FieldName = 'SaldoInicial'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
  end
  object qryExtrato: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'dtini'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtfim'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'pro_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'DEP_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '    DATA, DOCTO,PRO_ID, REFERENCIA, DESCRICAO,'
      '    SUM(QTDE_ENTRADA) AS ENTRADA,'
      '    SUM(QTDE_SAIDA) AS SAIDA, SISTEMA, ETG_ID'
      'from'
      '    VW_PRODUTO_EXTRATO'
      'where'
      '    DATA BETWEEN :DTINI AND :DTFIM AND'
      '    CONVERT(VARCHAR(10), PRO_ID) LIKE :PRO_ID AND'
      '    CONVERT(VARCHAR(10), DEP_ID) LIKE :DEP_ID'
      'group by'
      '    DATA, DOCTO,PRO_ID, REFERENCIA, DESCRICAO,'
      '    SISTEMA, ETG_ID'
      'order by'
      '    SISTEMA, DESCRICAO, DATA')
    Left = 467
    Top = 278
  end
  object pipMovimentacao: TppDBPipeline
    DataSource = DtsMovimentacao
    UserName = 'pipMovimentacao'
    Left = 208
    Top = 240
  end
  object pipExtratoEnt: TppDBPipeline
    DataSource = dsExtratoEnt
    CloseDataSource = True
    UserName = 'pipExtratoEnt'
    Left = 528
    Top = 233
  end
  object ds_Obs_CodFabr: TDataSource
    DataSet = qry_Obs_CodFabr
    Left = 903
    Top = 309
  end
  object qry_Obs_CodFabr: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dep_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'FOR_ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'pro_descricao'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 120
        Value = Null
      end
      item
        Name = 'ativo'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'select'
      #9'PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO,PRO_UNIDADE,'
      #9'PRO_VLRCUSTO, PRO_VLRVENDA,PRO_OBSERVACOES, PRO_VLRprazo,'
      #9'PRO_CODFAB1,PRO_CODFAB2,PRO_CODFAB3,PRO_CODFAB4,'
      #9'PRO_CODFAB5, PRO_CODFAB6, PRO_CODFAB7, PRO_CODFAB8,'
      #9'PRO_CODFAB9,PRO_CODFAB10'
      'from'
      #9'PRODUTO'
      'where'
      #9'convert(varchar(10),DEP_ID) like :dep_id  and '
      '                convert(varchar(10),FOR_ID) like :for_Id and'
      '                pro_descricao like :pro_descricao and'
      '                pro_ativo like :ativo             '
      'order by'
      #9'PRO_DESCRICAO')
    Left = 902
    Top = 275
    object qry_Obs_CodFabrPRO_ID: TAutoIncField
      FieldName = 'PRO_ID'
      ReadOnly = True
    end
    object qry_Obs_CodFabrPRO_REFERENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'PRO_REFERENCIA'
    end
    object qry_Obs_CodFabrPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 120
    end
    object qry_Obs_CodFabrPRO_UNIDADE: TStringField
      Alignment = taCenter
      FieldName = 'PRO_UNIDADE'
      Size = 10
    end
    object qry_Obs_CodFabrPRO_VLRCUSTO: TBCDField
      FieldName = 'PRO_VLRCUSTO'
      Precision = 15
      Size = 3
    end
    object qry_Obs_CodFabrPRO_VLRVENDA: TFMTBCDField
      FieldName = 'PRO_VLRVENDA'
      Precision = 20
      Size = 10
    end
    object qry_Obs_CodFabrPRO_OBSERVACOES: TStringField
      FieldName = 'PRO_OBSERVACOES'
      Size = 5000
    end
    object qry_Obs_CodFabrPRO_CODFAB1: TStringField
      FieldName = 'PRO_CODFAB1'
    end
    object qry_Obs_CodFabrPRO_CODFAB2: TStringField
      FieldName = 'PRO_CODFAB2'
    end
    object qry_Obs_CodFabrPRO_CODFAB3: TStringField
      FieldName = 'PRO_CODFAB3'
    end
    object qry_Obs_CodFabrPRO_CODFAB4: TStringField
      FieldName = 'PRO_CODFAB4'
    end
    object qry_Obs_CodFabrPRO_CODFAB5: TStringField
      FieldName = 'PRO_CODFAB5'
    end
    object qry_Obs_CodFabrPRO_CODFAB6: TStringField
      FieldName = 'PRO_CODFAB6'
    end
    object qry_Obs_CodFabrPRO_CODFAB7: TStringField
      FieldName = 'PRO_CODFAB7'
    end
    object qry_Obs_CodFabrPRO_CODFAB8: TStringField
      FieldName = 'PRO_CODFAB8'
    end
    object qry_Obs_CodFabrPRO_CODFAB9: TStringField
      FieldName = 'PRO_CODFAB9'
    end
    object qry_Obs_CodFabrPRO_CODFAB10: TStringField
      FieldName = 'PRO_CODFAB10'
    end
    object qry_Obs_CodFabrPRO_VLRprazo: TFMTBCDField
      FieldName = 'PRO_VLRprazo'
      Precision = 20
      Size = 10
    end
  end
  object pip_Obs_CodFabr: TppDBPipeline
    DataSource = ds_Obs_CodFabr
    UserName = 'pip_Obs_CodFabr'
    Left = 901
    Top = 236
  end
  object pp_Obs_CodFabr: TppReport
    AutoStop = False
    DataPipeline = pip_Obs_CodFabr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 902
    Top = 195
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_Obs_CodFabr'
    object ppHeaderBand18: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppDBText71: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'DBText62'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 794
        mmWidth = 59531
        BandType = 0
        LayerName = Foreground23
      end
      object ppLabel_Descricao: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produtos - Observa'#231#227'o/C'#243'digo de Fabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 5027
        mmWidth = 95779
        BandType = 0
        LayerName = Foreground23
      end
      object ppLabel84: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 11377
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground23
      end
      object ppLabel136: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label701'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 26458
        mmTop = 11377
        mmWidth = 96573
        BandType = 0
        LayerName = Foreground23
      end
      object ppLabel152: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label2'
        AutoSize = False
        Caption = 'UN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 124884
        mmTop = 11377
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground23
      end
      object ppLabel154: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Pr. Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 11377
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground23
      end
      object ppLabel155: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Pr. Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 11377
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground23
      end
      object ppLine52: TppLine
        DesignLayer = ppDesignLayer24
        UserName = 'Line52'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 10054
        mmWidth = 195527
        BandType = 0
        LayerName = Foreground23
      end
      object ppLine56: TppLine
        DesignLayer = ppDesignLayer24
        UserName = 'Line56'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1323
        mmTop = 23813
        mmWidth = 195527
        BandType = 0
        LayerName = Foreground23
      end
      object ppLabel_Observacao: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label_Observacao'
        AutoSize = False
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 19844
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground23
      end
      object pplabel_CodFab1: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'label_CodFab1'
        AutoSize = False
        Caption = 'Cod. Fabricante 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 5821
        mmTop = 15610
        mmWidth = 25135
        BandType = 0
        LayerName = Foreground23
      end
      object pplabel_CodFab2: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label6'
        Caption = 'Cod. Fabricante 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 36248
        mmTop = 15610
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground23
      end
      object pplabel_CodFab3: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label7'
        Caption = 'Cod. Fabricante 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 67204
        mmTop = 15610
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground23
      end
      object pplabel_CodFab4: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'label_CodFab4'
        Caption = 'Cod. Fabricante 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 99484
        mmTop = 15610
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground23
      end
      object pplabel_CodFab5: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'label_CodFab5'
        Caption = 'Cod. Fabricante 5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 131763
        mmTop = 15610
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground23
      end
      object pplabel_CodFab6: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'label_CodFab6'
        Caption = 'Cod. Fabricante 6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3598
        mmLeft = 162719
        mmTop = 15610
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground23
      end
      object ppLabel83: TppLabel
        DesignLayer = ppDesignLayer24
        UserName = 'Label83'
        AutoSize = False
        Caption = 'Pr. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 177271
        mmTop = 11377
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground23
      end
      object ppSystemVariable37: TppSystemVariable
        DesignLayer = ppDesignLayer24
        UserName = 'SystemVariable37'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 5292
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground23
      end
      object ppSystemVariable38: TppSystemVariable
        DesignLayer = ppDesignLayer24
        UserName = 'SystemVariable38'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177271
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground23
      end
    end
    object ppDetailBand19: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppDBText114: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'DBText1'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3725
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground23
      end
      object ppDBText116: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'DBText2'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3725
        mmLeft = 26458
        mmTop = 1058
        mmWidth = 96573
        BandType = 4
        LayerName = Foreground23
      end
      object ppDBText165: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'DBText201'
        DataField = 'PRO_UNIDADE'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3725
        mmLeft = 124884
        mmTop = 1058
        mmWidth = 7673
        BandType = 4
        LayerName = Foreground23
      end
      object ppDBText166: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'DBText3'
        DataField = 'PRO_VLRVENDA'
        DataPipeline = pip_Obs_CodFabr
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3725
        mmLeft = 134673
        mmTop = 1058
        mmWidth = 18521
        BandType = 4
        LayerName = Foreground23
      end
      object ppDBText167: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'DBText4'
        DataField = 'PRO_VLRprazo'
        DataPipeline = pip_Obs_CodFabr
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground23
      end
      object ppDB_CodFab1: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'DB_CodFab1'
        DataField = 'PRO_CODFAB1'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3440
        mmLeft = 5821
        mmTop = 5556
        mmWidth = 25135
        BandType = 4
        LayerName = Foreground23
      end
      object ppdb_CodFab2: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'db_CodFab2'
        DataField = 'PRO_CODFAB2'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3440
        mmLeft = 36248
        mmTop = 5556
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground23
      end
      object ppdb_CodFab3: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'db_CodFab3'
        DataField = 'PRO_CODFAB3'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3440
        mmLeft = 67204
        mmTop = 5556
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground23
      end
      object ppdb_CodFab4: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'db_CodFab4'
        DataField = 'PRO_CODFAB4'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3440
        mmLeft = 99484
        mmTop = 5556
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground23
      end
      object ppdb_CodFab5: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'db_CodFab5'
        DataField = 'PRO_CODFAB5'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3440
        mmLeft = 131763
        mmTop = 5556
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground23
      end
      object ppdb_CodFab6: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'db_CodFab6'
        DataField = 'PRO_CODFAB6'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3440
        mmLeft = 162719
        mmTop = 5556
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground23
      end
      object ppDBText204: TppDBText
        DesignLayer = ppDesignLayer24
        UserName = 'DBText6'
        DataField = 'PRO_VLRCUSTO'
        DataPipeline = pip_Obs_CodFabr
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground23
      end
      object ppdb_Observacao: TppDBMemo
        DesignLayer = ppDesignLayer24
        UserName = 'db_Observacao'
        CharWrap = False
        DataField = 'PRO_OBSERVACOES'
        DataPipeline = pip_Obs_CodFabr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'pip_Obs_CodFabr'
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 10319
        mmWidth = 192352
        BandType = 4
        LayerName = Foreground23
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
    end
    object ppSummaryBand14: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup21: TppGroup
      BreakName = 'PRO_ID'
      DataPipeline = pip_Obs_CodFabr
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'Group21'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_Obs_CodFabr'
      NewFile = False
      object ppGroupHeaderBand21: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand21: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
        object ppLine51: TppLine
          DesignLayer = ppDesignLayer24
          UserName = 'Line51'
          Pen.Style = psDot
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 264
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          LayerName = Foreground23
        end
      end
    end
    object ppDesignLayers24: TppDesignLayers
      object ppDesignLayer24: TppDesignLayer
        UserName = 'Foreground23'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList24: TppParameterList
    end
  end
  object qry_GeraProdExcel: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dep_id'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'select'
      
        #9'P.DEP_ID, DEP_DESCRICAO, PRO_REFERENCIA, PRO_DESCRICAO, PRO_VLR' +
        'VENDA'
      'from'
      #9'PRODUTO P'
      'inner join'
      #9'DEPARTAMENTO D on P.DEP_ID = D.DEP_ID'
      'where'
      #9'convert(varchar(20),P.DEP_ID) like :DEP_ID and PRO_ATIVO = '#39'A'#39' '
      'order by'
      #9'DEP_DESCRICAO, P.DEP_ID, PRO_DESCRICAO, PRO_REFERENCIA')
    Left = 185
    Top = 427
  end
  object Rep_ExtratoHora: TppReport
    AutoStop = False
    DataPipeline = pip_extrato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 468
    Top = 370
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_extrato'
    object ppTitleBand12: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand11: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLabel151: TppLabel
        DesignLayer = ppDesignLayer25
        UserName = 'Label47'
        Caption = 'Extrato Movimenta'#231#227'o de Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 67204
        BandType = 0
        LayerName = Foreground24
      end
      object ppDBText95: TppDBText
        DesignLayer = ppDesignLayer25
        UserName = 'DBText65'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 60791
        BandType = 0
        LayerName = Foreground24
      end
      object ppSystemVariable51: TppSystemVariable
        DesignLayer = ppDesignLayer25
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 172224
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = Foreground24
      end
      object ppSystemVariable52: TppSystemVariable
        DesignLayer = ppDesignLayer25
        UserName = 'SystemVariable101'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground24
      end
      object ppLine25: TppLine
        DesignLayer = ppDesignLayer25
        UserName = 'Line2'
        Pen.Style = psDot
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 10054
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground24
      end
    end
    object ppDetailBand12: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText109: TppDBText
        DesignLayer = ppDesignLayer25
        UserName = 'DBText4'
        DataField = 'HORA'
        DataPipeline = pip_extrato
        DisplayFormat = 'dd/MM/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 91546
        mmTop = 529
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground24
      end
      object ppDBText110: TppDBText
        DesignLayer = ppDesignLayer25
        UserName = 'DBText18'
        OnGetText = ppDBText44GetText
        DataField = 'ENTRADA'
        DataPipeline = pip_extrato
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 136790
        mmTop = 529
        mmWidth = 26458
        BandType = 4
        LayerName = Foreground24
      end
      object ppDBText112: TppDBText
        DesignLayer = ppDesignLayer25
        UserName = 'DBText27'
        OnGetText = ppDBText45GetText
        DataField = 'SAIDA'
        DataPipeline = pip_extrato
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 168011
        mmTop = 529
        mmWidth = 25135
        BandType = 4
        LayerName = Foreground24
      end
      object ppDBText205: TppDBText
        DesignLayer = ppDesignLayer25
        UserName = 'DBText3'
        DataField = 'DOCTO'
        DataPipeline = pip_extrato
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 69586
        mmTop = 529
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground24
      end
      object ppDBText207: TppDBText
        DesignLayer = ppDesignLayer25
        UserName = 'DBText1'
        DataField = 'SISTEMA'
        DataPipeline = pip_extrato
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 3725
        mmLeft = 1323
        mmTop = 529
        mmWidth = 64294
        BandType = 4
        LayerName = Foreground24
      end
      object ppDBText206: TppDBText
        DesignLayer = ppDesignLayer25
        UserName = 'DBText206'
        DataField = 'HORA'
        DataPipeline = pip_extrato
        DisplayFormat = 'hh:mm:ss'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 4233
        mmLeft = 112977
        mmTop = 529
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground24
      end
    end
    object ppFooterBand7: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand15: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabel158: TppLabel
        DesignLayer = ppDesignLayer25
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Total Entradas ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 2381
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground24
      end
      object ppLabel161: TppLabel
        DesignLayer = ppDesignLayer25
        UserName = 'Label78'
        AutoSize = False
        Caption = 'Saldo no Periodo ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 12171
        mmWidth = 54240
        BandType = 7
        LayerName = Foreground24
      end
      object ppLabel164: TppLabel
        DesignLayer = ppDesignLayer25
        UserName = 'Label137'
        AutoSize = False
        Caption = 'Total Saidas ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 7144
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground24
      end
      object ppLine40: TppLine
        DesignLayer = ppDesignLayer25
        UserName = 'Line4'
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 1058
        mmWidth = 203200
        BandType = 7
        LayerName = Foreground24
      end
      object ppDBCalc45: TppDBCalc
        DesignLayer = ppDesignLayer25
        UserName = 'DBCalc4'
        DataField = 'ENTRADA'
        DataPipeline = pip_extrato
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 2381
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground24
      end
      object ppDBCalc46: TppDBCalc
        DesignLayer = ppDesignLayer25
        UserName = 'DBCalc1'
        DataField = 'SAIDA'
        DataPipeline = pip_extrato
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_extrato'
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 7144
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground24
      end
      object varSaldoFinExtHora: TppVariable
        DesignLayer = ppDesignLayer25
        UserName = 'Variable101'
        OnGetText = varSaldoFinExtHoraGetText
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 12171
        mmWidth = 26458
        BandType = 7
        LayerName = Foreground24
      end
    end
    object ppGroup20: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = pip_extrato
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_extrato'
      NewFile = False
      object ppGroupHeaderBand20: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppLine43: TppLine
          DesignLayer = ppDesignLayer25
          UserName = 'Line1'
          Pen.Width = 0
          ParentWidth = True
          Position = lpBottom
          Weight = 0.250000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 12435
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLabel181: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 91546
          mmTop = 1058
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLabel190: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Qtde. Entrada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 136790
          mmTop = 1058
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLabel194: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label35'
          AutoSize = False
          Caption = 'Qtde. Saida'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 794
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLabel195: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label140'
          AutoSize = False
          Caption = 'Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 69586
          mmTop = 794
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLabel153: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label49'
          AutoSize = False
          Caption = 'Produto:'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 10
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 8202
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLabel157: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Saldo Inicial ------->'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 10
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 121973
          mmTop = 7938
          mmWidth = 40746
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object varSaldoIniExtHora: TppVariable
          DesignLayer = ppDesignLayer25
          UserName = 'Variable3'
          BlankWhenZero = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Draft 20cpi'
          Font.Size = 10
          Font.Style = []
          OnCalc = ppVariable2Calc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 167482
          mmTop = 7673
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppDBText97: TppDBText
          DesignLayer = ppDesignLayer25
          UserName = 'DBText2'
          Color = clGreen
          DataField = 'DESCRICAO'
          DataPipeline = pip_extrato
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Draft 20cpi'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pip_extrato'
          mmHeight = 3704
          mmLeft = 20902
          mmTop = 8202
          mmWidth = 88900
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLine38: TppLine
          DesignLayer = ppDesignLayer25
          UserName = 'Line3'
          Pen.Style = psDot
          Pen.Width = 0
          ParentWidth = True
          Position = lpBottom
          Style = lsDouble
          Weight = 0.250000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 6085
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLabel203: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label203'
          AutoSize = False
          Caption = 'Hora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 112977
          mmTop = 1058
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLabel205: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label1401'
          AutoSize = False
          Caption = 'Sistema'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 794
          mmWidth = 64294
          BandType = 3
          GroupNo = 0
          LayerName = Foreground24
        end
      end
      object ppGroupFooterBand20: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel204: TppLabel
          DesignLayer = ppDesignLayer25
          UserName = 'Label36'
          AutoSize = False
          Caption = 'Total ------>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 110067
          mmTop = 1323
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppDBCalc48: TppDBCalc
          DesignLayer = ppDesignLayer25
          UserName = 'DBCalc17'
          DataField = 'ENTRADA'
          DataPipeline = pip_extrato
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup20
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_extrato'
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 1323
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppDBCalc49: TppDBCalc
          DesignLayer = ppDesignLayer25
          UserName = 'DBCalc24'
          DataField = 'SAIDA'
          DataPipeline = pip_extrato
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Draft 20cpi'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup20
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_extrato'
          mmHeight = 3704
          mmLeft = 168011
          mmTop = 1323
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
          LayerName = Foreground24
        end
        object ppLine44: TppLine
          DesignLayer = ppDesignLayer25
          UserName = 'Line6'
          Pen.Width = 0
          ParentWidth = True
          Position = lpBottom
          Weight = 0.250000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 0
          LayerName = Foreground24
        end
      end
    end
    object ppDesignLayers25: TppDesignLayers
      object ppDesignLayer25: TppDesignLayer
        UserName = 'Foreground24'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList7: TppParameterList
    end
  end
  object RepPromoMarca: TppReport
    AutoStop = False
    DataPipeline = pip_Promocao
    PassSetting = psTwoPass
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 31
    Top = 373
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_Promocao'
    object ppHeaderBand25: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel206: TppLabel
        DesignLayer = ppDesignLayer26
        UserName = 'Label1'
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3895
        mmLeft = 6615
        mmTop = 20638
        mmWidth = 14288
        BandType = 0
        LayerName = Foreground25
      end
      object ppLabel207: TppLabel
        DesignLayer = ppDesignLayer26
        UserName = 'Label701'
        AutoSize = False
        Caption = 'Descri'#231#227'o do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3895
        mmLeft = 22490
        mmTop = 20638
        mmWidth = 105304
        BandType = 0
        LayerName = Foreground25
      end
      object ppLabel211: TppLabel
        DesignLayer = ppDesignLayer26
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Fabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3895
        mmLeft = 129911
        mmTop = 20638
        mmWidth = 30692
        BandType = 0
        LayerName = Foreground25
      end
      object ppLabel215: TppLabel
        DesignLayer = ppDesignLayer26
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 178859
        mmTop = 20638
        mmWidth = 18785
        BandType = 0
        LayerName = Foreground25
      end
      object ppLine57: TppLine
        DesignLayer = ppDesignLayer26
        UserName = 'Line1201'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 25135
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground25
      end
      object ppLabel160: TppLabel
        DesignLayer = ppDesignLayer26
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Embalag.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3895
        mmLeft = 162719
        mmTop = 20638
        mmWidth = 14023
        BandType = 0
        LayerName = Foreground25
      end
      object ppDB_empresa: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'ppDB_empresa'
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 6646
        mmLeft = 6615
        mmTop = 794
        mmWidth = 191030
        BandType = 0
        LayerName = Foreground25
      end
      object ppSystemVariable53: TppSystemVariable
        DesignLayer = ppDesignLayer26
        UserName = 'SystemVariable302'
        ReprintOnOverFlow = True
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 188648
        mmTop = 14288
        mmWidth = 8996
        BandType = 0
        LayerName = Foreground25
      end
      object ppImage2: TppImage
        DesignLayer = ppDesignLayer26
        UserName = 'Image2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 13494
        mmLeft = 159809
        mmTop = 265
        mmWidth = 37835
        BandType = 0
        LayerName = Foreground25
      end
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer26
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15081
        mmLeft = 6615
        mmTop = 265
        mmWidth = 32544
        BandType = 0
        LayerName = Foreground25
      end
      object ppDBText208: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'DBText208'
        DataField = 'PRM_DESCRICAO'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 5842
        mmLeft = 6615
        mmTop = 11642
        mmWidth = 191030
        BandType = 0
        LayerName = Foreground25
      end
      object ppDBText220: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'DBText220'
        OnGetText = ppDBText220GetText
        DataField = 'EMP_TELEFONE'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3175
        mmLeft = 89694
        mmTop = 7673
        mmWidth = 23548
        BandType = 0
        LayerName = Foreground25
      end
    end
    object ppDetailBand26: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText209: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'DBText199'
        OnGetText = ppDBText209GetText
        DataField = 'pro_referencia'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 6615
        mmTop = 529
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground25
      end
      object ppDBText212: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'DBText200'
        DataField = 'pro_descricao'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 22490
        mmTop = 529
        mmWidth = 105304
        BandType = 4
        LayerName = Foreground25
      end
      object ppDBText216: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'DBText202'
        DataField = 'MRC_DESCRICAO'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 129911
        mmTop = 529
        mmWidth = 30692
        BandType = 4
        LayerName = Foreground25
      end
      object ppDBText217: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'DBText203'
        DataField = 'IPR_VLR_PROMOCAO'
        DataPipeline = pip_Promocao
        DisplayFormat = '#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 178859
        mmTop = 529
        mmWidth = 18785
        BandType = 4
        LayerName = Foreground25
      end
      object ppDBText215: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'DBText215'
        DataField = 'PRO_EMBUNIDADE'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 162719
        mmTop = 529
        mmWidth = 14023
        BandType = 4
        LayerName = Foreground25
      end
    end
    object fbPromoMarca: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object lblValidade: TppLabel
        DesignLayer = ppDesignLayer26
        UserName = 'lblValidade'
        AutoSize = False
        Caption = 'VALIDADE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 137054
        mmTop = 1588
        mmWidth = 16404
        BandType = 8
        LayerName = Foreground25
      end
      object dbtDtFinal: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'dbtDtFinal'
        DataField = 'PRM_DT_FINAL'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3895
        mmLeft = 179652
        mmTop = 1588
        mmWidth = 17991
        BandType = 8
        LayerName = Foreground25
      end
      object dbtDtInicial: TppDBText
        DesignLayer = ppDesignLayer26
        UserName = 'dbtDtInicial'
        DataField = 'PRM_DT_INICIAL'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3895
        mmLeft = 155311
        mmTop = 1588
        mmWidth = 17991
        BandType = 8
        LayerName = Foreground25
      end
      object ppLabel217: TppLabel
        DesignLayer = ppDesignLayer26
        UserName = 'Label217'
        AutoSize = False
        Caption = #224
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 175155
        mmTop = 1588
        mmWidth = 2646
        BandType = 8
        LayerName = Foreground25
      end
      object ppLine58: TppLine
        DesignLayer = ppDesignLayer26
        UserName = 'Line1202'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 203200
        BandType = 8
        LayerName = Foreground25
      end
    end
    object ppDesignLayers26: TppDesignLayers
      object ppDesignLayer26: TppDesignLayer
        UserName = 'Foreground25'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList26: TppParameterList
    end
  end
  object RepPromoLanc: TppReport
    AutoStop = False
    DataPipeline = pip_Promocao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 30
    Top = 426
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pip_Promocao'
    object ppHeaderBand26: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppDBText218: TppDBText
        DesignLayer = ppDesignLayer27
        UserName = 'DBText62'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 265
        mmWidth = 67479
        BandType = 0
        LayerName = Foreground26
      end
      object ppLabel208: TppLabel
        DesignLayer = ppDesignLayer27
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio de Produto com Promo'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1323
        mmTop = 4763
        mmWidth = 61648
        BandType = 0
        LayerName = Foreground26
      end
      object ppLabel228: TppLabel
        DesignLayer = ppDesignLayer27
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Refer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 12700
        mmWidth = 16933
        BandType = 0
        LayerName = Foreground26
      end
      object ppLabel237: TppLabel
        DesignLayer = ppDesignLayer27
        UserName = 'Label701'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 21960
        mmTop = 12700
        mmWidth = 105834
        BandType = 0
        LayerName = Foreground26
      end
      object ppLabel256: TppLabel
        DesignLayer = ppDesignLayer27
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Vlr. Promo'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 174890
        mmTop = 12700
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground26
      end
      object ppLine59: TppLine
        DesignLayer = ppDesignLayer27
        UserName = 'Line120'
        Pen.Style = psDot
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 10848
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground26
      end
      object ppSystemVariable54: TppSystemVariable
        DesignLayer = ppDesignLayer27
        UserName = 'SystemVariable49'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 4763
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground26
      end
      object ppSystemVariable55: TppSystemVariable
        DesignLayer = ppDesignLayer27
        UserName = 'SystemVariable50'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 265
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground26
      end
      object ppLabel259: TppLabel
        DesignLayer = ppDesignLayer27
        UserName = 'Label259'
        AutoSize = False
        Caption = 'Fabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 12700
        mmWidth = 38100
        BandType = 0
        LayerName = Foreground26
      end
    end
    object ppDetailBand27: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText219: TppDBText
        DesignLayer = ppDesignLayer27
        UserName = 'DBText199'
        DataField = 'pro_referencia'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 529
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground26
      end
      object ppDBText221: TppDBText
        DesignLayer = ppDesignLayer27
        UserName = 'DBText200'
        DataField = 'pro_descricao'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 21960
        mmTop = 529
        mmWidth = 105834
        BandType = 4
        LayerName = Foreground26
      end
      object ppDBText224: TppDBText
        DesignLayer = ppDesignLayer27
        UserName = 'DBText203'
        DataField = 'IPR_VLR_PROMOCAO'
        DataPipeline = pip_Promocao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 175155
        mmTop = 529
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground26
      end
      object ppDBText226: TppDBText
        DesignLayer = ppDesignLayer27
        UserName = 'DBText2002'
        DataField = 'MRC_DESCRICAO'
        DataPipeline = pip_Promocao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3260
        mmLeft = 132557
        mmTop = 529
        mmWidth = 38100
        BandType = 4
        LayerName = Foreground26
      end
    end
    object ppSummaryBand16: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel257: TppLabel
        DesignLayer = ppDesignLayer27
        UserName = 'Label240'
        Caption = 'Total Geral ----->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3895
        mmLeft = 147109
        mmTop = 529
        mmWidth = 24977
        BandType = 7
        LayerName = Foreground26
      end
      object ppDBCalc50: TppDBCalc
        DesignLayer = ppDesignLayer27
        UserName = 'DBCalc33'
        DataField = 'IPR_VLR_PROMOCAO'
        DataPipeline = pip_Promocao
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip_Promocao'
        mmHeight = 3895
        mmLeft = 174890
        mmTop = 529
        mmWidth = 20373
        BandType = 7
        LayerName = Foreground26
      end
    end
    object ppGroup22: TppGroup
      BreakName = 'PRM_DESCRICAO'
      DataPipeline = pip_Promocao
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group22'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pip_Promocao'
      NewFile = False
      object ppGroupHeaderBand22: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppDBText225: TppDBText
          DesignLayer = ppDesignLayer27
          UserName = 'DBText2001'
          DataField = 'PRM_DESCRICAO'
          DataPipeline = pip_Promocao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pip_Promocao'
          mmHeight = 3725
          mmLeft = 19315
          mmTop = 2381
          mmWidth = 79640
          BandType = 3
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppDBText222: TppDBText
          DesignLayer = ppDesignLayer27
          UserName = 'DBText1'
          DataField = 'PRM_DT_INICIAL'
          DataPipeline = pip_Promocao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pip_Promocao'
          mmHeight = 3725
          mmLeft = 125677
          mmTop = 2381
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppDBText223: TppDBText
          DesignLayer = ppDesignLayer27
          UserName = 'DBText202'
          DataField = 'PRM_DT_FINAL'
          DataPipeline = pip_Promocao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pip_Promocao'
          mmHeight = 3725
          mmLeft = 147638
          mmTop = 2381
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppLabel248: TppLabel
          DesignLayer = ppDesignLayer27
          UserName = 'Label248'
          AutoSize = False
          Caption = 'Descri'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 2381
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppLabel251: TppLabel
          DesignLayer = ppDesignLayer27
          UserName = 'Label251'
          AutoSize = False
          Caption = 'Validade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 109273
          mmTop = 2381
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppLabel258: TppLabel
          DesignLayer = ppDesignLayer27
          UserName = 'Label258'
          Caption = #224
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 3725
          mmLeft = 144198
          mmTop = 2381
          mmWidth = 1778
          BandType = 3
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppLine65: TppLine
          DesignLayer = ppDesignLayer27
          UserName = 'Line1203'
          Pen.Style = psDot
          ParentWidth = True
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppLine60: TppLine
          DesignLayer = ppDesignLayer27
          UserName = 'Line1'
          Pen.Style = psDot
          ParentWidth = True
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          LayerName = Foreground26
        end
      end
      object ppGroupFooterBand22: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel260: TppLabel
          DesignLayer = ppDesignLayer27
          UserName = 'Label2401'
          Caption = 'Total ----->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3895
          mmLeft = 156104
          mmTop = 2381
          mmWidth = 15748
          BandType = 5
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppDBCalc51: TppDBCalc
          DesignLayer = ppDesignLayer27
          UserName = 'DBCalc51'
          DataField = 'IPR_VLR_PROMOCAO'
          DataPipeline = pip_Promocao
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pip_Promocao'
          mmHeight = 3969
          mmLeft = 174890
          mmTop = 2381
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
          LayerName = Foreground26
        end
        object ppLine66: TppLine
          DesignLayer = ppDesignLayer27
          UserName = 'Line66'
          Pen.Style = psDot
          ParentWidth = True
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          LayerName = Foreground26
        end
      end
    end
    object ppDesignLayers27: TppDesignLayers
      object ppDesignLayer27: TppDesignLayer
        UserName = 'Foreground26'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList27: TppParameterList
    end
  end
  object repExtratoProd: TppReport
    AutoStop = False
    DataPipeline = pipExtratoProd
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 604
    Top = 370
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipExtratoProd'
    object ppTitleBand2: TppTitleBand
      AfterGenerate = ppTitleBand2AfterGenerate
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand27: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label47'
        Caption = 'Extrato Movimenta'#231#227'o de Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 67204
        BandType = 0
        LayerName = BandLayer28
      end
      object ppDBText124: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText65'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 3598
        mmLeft = 1323
        mmTop = 794
        mmWidth = 60791
        BandType = 0
        LayerName = BandLayer28
      end
      object ppSystemVariable56: TppSystemVariable
        DesignLayer = ppDesignLayer28
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 173549
        mmTop = 5292
        mmWidth = 25950
        BandType = 0
        LayerName = BandLayer28
      end
      object ppSystemVariable57: TppSystemVariable
        DesignLayer = ppDesignLayer28
        UserName = 'SystemVariable101'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 183094
        mmTop = 794
        mmWidth = 16404
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel261: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label49'
        AutoSize = False
        Caption = 'Produto:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4057
        mmLeft = 1852
        mmTop = 11906
        mmWidth = 18256
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel262: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Saldo Inicial ------->'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 133351
        mmTop = 27517
        mmWidth = 40746
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLine77: TppLine
        DesignLayer = ppDesignLayer28
        UserName = 'Line2'
        Pen.Style = psDot
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 10054
        mmWidth = 203200
        BandType = 0
        LayerName = BandLayer28
      end
      object ppVariable4: TppVariable
        DesignLayer = ppDesignLayer28
        UserName = 'Variable3'
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVariable4Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 178064
        mmTop = 27252
        mmWidth = 21442
        BandType = 0
        LayerName = BandLayer28
      end
      object ppDBText227: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText2'
        Color = clGreen
        DataField = 'DESCRICAO'
        DataPipeline = pipExtratoProd
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 3969
        mmLeft = 40243
        mmTop = 11906
        mmWidth = 88900
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLine84: TppLine
        DesignLayer = ppDesignLayer28
        UserName = 'Line3'
        Pen.Style = psDot
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 16669
        mmWidth = 203200
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLine86: TppLine
        DesignLayer = ppDesignLayer28
        UserName = 'Line1'
        Pen.Width = 0
        ParentWidth = True
        Position = lpBottom
        Weight = 0.250000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 24340
        mmWidth = 203200
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel267: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 84659
        mmTop = 20372
        mmWidth = 16931
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel268: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Qtde. Entrada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 103173
        mmTop = 20372
        mmWidth = 20893
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel269: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label35'
        AutoSize = False
        Caption = 'Qtde. Saida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 128034
        mmTop = 20107
        mmWidth = 20894
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel270: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label140'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 64819
        mmTop = 20372
        mmWidth = 18256
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel271: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label142'
        AutoSize = False
        Caption = 'N'#186' Entrega'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 154491
        mmTop = 20107
        mmWidth = 19305
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel273: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label1402'
        AutoSize = False
        Caption = 'M'#243'dulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 1319
        mmTop = 20108
        mmWidth = 62511
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel274: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label274'
        AutoSize = False
        Caption = 'Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 177799
        mmTop = 20108
        mmWidth = 21700
        BandType = 0
        LayerName = BandLayer28
      end
      object ppLabel275: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label275'
        Caption = 'Periodo de : 00/00/0000   a   00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3757
        mmLeft = 81493
        mmTop = 5300
        mmWidth = 62696
        BandType = 0
        LayerName = BandLayer28
      end
      object ppDBText234: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText234'
        Color = clGreen
        DataField = 'REFERENCIA'
        DataPipeline = pipExtratoProd
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 3969
        mmLeft = 20868
        mmTop = 11906
        mmWidth = 18145
        BandType = 0
        LayerName = BandLayer28
      end
    end
    object ppDetailBand28: TppDetailBand
      AfterGenerate = ppDetailBand28AfterGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppDBText228: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText4'
        DataField = 'DATA'
        DataPipeline = pipExtratoProd
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 4233
        mmLeft = 84659
        mmTop = 1588
        mmWidth = 16931
        BandType = 4
        LayerName = BandLayer28
      end
      object ppDBText229: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText18'
        OnGetText = ppDBText229GetText
        DataField = 'QTDE_ENTRADA'
        DataPipeline = pipExtratoProd
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 4233
        mmLeft = 103173
        mmTop = 1588
        mmWidth = 20893
        BandType = 4
        LayerName = BandLayer28
      end
      object ppDBText230: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText27'
        OnGetText = ppDBText230GetText
        DataField = 'QTDE_SAIDA'
        DataPipeline = pipExtratoProd
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 4233
        mmLeft = 128034
        mmTop = 1588
        mmWidth = 20894
        BandType = 4
        LayerName = BandLayer28
      end
      object ppDBText231: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText3'
        DataField = 'DOCTO'
        DataPipeline = pipExtratoProd
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 4233
        mmLeft = 64819
        mmTop = 1588
        mmWidth = 18256
        BandType = 4
        LayerName = BandLayer28
      end
      object ppDBText232: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText94'
        DataField = 'ETG_ID'
        DataPipeline = pipExtratoProd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 4234
        mmLeft = 154491
        mmTop = 1588
        mmWidth = 19305
        BandType = 4
        LayerName = BandLayer28
      end
      object ppDBText233: TppDBText
        DesignLayer = ppDesignLayer28
        UserName = 'DBText1'
        DataField = 'SISTEMA'
        DataPipeline = pipExtratoProd
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 4234
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 62439
        BandType = 4
        LayerName = BandLayer28
      end
      object ppVariable7: TppVariable
        DesignLayer = ppDesignLayer28
        UserName = 'ppVariable7'
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        ResetType = veReportStart
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 181505
        mmTop = 1588
        mmWidth = 17991
        BandType = 4
        LayerName = BandLayer28
      end
    end
    object ppFooterBand16: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand17: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel263: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Total Entradas ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 6618
        mmWidth = 31750
        BandType = 7
        LayerName = BandLayer28
      end
      object ppLabel264: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Saldo Atual ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 59531
        mmTop = 16135
        mmWidth = 54240
        BandType = 7
        LayerName = BandLayer28
      end
      object ppVariable6: TppVariable
        OnPrint = ppVariable6Print
        DesignLayer = ppDesignLayer28
        UserName = 'var_MovtoDisc_EstoqueAtual'
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3968
        mmLeft = 118004
        mmTop = 16135
        mmWidth = 26458
        BandType = 7
        LayerName = BandLayer28
      end
      object ppLabel266: TppLabel
        DesignLayer = ppDesignLayer28
        UserName = 'Label137'
        AutoSize = False
        Caption = 'Total Saidas ------>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 11380
        mmWidth = 31750
        BandType = 7
        LayerName = BandLayer28
      end
      object ppLine85: TppLine
        DesignLayer = ppDesignLayer28
        UserName = 'Line4'
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 2115
        mmWidth = 203200
        BandType = 7
        LayerName = BandLayer28
      end
      object ppDBCalc12: TppDBCalc
        DesignLayer = ppDesignLayer28
        UserName = 'DBCalc1'
        DataField = 'QTDE_SAIDA'
        DataPipeline = pipExtratoProd
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 11380
        mmWidth = 26458
        BandType = 7
        LayerName = BandLayer28
      end
      object ppDBCalc43: TppDBCalc
        DesignLayer = ppDesignLayer28
        UserName = 'DBCalc2'
        DataField = 'QTDE_ENTRADA'
        DataPipeline = pipExtratoProd
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipExtratoProd'
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 6613
        mmWidth = 26458
        BandType = 7
        LayerName = BandLayer28
      end
    end
    object ppDesignLayers28: TppDesignLayers
      object ppDesignLayer28: TppDesignLayer
        UserName = 'BandLayer28'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList28: TppParameterList
    end
  end
  object pipExtratoProd: TppDBPipeline
    DataSource = dsExtratoProd
    UserName = 'pip_extrato1'
    Left = 603
    Top = 413
  end
  object qryExtratoProd: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'DT_INI'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DT_FIM'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'PRO_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select '
      
        #9'DATA, PRO_ID, REFERENCIA, DESCRICAO, SISTEMA, DOCTO,  QTDE_ENTR' +
        'ADA, '
      #9'QTDE_SAIDA, ETG_ID '
      'from '
      #9'VW_PRODUTO_EXTRATO '
      'where '
      #9'DATA BETWEEN :DT_INI AND :DT_FIM AND PRO_ID = :PRO_ID'
      'order by '
      #9'DATA, DATA_INCLUSAO, SISTEMA, DESCRICAO, PRO_ID')
    Left = 603
    Top = 454
  end
  object dsExtratoProd: TDataSource
    DataSet = qryExtratoProd
    Left = 604
    Top = 497
  end
  object qryPrecoSimp: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      #9'PRO_REFERENCIA, PRO_DESCRICAO, '
      #9'PRO_VLRVENDA, PRO_VLRPRAZO'
      'FROM'
      #9'PRODUTO'
      'WHERE'
      #9'PRO_ATIVO = '#39'A'#39
      'ORDER BY'
      #9'PRO_DESCRICAO')
    Left = 960
    Top = 16
    object qryPrecoSimpPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
    end
    object qryPrecoSimpPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 120
    end
    object qryPrecoSimpPRO_VLRVENDA: TFMTBCDField
      FieldName = 'PRO_VLRVENDA'
      Precision = 20
      Size = 10
    end
    object qryPrecoSimpPRO_VLRPRAZO: TFMTBCDField
      FieldName = 'PRO_VLRPRAZO'
      Precision = 20
      Size = 10
    end
  end
  object dtsPrecoSimp: TDataSource
    DataSet = qryPrecoSimp
    Left = 960
    Top = 64
  end
  object pipPrecoSimp: TppDBPipeline
    DataSource = dtsPrecoSimp
    UserName = 'pipPrecoSimp'
    Left = 960
    Top = 108
  end
  object repPrecoSimp: TppReport
    AutoStop = False
    DataPipeline = pipPrecoSimp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 960
    Top = 153
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipPrecoSimp'
    object ppHeaderBand28: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLine90: TppLine
        DesignLayer = ppDesignLayer29
        UserName = 'Line90'
        Weight = 0.750000000000000000
        mmHeight = 789
        mmLeft = 263
        mmTop = 15085
        mmWidth = 196852
        BandType = 0
        LayerName = Foreground27
      end
      object ppDBText239: TppDBText
        DesignLayer = ppDesignLayer29
        UserName = 'DBText239'
        AutoSize = True
        DataField = 'EMP_NOME'
        DataPipeline = DM_Geral.pipemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipemp'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 60060
        BandType = 0
        LayerName = Foreground27
      end
      object ppLabel65: TppLabel
        DesignLayer = ppDesignLayer29
        UserName = 'Label65'
        AutoSize = False
        Caption = 'Tabela de Pre'#231'os'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 5027
        mmWidth = 195792
        BandType = 0
        LayerName = Foreground27
      end
      object ppSystemVariable58: TppSystemVariable
        DesignLayer = ppDesignLayer29
        UserName = 'SystemVariable58'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3968
        mmLeft = 165894
        mmTop = 265
        mmWidth = 29898
        BandType = 0
        LayerName = Foreground27
      end
      object ppLabel265: TppLabel
        DesignLayer = ppDesignLayer29
        UserName = 'Label265'
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 0
        mmTop = 10583
        mmWidth = 26471
        BandType = 0
        LayerName = Foreground27
      end
      object ppLabel276: TppLabel
        DesignLayer = ppDesignLayer29
        UserName = 'Label276'
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 29640
        mmTop = 10583
        mmWidth = 17199
        BandType = 0
        LayerName = Foreground27
      end
      object ppLblPrecoVista: TppLabel
        DesignLayer = ppDesignLayer29
        UserName = 'LblPrecoVista'
        Caption = #192' Vista R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4234
        mmLeft = 151873
        mmTop = 10583
        mmWidth = 16934
        BandType = 0
        LayerName = Foreground27
      end
      object ppLblPrecoPrazo: TppLabel
        DesignLayer = ppDesignLayer29
        UserName = 'LblPrecoVista1'
        Caption = #192' Prazo R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4234
        mmLeft = 177271
        mmTop = 10583
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground27
      end
      object ppLine99: TppLine
        DesignLayer = ppDesignLayer29
        UserName = 'Line902'
        Weight = 0.750000000000000000
        mmHeight = 789
        mmLeft = 0
        mmTop = 9781
        mmWidth = 196852
        BandType = 0
        LayerName = Foreground27
      end
    end
    object ppDetailBand29: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppDBText236: TppDBText
        DesignLayer = ppDesignLayer29
        UserName = 'DBText236'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = pipPrecoSimp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipPrecoSimp'
        mmHeight = 4498
        mmLeft = 29632
        mmTop = 1052
        mmWidth = 111385
        BandType = 4
        LayerName = Foreground27
      end
      object ppDbPrecoVista: TppDBText
        DesignLayer = ppDesignLayer29
        UserName = 'DbPrecoVista'
        DataField = 'PRO_VLRVENDA'
        DataPipeline = pipPrecoSimp
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipPrecoSimp'
        mmHeight = 4498
        mmLeft = 143671
        mmTop = 1052
        mmWidth = 25135
        BandType = 4
        LayerName = Foreground27
      end
      object ppDbPrecoPrazo: TppDBText
        DesignLayer = ppDesignLayer29
        UserName = 'DbPrecoPrazo'
        DataField = 'PRO_VLRPRAZO'
        DataPipeline = pipPrecoSimp
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipPrecoSimp'
        mmHeight = 4498
        mmLeft = 170127
        mmTop = 1052
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground27
      end
      object ppLine92: TppLine
        DesignLayer = ppDesignLayer29
        UserName = 'Line92'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 527
        mmLeft = 0
        mmTop = 5820
        mmWidth = 197115
        BandType = 4
        LayerName = Foreground27
      end
      object ppDBText235: TppDBText
        DesignLayer = ppDesignLayer29
        UserName = 'DBText235'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = pipPrecoSimp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipPrecoSimp'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 1058
        mmWidth = 28323
        BandType = 4
        LayerName = Foreground27
      end
    end
    object ppFooterBand21: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine91: TppLine
        DesignLayer = ppDesignLayer29
        UserName = 'Line901'
        Weight = 0.750000000000000000
        mmHeight = 526
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 8
        LayerName = Foreground27
      end
      object ppSystemVariable59: TppSystemVariable
        DesignLayer = ppDesignLayer29
        UserName = 'SystemVariable59'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 794
        mmWidth = 20108
        BandType = 8
        LayerName = Foreground27
      end
    end
    object ppDesignLayers29: TppDesignLayers
      object ppDesignLayer29: TppDesignLayer
        UserName = 'Foreground27'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList29: TppParameterList
    end
  end
end
