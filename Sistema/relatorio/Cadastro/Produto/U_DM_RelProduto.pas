unit U_DM_RelProduto;

interface

uses
  SysUtils, Classes, DB, ppVar, ppDB, ppBands, ppCtrls, ppClass, ppParameter,
  ppPrnabl, ppCache, ppProd, ppReport, ADODB, ppComm, ppRelatv, ppDBPipe,
  ppStrtch, ppMemo, ppRegion, ppDesignLayer;

type
  TDM_RelProduto = class(TDataModule)
    pip_ProdPisCofins: TppDBPipeline;
    qry_ProdPisCofins: TADOQuery;
    qry_ProdPisCofinsPRO_REFERENCIA: TStringField;
    qry_ProdPisCofinsPRO_DESCRICAO: TStringField;
    qry_ProdPisCofinsSTPC_CODIGO: TIntegerField;
    qry_ProdPisCofinsPRO_ALIQPIS: TBCDField;
    qry_ProdPisCofinsPRO_ALIQCOFINS: TBCDField;
    qry_ProdPisCofinsSTPC_CODIGO_SAI: TIntegerField;
    qry_ProdPisCofinsPRO_ALIQPIS_SAI: TBCDField;
    qry_ProdPisCofinsPRO_ALIQCOFINS_SAI: TBCDField;
    qry_ProdPisCofinsPRO_CODIGONBM: TStringField;
    qry_ProdPisCofinsNAT_BC_CODIGO: TSmallintField;
    qry_ProdPisCofinsNAT_CODIGO: TSmallintField;
    dts_ProdPisCofins: TDataSource;
    pp_ProdPisCofins: TppReport;
    ppTitleBand6: TppTitleBand;
    ppHeaderBand6: TppHeaderBand;
    ppLabel53: TppLabel;
    ppDBText35: TppDBText;
    ppLine3: TppLine;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLine9: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel73: TppLabel;
    ppLabel75: TppLabel;
    ppLabel57: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText46: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText47: TppDBText;
    ppDBText58: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppParameterList23: TppParameterList;
    Dts_ContagemDia: TDataSource;
    ppContagemDia: TppReport;
    ppTitleBand11: TppTitleBand;
    ppHeaderBand10: TppHeaderBand;
    ppLabel116: TppLabel;
    ppLine29: TppLine;
    ppDBText84: TppDBText;
    ppDetailBand10: TppDetailBand;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppLabel126: TppLabel;
    ppFooterBand9: TppFooterBand;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppDBText89: TppDBText;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel123: TppLabel;
    ppLine76: TppLine;
    ppLine79: TppLine;
    ppLabel122: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppParameterList6: TppParameterList;
    qryContagemDia: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    BCDField1: TBCDField;
    qryContagemDiapro_vlrcusto: TBCDField;
    qryContagemDiapro_vlrvenda: TBCDField;
    pipContagemDia: TppDBPipeline;
    Dts_Fornecedor: TDataSource;
    qryFornecedor: TADOQuery;
    qryFornecedorfor_nome: TStringField;
    qryFornecedorpro_ean1: TStringField;
    qryFornecedorpro_referencia: TStringField;
    qryFornecedorpro_descricao: TStringField;
    qryFornecedorpro_unidade: TStringField;
    qryFornecedorpro_estoque: TBCDField;
    qryFornecedorpro_vlrcusto: TBCDField;
    qryFornecedortotal: TBCDField;
    qryFornecedorPRO_VLRVENDA: TBCDField;
    qryFornecedorPRO_VLRPRAZO: TBCDField;
    pipFornecedor: TppDBPipeline;
    ppFornecedor: TppReport;
    ppTitleBand9: TppTitleBand;
    ppHeaderBand9: TppHeaderBand;
    ppLabel101: TppLabel;
    ppDBText72: TppDBText;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    lbl_CustoFornec: TppLabel;
    lbl_TotalFornec: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppLine70: TppLine;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppDBText78: TppDBText;
    ppLabel109: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel156: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppLine4: TppLine;
    ppParameterList4: TppParameterList;
    dts_Compra: TDataSource;
    qry_Compra: TADOQuery;
    pip_Compra: TppDBPipeline;
    Rep_Compra: TppReport;
    ppTitleBand7: TppTitleBand;
    ppHeaderBand8: TppHeaderBand;
    ppLabel66: TppLabel;
    ppDBText75: TppDBText;
    ppLabel130: TppLabel;
    ppLabel133: TppLabel;
    ppLine35: TppLine;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText83: TppDBText;
    ppDBText117: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel96: TppLabel;
    ppDBText122: TppDBText;
    ppLine34: TppLine;
    ppLine55: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup17: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppLabel159: TppLabel;
    ppDBText170: TppDBText;
    ppLine54: TppLine;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppParameterList20: TppParameterList;
    Dts_ProdNaoMovto: TDataSource;
    qry_ProdNaoMovto: TADOQuery;
    qry_ProdNaoMovtoPRO_ID: TAutoIncField;
    qry_ProdNaoMovtoPRO_DESCRICAO: TStringField;
    qry_ProdNaoMovtoPRO_ESTOQUE: TBCDField;
    qry_ProdNaoMovtoPRO_ULTVENDA: TDateTimeField;
    qry_ProdNaoMovtoPRO_REFERENCIA: TStringField;
    qry_ProdNaoMovtoPRO_ATIVO: TStringField;
    pip_ProdNaoMovto: TppDBPipeline;
    pp_ProdNaoMovto: TppReport;
    ppTitleBand19: TppTitleBand;
    ppHeaderBand24: TppHeaderBand;
    ppLabel87: TppLabel;
    ppDBText81: TppDBText;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppLabel165: TppLabel;
    ppLabel167: TppLabel;
    ppDetailBand25: TppDetailBand;
    ppDBText210: TppDBText;
    ppDBText211: TppDBText;
    ppDBText213: TppDBText;
    ppDBText214: TppDBText;
    ppDBText59: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList25: TppParameterList;
    dsRelDepto: TDataSource;
    qryRelDepto: TADOQuery;
    qryRelDeptodep_descricao: TStringField;
    qryRelDeptoestoque: TBCDField;
    qryRelDeptocusto: TBCDField;
    qryRelDeptomedio: TBCDField;
    ppRelDepto: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLabel210: TppLabel;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppLabel214: TppLabel;
    ppLabel209: TppLabel;
    ppDBText173: TppDBText;
    ppLine107: TppLine;
    ppLine109: TppLine;
    ppDetailBand20: TppDetailBand;
    ppDBText168: TppDBText;
    ppDBText169: TppDBText;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLine108: TppLine;
    ppSystemVariable39: TppSystemVariable;
    ppSystemVariable40: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppParameterList12: TppParameterList;
    pipRelDepto: TppDBPipeline;
    dts_aliqfor: TDataSource;
    qry_aliqfor: TADOQuery;
    qry_aliqforfor_nome: TStringField;
    qry_aliqforpro_referencia: TStringField;
    qry_aliqforpro_descricao: TStringField;
    qry_aliqforpro_unidade: TStringField;
    qry_aliqforpro_estoque: TBCDField;
    qry_aliqforpro_vlrcusto: TBCDField;
    qry_aliqforpro_vlrmedio: TBCDField;
    qry_aliqforpro_vlrvenda: TBCDField;
    qry_aliqfornaf_aliquota: TBCDField;
    qry_aliqfornaf_descricao: TStringField;
    pipAliqFor: TppDBPipeline;
    ppAliqFor: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppDBText134: TppDBText;
    ppLabel166: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLabel179: TppLabel;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppDBText143: TppDBText;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLabel177: TppLabel;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppLabel168: TppLabel;
    ppDBCalc22: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppLine61: TppLine;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel176: TppLabel;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppDBText142: TppDBText;
    ppLine87: TppLine;
    ppLine89: TppLine;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLabel178: TppLabel;
    ppDBCalc20: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppParameterList9: TppParameterList;
    DsAlteracaoPreco: TDataSource;
    qryAlteracaoPreco: TADOQuery;
    qryAlteracaoPrecopro_dtaltpreco: TDateTimeField;
    qryAlteracaoPrecopro_referencia: TStringField;
    qryAlteracaoPrecodep_descricao: TStringField;
    qryAlteracaoPrecopro_descricao: TStringField;
    qryAlteracaoPrecopro_unidade: TStringField;
    qryAlteracaoPrecopro_estoqmin: TBCDField;
    qryAlteracaoPrecopro_vlrcusto: TBCDField;
    qryAlteracaoPrecopro_margem: TBCDField;
    qryAlteracaoPrecopro_vlrvenda: TBCDField;
    qryAlteracaoPrecopro_vlrprazo: TBCDField;
    qryAlteracaoPrecopro_custonota: TBCDField;
    qryAlteracaoPrecoNAF_ALIQUOTA: TBCDField;
    pipAlteracaoPreco: TppDBPipeline;
    ppAlteracaoPreco: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel182: TppLabel;
    ppDBText152: TppDBText;
    ppDetailBand18: TppDetailBand;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppDBText163: TppDBText;
    ppDBText155: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppGroup16: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppLine95: TppLine;
    ppLabel191: TppLabel;
    ppLabel192: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppLine98: TppLine;
    ppLabel201: TppLabel;
    ppDBText164: TppDBText;
    ppLabel202: TppLabel;
    ppLine100: TppLine;
    ppLabel193: TppLabel;
    ppGroupFooterBand16: TppGroupFooterBand;
    ppParameterList11: TppParameterList;
    Dts_DtUltimaVenda: TDataSource;
    qry_DtUltimaVenda: TADOQuery;
    qry_DtUltimaVendapro_referencia: TStringField;
    qry_DtUltimaVendapro_descricao: TStringField;
    qry_DtUltimaVendapro_unidade: TStringField;
    qry_DtUltimaVendapro_ultvenda: TDateTimeField;
    pip_DtUltimaVenda: TppDBPipeline;
    pp_DtUltimaVenda: TppReport;
    ppTitleBand4: TppTitleBand;
    ppHeaderBand4: TppHeaderBand;
    ppLabel40: TppLabel;
    ppDBText32: TppDBText;
    ppLabel51: TppLabel;
    ppLabel43: TppLabel;
    ppLabel50: TppLabel;
    ppLabel45: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText34: TppDBText;
    ppDBText33: TppDBText;
    ppDBText42: TppDBText;
    ppDBText27: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppParameterList17: TppParameterList;
    dts_lote: TDataSource;
    qry_lote: TADOQuery;
    qry_loteLOT_ID: TAutoIncField;
    qry_lotePRO_ID: TIntegerField;
    qry_loteLOT_LOTE: TStringField;
    qry_loteLOT_QUANT: TBCDField;
    qry_loteLOT_DATA: TDateTimeField;
    qry_lotepro_descricao: TStringField;
    qry_lotepro_registro_ms: TStringField;
    pip_lote: TppDBPipeline;
    Rep_lote: TppReport;
    ppTitleBand13: TppTitleBand;
    ppHeaderBand14: TppHeaderBand;
    ppLabel135: TppLabel;
    ppDBText92: TppDBText;
    ppLabel138: TppLabel;
    ppLabel141: TppLabel;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    ppLabel146: TppLabel;
    ppLine22: TppLine;
    ppLine41: TppLine;
    ppDetailBand15: TppDetailBand;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLine42: TppLine;
    ppLabel149: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppParameterList22: TppParameterList;
    ppCombustivel: TppReport;
    ppTitleBand10: TppTitleBand;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLine78: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine82: TppLine;
    ppLabel145: TppLabel;
    ppDBText106: TppDBText;
    ppSystemVariable21: TppSystemVariable;
    ppSystemVariable22: TppSystemVariable;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppLabel134: TppLabel;
    ppDBCalc47: TppDBCalc;
    ppLine83: TppLine;
    ppParameterList5: TppParameterList;
    RepGeralDisc: TppReport;
    ppHeaderBand2: TppHeaderBand;
    lbl_DescricaoFiltros: TppLabel;
    ppDBText68: TppDBText;
    ppLine33: TppLine;
    Geral_Desc_1: TppLabel;
    Geral_Ref_1: TppLabel;
    ppLine8: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine110: TppLine;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText12: TppDBText;
    ppLine32: TppLine;
    ppLabel30: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLabel16: TppLabel;
    ppDBText25: TppDBText;
    ppLine28: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText80: TppDBText;
    ppLabel76: TppLabel;
    ppLine13: TppLine;
    ppLine16: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppParameterList2: TppParameterList;
    repExtratoEnt: TppReport;
    ppTitleBand8: TppTitleBand;
    ppHeaderBand13: TppHeaderBand;
    ppLabel23: TppLabel;
    ppSystemVariable27: TppSystemVariable;
    ppSystemVariable28: TppSystemVariable;
    ppLabel39: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBText28: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText125: TppDBText;
    ppDBText128: TppDBText;
    ppDBText40: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppDBText130: TppDBText;
    ppLine53: TppLine;
    ppLabel44: TppLabel;
    ppLabel28: TppLabel;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLine30: TppLine;
    ppLabel26: TppLabel;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppLabel38: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc36: TppDBCalc;
    ppParameterList21: TppParameterList;
    ppAliq: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppDBText62: TppDBText;
    ppLabel3: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText13: TppDBText;
    ppDBText20: TppDBText;
    ppDBText29: TppDBText;
    ppDBText37: TppDBText;
    ppDBText57: TppDBText;
    ppDBText129: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine64: TppLine;
    ppLabel93: TppLabel;
    ppDBCalc44: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText61: TppDBText;
    ppLine27: TppLine;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel74: TppLabel;
    ppLabel79: TppLabel;
    ppLine39: TppLine;
    ppLabel80: TppLabel;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLabel46: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel22: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppParameterList3: TppParameterList;
    pp_AuxiliaInventario: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppLabel227: TppLabel;
    ppDBText182: TppDBText;
    ppLine115: TppLine;
    ppLabel229: TppLabel;
    ppLabel230: TppLabel;
    ppLabel231: TppLabel;
    ppLabel232: TppLabel;
    ppLine116: TppLine;
    ppLabel233: TppLabel;
    ppLabel234: TppLabel;
    ppDetailBand22: TppDetailBand;
    ppDBText183: TppDBText;
    ppDBText184: TppDBText;
    ppDBText185: TppDBText;
    ppDBText186: TppDBText;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppFooterBand19: TppFooterBand;
    ppSummaryBand8: TppSummaryBand;
    ppLabel235: TppLabel;
    ppDBCalc32: TppDBCalc;
    ppParameterList14: TppParameterList;
    pp_TabelaSecao: TppReport;
    ppTitleBand17: TppTitleBand;
    ppHeaderBand20: TppHeaderBand;
    ppLabel216: TppLabel;
    ppDBText174: TppDBText;
    ppDetailBand21: TppDetailBand;
    ppDBText175: TppDBText;
    ppDBText176: TppDBText;
    ppDBText177: TppDBText;
    ppDBText178: TppDBText;
    ppDBText179: TppDBText;
    ppDBText180: TppDBText;
    ppLine111: TppLine;
    ppDBText23: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppSummaryBand7: TppSummaryBand;
    ppDBCalc30: TppDBCalc;
    ppLabel218: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLine7: TppLine;
    ppGroup19: TppGroup;
    ppGroupHeaderBand19: TppGroupHeaderBand;
    ppLabel219: TppLabel;
    ppDBText181: TppDBText;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppLabel221: TppLabel;
    ppLabel220: TppLabel;
    ppLabel222: TppLabel;
    ppLabel223: TppLabel;
    ppLabel224: TppLabel;
    ppLabel225: TppLabel;
    ppLabel226: TppLabel;
    ppLine114: TppLine;
    ppGroupFooterBand19: TppGroupFooterBand;
    ppLabel29: TppLabel;
    ppDBCalc35: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    ppParameterList13: TppParameterList;
    pip_TabelaSecao: TppDBPipeline;
    pip_AuxiliaInventario: TppDBPipeline;
    pipAliq: TppDBPipeline;
    pipGeralDisc: TppDBPipeline;
    pipCombustivel: TppDBPipeline;
    pipTotais: TppDBPipeline;
    ppTotais: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBText63: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText1: TppDBText;
    ppDBText79: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel2: TppLabel;
    ppLabel110: TppLabel;
    ppDBText82: TppDBText;
    ppLabel113: TppLabel;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppParameterList1: TppParameterList;
    qryTotais: TADOQuery;
    qryTotaispro_ean1: TStringField;
    qryTotaispro_referencia: TStringField;
    qryTotaispro_descricao: TStringField;
    qryTotaispro_unidade: TStringField;
    qryTotaispro_quant_unid: TBCDField;
    qryTotaispro_estoque: TBCDField;
    qryTotaispro_estoqmin: TBCDField;
    qryTotaispro_vlrcusto: TBCDField;
    qryTotaispro_margem: TBCDField;
    qryTotaispro_vlrvenda: TBCDField;
    qryTotaispro_vlrprazo: TBCDField;
    qryTotaisNAF_ALIQUOTA: TBCDField;
    qryTotaisdep_descricao: TStringField;
    qry_combustivel: TADOQuery;
    qry_combustiveltan_codigo: TIntegerField;
    qry_combustivelcom_codigo: TIntegerField;
    qry_combustivelESTOQUE: TBCDField;
    qry_combustivelcom_precusto: TBCDField;
    qry_combustivelcom_descricao: TStringField;
    qry_combustivelcusto: TBCDField;
    qryExtratoEnt: TADOQuery;
    qryAliq: TADOQuery;
    qryAliqdep_descricao: TStringField;
    qryAliqpro_ean1: TStringField;
    qryAliqpro_referencia: TStringField;
    qryAliqpro_descricao: TStringField;
    qryAliqpro_unidade: TStringField;
    qryAliqpro_estoque: TBCDField;
    qryAliqpro_vlrcusto: TBCDField;
    qryAliqpro_vlrmedio: TBCDField;
    qryAliqCusto: TBCDField;
    qryAliqMedio: TBCDField;
    qryAliqnaf_aliquota: TBCDField;
    qryAliqnaf_descricao: TStringField;
    qryAliqcst_id: TStringField;
    qry_AuxiliaInvetario: TADOQuery;
    qry_TabelaSecao: TADOQuery;
    qry_TabelaSecaosec_descricao: TStringField;
    qry_TabelaSecaopro_ean1: TStringField;
    qry_TabelaSecaopro_referencia: TStringField;
    qry_TabelaSecaopro_descricao: TStringField;
    qry_TabelaSecaopro_unidade: TStringField;
    qry_TabelaSecaopro_vlrvenda: TBCDField;
    qry_TabelaSecaopro_vlrprazo: TBCDField;
    qry_TabelaSecaopro_estoque: TBCDField;
    qry_TabelaSecaototal_venda: TBCDField;
    qry_TabelaSecaopro_vlrcusto: TBCDField;
    qry_TabelaSecaototal_custo: TBCDField;
    Dts_TabelaSecao: TDataSource;
    Dts_AuxiliaInventario: TDataSource;
    dtsAliq: TDataSource;
    dsExtratoEnt: TDataSource;
    dtsGeralDisc: TDataSource;
    Dts_combustivel: TDataSource;
    dtsTotais: TDataSource;
    ppMovimentacao: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel34: TppLabel;
    ppDBText96: TppDBText;
    ppDetailBand13: TppDetailBand;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText105: TppDBText;
    ppDBText111: TppDBText;
    ppDBText113: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLine37: TppLine;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLine47: TppLine;
    ppDBText115: TppDBText;
    ppLabel54: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLabel85: TppLabel;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppLabel88: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText24: TppDBText;
    ppLabel15: TppLabel;
    ppLine6: TppLine;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppParameterList8: TppParameterList;
    qryMovimentacao: TADOQuery;
    DtsMovimentacao: TDataSource;
    Dts_AtivoInativo: TDataSource;
    qry_AtivoInativo: TADOQuery;
    qry_AtivoInativoPRO_ID: TAutoIncField;
    qry_AtivoInativoPRO_EAN1: TStringField;
    qry_AtivoInativoPRO_EAN2: TStringField;
    qry_AtivoInativoPRO_EAN3: TStringField;
    qry_AtivoInativoPRO_REFERENCIA: TStringField;
    qry_AtivoInativoCST_ID: TStringField;
    qry_AtivoInativoNAF_CODFISCAL: TStringField;
    qry_AtivoInativoDEP_ID: TIntegerField;
    qry_AtivoInativoPRO_UNIDADE: TStringField;
    qry_AtivoInativoPRO_QUANT_UNID: TBCDField;
    qry_AtivoInativoPRO_ESTOQUE: TBCDField;
    qry_AtivoInativoPRO_ESTOQMIN: TBCDField;
    qry_AtivoInativoPRO_VLRCUSTO: TBCDField;
    qry_AtivoInativoPRO_VLRPREPOS: TBCDField;
    qry_AtivoInativoPRO_VLRMEDIO: TBCDField;
    qry_AtivoInativoPRO_VLRPRAZO: TBCDField;
    qry_AtivoInativoPRO_ULTCOMP: TDateTimeField;
    qry_AtivoInativoPRO_ULTVENDA: TDateTimeField;
    qry_AtivoInativoPRO_QTDEULTCOM: TBCDField;
    qry_AtivoInativoPRO_DTALTPRECO: TDateTimeField;
    qry_AtivoInativoPRO_DESCRICAO: TStringField;
    qry_AtivoInativoPRO_MARGEM: TBCDField;
    qry_AtivoInativoPRO_COMISSAO: TBCDField;
    qry_AtivoInativoPRO_VLRVENDA: TBCDField;
    qry_AtivoInativoPRO_OBSERVACOES: TStringField;
    qry_AtivoInativoPRO_BALANCA: TStringField;
    qry_AtivoInativoPRO_CODBALANCA: TStringField;
    qry_AtivoInativoPRO_RESUMIDO: TStringField;
    qry_AtivoInativoPRO_ITA: TIntegerField;
    qry_AtivoInativoPRO_VALIDADE: TDateTimeField;
    qry_AtivoInativoPRO_ESTOQUE_DEP: TBCDField;
    qry_AtivoInativoPRO_VLRCUSTO_DEP: TBCDField;
    qry_AtivoInativoPRO_ATIVO: TStringField;
    qry_AtivoInativoPRO_CUSTONOTA: TBCDField;
    qry_AtivoInativoPRO_VLRATACADO: TBCDField;
    qry_AtivoInativoPRO_MARGEMPRAZO: TBCDField;
    qry_AtivoInativoPRO_VLRCALCSUBST: TBCDField;
    qry_AtivoInativoPRO_VLRALIQSUBST: TBCDField;
    qry_AtivoInativopro_icmscompra: TBCDField;
    qry_AtivoInativopro_icmsvenda: TBCDField;
    qry_AtivoInativoPRO_PESOLIQUIDO: TBCDField;
    qry_AtivoInativoPRO_PESOBRUTO: TBCDField;
    qry_AtivoInativoPRO_CODIGONBM: TStringField;
    qry_AtivoInativopro_vlrmedioant: TBCDField;
    qry_AtivoInativoPRO_ORIGEM: TIntegerField;
    qry_AtivoInativoCFS_ID: TStringField;
    qry_AtivoInativopro_descmax: TBCDField;
    qry_AtivoInativoPRO_DATACADASTRO: TDateTimeField;
    qry_AtivoInativoLAB_ID: TIntegerField;
    qry_AtivoInativoPRO_VLRMINIMO: TBCDField;
    qry_AtivoInativopro_gaveta: TStringField;
    qry_AtivoInativoFOR_ID: TIntegerField;
    pipAtivoInativo: TppDBPipeline;
    ppAtivoInativo: TppReport;
    ppTitleBand14: TppTitleBand;
    ppHeaderBand16: TppHeaderBand;
    ppLabel180: TppLabel;
    ppDBText144: TppDBText;
    ppLine93: TppLine;
    ppLine94: TppLine;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    ppLabel185: TppLabel;
    ppLabel186: TppLabel;
    ppLabel187: TppLabel;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppDetailBand17: TppDetailBand;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppParameterList10: TppParameterList;
    Dts_Promocao: TDataSource;
    qry_Promocao: TADOQuery;
    pip_Promocao: TppDBPipeline;
    pp_Promocao: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppDBText197: TppDBText;
    ppLabel245: TppLabel;
    ppLabel249: TppLabel;
    ppLabel250: TppLabel;
    ppLabel252: TppLabel;
    ppLabel253: TppLabel;
    ppLabel254: TppLabel;
    ppLine120: TppLine;
    ppLine122: TppLine;
    ppDetailBand24: TppDetailBand;
    ppDBText199: TppDBText;
    ppDBText200: TppDBText;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppDBText203: TppDBText;
    ppSummaryBand10: TppSummaryBand;
    ppLabel255: TppLabel;
    ppDBCalc34: TppDBCalc;
    ppParameterList16: TppParameterList;
    pp_ProdCst: TppReport;
    ppHeaderBand22: TppHeaderBand;
    ppDBText189: TppDBText;
    ppLabel236: TppLabel;
    ppLabel241: TppLabel;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    ppLabel244: TppLabel;
    ppLabel247: TppLabel;
    ppLabel246: TppLabel;
    ppDetailBand23: TppDetailBand;
    ppDBText190: TppDBText;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText193: TppDBText;
    ppDBText194: TppDBText;
    ppDBText196: TppDBText;
    ppSummaryBand9: TppSummaryBand;
    ppLabel240: TppLabel;
    ppDBCalc33: TppDBCalc;
    ppGroup18: TppGroup;
    ppGroupHeaderBand18: TppGroupHeaderBand;
    ppLine117: TppLine;
    ppLine118: TppLine;
    ppLabel239: TppLabel;
    ppDBText198: TppDBText;
    ppDBText195: TppDBText;
    ppGroupFooterBand18: TppGroupFooterBand;
    ppDBCalc40: TppDBCalc;
    ppLine119: TppLine;
    ppLabel238: TppLabel;
    ppParameterList15: TppParameterList;
    pip_ProdCst: TppDBPipeline;
    qry_ProdCst: TADOQuery;
    qry_ProdCstpro_referencia: TStringField;
    qry_ProdCstpro_descricao: TStringField;
    qry_ProdCstpro_unidade: TStringField;
    qry_ProdCstpro_estoque: TBCDField;
    qry_ProdCstpro_vlrcusto: TBCDField;
    qry_ProdCsttotal: TBCDField;
    qry_ProdCstcst_id: TStringField;
    qry_ProdCstcst_descricao: TStringField;
    Dts_ProdCst: TDataSource;
    qryGeralDisc: TADOQuery;
    qryGeralDiscdep_descricao: TStringField;
    qryGeralDiscsec_descricao: TStringField;
    qryGeralDiscpro_ean1: TStringField;
    qryGeralDiscpro_referencia: TStringField;
    qryGeralDiscpro_descricao: TStringField;
    qryGeralDiscpro_unidade: TStringField;
    qryGeralDiscpro_quant_unid: TBCDField;
    qryGeralDiscpro_estoque: TBCDField;
    qryGeralDiscpro_estoqmin: TBCDField;
    qryGeralDiscpro_estoqmax: TBCDField;
    qryGeralDiscpro_vlrvenda: TBCDField;
    qryGeralDiscpro_vlrprazo: TBCDField;
    qryGeralDiscpro_vlrcusto: TBCDField;
    qryGeralDiscpro_custonota: TBCDField;
    qryGeralDiscpro_vlrmedio: TBCDField;
    qryGeralDiscpro_vlratacado: TBCDField;
    qryGeralDisctotal_venda: TBCDField;
    qryGeralDisctotal_custo: TBCDField;
    qryGeralDisctotal_custo_real: TBCDField;
    qryGeralDisctotal_medio: TBCDField;
    qryGeralDisccst_id: TStringField;
    qryGeralDiscsugestao: TBCDField;
    qryGeralDiscnaf_aliquota: TBCDField;
    qryGeralDiscpro_gaveta: TStringField;
    qryGeralDiscsec_id: TIntegerField;
    qryGeralDiscpro_codfab1: TStringField;
    qryGeralDiscPRO_CODIGONBM: TStringField;
    qryGeralDiscfor_id: TIntegerField;
    qryGeralDiscfor_nome: TStringField;
    qryExtratoAcum: TADOQuery;
    qryExtratoAcumPRO_ID: TIntegerField;
    qryExtratoAcumREFERENCIA: TStringField;
    qryExtratoAcumDESCRICAO: TStringField;
    qryExtratoAcumENTRADA: TBCDField;
    qryExtratoAcumSAIDA: TBCDField;
    qryExtratoAcumSISTEMA: TStringField;
    dts_extrato: TDataSource;
    dtsExtratoAcum: TDataSource;
    pip_ExtratoAcum: TppDBPipeline;
    Rep_ExtratoAcum: TppReport;
    ppTitleBand5: TppTitleBand;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText67: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppSummaryBand12: TppSummaryBand;
    ppLine26: TppLine;
    ppParameterList19: TppParameterList;
    Rep_Extrato: TppReport;
    ppTitleBand3: TppTitleBand;
    ppHeaderBand3: TppHeaderBand;
    ppLabel47: TppLabel;
    ppDBText65: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel49: TppLabel;
    ppLabel86: TppLabel;
    ppLine12: TppLine;
    ppVariable2: TppVariable;
    ppDBText60: TppDBText;
    ppLine14: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand11: TppSummaryBand;
    ppLabel64: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppVariable10: TppVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText56: TppDBText;
    ppLine17: TppLine;
    ppLabel90: TppLabel;
    ppLabel92: TppLabel;
    ppLabel94: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel100: TppLabel;
    ppDBCalc41: TppDBCalc;
    ppDBCalc42: TppDBCalc;
    ppLine23: TppLine;
    ppParameterList18: TppParameterList;
    pip_extrato: TppDBPipeline;
    qry_SaldoInicial: TADOQuery;
    qry_SaldoInicialSaldoInicial: TBCDField;
    qryExtrato: TADOQuery;
    var_MovtoDisc_EstoqueAtual: TppVariable;
    qryMovimentacaosec_id: TIntegerField;
    qryMovimentacaosec_descricao: TStringField;
    qryMovimentacaodep_id: TIntegerField;
    qryMovimentacaodep_descricao: TStringField;
    qryMovimentacaopro_id: TIntegerField;
    qryMovimentacaopro_referencia: TStringField;
    qryMovimentacaopro_descricao: TStringField;
    qryMovimentacaopro_unidade: TStringField;
    qryMovimentacaoQTDE_ENTRADA: TFMTBCDField;
    qryMovimentacaoQTDE_SAIDA: TFMTBCDField;
    pipMovimentacao: TppDBPipeline;
    qryExtratoEntPRO_ID: TIntegerField;
    qryExtratoEntPRO_EAN: TStringField;
    qryExtratoEntPRO_REFERENCIA: TStringField;
    qryExtratoEntPRO_DESCRICAO: TStringField;
    qryExtratoEntPRO_ESTOQUE: TBCDField;
    qryExtratoEntPRO_UNIDADE: TStringField;
    qryExtratoEntDATA_ENTRADA: TDateTimeField;
    qryExtratoEntQTD_ENTRADA: TBCDField;
    qryExtratoEntVLR_ENTRADA: TBCDField;
    qryExtratoEntFOR_ID: TStringField;
    qryExtratoEntFOR_NOME: TStringField;
    qryExtratoEntPRO_DEPOSITO: TBCDField;
    pipExtratoEnt: TppDBPipeline;
    ppDBText26: TppDBText;
    qryGeralDiscPRO_CODBALANCA: TStringField;
    ppDBText41: TppDBText;
    qryAlteracaoPrecoPRO_EAN1: TStringField;
    ds_Obs_CodFabr: TDataSource;
    qry_Obs_CodFabr: TADOQuery;
    pip_Obs_CodFabr: TppDBPipeline;
    ppHeaderBand18: TppHeaderBand;
    ppDBText71: TppDBText;
    ppLabel_Descricao: TppLabel;
    ppLabel84: TppLabel;
    ppLabel136: TppLabel;
    ppLabel152: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppDetailBand19: TppDetailBand;
    ppDBText114: TppDBText;
    ppDBText116: TppDBText;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppSummaryBand14: TppSummaryBand;
    ppParameterList24: TppParameterList;
    pp_Obs_CodFabr: TppReport;
    qry_Obs_CodFabrPRO_ID: TAutoIncField;
    qry_Obs_CodFabrPRO_REFERENCIA: TStringField;
    qry_Obs_CodFabrPRO_DESCRICAO: TStringField;
    qry_Obs_CodFabrPRO_UNIDADE: TStringField;
    qry_Obs_CodFabrPRO_VLRCUSTO: TBCDField;
    qry_Obs_CodFabrPRO_VLRVENDA: TFMTBCDField;
    qry_Obs_CodFabrPRO_OBSERVACOES: TStringField;
    qry_Obs_CodFabrPRO_CODFAB1: TStringField;
    qry_Obs_CodFabrPRO_CODFAB2: TStringField;
    qry_Obs_CodFabrPRO_CODFAB3: TStringField;
    qry_Obs_CodFabrPRO_CODFAB4: TStringField;
    qry_Obs_CodFabrPRO_CODFAB5: TStringField;
    qry_Obs_CodFabrPRO_CODFAB6: TStringField;
    qry_Obs_CodFabrPRO_CODFAB7: TStringField;
    qry_Obs_CodFabrPRO_CODFAB8: TStringField;
    qry_Obs_CodFabrPRO_CODFAB9: TStringField;
    qry_Obs_CodFabrPRO_CODFAB10: TStringField;
    ppLine52: TppLine;
    ppLine56: TppLine;
    ppLabel_Observacao: TppLabel;
    pplabel_CodFab1: TppLabel;
    pplabel_CodFab2: TppLabel;
    pplabel_CodFab3: TppLabel;
    pplabel_CodFab4: TppLabel;
    pplabel_CodFab5: TppLabel;
    pplabel_CodFab6: TppLabel;
    ppDB_CodFab1: TppDBText;
    ppdb_CodFab2: TppDBText;
    ppdb_CodFab3: TppDBText;
    ppdb_CodFab4: TppDBText;
    ppdb_CodFab5: TppDBText;
    ppdb_CodFab6: TppDBText;
    ppLabel83: TppLabel;
    ppDBText204: TppDBText;
    qry_Obs_CodFabrPRO_VLRprazo: TFMTBCDField;
    ppdb_Observacao: TppDBMemo;
    ppLine2: TppLine;
    ppLine5: TppLine;
    ppLine50: TppLine;
    ppLine121: TppLine;
    ppLine31: TppLine;
    qryGeralDiscPRO_EMBUNIDADE: TStringField;
    qry_GeraProdExcel: TADOQuery;
    ppLabel137: TppLabel;
    ppLine20: TppLine;
    ppDBText64: TppDBText;
    ppDBText66: TppDBText;
    ppLabel14: TppLabel;
    ppLabel32: TppLabel;
    ppLabel41: TppLabel;
    ppLine15: TppLine;
    ppLine18: TppLine;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppVariable1: TppVariable;
    ppLabel89: TppLabel;
    ppLabel91: TppLabel;
    ppLine24: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel42: TppLabel;
    ppLabel48: TppLabel;
    ppLabel52: TppLabel;
    ppLabel139: TppLabel;
    ppVariable3: TppVariable;
    var_MovtoAcum_EstoqueAtualAcum: TppVariable;
    ppLabel140: TppLabel;
    ppDBText93: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppSystemVariable23: TppSystemVariable;
    ppSystemVariable24: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable17: TppSystemVariable;
    ppSystemVariable18: TppSystemVariable;
    ppSystemVariable29: TppSystemVariable;
    ppSystemVariable30: TppSystemVariable;
    ppSystemVariable31: TppSystemVariable;
    ppSystemVariable32: TppSystemVariable;
    ppSystemVariable35: TppSystemVariable;
    ppSystemVariable36: TppSystemVariable;
    ppSystemVariable41: TppSystemVariable;
    ppSystemVariable42: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable49: TppSystemVariable;
    ppSystemVariable50: TppSystemVariable;
    ppSystemVariable43: TppSystemVariable;
    ppSystemVariable44: TppSystemVariable;
    ppSystemVariable33: TppSystemVariable;
    ppSystemVariable34: TppSystemVariable;
    ppSystemVariable47: TppSystemVariable;
    ppSystemVariable48: TppSystemVariable;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppSystemVariable45: TppSystemVariable;
    ppSystemVariable46: TppSystemVariable;
    ppSystemVariable37: TppSystemVariable;
    ppSystemVariable38: TppSystemVariable;
    ppSystemVariable25: TppSystemVariable;
    ppSystemVariable26: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel142: TppLabel;
    ppDBText94: TppDBText;
    regCabecalho: TppRegion;
    ppLabel17: TppLabel;
    ppLabel31: TppLabel;
    ppLabel20: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel115: TppLabel;
    regItens: TppRegion;
    ppDBText16: TppDBText;
    ppDBText36: TppDBText;
    ppDBText19: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    var_mcontagem: TppVariable;
    var_mTotal: TppVariable;
    regTotal: TppRegion;
    ppLabel24: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    qryGeralDiscMRC_DESCRICAO: TStringField;
    dbtxtFabric: TppDBText;
    lblFabric: TppLabel;
    regCabecMedMov: TppRegion;
    ppLabel99: TppLabel;
    ppLabel114: TppLabel;
    lblCompraCusto: TppLabel;
    ppLabel103: TppLabel;
    ppLabel117: TppLabel;
    regItensMedMov: TppRegion;
    ppDBText118: TppDBText;
    ppDBText121: TppDBText;
    dbtCompraCusto: TppDBText;
    ppDBText123: TppDBText;
    dbtCompraSugestao: TppDBText;
    edtUnComp: TppDBText;
    lblUnComp: TppLabel;
    regDatePagMedMov: TppRegion;
    ppSystemVariable12: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    Rep_ExtratoHora: TppReport;
    ppTitleBand12: TppTitleBand;
    ppHeaderBand11: TppHeaderBand;
    ppLabel151: TppLabel;
    ppDBText95: TppDBText;
    ppSystemVariable51: TppSystemVariable;
    ppSystemVariable52: TppSystemVariable;
    ppLabel153: TppLabel;
    ppLabel157: TppLabel;
    ppLine25: TppLine;
    varSaldoIniExtHora: TppVariable;
    ppDBText97: TppDBText;
    ppLine38: TppLine;
    ppDetailBand12: TppDetailBand;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText112: TppDBText;
    ppDBText205: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppSummaryBand15: TppSummaryBand;
    ppLabel158: TppLabel;
    ppLabel161: TppLabel;
    ppLabel164: TppLabel;
    ppLine40: TppLine;
    ppDBCalc45: TppDBCalc;
    ppDBCalc46: TppDBCalc;
    ppGroup20: TppGroup;
    ppGroupHeaderBand20: TppGroupHeaderBand;
    ppDBText207: TppDBText;
    ppLine43: TppLine;
    ppLabel181: TppLabel;
    ppLabel190: TppLabel;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppGroupFooterBand20: TppGroupFooterBand;
    ppLabel204: TppLabel;
    ppDBCalc48: TppDBCalc;
    ppDBCalc49: TppDBCalc;
    ppLine44: TppLine;
    ppParameterList7: TppParameterList;
    ppLabel203: TppLabel;
    ppDBText206: TppDBText;
    ppLabel205: TppLabel;
    varSaldoFinExtHora: TppVariable;
    ppGroup21: TppGroup;
    ppGroupHeaderBand21: TppGroupHeaderBand;
    ppGroupFooterBand21: TppGroupFooterBand;
    ppLine51: TppLine;
    qryGeralDiscpro_comissao: TBCDField;
    RepPromoMarca: TppReport;
    ppHeaderBand25: TppHeaderBand;
    ppLabel206: TppLabel;
    ppLabel207: TppLabel;
    ppLabel211: TppLabel;
    ppLabel215: TppLabel;
//    ppLine51: TppLine;
    ppLine57: TppLine;
    ppDetailBand26: TppDetailBand;
    ppDBText209: TppDBText;
    ppDBText212: TppDBText;
    ppDBText216: TppDBText;
    ppDBText217: TppDBText;
    ppParameterList26: TppParameterList;
    ppLabel160: TppLabel;
    ppDBText215: TppDBText;
    ppDB_empresa: TppDBText;
    ppSystemVariable53: TppSystemVariable;
    ppImage2: TppImage;
    ppImage1: TppImage;
    ppDBText208: TppDBText;
    fbPromoMarca: TppFooterBand;
    lblValidade: TppLabel;
    dbtDtFinal: TppDBText;
    dbtDtInicial: TppDBText;
    ppLabel217: TppLabel;
    ppLine58: TppLine;
    ppDBText220: TppDBText;
    RepPromoLanc: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppDBText218: TppDBText;
    ppLabel208: TppLabel;
    ppLabel228: TppLabel;
    ppLabel237: TppLabel;
    ppLabel256: TppLabel;
    ppLine59: TppLine;
    ppSystemVariable54: TppSystemVariable;
    ppSystemVariable55: TppSystemVariable;
    ppDetailBand27: TppDetailBand;
    ppDBText219: TppDBText;
    ppDBText221: TppDBText;
    ppDBText222: TppDBText;
    ppDBText223: TppDBText;
    ppDBText224: TppDBText;
    ppSummaryBand16: TppSummaryBand;
    ppLabel257: TppLabel;
    ppDBCalc50: TppDBCalc;
    ppParameterList27: TppParameterList;
    ppGroup22: TppGroup;
    ppGroupHeaderBand22: TppGroupHeaderBand;
    ppGroupFooterBand22: TppGroupFooterBand;
    ppDBText225: TppDBText;
    ppLabel248: TppLabel;
    ppLabel251: TppLabel;
    ppLabel258: TppLabel;
    ppLine65: TppLine;
    ppLine60: TppLine;
    ppLabel259: TppLabel;
    ppDBText226: TppDBText;
    ppLabel260: TppLabel;
    ppDBCalc51: TppDBCalc;
    ppLine66: TppLine;
    qry_AuxiliaInvetarioPRO_ID: TAutoIncField;
    qry_AuxiliaInvetarioPRO_REFERENCIA: TStringField;
    qry_AuxiliaInvetarioPRO_DESCRICAO: TStringField;
    qry_AuxiliaInvetarioPRO_UNIDADE: TStringField;
    qry_AuxiliaInvetarioPRO_VLRCUSTO: TBCDField;
    qry_AuxiliaInvetarioPRO_ESTOQUE: TFMTBCDField;
    qry_AuxiliaInvetarioTOTAL: TFMTBCDField;
    ppLine67: TppLine;
    ppDBText119: TppDBText;
    ppLabel102: TppLabel;
    qry_CompraPRO_ID: TIntegerField;
    qry_CompraPRO_REFERENCIA: TStringField;
    qry_CompraPRO_DESCRICAO: TStringField;
    qry_CompraPRO_UNIDADE: TStringField;
    qry_CompraPRO_EMBUNIDADE: TStringField;
    qry_CompraDEP_ID: TIntegerField;
    qry_CompraDEP_DESCRICAO: TStringField;
    qry_CompraSEC_ID: TIntegerField;
    qry_CompraSEC_DESCRICAO: TStringField;
    qry_CompraPRO_ESTOQUE: TBCDField;
    qry_CompraPRO_VLRCUSTO: TBCDField;
    qry_CompraPRO_CUSTONOTA: TBCDField;
    qry_CompraSAIDA: TBCDField;
    qry_CompraMEDIA: TFMTBCDField;
    qry_CompraSUGESTAO: TFMTBCDField;
    qry_CompraTotal: TFloatField;
    ppFooterBand10: TppFooterBand;
    ppSummaryBand13: TppSummaryBand;
    regTotalMedMov: TppRegion;
    ppLabel150: TppLabel;
    dbcCompraSugestao: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLine36: TppLine;
    qry_CompraMRC_DESCRICAO: TStringField;
    ppGroup23: TppGroup;
    ppGroupHeaderBand23: TppGroupHeaderBand;
    ppGroupFooterBand23: TppGroupFooterBand;
    ppLabel95: TppLabel;
    ppDBText120: TppDBText;
    lnMediaMovMarcaHeader: TppLine;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppLine75: TppLine;
    repExtratoProd: TppReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand27: TppHeaderBand;
    ppLabel13: TppLabel;
    ppDBText124: TppDBText;
    ppSystemVariable56: TppSystemVariable;
    ppSystemVariable57: TppSystemVariable;
    ppLabel261: TppLabel;
    ppLabel262: TppLabel;
    ppLine77: TppLine;
    ppVariable4: TppVariable;
    ppDBText227: TppDBText;
    ppLine84: TppLine;
    ppDetailBand28: TppDetailBand;
    ppDBText228: TppDBText;
    ppDBText229: TppDBText;
    ppDBText230: TppDBText;
    ppDBText231: TppDBText;
    ppDBText232: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppSummaryBand17: TppSummaryBand;
    ppLabel263: TppLabel;
    ppLabel264: TppLabel;
    ppVariable6: TppVariable;
    ppLabel266: TppLabel;
    ppLine85: TppLine;
    ppDBCalc12: TppDBCalc;
    ppDBText233: TppDBText;
    ppLine86: TppLine;
    ppLabel267: TppLabel;
    ppLabel268: TppLabel;
    ppLabel269: TppLabel;
    ppLabel270: TppLabel;
    ppLabel271: TppLabel;
    ppDesignLayers28: TppDesignLayers;
    ppDesignLayer28: TppDesignLayer;
    ppParameterList28: TppParameterList;
    pipExtratoProd: TppDBPipeline;
    qryExtratoProd: TADOQuery;
    dsExtratoProd: TDataSource;
    ppLabel273: TppLabel;
    ppLabel274: TppLabel;
    ppDBCalc43: TppDBCalc;
    ppVariable7: TppVariable;
    ppLabel275: TppLabel;
    ppDBText234: TppDBText;
    ppLine19: TppLine;
    ppLine21: TppLine;
    ppGroup24: TppGroup;
    ppGroupHeaderBand24: TppGroupHeaderBand;
    ppGroupFooterBand24: TppGroupFooterBand;
    ppLine88: TppLine;
    ppLabel272: TppLabel;
    qryGeralDiscpro_resumido: TStringField;
    qryGeralDiscCES_CODIGO: TStringField;
    qryPrecoSimp: TADOQuery;
    dtsPrecoSimp: TDataSource;
    pipPrecoSimp: TppDBPipeline;
    repPrecoSimp: TppReport;
    qryPrecoSimpPRO_REFERENCIA: TStringField;
    qryPrecoSimpPRO_DESCRICAO: TStringField;
    qryPrecoSimpPRO_VLRVENDA: TFMTBCDField;
    qryPrecoSimpPRO_VLRPRAZO: TFMTBCDField;
    ppParameterList29: TppParameterList;
    ppDesignLayers29: TppDesignLayers;
    ppDesignLayer29: TppDesignLayer;
    ppHeaderBand28: TppHeaderBand;
    ppDetailBand29: TppDetailBand;
    ppFooterBand21: TppFooterBand;
    ppDBText235: TppDBText;
    ppDBText236: TppDBText;
    ppDbPrecoVista: TppDBText;
    ppDbPrecoPrazo: TppDBText;
    ppLine90: TppLine;
    ppDBText239: TppDBText;
    ppLabel65: TppLabel;
    ppLine91: TppLine;
    ppSystemVariable58: TppSystemVariable;
    ppSystemVariable59: TppSystemVariable;
    ppLabel265: TppLabel;
    ppLabel276: TppLabel;
    ppLblPrecoVista: TppLabel;
    ppLblPrecoPrazo: TppLabel;
    ppLine92: TppLine;
    ppLine99: TppLine;
    procedure ppDBText59GetText(Sender: TObject; var Text: string);
    procedure ppDBText45GetText(Sender: TObject; var Text: string);
    procedure ppDBText44GetText(Sender: TObject; var Text: string);
    procedure ppDBText69GetText(Sender: TObject; var Text: string);
    procedure ppDBText70GetText(Sender: TObject; var Text: string);
    procedure qry_ProdNaoMovtoPRO_ATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable4Calc(Sender: TObject; var Value: Variant);
    procedure var_mTotalPrint(Sender: TObject);
    procedure var_mcontagemPrint(Sender: TObject);
    procedure var_MovtoDisc_EstoqueAtualPrint(Sender: TObject);
    procedure qry_ProdNaoMovtoPRO_ULTVENDAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure ppVariable3GetText(Sender: TObject; var Text: string);
    procedure var_MovtoAcum_EstoqueAtualAcumPrint(Sender: TObject);
    procedure ppVariable10GetText(Sender: TObject; var Text: string);
    procedure varSaldoFinExtHoraGetText(Sender: TObject; var Text: string);
    procedure qry_PromocaoBeforeOpen(DataSet: TDataSet);
    procedure ppDBText220GetText(Sender: TObject; var Text: string);
    procedure ppDBText209GetText(Sender: TObject; var Text: string);
    procedure qry_CompraCalcFields(DataSet: TDataSet);
    procedure ppDBText229GetText(Sender: TObject; var Text: string);
    procedure ppDBText230GetText(Sender: TObject; var Text: string);
    procedure ppVariable6Print(Sender: TObject);
    procedure ppTitleBand2AfterGenerate(Sender: TObject);
    procedure ppDetailBand28AfterGenerate(Sender: TObject);
    procedure ppVariable5GetText(Sender: TObject; var Text: string);
  private
    { Private declarations }
  public
    procedure PrintRel;
    procedure ImprimePromocao(PrmId: integer);
    function ImprimeSugestao(const AProduto, ADepart, ASecao, AMarca: string;
                                AMedia, ASugestaoCompra: integer;
              ASemMovto, AProdAtivos, ASugestaoZerada, AGeraExcel, AFiltraPorPes: boolean): boolean;
  end;

var
  DM_RelProduto: TDM_RelProduto;

implementation

uses
  Forms, MaskUtils, DateUtils, Windows, Variants, DBClient, Dialogs,
  U_DM, U_DM_Geral, U_RelProduto;

{$R *.dfm}

{ TDM_RelProduto }

procedure TDM_RelProduto.ImprimePromocao(PrmId: integer);
const
  SQL =
    ' select ' +
    '    PRO_REFERENCIA, PRO_DESCRICAO, PRO_EMBUNIDADE, PRM_DESCRICAO, ' +
    '    PRM_DT_INICIAL, PRM_DT_FINAL, IPR_VLR_PROMOCAO, MRC_DESCRICAO ' +
    ' from ' +
    '    PROMOCAO C ' +
    ' inner join ' +
    '    ITEM_PROMOCAO I on C.PRM_ID = I.PRM_ID ' +
    ' inner join ' +
    '    PRODUTO P on I.PRO_ID = P.PRO_ID ' +
    ' left join ' +
    '    MARCA M on P.MRC_ID = M.MRC_ID ' +
    ' where ' +
    '    C.PRM_ID = :PRM_ID ' +
    ' order by ' +
    '    MRC_DESCRICAO, PRO_DESCRICAO';
begin
  try
    qry_Promocao.SQL.Clear;

    qry_Promocao.SQL.Text := SQL;

    qry_Promocao.Parameters[0].Value := PrmId;
    qry_Promocao.Open;

    if qry_Promocao.IsEmpty then
    begin
      Application.MessageBox('Não há dados para imprimir!', 'ATENÇÃO!',
        MB_ICONINFORMATION);
      Exit;
    end;

    RepPromoMarca.Print;
  finally
    qry_Promocao.Close;
  end;
end;

function TDM_RelProduto.ImprimeSugestao(const AProduto, ADepart, ASecao,
  AMarca: string; AMedia, ASugestaoCompra: integer; ASemMovto, AProdAtivos,
  ASugestaoZerada, AGeraExcel, AFiltraPorPes : boolean): boolean;
const
  {$REGION 'SQLs'}
  SQL_SUGESTAO =
    ' SELECT ' +
    '    P.PRO_ID, dbo.FN_FORMAT(PRO_REFERENCIA, 5, ''0'', 1) AS PRO_REFERENCIA, ' +
    '    PRO_DESCRICAO, PRO_UNIDADE, PRO_EMBUNIDADE, P.DEP_ID, %5:s, ' +
    '    P.SEC_ID, %0:s, %6:s AS MRC_DESCRICAO, ' +
    '    CAST(ISNULL(P.PRO_ESTOQUE,0) AS NUMERIC(15,3)) AS PRO_ESTOQUE, ' +
    '    CAST(ISNULL(P.PRO_VLRCUSTO,0) AS NUMERIC(15,3)) AS PRO_VLRCUSTO, ' +
    '    CAST(ISNULL(P.PRO_CUSTONOTA,0) AS NUMERIC(15,3)) AS PRO_CUSTONOTA, ' +
    '    CAST(ISNULL(SUM(QTDE_SAIDA),0) AS NUMERIC(15,3)) AS SAIDA, ' +
    '    CASE ' +
    '        WHEN ISNULL(SUM(QTDE_SAIDA),0) = 0 THEN 0 ' +
    '        ELSE (ISNULL(SUM(QTDE_SAIDA),0) / %1:d) ' +
    '    END MEDIA, ' +
    '    CASE ' +
    '        WHEN PRO_ESTOQUE > (ISNULL(SUM(QTDE_SAIDA),0) / %1:d) * %2:d THEN 0 ' +
    '        ELSE ((ISNULL(SUM(QTDE_SAIDA),0) / %1:d) * %2:d) - PRO_ESTOQUE ' +
    '    END SUGESTAO ' +
    ' FROM ' +
    '    PRODUTO P ' +
    ' INNER JOIN ' +
    '    DEPARTAMENTO D ON P.DEP_ID = D.DEP_ID ' +
    ' LEFT JOIN ' +
    '    SECAO S ON P.SEC_ID = S.SEC_ID ' +
    ' LEFT JOIN ' +
    '    MARCA M ON P.MRC_ID = M.MRC_ID ' +
    ' %3:s JOIN ' +
    '    VW_PRODUTO_EXTRATO V ON P.PRO_ID = V.PRO_ID AND V.DATA BETWEEN :DT_INI AND :DT_FIN ' +
    ' WHERE ' +
    '    PRO_ATIVO LIKE :PRO_ATIVO AND ' +
    '    CONVERT(VARCHAR(10), P.PRO_ID) LIKE :PRO_ID AND ' +
    '    CONVERT(VARCHAR(10), P.DEP_ID) LIKE :DEP_ID AND ' +
    '    CONVERT(VARCHAR(10), ISNULL(P.SEC_ID, '''')) LIKE :SEC_ID AND ' +
    '    CONVERT(VARCHAR(10), ISNULL(P.MRC_ID, '''')) LIKE :MRC_ID ' +
    ' GROUP BY ' +
    '    P.PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_UNIDADE, PRO_EMBUNIDADE, ' +
    '    P.DEP_ID, DEP_DESCRICAO, P.SEC_ID, SEC_DESCRICAO, MRC_DESCRICAO, ' +
    '    P.PRO_ESTOQUE, P.PRO_VLRCUSTO, P.PRO_CUSTONOTA ' +
    ' %4:s';

  SQL_HAVING =
    ' HAVING ' +
    '    CASE ' +
    '        WHEN PRO_ESTOQUE > (ISNULL(SUM(QTDE_SAIDA),0) / %0:d) * %1:d THEN 0 ' +
    '        ELSE ((ISNULL(SUM(QTDE_SAIDA),0) / %0:d) * %1:d) - PRO_ESTOQUE ' +
    '    END > 0 ' +
    ' %2:s';

  SQL_ORDERBY =
    ' ORDER BY' +
    '    DEP_DESCRICAO, SEC_DESCRICAO, MRC_DESCRICAO, PRO_DESCRICAO';
  {$ENDREGION}
var
  ADtInicial, ADtFinal: TDateTime;
  sTipoFiltro, ASecaoValor, AInnerLeft, AAtivos, ASql, AEndSql,
  ADeptoValor, AMarcaValor: string;
begin
  Result     := True;

  ADtFinal   := Date;

  if AFiltraPorPes then
  Begin
    sTipoFiltro := 'mês(es)';
    ADtInicial  := IncMonth(ADtFinal, -AMedia);
  End
  else
  Begin
    sTipoFiltro := 'dia(s)';
    ADtInicial  := IncDay(ADtFinal, -AMedia);
  End;

  if Rep_Compra.GroupHeader[0].Visible then
    ADeptoValor := 'DEP_DESCRICAO'
  else
    ADeptoValor := ''''' AS DEP_DESCRICAO';

  if Rep_Compra.GroupHeader[1].Visible then
    ASecaoValor := 'SEC_DESCRICAO'
  else
    ASecaoValor := ''''' AS SEC_DESCRICAO';

  if Rep_Compra.GroupHeader[2].Visible then
    AMarcaValor := 'ISNULL(MRC_DESCRICAO, ''SEM MARCA'')'
  else
    AMarcaValor := '''''';

  if ASemMovto then
    AInnerLeft := 'LEFT'
  else
    AInnerLeft := 'INNER';

  if AProdAtivos then
    AAtivos := 'A'
  else
    AAtivos := '%';

  if ASugestaoZerada then
    AEndSql := Format(SQL_HAVING, [AMedia, ASugestaoCompra, SQL_ORDERBY])
  else
    AEndSql := SQL_ORDERBY;

  ASql := Format(SQL_SUGESTAO, [ASecaoValor, AMedia, ASugestaoCompra,
                                AInnerLeft, AEndSql, ADeptoValor,
                                AMarcaValor]);

  qry_Compra.SQL.Clear;
  qry_Compra.SQL.Text := ASql;

  qry_Compra.Parameters[0].Value := ADtInicial;
  qry_Compra.Parameters[1].Value := ADtFinal;
  qry_Compra.Parameters[2].Value := AAtivos;
  qry_Compra.Parameters[3].Value := AProduto;
  qry_Compra.Parameters[4].Value := ADepart;
  qry_Compra.Parameters[5].Value := ASecao;
  qry_Compra.Parameters[6].Value := AMarca;

  try
    qry_Compra.Open;

    if qry_Compra.IsEmpty then
    begin
      Application.MessageBox('Não há dados para opção selecionada!', 'ATENÇÃO!',
        MB_ICONINFORMATION);
      Result := False;
      Exit;
    end;

    ppLabel130.Caption := Format('Cálculo de média no período de: %s à %s', [DateTimeToStr(ADtInicial), DateTimeToStr(ADtFinal)]);



    ppLabel133.Caption := Format('Sugestão de compra para %d %s', [ASugestaoCompra, sTipoFiltro]);

    if not AGeraExcel then
      Rep_Compra.Print;

  finally
    qry_Compra.Close;
  end;
end;

procedure TDM_RelProduto.ppDBText209GetText(Sender: TObject; var Text: string);
var
  ref: integer;
begin
  with qry_Promocao do
  if TryStrToInt(FieldByName('PRO_REFERENCIA').AsString, ref) then
    Text := Format('%.5d', [ref])
  else
    Text := FieldByName('PRO_REFERENCIA').AsString;
  //
end;

procedure TDM_RelProduto.ppDBText220GetText(Sender: TObject; var Text: string);
begin
  Text := FormatMaskText('!\(99\)0000-0000;0;_', DM_Geral.qryEmpEMP_TELEFONE.AsString);
end;

procedure TDM_RelProduto.ppDBText229GetText(Sender: TObject; var Text: string);
begin
  if qryExtratoProd.FieldByName('QTDE_ENTRADA').AsFloat = 0 then
    Text := '';
end;

procedure TDM_RelProduto.ppDBText230GetText(Sender: TObject; var Text: string);
begin
  if qryExtratoProd.FieldByName('QTDE_SAIDA').AsFloat = 0 then
    Text := '';
end;

procedure TDM_RelProduto.ppDBText44GetText(Sender: TObject; var Text: string);
begin
  if qryExtrato.FieldByName('ENTRADA').AsFloat = 0 then
    Text := '';
end;

procedure TDM_RelProduto.ppDBText45GetText(Sender: TObject; var Text: string);
begin
  if qryExtrato.FieldByName('SAIDA').AsFloat = 0 then
    Text := '';
end;

procedure TDM_RelProduto.ppDBText59GetText(Sender: TObject; var Text: string);
begin
  Text := DM_Geral.GetSituacaoProduto(varToStr(qry_ProdNaoMovtoPRO_ATIVO.Value)[1]);
end;

procedure TDM_RelProduto.ppDBText69GetText(Sender: TObject; var Text: string);
begin
  if qryExtratoAcumSAIDA.Value = 0 then
    Text := '';
end;

procedure TDM_RelProduto.ppDBText70GetText(Sender: TObject; var Text: string);
begin
  if qryExtratoAcumENTRADA.Value = 0 then
    Text := '';
end;

procedure TDM_RelProduto.ppDetailBand28AfterGenerate(Sender: TObject);
begin
  with qryExtratoProd do
    ppVariable7.AsFloat := ppVariable7.AsFloat +
      FieldByName('QTDE_ENTRADA').AsFloat - FieldByName('QTDE_SAIDA').AsFloat;
end;

procedure TDM_RelProduto.ppTitleBand2AfterGenerate(Sender: TObject);
begin
  ppVariable7.AsFloat := qry_SaldoInicialSaldoInicial.Value;
end;

procedure TDM_RelProduto.ppVariable10GetText(Sender: TObject; var Text: string);
begin
  Text := FormatFloat('###,##0.000', ppDBCalc4.Value - ppDBCalc5.Value);
end;

procedure TDM_RelProduto.ppVariable2Calc(Sender: TObject; var Value: Variant);
begin
  Value := qry_SaldoInicialSaldoInicial.Value;
end;

procedure TDM_RelProduto.ppVariable3GetText(Sender: TObject; var Text: string);
begin
  Text := FormatFloat('###,##0.000',ppDBCalc2.Value - ppDBCalc3.Value);
end;

procedure TDM_RelProduto.ppVariable4Calc(Sender: TObject; var Value: Variant);
begin
  Value := qry_SaldoInicialSaldoInicial.Value;
end;

procedure TDM_RelProduto.ppVariable5GetText(Sender: TObject; var Text: string);
begin
  Text := FormatFloat('###,##0.000', ppDBCalc43.Value - ppDBCalc12.Value);
end;

procedure TDM_RelProduto.ppVariable6Print(Sender: TObject);
const
  SQL_MovtoDisc = 'SELECT PRO_ESTOQUE FROM PRODUTO WHERE PRO_ID = :ID';
var
  EstAtual : Extended;
begin
  EstAtual := DM.OpenSQL(SQL_MovtoDisc, [qryExtratoProd.FieldByName('PRO_ID').AsInteger]);
  ppVariable6.Value := FormatFloat('###,##0.000',EstAtual);
end;

procedure TDM_RelProduto.PrintRel;
begin
  with Tfrm_RelProduto.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TDM_RelProduto.qry_CompraCalcFields(DataSet: TDataSet);
begin
  qry_CompraTotal.Value :=
    qry_CompraSUGESTAO.AsFloat * qry_Compra.FieldByName(dbtCompraCusto.DataField).AsFloat;
end;

procedure TDM_RelProduto.qry_ProdNaoMovtoPRO_ATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := DM_Geral.GetSituacaoProduto(varToStr(Sender.AsString)[1]);
end;

procedure TDM_RelProduto.qry_ProdNaoMovtoPRO_ULTVENDAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if Sender.IsNull then
     Text := '';
end;

procedure TDM_RelProduto.qry_PromocaoBeforeOpen(DataSet: TDataSet);
begin
  with DM_Geral do
  try
    qryImagens.Open;

    if not qryImagensPAR_REL_DISTRIB_PICTURE1.IsNull and
       FileExists(qryImagensPAR_REL_DISTRIB_PICTURE1.Value) then
      ppImage1.Picture.LoadFromFile(qryImagensPAR_REL_DISTRIB_PICTURE1.Value);
    //

    if not qryImagensPAR_REL_DISTRIB_PICTURE2.IsNull and
       FileExists(qryImagensPAR_REL_DISTRIB_PICTURE2.Value) then
      ppImage2.Picture.LoadFromFile(qryImagensPAR_REL_DISTRIB_PICTURE2.Value);
    //
  finally
    qryImagens.Close;
  end;
end;

procedure TDM_RelProduto.varSaldoFinExtHoraGetText(Sender: TObject;
  var Text: string);
begin
  Text := FormatFloat('###,##0.000', ppDBCalc45.Value - ppDBCalc46.Value);
end;

procedure TDM_RelProduto.var_mcontagemPrint(Sender: TObject);
begin
  var_mcontagem.Value := '.................';
end;

procedure TDM_RelProduto.var_MovtoAcum_EstoqueAtualAcumPrint(Sender: TObject);
const
  SQL_MovtoAcum = 'SELECT PRO_ESTOQUE FROM PRODUTO WHERE PRO_ID = :ID';
var
  EstAtual : Extended;
begin
  EstAtual := DM.OpenSQL(SQL_MovtoAcum,[qryExtratoAcumPRO_ID.Value]);
  var_MovtoAcum_EstoqueAtualAcum.Value := FormatFloat('###,##0.000',EstAtual);
end;

procedure TDM_RelProduto.var_MovtoDisc_EstoqueAtualPrint(Sender: TObject);
const
  SQL_MovtoDisc = 'SELECT PRO_ESTOQUE FROM PRODUTO WHERE PRO_ID = :ID';
var
  EstAtual : Extended;
begin
  EstAtual := DM.OpenSQL(SQL_MovtoDisc, [qryExtrato.FieldByName('PRO_ID').AsInteger]);
  var_MovtoDisc_EstoqueAtual.Value := FormatFloat('###,##0.000',EstAtual);
end;

procedure TDM_RelProduto.var_mTotalPrint(Sender: TObject);
begin
    if qryGeralDiscpro_estoque.value > 0 then
      var_mTotal.Value:= FormatFloat('#,###,##0.00',qryGeralDiscpro_vlrvenda.Value * qryGeralDiscpro_estoque.Value)
    else
      var_mTotal.Value:= FormatFloat('#,###,##0.00',0);
end;

initialization
  DM_RelProduto := TDM_RelProduto.Create(Application);

end.
