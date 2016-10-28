object frm_ViewEntCorrecao: Tfrm_ViewEntCorrecao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Notas fiscais de entrada de mercadorias para serem corrigidas'
  ClientHeight = 331
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGrid
    Left = 0
    Top = 117
    Width = 677
    Height = 214
    Align = alClient
    DataSource = ds_ViewEntCorrecao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = GridDrawColumnCell
    OnKeyPress = GridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'ENT_NUMNOTA'
        Title.Caption = 'N'#186' Nota Fiscal'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENT_SERIE'
        Title.Alignment = taCenter
        Title.Caption = 'S'#233'rie'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOD_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Modelo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENT_DT_EMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Emiss'#227'o'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOR_NOME'
        Title.Caption = 'Fornecedor'
        Width = 360
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOR_ESTADO'
        Title.Alignment = taCenter
        Title.Caption = 'UF'
        Width = 25
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 117
    Align = alTop
    BevelEdges = []
    TabOrder = 1
    object Memo1: TMemo
      Left = 2
      Top = 2
      Width = 672
      Height = 112
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        
          'Nota: Verifique as notas fiscais de entrada de mercadorias discr' +
          'iminadas abaixo elas possuem desconformidade do CFOP do cabe'#231'alh' +
          'o'
        'em rela'#231#227'o ao CFOP dos itens.'
        
          ' - As notas fiscais com os c'#243'digos CFOP'#39's iniciados em 1 no cabe' +
          #231'alho, exemplo '#39'1102'#39' devem conter itens com CFOP'#39's tamb'#233'm inici' +
          'ados'
        
          ' em '#39'1'#39'. Estes c'#243'digos indicam que a movimenta'#231#227'o de aquisi'#231#227'o d' +
          'as mercadorias aconteceu com um fornecedor dentro do pr'#243'prio est' +
          'ado.'
        
          ' - As notas fiscais com os c'#243'digos CFOP'#39's iniciados em 2 no cabe' +
          #231'alho, exemplo '#39'2403'#39' devem conter itens com CFOP'#39's tamb'#233'm inici' +
          'ados '
        
          'em '#39'2'#39'. Estes c'#243'digos indicam que a movimenta'#231#227'o de aquisi'#231#227'o da' +
          's mercadorias aconteceu com um fornecedor de fora do estado.'
        
          ' - As notas fiscais com os c'#243'digos CFOP'#39's iniciados em 3 no cabe' +
          #231'alho, exemplo '#39'3403'#39' devem conter itens com CFOP'#39's tamb'#233'm inici' +
          'ados'
        
          'em '#39'3'#39'. Estes c'#243'digos indicam que a movimenta'#231#227'o de aquisi'#231#227'o da' +
          's mercadorias aconteceu com um fornecedor estrangeiro.')
      ParentFont = False
      TabOrder = 0
    end
  end
  object QRYViewEntCorrecao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    SQLConnection = DMRet.Con
    Left = 544
    Top = 144
  end
  object DspViewEntCorrecao: TDataSetProvider
    DataSet = QRYViewEntCorrecao
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 543
    Top = 190
  end
  object CDSViewEntCorrecao: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DISTINCT E.ENT_NUMNOTA, ENT_SERIE, MOD_ID, ENT_DT_EMISSAO' +
      ', FOR_NOME, FOR_ESTADO FROM ENTRADA E INNER JOIN ITEM_ENTRADA I ' +
      'ON E.ENT_ID = I.ENT_ID INNER JOIN FORNECEDORES F ON E.FOR_ID = F' +
      '.FOR_ID WHERE SUBSTRING(CONVERT(VARCHAR(5),E.CFO_ID),1,1) <> SUB' +
      'STRING(CONVERT(VARCHAR(5),I.CFO_ID),1,1) AND ENT_DT_EMISSAO BETW' +
      'EEN :DT_INI AND :DT_FIM ORDER BY ENT_DT_EMISSAO'
    Params = <
      item
        DataType = ftDateTime
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    ProviderName = 'DspViewEntCorrecao'
    Left = 544
    Top = 235
    object CDSViewEntCorrecaoENT_NUMNOTA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ENT_NUMNOTA'
    end
    object CDSViewEntCorrecaoENT_SERIE: TStringField
      Alignment = taCenter
      FieldName = 'ENT_SERIE'
      Size = 3
    end
    object CDSViewEntCorrecaoMOD_ID: TStringField
      Alignment = taCenter
      FieldName = 'MOD_ID'
      Size = 3
    end
    object CDSViewEntCorrecaoENT_DT_EMISSAO: TSQLTimeStampField
      Alignment = taCenter
      FieldName = 'ENT_DT_EMISSAO'
    end
    object CDSViewEntCorrecaoFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      Size = 40
    end
    object CDSViewEntCorrecaoFOR_ESTADO: TStringField
      Alignment = taCenter
      FieldName = 'FOR_ESTADO'
      Size = 2
    end
  end
  object ds_ViewEntCorrecao: TDataSource
    DataSet = CDSViewEntCorrecao
    Left = 546
    Top = 280
  end
end
