object DM_Geral: TDM_Geral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 495
  Width = 832
  object pipemp: TppDBPipeline
    DataSource = dtsEmp
    CloseDataSource = True
    UserName = 'pipemp'
    Left = 11
    Top = 97
  end
  object dtsEmp: TDataSource
    DataSet = qryEmp
    Left = 12
    Top = 51
  end
  object qryEmp: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      '    EMP_NOME,'
      '    isnull(EMP_ENDERECO,'#39#39') AS EMP_ENDERECO,'
      '    isnull(EMP_BAIRRO,'#39#39') AS EMP_BAIRRO,'
      '    isnull(EMP_CIDADE,'#39#39') AS EMP_CIDADE,'
      
        '    isnull(EMP_ENDERECO, '#39#39') + '#39' '#39' + isnull(EMP_BAIRRO, '#39#39') AS E' +
        'NDERECO,'
      '    EMP_TELEFONE, EMP_FAX, EMP_ESTADO, EMP_CEP, EMP_CGC,'
      '    EMP_INSCRICAOESTADUAL, EMP_NUMERO,EMP_LICENCA,'
      '    EMP_DATAREGISTROJUNTA, EMP_NUMEROREGISTROJUNTA,'
      '    EMP_NOMEREPRES, EMP_REPRESCPF, EMP_NOMECONTADOR,'
      '    EMP_CRCCONTADOR, EMP_NUMEROORDEM,'
      '    EMP_MENSAGEMRODAPE'
      'from'
      '    EMPRESAS')
    Left = 13
    Top = 9
    object qryEmpEMP_NOME: TStringField
      FieldName = 'EMP_NOME'
      Size = 200
    end
    object qryEmpEMP_CGC: TStringField
      FieldName = 'EMP_CGC'
      OnGetText = qryEmpEMP_CGCGetText
      Size = 14
    end
    object qryEmpEMP_INSCRICAOESTADUAL: TStringField
      FieldName = 'EMP_INSCRICAOESTADUAL'
      Size = 14
    end
    object qryEmpEMP_LICENCA: TStringField
      FieldName = 'EMP_LICENCA'
    end
    object qryEmpEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      Size = 100
    end
    object qryEmpEMP_BAIRRO: TStringField
      FieldName = 'EMP_BAIRRO'
      Size = 50
    end
    object qryEmpEMP_CIDADE: TStringField
      FieldName = 'EMP_CIDADE'
      Size = 100
    end
    object qryEmpEMP_TELEFONE: TStringField
      FieldName = 'EMP_TELEFONE'
      EditMask = '!\(99\)9999-9999;0;_'
      Size = 12
    end
    object qryEmpEMP_FAX: TStringField
      FieldName = 'EMP_FAX'
      EditMask = '!\(99\)9999-9999;0;_'
      Size = 10
    end
    object qryEmpEMP_ESTADO: TStringField
      FieldName = 'EMP_ESTADO'
      Size = 2
    end
    object qryEmpEMP_CEP: TIntegerField
      FieldName = 'EMP_CEP'
    end
    object qryEmpEMP_NUMERO: TIntegerField
      FieldName = 'EMP_NUMERO'
    end
    object qryEmpENDERECO: TStringField
      FieldName = 'ENDERECO'
      ReadOnly = True
      Size = 151
    end
    object qryEmpEMP_DATAREGISTROJUNTA: TDateTimeField
      FieldName = 'EMP_DATAREGISTROJUNTA'
    end
    object qryEmpEMP_NUMEROREGISTROJUNTA: TStringField
      FieldName = 'EMP_NUMEROREGISTROJUNTA'
      Size = 13
    end
    object qryEmpEMP_NOMEREPRES: TStringField
      FieldName = 'EMP_NOMEREPRES'
      Size = 35
    end
    object qryEmpEMP_REPRESCPF: TStringField
      FieldName = 'EMP_REPRESCPF'
      Size = 14
    end
    object qryEmpEMP_NOMECONTADOR: TStringField
      FieldName = 'EMP_NOMECONTADOR'
      Size = 35
    end
    object qryEmpEMP_CRCCONTADOR: TStringField
      FieldName = 'EMP_CRCCONTADOR'
      Size = 10
    end
    object qryEmpEMP_NUMEROORDEM: TIntegerField
      FieldName = 'EMP_NUMEROORDEM'
    end
    object qryEmpEMP_MENSAGEMRODAPE: TStringField
      FieldName = 'EMP_MENSAGEMRODAPE'
      Size = 100
    end
  end
  object qry_CadastroCliente: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      #9'CLI_ID,CLI_NOME,CLI_ENDERECO,'
      #9'CLI_BAIRRO,CLI_CIDADE,CLI_ESTADO,'
      #9'CLI_CEP,CLI_TELEFONE,CLI_CELULARFAX,'
      #9'CLI_CGC,CLI_CPF,CLI_INSCRICAO,'
      #9'(CLI_ENDERECO+'#39'  '#39'+CLI_BAIRRO) AS CLI_END_BAIRRO,'
      '                CLI_TIPOPES, CLI_NUMERO, CLI_TELEFONE2'
      'from '
      #9'CLIENTES'
      'order by'
      #9'CLI_NOME')
    Left = 398
    Top = 333
    object qry_CadastroClienteCLI_ID: TStringField
      FieldName = 'CLI_ID'
      Size = 10
    end
    object qry_CadastroClienteCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 100
    end
    object qry_CadastroClienteCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object qry_CadastroClienteCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Size = 40
    end
    object qry_CadastroClienteCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Size = 40
    end
    object qry_CadastroClienteCLI_ESTADO: TStringField
      FieldName = 'CLI_ESTADO'
      Size = 2
    end
    object qry_CadastroClienteCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      Size = 9
    end
    object qry_CadastroClienteCLI_TELEFONE: TStringField
      FieldName = 'CLI_TELEFONE'
      Size = 15
    end
    object qry_CadastroClienteCLI_CELULARFAX: TStringField
      FieldName = 'CLI_CELULARFAX'
      Size = 15
    end
    object qry_CadastroClienteCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 18
    end
    object qry_CadastroClienteCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 14
    end
    object qry_CadastroClienteCLI_INSCRICAO: TStringField
      FieldName = 'CLI_INSCRICAO'
      Size = 18
    end
    object qry_CadastroClienteCLI_END_BAIRRO: TStringField
      FieldName = 'CLI_END_BAIRRO'
      ReadOnly = True
      Size = 92
    end
    object qry_CadastroClienteCLI_TIPOPES: TStringField
      FieldName = 'CLI_TIPOPES'
      Size = 1
    end
    object qry_CadastroClienteCLI_NUMERO: TStringField
      FieldName = 'CLI_NUMERO'
      Size = 10
    end
    object qry_CadastroClienteCLI_TELEFONE2: TStringField
      FieldName = 'CLI_TELEFONE2'
      Size = 15
    end
  end
  object Dts_CadastroCliente: TDataSource
    DataSet = qry_CadastroCliente
    Left = 398
    Top = 377
  end
  object qry_CadastroProduto: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select PRO_ID, PRO_DESCRICAO, PRO_EAN1, PRO_REFERENCIA from PROD' +
        'UTO order by 2')
    Left = 227
    Top = 11
    object qry_CadastroProdutoPRO_ID: TAutoIncField
      FieldName = 'PRO_ID'
      ReadOnly = True
    end
    object qry_CadastroProdutoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 120
    end
    object qry_CadastroProdutoPRO_EAN1: TStringField
      FieldName = 'PRO_EAN1'
    end
    object qry_CadastroProdutoPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
    end
  end
  object Dts_CadastroProduto: TDataSource
    DataSet = qry_CadastroProduto
    Left = 227
    Top = 52
  end
  object qryCadServico: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      #9'SERV_CODIGO, SERV_DESCRICAO'
      'from'
      #9'SERVICOS'
      'order by'
      #9'SERV_DESCRICAO')
    Left = 321
    Top = 10
    object qryCadServicoSERV_CODIGO: TAutoIncField
      FieldName = 'SERV_CODIGO'
      ReadOnly = True
    end
    object qryCadServicoSERV_DESCRICAO: TStringField
      FieldName = 'SERV_DESCRICAO'
      Size = 150
    end
  end
  object dtsCadServico: TDataSource
    DataSet = qryCadServico
    Left = 321
    Top = 53
  end
  object qryCadDepart: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select dep_id, dep_descricao, DEP_DESCONTO from DEPARTAMENTO'
      'order by dep_descricao')
    Left = 613
    Top = 8
    object qryCadDepartdep_id: TIntegerField
      FieldName = 'dep_id'
    end
    object qryCadDepartdep_descricao: TStringField
      FieldName = 'dep_descricao'
      Size = 90
    end
    object qryCadDepartDEP_DESCONTO: TBCDField
      FieldName = 'DEP_DESCONTO'
      Precision = 8
      Size = 2
    end
  end
  object DtsCadDepart: TDataSource
    DataSet = qryCadDepart
    Left = 612
    Top = 50
  end
  object qryCadCfop: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CFO_ID, CFO_DESCRICAO from CFOP'
      'order by cfo_id')
    Left = 686
    Top = 7
    object qryCadCfopCFO_ID: TIntegerField
      FieldName = 'CFO_ID'
    end
    object qryCadCfopCFO_DESCRICAO: TStringField
      FieldName = 'CFO_DESCRICAO'
      Size = 90
    end
  end
  object dtsCadCfop: TDataSource
    DataSet = qryCadCfop
    Left = 684
    Top = 50
  end
  object dtsCadFornec: TDataSource
    DataSet = qryCadFornec
    Left = 142
    Top = 53
  end
  object qryCadFornec: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select for_id, for_nome, for_cgc, for_inscricao from fornecedore' +
        's'
      'order by for_nome')
    Left = 142
    Top = 9
    object qryCadFornecfor_id: TStringField
      FieldName = 'for_id'
      Size = 10
    end
    object qryCadFornecfor_nome: TStringField
      FieldName = 'for_nome'
      Size = 40
    end
    object qryCadFornecfor_cgc: TStringField
      FieldName = 'for_cgc'
      Size = 18
    end
    object qryCadFornecfor_inscricao: TStringField
      FieldName = 'for_inscricao'
      Size = 18
    end
  end
  object qryCadComb: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select t.COM_CODIGO, c.COM_DESCRICAO,'
      't.TAN_CODIGO'
      'from TANQUES t, COMBUSTIVEL c'
      'where (t.com_codigo = c.com_codigo)')
    Left = 394
    Top = 10
    object qryCadCombCOM_CODIGO: TIntegerField
      FieldName = 'COM_CODIGO'
    end
    object qryCadCombCOM_DESCRICAO: TStringField
      FieldName = 'COM_DESCRICAO'
      Size = 60
    end
    object qryCadCombTAN_CODIGO: TIntegerField
      FieldName = 'TAN_CODIGO'
    end
  end
  object dtsCadComb: TDataSource
    DataSet = qryCadComb
    Left = 395
    Top = 52
  end
  object dtsCidade: TDataSource
    DataSet = qryCidade
    Left = 299
    Top = 156
  end
  object qryCidade: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct cli_cidade from clientes order by cli_cidade')
    Left = 299
    Top = 112
    object qryCidadecli_cidade: TStringField
      FieldName = 'cli_cidade'
      Size = 25
    end
  end
  object dtsVendedor: TDataSource
    DataSet = qryVendedor
    Left = 468
    Top = 51
  end
  object qryVendedor: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select vdd_id, vdd_nome, vdd_comissao, VDD_SENHA, vdd_email from' +
        ' vendedor'
      'order by vdd_nome')
    Left = 467
    Top = 9
    object qryVendedorvdd_id: TIntegerField
      FieldName = 'vdd_id'
    end
    object qryVendedorvdd_nome: TStringField
      FieldName = 'vdd_nome'
      Size = 90
    end
    object qryVendedorvdd_comissao: TBCDField
      FieldName = 'vdd_comissao'
      Precision = 15
      Size = 3
    end
    object qryVendedorVDD_SENHA: TStringField
      FieldName = 'VDD_SENHA'
    end
    object qryVendedorvdd_email: TStringField
      FieldName = 'vdd_email'
      Size = 120
    end
  end
  object qryTransporta: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select trp_id, trp_nome from transportadora'
      'order by trp_nome')
    Left = 365
    Top = 112
    object qryTransportatrp_id: TIntegerField
      FieldName = 'trp_id'
    end
    object qryTransportatrp_nome: TStringField
      FieldName = 'trp_nome'
      Size = 70
    end
  end
  object dsTransporta: TDataSource
    DataSet = qryTransporta
    Left = 366
    Top = 155
  end
  object qry_params: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      '    PAR_SAI_PARCELA, PAR_ESTABELECIMENTO,'
      '    PAR_PRODUTO_SECAO, PAR_MENS_COBRANCA,'
      '    PAR_MENS_COBRANCA_OBS, PAR_REC_VLRRECEBER_CARTA,'
      '    PAR_REC_CONTROLEREC, PAR_REC_CORRECAOTELA,'
      '    PAR_FATOR_COEF2, PAR_ORC_IMPORTA_EXCEL,'
      '    PAR_SENHAEXCEL, PAR_REL_PROD_DIR_PICTURE,'
      '    PAR_PRO_TIPO_PROMOCAO,PAR_CAD_PRO_ALT_NOME_CAMPOS,'
      '    PAR_TIPO_CARTA_COB'
      'from'
      '    PARAMS')
    Left = 68
    Top = 9
    object qry_paramsPAR_SAI_PARCELA: TStringField
      FieldName = 'PAR_SAI_PARCELA'
      Size = 1
    end
    object qry_paramsPAR_ESTABELECIMENTO: TStringField
      FieldName = 'PAR_ESTABELECIMENTO'
      Size = 1
    end
    object qry_paramsPAR_PRODUTO_SECAO: TStringField
      FieldName = 'PAR_PRODUTO_SECAO'
      Size = 1
    end
    object qry_paramsPAR_MENS_COBRANCA: TStringField
      FieldName = 'PAR_MENS_COBRANCA'
      Size = 250
    end
    object qry_paramsPAR_MENS_COBRANCA_OBS: TStringField
      FieldName = 'PAR_MENS_COBRANCA_OBS'
      Size = 250
    end
    object qry_paramsPAR_REC_VLRRECEBER_CARTA: TStringField
      FieldName = 'PAR_REC_VLRRECEBER_CARTA'
      Size = 1
    end
    object qry_paramsPAR_REC_CONTROLEREC: TStringField
      FieldName = 'PAR_REC_CONTROLEREC'
      Size = 1
    end
    object qry_paramsPAR_REC_CORRECAOTELA: TStringField
      FieldName = 'PAR_REC_CORRECAOTELA'
      Size = 1
    end
    object qry_paramsPAR_FATOR_COEF2: TBCDField
      FieldName = 'PAR_FATOR_COEF2'
      Precision = 7
    end
    object qry_paramsPAR_ORC_IMPORTA_EXCEL: TStringField
      FieldName = 'PAR_ORC_IMPORTA_EXCEL'
      Size = 1
    end
    object qry_paramsPAR_SENHAEXCEL: TStringField
      FieldName = 'PAR_SENHAEXCEL'
      Size = 6
    end
    object qry_paramsPAR_REL_PROD_DIR_PICTURE: TStringField
      FieldName = 'PAR_REL_PROD_DIR_PICTURE'
      Size = 200
    end
    object qry_paramsPAR_PRO_TIPO_PROMOCAO: TStringField
      FieldName = 'PAR_PRO_TIPO_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object qry_paramsPAR_CAD_PRO_ALT_NOME_CAMPOS: TStringField
      FieldName = 'PAR_CAD_PRO_ALT_NOME_CAMPOS'
      Size = 1
    end
    object qry_paramsPAR_TIPO_CARTA_COB: TStringField
      FieldName = 'PAR_TIPO_CARTA_COB'
      Size = 1
    end
  end
  object qryCadSecao: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      #9'SEC_ID, SEC_DESCRICAO'
      'from'
      #9'SECAO'
      'order by'
      #9'SEC_DESCRICAO')
    Left = 222
    Top = 112
    object qryCadSecaoSEC_ID: TAutoIncField
      FieldName = 'SEC_ID'
      ReadOnly = True
    end
    object qryCadSecaoSEC_DESCRICAO: TStringField
      FieldName = 'SEC_DESCRICAO'
    end
  end
  object dtsCadSecao: TDataSource
    DataSet = qryCadSecao
    Left = 222
    Top = 156
  end
  object qry_Usuario: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select usu_id, usu_nome from usuario')
    Left = 538
    Top = 8
    object qry_Usuariousu_id: TAutoIncField
      FieldName = 'usu_id'
      ReadOnly = True
    end
    object qry_Usuariousu_nome: TStringField
      FieldName = 'usu_nome'
      Size = 90
    end
  end
  object Dts_Usuario: TDataSource
    DataSet = qry_Usuario
    Left = 540
    Top = 51
  end
  object qrynaf_codfiscal: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select NAF_CODFISCAL, NAF_DESCRICAO from NATUREZA_FISCAL')
    Left = 449
    Top = 111
    object qrynaf_codfiscalNAF_CODFISCAL: TStringField
      FieldName = 'NAF_CODFISCAL'
      Size = 10
    end
    object qrynaf_codfiscalNAF_DESCRICAO: TStringField
      FieldName = 'NAF_DESCRICAO'
      Size = 90
    end
  end
  object dtsnaf_codfiscal: TDataSource
    DataSet = qrynaf_codfiscal
    Left = 449
    Top = 153
  end
  object dtsCadCst: TDataSource
    DataSet = qryCadCst
    Left = 748
    Top = 50
  end
  object qryCadCst: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CST_ID, CST_DESCRICAO from CST')
    Left = 749
    Top = 7
    object qryCadCstCST_ID: TStringField
      FieldName = 'CST_ID'
      Size = 10
    end
    object qryCadCstCST_DESCRICAO: TStringField
      FieldName = 'CST_DESCRICAO'
      Size = 90
    end
  end
  object qry_SitTribPisCofinsSaida: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      #9'convert(varchar(10), STPC_CODIGO) as STPC_CODIGO,'
      #9'STPC_DESCRICAO'
      'FROM'
      #9'SITUACAO_TRIBUTARIA_PIS_COFINS'
      'WHERE'
      #9'STPC_CODIGO < 50'
      'ORDER BY'
      #9'convert(int, STPC_CODIGO)')
    Left = 643
    Top = 216
    object qry_SitTribPisCofinsSaidaSTPC_CODIGO: TStringField
      FieldName = 'STPC_CODIGO'
      ReadOnly = True
      Size = 10
    end
    object qry_SitTribPisCofinsSaidaSTPC_DESCRICAO: TStringField
      FieldName = 'STPC_DESCRICAO'
      Size = 200
    end
  end
  object qry_SitTribPisCofinsEntrada: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      #9'convert(varchar(10), STPC_CODIGO) as STPC_CODIGO,'
      #9'STPC_DESCRICAO'
      'FROM'
      #9'SITUACAO_TRIBUTARIA_PIS_COFINS'
      'WHERE'
      #9'STPC_CODIGO > 49'
      'ORDER BY'
      #9'convert(int, STPC_CODIGO)')
    Left = 645
    Top = 118
    object qry_SitTribPisCofinsEntradaSTPC_CODIGO: TStringField
      FieldName = 'STPC_CODIGO'
      ReadOnly = True
      Size = 10
    end
    object qry_SitTribPisCofinsEntradaSTPC_DESCRICAO: TStringField
      FieldName = 'STPC_DESCRICAO'
      Size = 200
    end
  end
  object Ds_SitTribPisCofinsEntrada: TDataSource
    DataSet = qry_SitTribPisCofinsEntrada
    Left = 644
    Top = 163
  end
  object Ds_SitTribPisCofinsSaida: TDataSource
    DataSet = qry_SitTribPisCofinsSaida
    Left = 643
    Top = 261
  end
  object qry_NatReceita: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      #9'NAT_CODIGO,NAT_OBSERVACAO,NAT_ATIVO '
      'from '
      #9'NATUREZA_RECEITA')
    Left = 124
    Top = 224
    object qry_NatReceitaNAT_CODIGO: TSmallintField
      Alignment = taLeftJustify
      DisplayWidth = 5
      FieldName = 'NAT_CODIGO'
    end
    object qry_NatReceitaNAT_OBSERVACAO: TStringField
      FieldName = 'NAT_OBSERVACAO'
      Size = 80
    end
    object qry_NatReceitaNAT_ATIVO: TStringField
      FieldName = 'NAT_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_NatReceita: TDataSource
    DataSet = qry_NatReceita
    Left = 125
    Top = 267
  end
  object Dts_FormaPagto: TDataSource
    AutoEdit = False
    DataSet = qry_FormaPagto
    Left = 212
    Top = 266
  end
  object qry_FormaPagto: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from FORMA_PAGAMENTO'
      'order by fpg_descricao')
    Left = 212
    Top = 223
    object qry_FormaPagtoFPG_ID: TAutoIncField
      FieldName = 'FPG_ID'
      ReadOnly = True
    end
    object qry_FormaPagtoFPG_DESCRICAO: TStringField
      FieldName = 'FPG_DESCRICAO'
      Size = 40
    end
    object qry_FormaPagtoFPG_TIPO: TStringField
      FieldName = 'FPG_TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_NatFiscal: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from natureza_fiscal')
    Left = 293
    Top = 222
    object qry_NatFiscalNAF_CODFISCAL: TStringField
      FieldName = 'NAF_CODFISCAL'
      Size = 10
    end
    object qry_NatFiscalNAF_CODIMPRES: TStringField
      FieldName = 'NAF_CODIMPRES'
      Size = 10
    end
    object qry_NatFiscalNAF_DESCRICAO: TStringField
      FieldName = 'NAF_DESCRICAO'
      Size = 90
    end
    object qry_NatFiscalNAF_ALIQUOTA: TBCDField
      FieldName = 'NAF_ALIQUOTA'
      Precision = 15
      Size = 3
    end
    object qry_NatFiscalNAF_CTSN: TStringField
      FieldName = 'NAF_CTSN'
      Size = 4
    end
    object qry_NatFiscalNAF_ISSQN: TStringField
      FieldName = 'NAF_ISSQN'
      FixedChar = True
      Size = 1
    end
  end
  object dts_NatFiscal: TDataSource
    AutoEdit = False
    DataSet = qry_NatFiscal
    Left = 294
    Top = 266
  end
  object qry_ecf: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select NUM_CAIXA_PARAM from parametros_reducao'
      'order by NUM_CAIXA_PARAM')
    Left = 362
    Top = 221
    object qry_ecfNUM_CAIXA_PARAM: TStringField
      FieldName = 'NUM_CAIXA_PARAM'
      Size = 3
    end
  end
  object Dts_ecf: TDataSource
    AutoEdit = False
    DataSet = qry_ecf
    Left = 360
    Top = 266
  end
  object qryBico: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      #9'B.BIC_CODIGO, C.COM_DESCRICAO'
      'from'
      #9'BICOS B'
      'inner join'
      #9'TANQUES T on T.TAN_CODIGO = B.TAN_CODIGO'
      'inner join'
      #9'COMBUSTIVEL C on C.COM_CODIGO = T.COM_CODIGO'
      'order by'
      #9'B.BIC_CODIGO')
    Left = 420
    Top = 223
    object qryBicoBIC_CODIGO: TIntegerField
      FieldName = 'BIC_CODIGO'
    end
    object qryBicoCOM_DESCRICAO: TStringField
      FieldName = 'COM_DESCRICAO'
      Size = 60
    end
  end
  object dsBico: TDataSource
    AutoEdit = False
    DataSet = qryBico
    Left = 420
    Top = 265
  end
  object qry_NatCredito: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select NAT_BC_CODIGO, NAT_BC_DESCRICAO from NATUREZA_BC_CREDITO')
    Left = 37
    Top = 231
    object qry_NatCreditoNAT_BC_CODIGO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'NAT_BC_CODIGO'
    end
    object qry_NatCreditoNAT_BC_DESCRICAO: TStringField
      FieldName = 'NAT_BC_DESCRICAO'
      Size = 150
    end
  end
  object ds_NatCredito: TDataSource
    DataSet = qry_NatCredito
    Left = 38
    Top = 276
  end
  object qryOficina: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      #9'OFI_ID, OFI_DESCRICAO'
      'from'
      #9'OFICINA'
      'order by'
      #9'OFI_DESCRICAO')
    Left = 149
    Top = 334
    object qryOficinaOFI_ID: TAutoIncField
      FieldName = 'OFI_ID'
      ReadOnly = True
    end
    object qryOficinaOFI_DESCRICAO: TStringField
      FieldName = 'OFI_DESCRICAO'
      Size = 60
    end
  end
  object qryTipoPagto: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      #9'TPG_ID, TPG_DESCRICAO'
      'from'
      #9'TIPO_PAGAMENTO'
      'order by'
      #9'TPG_DESCRICAO')
    Left = 33
    Top = 333
    object qryTipoPagtoTPG_ID: TAutoIncField
      FieldName = 'TPG_ID'
      ReadOnly = True
    end
    object qryTipoPagtoTPG_DESCRICAO: TStringField
      FieldName = 'TPG_DESCRICAO'
      Size = 30
    end
  end
  object dsOficina: TDataSource
    DataSet = qryOficina
    Left = 148
    Top = 377
  end
  object dsTipoPagto: TDataSource
    DataSet = qryTipoPagto
    Left = 32
    Top = 376
  end
  object qry_Tipo: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select '
      '  TIP_ID, '
      '  TIP_DESCRICAO'
      'from '
      '  TIPO_DOCTO'
      'order by'
      '  TIP_DESCRICAO')
    Left = 94
    Top = 333
    object qry_TipoTIP_ID: TAutoIncField
      FieldName = 'TIP_ID'
      ReadOnly = True
    end
    object qry_TipoTIP_DESCRICAO: TStringField
      FieldName = 'TIP_DESCRICAO'
      Size = 90
    end
  end
  object Dts_tipo: TDataSource
    DataSet = qry_Tipo
    Left = 95
    Top = 377
  end
  object qry_Classificacao: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select '
      '  CLF_ID, CLF_DESCRICAO, CLF_NATUREZA'
      'from '
      '  CLASS_FINANCEIRA'
      'order by'
      '  CLF_DESCRICAO')
    Left = 239
    Top = 333
    object qry_ClassificacaoCLF_ID: TIntegerField
      FieldName = 'CLF_ID'
    end
    object qry_ClassificacaoCLF_DESCRICAO: TStringField
      FieldName = 'CLF_DESCRICAO'
      Size = 90
    end
    object qry_ClassificacaoCLF_NATUREZA: TStringField
      FieldName = 'CLF_NATUREZA'
      Size = 1
    end
  end
  object Dts_Classificacao: TDataSource
    DataSet = qry_Classificacao
    Left = 239
    Top = 377
  end
  object qry_Local: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select '
      '  LOC_ID, '
      '  LOC_DESCRICAO,'
      '  LOCAL_XY'
      'from '
      '  LOCAL'
      'order by'
      '  LOC_DESCRICAO')
    Left = 316
    Top = 333
    object qry_LocalLOC_ID: TIntegerField
      FieldName = 'LOC_ID'
    end
    object qry_LocalLOC_DESCRICAO: TStringField
      FieldName = 'LOC_DESCRICAO'
      Size = 90
    end
  end
  object Dts_Local: TDataSource
    DataSet = qry_Local
    Left = 316
    Top = 377
  end
  object dtsParams: TDataSource
    DataSet = qry_params
    Left = 66
    Top = 53
  end
  object pipParams: TppDBPipeline
    DataSource = dtsParams
    UserName = 'pipParams'
    Left = 66
    Top = 97
  end
  object qryEspecial: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      '   ESP_DESCRICAO, ESP_ID'
      'from'
      '   ESPECIALIDADE'
      'order by'
      '   ESP_DESCRICAO')
    Left = 475
    Top = 223
    object qryEspecialesp_descricao: TStringField
      FieldName = 'esp_descricao'
      Size = 70
    end
    object qryEspecialesp_id: TIntegerField
      FieldName = 'esp_id'
    end
  end
  object dsEspecial: TDataSource
    DataSet = qryEspecial
    Left = 475
    Top = 264
  end
  object qry_Banco: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      #9'BAN_ID, BAN_NOME, BAN_CIDADE, BAN_CONTA, BAN_AGENCIA,'
      #9'BAN_SALDO, BAN_SALDOINI, BAN_CAIXACONTABIL, BAN_TIPOMOVIMENTO,'
      #9'BAN_EMP_CGC, BAN_EMP_NOME, BAN_EMP_INSCRICAOESTADUAL,'
      #9'BAN_CH_VLRLIN, BAN_CH_VLRCOL, BAN_CH_LI1LIN, BAN_CH_LI1COL,'
      #9'BAN_CH_LI2LIN, BAN_CH_LI2COL, BAN_CH_NOMLIN, BAN_CH_NOMCOL,'
      #9'BAN_CH_CIDLIN, BAN_CH_CIDCOL, BAN_CH_DIALIN, BAN_CH_DIACOL,'
      #9'BAN_CH_MESLIN, BAN_CH_MESCOL, BAN_CH_ANOLIN, BAN_CH_ANOCOL,'
      
        #9'BAN_CH_BOMLIN, BAN_CH_BOMCOL, BAN_CH_NUMLINHAS, BAN_CH_CARACLIN' +
        '1,'
      #9'BAN_CH_CARACLIN2, BAN_CH_TAMFONTE'
      'from'
      #9'CAIXA')
    Left = 484
    Top = 333
    object qry_BancoBAN_ID: TIntegerField
      FieldName = 'BAN_ID'
    end
    object qry_BancoBAN_NOME: TStringField
      FieldName = 'BAN_NOME'
      Size = 30
    end
    object qry_BancoBAN_CIDADE: TStringField
      FieldName = 'BAN_CIDADE'
      Size = 40
    end
    object qry_BancoBAN_CONTA: TStringField
      FieldName = 'BAN_CONTA'
    end
    object qry_BancoBAN_AGENCIA: TStringField
      FieldName = 'BAN_AGENCIA'
      Size = 10
    end
    object qry_BancoBAN_SALDO: TBCDField
      FieldName = 'BAN_SALDO'
      Precision = 15
      Size = 2
    end
    object qry_BancoBAN_SALDOINI: TBCDField
      FieldName = 'BAN_SALDOINI'
      Precision = 15
      Size = 2
    end
    object qry_BancoBAN_CAIXACONTABIL: TStringField
      FieldName = 'BAN_CAIXACONTABIL'
      Size = 1
    end
    object qry_BancoBAN_TIPOMOVIMENTO: TStringField
      FieldName = 'BAN_TIPOMOVIMENTO'
      Size = 1
    end
    object qry_BancoBAN_EMP_CGC: TStringField
      FieldName = 'BAN_EMP_CGC'
      Size = 14
    end
    object qry_BancoBAN_EMP_NOME: TStringField
      FieldName = 'BAN_EMP_NOME'
      Size = 35
    end
    object qry_BancoBAN_EMP_INSCRICAOESTADUAL: TStringField
      FieldName = 'BAN_EMP_INSCRICAOESTADUAL'
      Size = 14
    end
    object qry_BancoBAN_CH_VLRLIN: TIntegerField
      FieldName = 'BAN_CH_VLRLIN'
    end
    object qry_BancoBAN_CH_VLRCOL: TIntegerField
      FieldName = 'BAN_CH_VLRCOL'
    end
    object qry_BancoBAN_CH_LI1LIN: TIntegerField
      FieldName = 'BAN_CH_LI1LIN'
    end
    object qry_BancoBAN_CH_LI1COL: TIntegerField
      FieldName = 'BAN_CH_LI1COL'
    end
    object qry_BancoBAN_CH_LI2LIN: TIntegerField
      FieldName = 'BAN_CH_LI2LIN'
    end
    object qry_BancoBAN_CH_LI2COL: TIntegerField
      FieldName = 'BAN_CH_LI2COL'
    end
    object qry_BancoBAN_CH_NOMLIN: TIntegerField
      FieldName = 'BAN_CH_NOMLIN'
    end
    object qry_BancoBAN_CH_NOMCOL: TIntegerField
      FieldName = 'BAN_CH_NOMCOL'
    end
    object qry_BancoBAN_CH_CIDLIN: TIntegerField
      FieldName = 'BAN_CH_CIDLIN'
    end
    object qry_BancoBAN_CH_CIDCOL: TIntegerField
      FieldName = 'BAN_CH_CIDCOL'
    end
    object qry_BancoBAN_CH_DIALIN: TIntegerField
      FieldName = 'BAN_CH_DIALIN'
    end
    object qry_BancoBAN_CH_DIACOL: TIntegerField
      FieldName = 'BAN_CH_DIACOL'
    end
    object qry_BancoBAN_CH_MESLIN: TIntegerField
      FieldName = 'BAN_CH_MESLIN'
    end
    object qry_BancoBAN_CH_MESCOL: TIntegerField
      FieldName = 'BAN_CH_MESCOL'
    end
    object qry_BancoBAN_CH_ANOLIN: TIntegerField
      FieldName = 'BAN_CH_ANOLIN'
    end
    object qry_BancoBAN_CH_ANOCOL: TIntegerField
      FieldName = 'BAN_CH_ANOCOL'
    end
    object qry_BancoBAN_CH_BOMLIN: TIntegerField
      FieldName = 'BAN_CH_BOMLIN'
    end
    object qry_BancoBAN_CH_BOMCOL: TIntegerField
      FieldName = 'BAN_CH_BOMCOL'
    end
    object qry_BancoBAN_CH_NUMLINHAS: TIntegerField
      FieldName = 'BAN_CH_NUMLINHAS'
    end
    object qry_BancoBAN_CH_CARACLIN1: TIntegerField
      FieldName = 'BAN_CH_CARACLIN1'
    end
    object qry_BancoBAN_CH_CARACLIN2: TIntegerField
      FieldName = 'BAN_CH_CARACLIN2'
    end
    object qry_BancoBAN_CH_TAMFONTE: TIntegerField
      FieldName = 'BAN_CH_TAMFONTE'
    end
  end
  object Dts_Banco: TDataSource
    DataSet = qry_Banco
    Left = 486
    Top = 378
  end
  object qryRestricao: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select RES_ID, RES_DESCRICAO from restricoes')
    Left = 147
    Top = 112
    object qryRestricaoRES_ID: TIntegerField
      FieldName = 'RES_ID'
    end
    object qryRestricaoRES_DESCRICAO: TStringField
      FieldName = 'RES_DESCRICAO'
      Size = 40
    end
  end
  object dtsRestricao: TDataSource
    DataSet = qryRestricao
    Left = 147
    Top = 157
  end
  object qry_Tanque: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      #9'convert(varchar(10),TAN_CODIGO) as TAN_CODIGO, COM_DESCRICAO'
      'from '
      #9'TANQUES T '
      'inner join'
      #9'COMBUSTIVEL C on T.COM_CODIGO = C.COM_CODIGO'
      'where'
      '               T.TAN_SITUACAO = '#39'A'#39)
    Left = 562
    Top = 330
    object qry_TanqueTAN_CODIGO: TStringField
      FieldName = 'TAN_CODIGO'
      ReadOnly = True
      Size = 3
    end
    object qry_TanqueCOM_DESCRICAO: TStringField
      FieldName = 'COM_DESCRICAO'
      Size = 60
    end
  end
  object dts_Tanque: TDataSource
    DataSet = qry_Tanque
    Left = 562
    Top = 380
  end
  object dtsMecanico: TDataSource
    DataSet = qryMecanico
    Left = 646
    Top = 379
  end
  object qryMecanico: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select mec_id, mec_nome from mecanico'
      'order by mec_nome')
    Left = 645
    Top = 329
    object qryMecanicomec_id: TIntegerField
      FieldName = 'mec_id'
    end
    object qryMecanicomec_nome: TStringField
      FieldName = 'mec_nome'
      Size = 40
    end
  end
  object dsMarca: TDataSource
    DataSet = qryMarca
    Left = 726
    Top = 379
  end
  object qryMarca: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MRC_ID, MRC_DESCRICAO'
      'from MARCA'
      'order by MRC_DESCRICAO')
    Left = 725
    Top = 329
    object qryMarcaMRC_ID: TAutoIncField
      FieldName = 'MRC_ID'
      ReadOnly = True
    end
    object qryMarcaMRC_DESCRICAO: TStringField
      FieldName = 'MRC_DESCRICAO'
      Size = 60
    end
  end
  object qryImagens: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      '   PAR_REL_DISTRIB_PICTURE1, '
      '   PAR_REL_DISTRIB_PICTURE2 '
      'from '
      '   params')
    Left = 528
    Top = 112
    object qryImagensPAR_REL_DISTRIB_PICTURE1: TStringField
      FieldName = 'PAR_REL_DISTRIB_PICTURE1'
      Size = 200
    end
    object qryImagensPAR_REL_DISTRIB_PICTURE2: TStringField
      FieldName = 'PAR_REL_DISTRIB_PICTURE2'
      Size = 200
    end
  end
  object dsPrestServ: TDataSource
    DataSet = qryPrestServ
    Left = 544
    Top = 260
  end
  object qryPrestServ: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select PRE_ID, PRE_NOME from PRESTSERVICO order by PRE_NOME')
    Left = 544
    Top = 216
    object qryPrestServPRE_ID: TAutoIncField
      FieldName = 'PRE_ID'
      ReadOnly = True
    end
    object qryPrestServPRE_NOME: TStringField
      FieldName = 'PRE_NOME'
      Size = 60
    end
  end
  object dsCargas: TDataSource
    DataSet = qryCargas
    Left = 730
    Top = 268
  end
  object qryCargas: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      #9'CAG_ID, CAG_DESCRICAO'
      'from'
      #9'CARGAS'
      'order by'
      #9'CAG_DESCRICAO')
    Left = 729
    Top = 224
    object qryCargasCAG_ID: TAutoIncField
      FieldName = 'CAG_ID'
      ReadOnly = True
    end
    object qryCargasCAG_DESCRICAO: TStringField
      FieldName = 'CAG_DESCRICAO'
      Size = 10
    end
  end
  object qryContribPis: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT CCO_ID, CCO_CODIGO, CCO_DENOMINACAO FROM CODIGOS_CONTRIB_' +
        'PIS ORDER BY CCO_CODIGO')
    Left = 16
    Top = 144
    object qryContribPisCCO_ID: TAutoIncField
      FieldName = 'CCO_ID'
      ReadOnly = True
    end
    object qryContribPisCCO_CODIGO: TStringField
      FieldName = 'CCO_CODIGO'
      Size = 6
    end
    object qryContribPisCCO_DENOMINACAO: TStringField
      FieldName = 'CCO_DENOMINACAO'
      Size = 240
    end
  end
  object Ds_ContribPis: TDataSource
    DataSet = qryContribPis
    Left = 17
    Top = 189
  end
  object qryContribCofins: TADOQuery
    Connection = DM.Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT CCO_ID, CCO_CODIGO, CCO_DENOMINACAO FROM CODIGOS_CONTRIB_' +
        'COFINS ORDER BY CCO_CODIGO')
    Left = 78
    Top = 144
    object qryContribCofinsCCO_ID: TAutoIncField
      FieldName = 'CCO_ID'
      ReadOnly = True
    end
    object qryContribCofinsCCO_CODIGO: TStringField
      FieldName = 'CCO_CODIGO'
      Size = 6
    end
    object qryContribCofinsCCO_DENOMINACAO: TStringField
      FieldName = 'CCO_DENOMINACAO'
      Size = 240
    end
  end
  object Ds_ContribCofins: TDataSource
    DataSet = qryContribCofins
    Left = 79
    Top = 189
  end
end
