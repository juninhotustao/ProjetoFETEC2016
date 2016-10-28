object frm_ObservacaoProduto: Tfrm_ObservacaoProduto
  Left = 280
  Top = 137
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Observa'#231#245'es do Produto'
  ClientHeight = 385
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 385
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 658
    ExplicitHeight = 335
    object Panel3: TPanel
      Left = 1
      Top = 344
      Width = 788
      Height = 40
      Align = alBottom
      Color = clMenu
      TabOrder = 0
      ExplicitTop = 294
      ExplicitWidth = 656
      object btn_fechar: TBitBtn
        Left = 636
        Top = 6
        Width = 83
        Height = 25
        Hint = '<F10> Cancela'
        Caption = 'Fechar'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000E3DFE0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE3DFE0FFFFFF52ADFF185294185A9C185A9C185A9C185AA518
          5AA5185A9C185A9C18529418529418528C184A844AADFFFFFFFFFFFFFF185AA5
          186BBD1873CE1873CE1873CE1873CE1873CE1873CE1873CE1873CE186BC6186B
          BD185AA5104A7BFFFFFFFFFFFF1863AD1873CE187BDE187BDE187BE71884E718
          8CF7188CF7188CF7188CF7187BDE186BC61863AD18528CFFFFFFFFFFFF186BC6
          187BDE1884EFFFFFFF84C6FF188CF7188CF7188CF7188CF784C6FFFFFFFF1873
          CE186BBD185294FFFFFFFFFFFF1873CE1884E7188CF7188CFFFFFFFF84C6FF18
          8CF7188CF784C6FFFFFFFF1884E71873D6186BC6185A9CFFFFFFFFFFFF187BDE
          188CF7188CFF188CF7188CF7FFFFFF84C6FF84C6FFFFFFFF188CF71884E71873
          D61873CE185AA5FFFFFFFFFFFF1884E7188CFF188CF7188CF7188CF7188CF7FF
          FFFF84C6FF188CF71884EF187BDE1873CE1873CE1863ADFFFFFFFFFFFF1884EF
          188CFF188CFF188CF7188CF784C6FFFFFFFFFFFFFF84C6FF1884E71873D61873
          CE1873CE1863ADFFFFFFFFFFFF188CFF2194FF2194FF188CFF84C6FFFFFFFF18
          84F71884EFFFFFFF84C6FF1873CE1873CE1873CE1863ADFFFFFFFFFFFF188CFF
          39A5FF39A5FF84C6FFFFFFFF188CFF188CFF1884EF1884E7FFFFFF84C6FF1873
          CE1873CE1863ADFFFFFFFFFFFF2194FF52ADFF4AADFFFFFFFF2194FF2194FF18
          94FF188CF71884EF1884E7FFFFFF1873CE1873CE1863ADFFFFFFFFFFFF39A5FF
          6BBDFF52ADFF39A5FF319CFF299CFF299CFF2194FF188CFF1884F71884EF187B
          DE1873CE1863ADFFFFFFFFFFFF4AADFF84C6FF6BBDFF52ADFF4AADFF39A5FF31
          9CFF299CFF2194FF1894FF188CF71884EF1873CE185A9CFFFFFFFFFFFFADDEFF
          4AADFF319CFF2194FF188CFF188CFF188CF7188CF71884EF1884E7187BDE1873
          CE186BBD63B5FFFFFFFFE3DFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DFE0}
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        OnClick = btn_fecharClick
      end
    end
    object DBMemo1: TDBMemo
      Left = 1
      Top = 153
      Width = 788
      Height = 191
      Align = alClient
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = 16056319
      DataField = 'PRO_OBSERVACOES'
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      WantTabs = True
      ExplicitTop = 88
      ExplicitWidth = 656
      ExplicitHeight = 206
    end
    object grid_similares: TDBGrid
      Left = 1
      Top = 1
      Width = 788
      Height = 152
      Align = alTop
      DataSource = dsSimilar
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_REFERENCIA'
          Title.Caption = 'Refer'#234'ncia'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 365
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_ESTOQUE'
          Title.Caption = 'Estoque'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_VLRVENDA'
          Title.Caption = 'Vlr. Vista'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_VLRPRAZO'
          Title.Caption = 'Vlr. Prazo'
          Width = 84
          Visible = True
        end>
    end
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = QRY
    Left = 336
    Top = 118
  end
  object QRY: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PRO_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      #9'PRO_DESCRICAO, PRO_OBSERVACOES'
      'from'
      #9'PRODUTO'
      'where'
      #9'PRO_ID = :PRO_ID')
    SQLConnection = DMRet.Con
    Left = 336
    Top = 64
  end
  object dtsSimilar: TSQLDataSet
    SchemaName = 'sa'
    GetMetadata = False
    CommandText = 
      'select'#13#10'        PSI_ID, s.PRO_ID, PRO_ID_SIMILAR, PRO_REFERENCIA' +
      ', PRO_EAN1, '#13#10'        PRO_DESCRICAO, PRO_UNIDADE, PRO_ESTOQUE, P' +
      'RO_VLRVENDA, PRO_VLRPRAZO'#13#10'from'#13#10'         PRODUTO_SIMILAR s'#13#10'lef' +
      't join '#13#10'         PRODUTO P ON (P.PRO_ID = S.PRO_ID_SIMILAR)'#9#13#10' ' +
      'where'#13#10'          s.PRO_ID = :ID'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DMRet.Con
    Left = 248
    Top = 58
    object dtsSimilarPSI_ID: TIntegerField
      FieldName = 'PSI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsSimilarPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      ProviderFlags = [pfInUpdate]
    end
    object dtsSimilarPRO_ID_SIMILAR: TIntegerField
      FieldName = 'PRO_ID_SIMILAR'
      ProviderFlags = [pfInUpdate]
    end
    object dtsSimilarPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dtsSimilarPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object dtsSimilarPRO_ESTOQUE: TFMTBCDField
      FieldName = 'PRO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dtsSimilarPRO_VLRVENDA: TFMTBCDField
      FieldName = 'PRO_VLRVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 10
    end
    object dtsSimilarPRO_VLRPRAZO: TFMTBCDField
      FieldName = 'PRO_VLRPRAZO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 10
    end
    object dtsSimilarPRO_EAN1: TStringField
      FieldName = 'PRO_EAN1'
      ProviderFlags = [pfInUpdate]
    end
    object dtsSimilarPRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dspSimilar: TDataSetProvider
    DataSet = dtsSimilar
    Options = [poFetchDetailsOnDemand, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 248
    Top = 106
  end
  object cdsSimilar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspSimilar'
    Left = 248
    Top = 154
    object cdsSimilarPSI_ID: TIntegerField
      FieldName = 'PSI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSimilarPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSimilarPRO_ID_SIMILAR: TIntegerField
      FieldName = 'PRO_ID_SIMILAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSimilarPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSimilarPRO_EAN1: TStringField
      FieldName = 'PRO_EAN1'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSimilarPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object cdsSimilarPRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsSimilarPRO_ESTOQUE: TFMTBCDField
      FieldName = 'PRO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###0.000'
      Precision = 15
      Size = 3
    end
    object cdsSimilarPRO_VLRVENDA: TFMTBCDField
      FieldName = 'PRO_VLRVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###0.00'
      Precision = 20
      Size = 10
    end
    object cdsSimilarPRO_VLRPRAZO: TFMTBCDField
      FieldName = 'PRO_VLRPRAZO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###0.00'
      Precision = 20
      Size = 10
    end
  end
  object dsSimilar: TDataSource
    AutoEdit = False
    DataSet = cdsSimilar
    Left = 248
    Top = 202
  end
end
