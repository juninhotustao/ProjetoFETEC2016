object DM_Promissoria: TDM_Promissoria
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 226
  Width = 252
  object cdsProm: TClientDataSet
    PersistDataPacket.Data = {
      DE0000009619E0BD010000001800000007000000000003000000DE000A4E554D
      5F50524F4D495301004900000001000557494454480200020014000944545F56
      454E43544F08000800000000000556414C4F5212000500000002000844454349
      4D414C5302000200040005574944544802000200200008434E504A5F43504601
      0049000000010005574944544802000200120008434C495F4E4F4D4501004900
      0000010005574944544802000200640008454E44455245434F01004900000001
      0005574944544802000200CA000A44545F454D495353414F0800080000000000
      0000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NUM_PROMIS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDateTime
      end
      item
        Name = 'VALOR'
        DataType = ftBCD
        Precision = 32
        Size = 4
      end
      item
        Name = 'CNPJ_CPF'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CLI_NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 202
      end
      item
        Name = 'DT_EMISSAO'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 13
    object cdsPromNUM_PROMIS: TStringField
      FieldName = 'NUM_PROMIS'
    end
    object cdsPromVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 32
    end
    object cdsPromDT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
    end
    object cdsPromCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object cdsPromCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 100
    end
    object cdsPromENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 202
    end
    object cdsPromDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
  end
  object dsProm: TDataSource
    DataSet = cdsProm
    Left = 18
    Top = 60
  end
  object repProm: TppReport
    AutoStop = False
    DataPipeline = pipProm
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 5080
    PrinterSetup.mmMarginRight = 5080
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 101600
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 119
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
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 17
    Top = 150
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pipProm'
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 79111
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        DesignLayer = ppDesignLayer1
        UserName = 'Region1'
        Caption = 'Region1'
        mmHeight = 76200
        mmLeft = 0
        mmTop = 2117
        mmWidth = 200555
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object lblVencto: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'lblVencto'
          OnGetText = lblVenctoGetText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 101336
          mmTop = 3969
          mmWidth = 96838
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel6: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label6'
          AutoSize = False
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 162190
          mmTop = 9790
          mmWidth = 5027
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label4'
          AutoSize = False
          Caption = 'pagarei(emos) por esta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 23284
          mmWidth = 35983
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel5: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label5'
          Caption = '_______________________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 5027
          mmLeft = 124090
          mmTop = 62442
          mmWidth = 73025
          BandType = 4
          LayerName = Foreground
        end
        object lbl_empresa: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'lbl_empresa'
          OnGetText = lbl_empresaGetText
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          mmHeight = 5027
          mmLeft = 1852
          mmTop = 29634
          mmWidth = 196321
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel8: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Ou a sua ordem a quantia de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 1852
          mmTop = 35984
          mmWidth = 24606
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel11: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label11'
          AutoSize = False
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3598
          mmLeft = 124090
          mmTop = 66940
          mmWidth = 73025
          BandType = 4
          LayerName = Foreground
        end
        object lbl_data: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'lbl_data'
          OnGetText = lbl_dataGetText
          Caption = 'Campo belo, 16 de novembro de 2010'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 137171
          mmTop = 53182
          mmWidth = 59944
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel10: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label10'
          AutoSize = False
          Caption = 'em moeda corrente deste pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 169069
          mmTop = 44451
          mmWidth = 28575
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText1: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText1'
          DataField = 'CNPJ_CPF'
          DataPipeline = pipProm
          DisplayFormat = '99.999.999/9999-99;0;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipProm'
          mmHeight = 3598
          mmLeft = 19315
          mmTop = 53975
          mmWidth = 45773
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel1: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label1'
          Caption = 'CPF/CNPJ:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 2096
          mmTop = 53975
          mmWidth = 16425
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel2: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label2'
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 8996
          mmTop = 62177
          mmWidth = 9398
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText2: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText2'
          DataField = 'CLI_NOME'
          DataPipeline = pipProm
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipProm'
          mmHeight = 3704
          mmLeft = 19315
          mmTop = 62442
          mmWidth = 104246
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel7: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label7'
          Caption = 'Endere'#231'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 3958
          mmTop = 71173
          mmWidth = 14563
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText3: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'ENDERECO'
          DataPipeline = pipProm
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipProm'
          mmHeight = 3725
          mmLeft = 19315
          mmTop = 71173
          mmWidth = 762
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel9: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label12'
          AutoSize = False
          Caption = 'N'#186
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 9790
          mmWidth = 5027
          BandType = 4
          LayerName = Foreground
        end
        object lblDescr1: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'lbl_empresa1'
          AutoSize = False
          Caption = 'No dia '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          mmHeight = 5027
          mmLeft = 21696
          mmTop = 16669
          mmWidth = 10848
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label3'
          OnGetText = ppLabel3GetText
          AutoSize = False
          Caption = ' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          mmHeight = 5027
          mmLeft = 33602
          mmTop = 16669
          mmWidth = 57150
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel13: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label13'
          AutoSize = False
          Caption = 'de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          mmHeight = 5027
          mmLeft = 91811
          mmTop = 16669
          mmWidth = 3704
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel14: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label14'
          OnGetText = ppLabel14GetText
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          mmHeight = 5027
          mmLeft = 96573
          mmTop = 16669
          mmWidth = 78581
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel15: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label15'
          AutoSize = False
          Caption = 'de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          mmHeight = 5027
          mmLeft = 176213
          mmTop = 16669
          mmWidth = 3704
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel16: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label16'
          OnGetText = ppLabel16GetText
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          mmHeight = 5027
          mmLeft = 181240
          mmTop = 16669
          mmWidth = 16933
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel17: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label17'
          AutoSize = False
          Caption = 'NOTA PROMISSORIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4763
          mmLeft = 39688
          mmTop = 23284
          mmWidth = 36513
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel18: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label18'
          AutoSize = False
          Caption = 'na pra'#231'a de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4763
          mmLeft = 77258
          mmTop = 23284
          mmWidth = 19050
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel19: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label19'
          OnGetText = ppLabel19GetText
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 97102
          mmTop = 23284
          mmWidth = 101071
          BandType = 4
          LayerName = Foreground
        end
      end
      object ppRegion5: TppRegion
        DesignLayer = ppDesignLayer1
        UserName = 'Region5'
        mmHeight = 5292
        mmLeft = 7938
        mmTop = 8731
        mmWidth = 30956
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppDBText4: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText4'
          DataField = 'NUM_PROMIS'
          DataPipeline = pipProm
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pipProm'
          mmHeight = 3598
          mmLeft = 9261
          mmTop = 9525
          mmWidth = 29104
          BandType = 4
          LayerName = Foreground
        end
      end
      object ppRegion2: TppRegion
        DesignLayer = ppDesignLayer1
        UserName = 'Region2'
        mmHeight = 5292
        mmLeft = 168540
        mmTop = 8996
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppDBText5: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText5'
          DataField = 'VALOR'
          DataPipeline = pipProm
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pipProm'
          mmHeight = 3704
          mmLeft = 169333
          mmTop = 9790
          mmWidth = 23813
          BandType = 4
          LayerName = Foreground
        end
      end
      object ppRegion3: TppRegion
        DesignLayer = ppDesignLayer1
        UserName = 'Region3'
        Caption = 'Region3'
        mmHeight = 6085
        mmLeft = 28575
        mmTop = 36248
        mmWidth = 170657
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel12: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label9'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3260
          mmLeft = 265
          mmTop = 41540
          mmWidth = 557065
          BandType = 4
          LayerName = Foreground
        end
        object lbl_extenso_1: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'lbl_extenso_1'
          OnGetText = lbl_extenso_1GetText
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          mmHeight = 3969
          mmLeft = 29634
          mmTop = 37307
          mmWidth = 168540
          BandType = 4
          LayerName = Foreground
        end
      end
      object ppRegion4: TppRegion
        DesignLayer = ppDesignLayer1
        UserName = 'Region4'
        Caption = 'Region4'
        mmHeight = 5821
        mmLeft = 2381
        mmTop = 44450
        mmWidth = 166159
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object lbl_extenso_2: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'lbl_extenso_2'
          OnGetText = lbl_extenso_2GetText
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormField = False
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 45508
          mmWidth = 164307
          BandType = 4
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
    object ppParameterList2: TppParameterList
    end
  end
  object pipProm: TppDBPipeline
    DataSource = dsProm
    UserName = 'pipProm'
    Left = 16
    Top = 107
    object pipPromppField1: TppField
      FieldAlias = 'NUM_PROMIS'
      FieldName = 'NUM_PROMIS'
      FieldLength = 20
      DisplayWidth = 20
      Position = 0
    end
    object pipPromppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 33
      Position = 1
    end
    object pipPromppField3: TppField
      FieldAlias = 'DT_VENCTO'
      FieldName = 'DT_VENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pipPromppField4: TppField
      FieldAlias = 'CNPJ_CPF'
      FieldName = 'CNPJ_CPF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 3
    end
    object pipPromppField5: TppField
      FieldAlias = 'CLI_NOME'
      FieldName = 'CLI_NOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object pipPromppField6: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 202
      DisplayWidth = 202
      Position = 5
    end
    object pipPromppField7: TppField
      FieldAlias = 'DT_EMISSAO'
      FieldName = 'DT_EMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
  end
end
