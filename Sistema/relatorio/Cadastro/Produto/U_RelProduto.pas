unit U_RelProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask;

type
  Tfrm_RelProduto = class(TForm)
    tabTotais: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet7: TTabSheet;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    TabSheet10: TTabSheet;
    GroupBox13: TGroupBox;
    lbl_departamento10: TLabel;
    lkp_departamento10: TDBLookupComboBox;
    chk_departamento10: TCheckBox;
    TabSheet11: TTabSheet;
    GroupBox15: TGroupBox;
    lbl_dep11: TLabel;
    lkp_dep11: TDBLookupComboBox;
    chk_mov11: TCheckBox;
    TabSheet13: TTabSheet;
    chk_contagem2: TCheckBox;
    pge_: TPageControl;
    chk_estzero: TCheckBox;
    pge_1: TPageControl;
    TabSheet14: TTabSheet;
    GroupBox5: TGroupBox;
    lbl_aliq: TLabel;
    lkp_aliq: TDBLookupComboBox;
    chk_aliq: TCheckBox;
    RadioGroup4: TRadioGroup;
    TabSheet15: TTabSheet;
    GroupBox18: TGroupBox;
    lbl_aliqfor: TLabel;
    lkp_aliqfor: TDBLookupComboBox;
    chk_aliqfor: TCheckBox;
    chk_zeradoAliqfor: TCheckBox;
    GroupBox19: TGroupBox;
    lbl_naf_codfiscal: TLabel;
    lkp_naf_codfiscal: TDBLookupComboBox;
    chk_naf_codfiscal: TCheckBox;
    TabSheet16: TTabSheet;
    rg_tipo_ativoinativo: TRadioGroup;
    rg_orden_ativoinativo: TRadioGroup;
    GroupBox20: TGroupBox;
    Label5: TLabel;
    lkp_produto: TDBLookupComboBox;
    chk_ativo_inativo: TCheckBox;
    TabSheet17: TTabSheet;
    GroupBox22: TGroupBox;
    lbl_DepAltPreco: TLabel;
    lkp_DepAltPreco: TDBLookupComboBox;
    chk_DepAltPreco: TCheckBox;
    GroupBox21: TGroupBox;
    dt_ini: TDateTimePicker;
    Label7: TLabel;
    dt_fim: TDateTimePicker;
    pge_TabelaPreco: TPageControl;
    Tab_Geral_AgrupDepto: TTabSheet;
    Tab_Geral_Secao: TTabSheet;
    GroupBox24: TGroupBox;
    lbl_secao: TLabel;
    chk_secao: TCheckBox;
    lkp_secao: TDBLookupComboBox;
    TabSheet21: TTabSheet;
    TabSheet22: TTabSheet;
    GroupBox25: TGroupBox;
    lbl_DeptoCST: TLabel;
    lkp_DeptoCST: TDBLookupComboBox;
    chk_DeptoCST: TCheckBox;
    TabSheet23: TTabSheet;
    grpPromoProduto: TGroupBox;
    lbl_prod: TLabel;
    lkp_prod: TDBLookupComboBox;
    chk_prod: TCheckBox;
    GroupBox2: TGroupBox;
    lkp_DeptoPreco: TDBLookupComboBox;
    lbl_DeptoPreco: TLabel;
    chk_DeptoPreco: TCheckBox;
    chk_trac: TCheckBox;
    GroupBox3: TGroupBox;
    lbl_cst: TLabel;
    lkp_cst: TDBLookupComboBox;
    chk_todoscst: TCheckBox;
    GroupBox1: TGroupBox;
    chk_mTracejada: TCheckBox;
    chk_zerado: TCheckBox;
    rg_col5: TGroupBox;
    chk_mcontagem: TCheckBox;
    chk_mTotal: TCheckBox;
    chk_mTotalCusto: TCheckBox;
    rg_col4: TGroupBox;
    chk_mCusto: TCheckBox;
    chk_mMedio: TCheckBox;
    chk_atacado: TCheckBox;
    chk_mMinimo: TCheckBox;
    rg_col3: TGroupBox;
    chk_mPrazo: TCheckBox;
    rg_col1: TGroupBox;
    chk_mEstoque: TCheckBox;
    rg_col2: TGroupBox;
    chk_mAvista: TCheckBox;
    chk_gaveta: TCheckBox;
    chk_cst: TCheckBox;
    chk_aliquota: TCheckBox;
    chk_SoZerado: TCheckBox;
    TabSheet3: TTabSheet;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    dt_inic: TDateTimePicker;
    dt_fina: TDateTimePicker;
    rg_ordenar: TRadioGroup;
    chk_mMinimo2: TCheckBox;
    chk_SoNegativo: TCheckBox;
    GroupBox8: TGroupBox;
    chk_mQtdeUn: TCheckBox;
    GroupBox14: TGroupBox;
    lbl_produto: TLabel;
    chk_todos: TCheckBox;
    edt_produto: TEdit;
    chk_mMaximo: TCheckBox;
    chk_mSugestiva: TCheckBox;
    tabExtrato: TTabSheet;
    TabSheet5: TTabSheet;
    gp_sec: TGroupBox;
    gp_dep: TGroupBox;
    lbl_media_departamento: TLabel;
    lkp_media_departamento: TDBLookupComboBox;
    chk_media_departamento: TCheckBox;
    lbl_media_secao: TLabel;
    lkp_media_secao: TDBLookupComboBox;
    chk_media_secao: TCheckBox;
    gp_mes: TGroupBox;
    Label13: TLabel;
    lbl_mediaCalculo: TLabel;
    edt_mediaCalculo: TEdit;
    lbl_mediaSugestao: TLabel;
    edt_mediaSugestao: TEdit;
    Label17: TLabel;
    chk_SugestaoZerada_Media: TCheckBox;
    Label20: TLabel;
    chk_mCustoReal: TCheckBox;
    chk_mTotalCustoReal: TCheckBox;
    chk_mTotalMedio: TCheckBox;
    GroupBox33: TGroupBox;
    GroupBox29: TGroupBox;
    chk_MEstoqueSec: TCheckBox;
    GroupBox30: TGroupBox;
    chk_MVistaSec: TCheckBox;
    chk_mCustoSec: TCheckBox;
    GroupBox31: TGroupBox;
    chk_MPrazoSec: TCheckBox;
    GroupBox32: TGroupBox;
    chk_MTotalSec: TCheckBox;
    chk_mTotalCustoSec: TCheckBox;
    chk_SoZeradoSec: TCheckBox;
    chk_SoNegativoSec: TCheckBox;
    chk_zeradoSec: TCheckBox;
    chk_mTracejadaSec: TCheckBox;
    btn_excel: TBitBtn;
    chk_ProdAtivos_Media: TCheckBox;
    chk_agrupado: TCheckBox;
    gp_sec3: TGroupBox;
    Label21: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    CheckBox4: TCheckBox;
    GroupBox35: TGroupBox;
    dt_final: TDateTimePicker;
    Label3: TLabel;
    dt_inicial: TDateTimePicker;
    Label22: TLabel;
    gp_sec4: TGroupBox;
    Label25: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    CheckBox16: TCheckBox;
    Panel2: TPanel;
    rg_Tabela: TRadioGroup;
    chk_agrupado_secao: TCheckBox;
    chk_AtacadoVarejo: TCheckBox;
    btn_GeralDiscXLS: TSpeedButton;
    btn_FornecedorXLS: TSpeedButton;
    lblGaveta: TLabel;
    edtGaveta: TEdit;
    Label24: TLabel;
    grpPromoPeriodo: TGroupBox;
    dt_termino: TDateTimePicker;
    Label12: TLabel;
    dt_comeco: TDateTimePicker;
    Label11: TLabel;
    GroupBox38: TGroupBox;
    Label26: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    CheckBox14: TCheckBox;
    chk_zeradoAliq: TCheckBox;
    SpeedButton3: TSpeedButton;
    GroupBox39: TGroupBox;
    Label27: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    CheckBox15: TCheckBox;
    chk_agrupado_secao_media: TCheckBox;
    chk_ProdZerado: TCheckBox;
    Tab_Geral_Combustivel: TTabSheet;
    Label28: TLabel;
    rg_FornecedorPreco: TRadioGroup;
    btn_imprimir: TBitBtn;
    btn_fechar: TBitBtn;
    chk_gaveta2: TCheckBox;
    Pge_PisCofins: TTabSheet;
    GroupBox4: TGroupBox;
    lbl_ProdPisCofins: TLabel;
    SpeedButton4: TSpeedButton;
    dblkp_ProdPisCofins: TDBLookupComboBox;
    CheckBox5: TCheckBox;
    SpeedButton5: TSpeedButton;
    rg_Inativo_PisCofins: TRadioGroup;
    TabSheet6: TTabSheet;
    GroupBox9: TGroupBox;
    lbl_ProdNaoMovto: TLabel;
    SpeedButton6: TSpeedButton;
    dblkp_ProdNaoMovto: TDBLookupComboBox;
    chk_ProdnaoMovto: TCheckBox;
    GroupBox10: TGroupBox;
    Label30: TLabel;
    dt_ini_ProdNaoMovto: TDateTimePicker;
    dt_fim_ProdNaoMovto: TDateTimePicker;
    SpeedButton7: TSpeedButton;
    Panel4: TPanel;
    rg_ordem: TRadioGroup;
    rg_tipo: TRadioGroup;
    chk_CodFrabric: TCheckBox;
    rg_tipo_ProdNMovto: TRadioGroup;
    chk_CodNCM: TCheckBox;
    GroupBox12: TGroupBox;
    lblFornecedor: TLabel;
    lkpFornecedor: TDBLookupComboBox;
    chkFornecedor: TCheckBox;
    chkAgrupaForn: TCheckBox;
    GroupBox41: TGroupBox;
    lbl_media_produto: TLabel;
    lkp_media_produto: TDBLookupComboBox;
    chk_media_produto: TCheckBox;
    spd_media_produto: TSpeedButton;
    GroupBox28: TGroupBox;
    lbl_CodTribPisCofinsEntrada: TLabel;
    dblk_CodTribPisCofinsEntrada: TDBLookupComboBox;
    chk_CodTribPisCofinsEntrada: TCheckBox;
    lbl_CodTribPisCofinsSaida: TLabel;
    dblk_CodTribPisCofinsSaida: TDBLookupComboBox;
    chk_CodTribPisCofinsSaida: TCheckBox;
    tab_lote: TTabSheet;
    GroupBox42: TGroupBox;
    lbl_lote_produto: TLabel;
    spd_lote_produto: TSpeedButton;
    lkp_lote_produto: TDBLookupComboBox;
    chk_lote_produto: TCheckBox;
    chk_ProdnaoMovto_EstoqueZerado: TCheckBox;
    chk_ProdSemMovto_Media: TCheckBox;
    spd_ProdAitvo: TSpeedButton;
    GroupBox44: TGroupBox;
    lbl_fornc: TLabel;
    spd_forn: TSpeedButton;
    lkp_fornc: TDBLookupComboBox;
    chk_fornc: TCheckBox;
    GroupBox17: TGroupBox;
    lbl_produt: TLabel;
    spd_product: TSpeedButton;
    lkp_produt: TDBLookupComboBox;
    chk_produt: TCheckBox;
    grp_DepCustoFornec: TGroupBox;
    lbl_TotaisDep: TLabel;
    lkp_TotaisDep: TDBLookupComboBox;
    chk_TotaisDep: TCheckBox;
    spd_prod: TSpeedButton;
    spd_TotaisDep: TSpeedButton;
    spd_DeptoPreco: TSpeedButton;
    spd_GeralFornecedor: TSpeedButton;
    spd_aliq: TSpeedButton;
    spd_DeptoLevDiario: TSpeedButton;
    spd_depMovimentacao: TSpeedButton;
    spd_DepAltPreco: TSpeedButton;
    spd_DeptoCST: TSpeedButton;
    spd_media_departamento: TSpeedButton;
    chk_CodBalanca: TCheckBox;
    rg_RefEan: TRadioGroup;
    tab_Obs_CodFab: TTabSheet;
    GroupBox6: TGroupBox;
    lbl_For_Obs_CodFab: TLabel;
    spd_For_Obs_CodFab: TSpeedButton;
    lkp_For_Obs_CodFab: TDBLookupComboBox;
    chk_For_Obs_CodFab: TCheckBox;
    GroupBox34: TGroupBox;
    lbl_Dep_Obs_CodFab: TLabel;
    spd_Dep_Obs_CodFab: TSpeedButton;
    lkp_Dep_Obs_CodFab: TDBLookupComboBox;
    chk_Dep_Obs_CodFab: TCheckBox;
    r: TGroupBox;
    lbl_NaturezaReceita: TLabel;
    lkp_NatReceita: TDBLookupComboBox;
    chk_NatReceita: TCheckBox;
    chk_SemNatReceita: TCheckBox;
    rg_NatCredito: TGroupBox;
    lbl_NatCredito: TLabel;
    lkp_NatCredito: TDBLookupComboBox;
    chk_NatCredito: TCheckBox;
    chk_SemNatCredito: TCheckBox;
    chk_naoagrupar: TCheckBox;
    chk_Custo_Obs_CodFab: TCheckBox;
    GroupBox11: TGroupBox;
    lbl_Pro_Obs_CodFab: TLabel;
    chk_Pro_Obs_CodFab: TCheckBox;
    edt_Pro_Obs_CodFab: TEdit;
    chk_TodosMinimos: TCheckBox;
    rg_situacao_Pro_Obs_CodFab: TRadioGroup;
    btn_GeraExcel_prodNaoMovimentados: TBitBtn;
    pnl_aguarde_nao_movimentados: TGroupBox;
    Label10: TLabel;
    Label16: TLabel;
    chkUnEmbComp1: TCheckBox;
    chkUnEmbComp2: TCheckBox;
    Tab_Geral_ProdExcel: TTabSheet;
    rg_GerarProdExcel: TRadioGroup;
    GroupBox36: TGroupBox;
    lbl_GerarProdExcel: TLabel;
    lkp_GerarProdExcel: TDBLookupComboBox;
    chk_GerarProdExcel: TCheckBox;
    GroupBox45: TGroupBox;
    chk_Custo: TCheckBox;
    chk_CustoReal: TCheckBox;
    chk_Margem: TCheckBox;
    chk_PrVista: TCheckBox;
    chk_PrPrazo: TCheckBox;
    chk_AliqValor: TCheckBox;
    spd_ImportaExcel: TSpeedButton;
    rgValor: TRadioGroup;
    chkProdEstoq: TCheckBox;
    gp_marcaFabricante: TGroupBox;
    lbl_media_marcaFabricante: TLabel;
    spd_media_marcaFabricante: TSpeedButton;
    lkp_media_marcaFabricante: TDBLookupComboBox;
    chk_media_marcaFabricante: TCheckBox;
    Panel3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox27: TGroupBox;
    chk_mFabric: TCheckBox;
    rgTipoRelMedMov: TRadioGroup;
    chkSoPrecoFixo: TCheckBox;
    GroupBox46: TGroupBox;
    lbl_DepartamentoExtrato: TLabel;
    btn_LocDepExtrato: TSpeedButton;
    lkp_DepartamentoExtrato: TDBLookupComboBox;
    chk_DepExtrato: TCheckBox;
    GroupBox23: TGroupBox;
    Label4: TLabel;
    dt_extrato_ini: TDateTimePicker;
    dt_extrato_fim: TDateTimePicker;
    GroupBox16: TGroupBox;
    lbl_ProdutoExtrato: TLabel;
    btn_LocProdExtrato: TSpeedButton;
    lkp_ProdutoExtrato: TDBLookupComboBox;
    rg_extratoAcum: TRadioGroup;
    pnl_Extrado_Inferior: TPanel;
    chk_Extrato_SoEntradas: TCheckBox;
    chk_AgrupaExtPorTipo: TCheckBox;
    chkComissao: TCheckBox;
    chkSoComissao: TCheckBox;
    chk_agrupado_depto_media: TCheckBox;
    grpPromoFabricante: TGroupBox;
    lblPromoFabricante: TLabel;
    lkpPromoFabricante: TDBLookupComboBox;
    chkPromoFabricante: TCheckBox;
    GroupBox26: TGroupBox;
    rg_GeraEstData: TRadioGroup;
    groupAtivo: TRadioGroup;
    btn_EstoquePorDataXLS: TSpeedButton;
    GroupBox43: TGroupBox;
    lbl_fornecedor: TLabel;
    spd_fornecedor: TSpeedButton;
    lkp_fornecedor: TDBLookupComboBox;
    chk_fornecedor: TCheckBox;
    groupDataParaEstoque: TGroupBox;
    Dt_GeraEstData: TDateTimePicker;
    Pnl_aguarde_estoque_data: TGroupBox;
    Label1: TLabel;
    Label29: TLabel;
    grpProdSemMovMargem: TGroupBox;
    lblMargemProdSemMov: TLabel;
    edtMargemProdSemMov: TMaskEdit;
    btnProdSemMovMargemHelp: TSpeedButton;
    chk_ImpCusto_Media: TCheckBox;
    chkMovSaldo: TCheckBox;
    chkNaoAgrupaMarcaFabric: TCheckBox;
    gbMarca: TGroupBox;
    lblMarca: TLabel;
    spdMarca: TSpeedButton;
    lkpMarca: TDBLookupComboBox;
    chkMarca: TCheckBox;
    rgTipoRel: TRadioGroup;
    rgDescProduto: TRadioGroup;
    rg_EanouRef: TRadioGroup;
    rg_mediaTipo: TRadioGroup;
    chk_CodCest: TCheckBox;
    tabPrecoSimplificado: TTabSheet;
    rgPrecoSimplificado: TRadioGroup;
    procedure tsh_vendedorShow(Sender: TObject);
    procedure tsh_clienteShow(Sender: TObject);
    procedure tsh_localShow(Sender: TObject);
    procedure chk_DeptoPrecoClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure lkp_clienteEnter(Sender: TObject);
    procedure tsh_RepShow(Sender: TObject);
    procedure tsh_totaisShow(Sender: TObject);
    procedure lkp_totaisEnter(Sender: TObject);
    procedure lkp_reposEnter(Sender: TObject);
    procedure tsh_inventShow(Sender: TObject);
    procedure chk_aliqClick(Sender: TObject);
    procedure lkp_aliqEnter(Sender: TObject);
    procedure chk_departamento10Click(Sender: TObject);
    procedure chk_TotaisDepClick(Sender: TObject);
    procedure chk_mov11Click(Sender: TObject);
    procedure chk_forncClick(Sender: TObject);
    procedure chk_aliqforClick(Sender: TObject);
    procedure chk_naf_codfiscalClick(Sender: TObject);
    procedure chk_ativo_inativoClick(Sender: TObject);
    procedure chk_DepAltPrecoClick(Sender: TObject);
    procedure chk_secaoClick(Sender: TObject);
    procedure chk_DeptoCSTClick(Sender: TObject);
    procedure chk_prodClick(Sender: TObject);
    procedure rg_TabelaClick(Sender: TObject);
    procedure chk_mCustoClick(Sender: TObject);
    procedure chk_mMedioClick(Sender: TObject);
    procedure chk_mMinimoClick(Sender: TObject);
    procedure chk_todoscstClick(Sender: TObject);
    procedure chk_atacadoClick(Sender: TObject);
    procedure chk_mAvistaClick(Sender: TObject);
    procedure chk_mEstoqueClick(Sender: TObject);
    procedure chk_zeradoClick(Sender: TObject);
    procedure chk_SoZeradoClick(Sender: TObject);
    procedure chk_produtClick(Sender: TObject);
    procedure chk_mMinimo2Click(Sender: TObject);
    procedure chk_SoNegativoClick(Sender: TObject);
    procedure chk_todosClick(Sender: TObject);
    procedure chk_mMaximoClick(Sender: TObject);
    procedure btn_LocProdExtratoClick(Sender: TObject);
    procedure chk_media_departamentoClick(Sender: TObject);
    procedure chk_media_secaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt_mediaCalculoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_mediaSugestaoKeyPress(Sender: TObject; var Key: Char);
    procedure chk_mCustoRealClick(Sender: TObject);
    procedure chk_MVistaSecClick(Sender: TObject);
    procedure chk_mCustoSecClick(Sender: TObject);
    procedure chk_MTotalSecClick(Sender: TObject);
    procedure chk_mTotalCustoSecClick(Sender: TObject);
    procedure chk_MEstoqueSecClick(Sender: TObject);
    procedure chk_zeradoSecClick(Sender: TObject);
    procedure chk_SoZeradoSecClick(Sender: TObject);
    procedure chk_SoNegativoSecClick(Sender: TObject);
    procedure btn_excelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure chk_AtacadoVarejoClick(Sender: TObject);
    procedure btn_GeralDiscXLSClick(Sender: TObject);
    procedure btn_FornecedorXLSClick(Sender: TObject);
    procedure rg_ordemClick(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CheckBox15Click(Sender: TObject);
    procedure chk_fornecedorClick(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure chk_ProdnaoMovtoClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure chkFornecedorClick(Sender: TObject);
    procedure chkAgrupaFornClick(Sender: TObject);
    procedure chk_media_produtoClick(Sender: TObject);
    procedure spd_media_produtoClick(Sender: TObject);
    procedure chk_CodTribPisCofinsEntradaClick(Sender: TObject);
    procedure chk_CodTribPisCofinsSaidaClick(Sender: TObject);
    procedure chk_lote_produtoClick(Sender: TObject);
    procedure spd_lote_produtoClick(Sender: TObject);
    procedure btn_EstoquePorDataXLSClick(Sender: TObject);
    procedure spd_fornecedorClick(Sender: TObject);
    procedure spd_fornClick(Sender: TObject);
    procedure spd_productClick(Sender: TObject);
    procedure spd_prodClick(Sender: TObject);
    procedure spd_ProdAitvoClick(Sender: TObject);
    procedure spd_TotaisDepClick(Sender: TObject);
    procedure spd_GeralFornecedorClick(Sender: TObject);
    procedure spd_DeptoPrecoClick(Sender: TObject);
    procedure spd_aliqClick(Sender: TObject);
    procedure spd_DeptoLevDiarioClick(Sender: TObject);
    procedure spd_depMovimentacaoClick(Sender: TObject);
    procedure spd_DepAltPrecoClick(Sender: TObject);
    procedure spd_DeptoCSTClick(Sender: TObject);
    procedure spd_media_departamentoClick(Sender: TObject);
    procedure chk_Dep_Obs_CodFabClick(Sender: TObject);
    procedure chk_For_Obs_CodFabClick(Sender: TObject);
    procedure chk_NatReceitaClick(Sender: TObject);
    procedure chk_SemNatReceitaClick(Sender: TObject);
    procedure chk_NatCreditoClick(Sender: TObject);
    procedure chk_SemNatCreditoClick(Sender: TObject);
    procedure spd_Dep_Obs_CodFabClick(Sender: TObject);
    procedure spd_For_Obs_CodFabClick(Sender: TObject);
    procedure chk_Pro_Obs_CodFabClick(Sender: TObject);
    procedure btn_GeraExcel_prodNaoMovimentadosClick(Sender: TObject);
    procedure spd_ImportaExcelClick(Sender: TObject);
    procedure chk_GerarProdExcelClick(Sender: TObject);
    procedure chk_Extrato_SoEntradasClick(Sender: TObject);
    procedure chk_media_marcaFabricanteClick(Sender: TObject);
    procedure spd_media_marcaFabricanteClick(Sender: TObject);
    procedure rgTipoRelClick(Sender: TObject);
    procedure chk_DepExtratoClick(Sender: TObject);
    procedure btn_LocDepExtratoClick(Sender: TObject);
    procedure rg_extratoAcumClick(Sender: TObject);
    procedure chkPadraoClick(Sender: TObject);
    procedure chkComissaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkPromoFabricanteClick(Sender: TObject);
    procedure edtMargemProdSemMovKeyPress(Sender: TObject; var Key: Char);
    procedure edtMargemProdSemMovExit(Sender: TObject);
    procedure btnProdSemMovMargemHelpClick(Sender: TObject);
    procedure chkMovSaldoClick(Sender: TObject);
    procedure chkMarcaClick(Sender: TObject);
    procedure spdMarcaClick(Sender: TObject);
    procedure rg_mediaTipoClick(Sender: TObject);
  private
    TrabSecao : boolean;
    procedure ConfigGeralDiscSQL;
    procedure ConfigFornecedorSQL;
    procedure ConfigMovimentacao;
    procedure ConfigNaturezaFiscal_Aliquota_Depto;
    procedure ConfigPisCofins;
    procedure ConfigMediaMovimentacao;
    procedure ConfigProdutosNaoMovimentados;
    procedure ConfigGeraEstoquePorData;
    procedure ValidaCampos;
    procedure VisibleChkTodosMinimos;
    procedure EnabledChkMSugestiva;
    procedure EnabledChkMTotal;
    procedure EnabledChkMTotalCusto;
    procedure EnabledChkMTotalCustoReal;
    procedure EnabledChkMTotalMedio;
  public
    GeraExcel : boolean;
  end;

var
  frm_RelProduto: Tfrm_RelProduto;

implementation

uses
  U_Dm, Math, TypInfo, DBClient, Variants, U_PesqProduto, U_GeraPlanilhaExcel,
  U_PesqFornecedor, U_PesqDepartamento, U_DM_Geral, U_DM_RelProduto,
  U_PesqMarca, Printers;

{$R *.DFM}

procedure Tfrm_RelProduto.tsh_vendedorShow(Sender: TObject);
begin
  RadioGroup1.Enabled       := True;
  lbl_DeptoPreco.Enabled    := False;
  chk_DeptoPreco.Enabled    := False;
  lkp_DeptoPreco.Enabled    := False;
end;

procedure Tfrm_RelProduto.ValidaCampos;
begin
  //verifica produto
  If (Trim(dblkp_ProdPisCofins.Text) = '') and (CheckBox5.Checked = false) then
  Begin
    MessageBox(handle,'Selecione um Produto ou Marque Todos!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
    dblkp_ProdPisCofins.SetFocus;
    Abort;
  End;
  //verifica ST de Entrada
  if  (dblk_CodTribPisCofinsEntrada.Text = '') and
      (chk_CodTribPisCofinsEntrada.Checked = false)  then
  begin
    MessageBox(handle,'Selecione um ST de entrada ou Marque Todos!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
    dblk_CodTribPisCofinsEntrada.SetFocus;
    Abort;
  end;
  //verifica ST de saída
  if  (dblk_CodTribPisCofinsSaida.Text = '') and (chk_CodTribPisCofinsSaida.Checked = false) then
  begin
    MessageBox(handle,'Selecione um ST de saída ou Marque Todos!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
    dblk_CodTribPisCofinsSaida.SetFocus;
    Abort;
  end;
  //verifica Natureza de Credito
  if  (lkp_NatCredito.Text = '') and (chk_NatCredito.Checked = false)  then
  begin
    MessageBox(handle,'Selecione uma Natureza da Crédito ou Marque Todos!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
    lkp_NatCredito.SetFocus;
    Abort;
  end;
  //verifica natureza da receita
  if  (lkp_NatReceita.Text = '') and (chk_NatReceita.Checked = false)  then
  begin
    MessageBox(handle,'Selecione uma Natureza da Receita ou Marque Todos!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
    lkp_NatReceita.SetFocus;
    Abort;
  end;
end;

procedure Tfrm_RelProduto.VisibleChkTodosMinimos;
begin
  chk_TodosMinimos.Visible := chk_mMinimo2.Checked or chk_mMinimo.Checked;

  if not chk_TodosMinimos.Visible then
    chk_TodosMinimos.Checked := False;
end;

procedure Tfrm_RelProduto.tsh_clienteShow(Sender: TObject);
begin
  RadioGroup1.Enabled          := False;
  lbl_DeptoPreco.Enabled       := True;
  chk_DeptoPreco.Enabled       := True;
  lkp_DeptoPreco.Enabled       := True;
end;

procedure Tfrm_RelProduto.tsh_localShow(Sender: TObject);
begin
  RadioGroup1.Enabled          := False;
  lbl_DeptoPreco.Enabled       := False;
  chk_DeptoPreco.Enabled       := False;
  lkp_DeptoPreco.Enabled       := False;
end;

procedure Tfrm_RelProduto.chk_DeptoPrecoClick(Sender: TObject);
begin
  lkp_DeptoPreco.Enabled := not chk_DeptoPreco.Checked;
  lbl_DeptoPreco.Enabled := not chk_DeptoPreco.Checked;
  spd_DeptoPreco.Visible := not chk_DeptoPreco.Checked;
end;

procedure Tfrm_RelProduto.chk_Dep_Obs_CodFabClick(Sender: TObject);
begin
  lkp_Dep_Obs_CodFab.Enabled := not chk_Dep_Obs_CodFab.Checked;
  lbl_Dep_Obs_CodFab.Enabled := not chk_Dep_Obs_CodFab.Checked;
  spd_Dep_Obs_CodFab.Visible := not chk_Dep_Obs_CodFab.Checked;
end;

procedure Tfrm_RelProduto.chk_Extrato_SoEntradasClick(Sender: TObject);
begin
  rg_extratoAcum.Visible       := not chk_Extrato_SoEntradas.Checked;
  chk_AgrupaExtPorTipo.Enabled := not chk_Extrato_SoEntradas.Checked and (rg_extratoAcum.ItemIndex > 0);
  chk_AgrupaExtPorTipo.Checked := chk_AgrupaExtPorTipo.Enabled;
end;

procedure Tfrm_RelProduto.ConfigMediaMovimentacao;
const
  LANDSCAPE = 2.5;

  //Media/Movimentação
  LEFT_REG_DATE_PAG_MED_MOV = 6.7812;
  LEFT_REG_CABEC_MED_MOV = 4.2813;
  LEFT_REG_ITENS_MED_MOV = 4.2813;
  LEFT_REG_TOTAL_MED_MOV = 5.5729; //3.3437;
  WIDTH_PROD_DESCR_MED_MOV = 3.8854;
var
  AFiltroEmMeses : Boolean;
  mCalculo, mSugestao : integer;
  AProduto, ADepart, ASecao, AMarca: string;
begin
  with DM_RelProduto do
  begin
    if chk_ImpCusto_Media.Checked then
    begin
      lblCompraCusto.Caption   := 'Custo';
      dbtCompraCusto.DataField := 'PRO_VLRCUSTO';
    end else
    begin
      lblCompraCusto.Caption   := 'Custo Real';
      dbtCompraCusto.DataField := 'PRO_CUSTONOTA';
    end;

    //Com ou Sem Departamento
    Rep_Compra.GroupHeader[0].Visible  := not chk_agrupado_depto_media.Checked;
    Rep_Compra.GroupFooter[0].Visible  := not chk_agrupado_depto_media.Checked;

    //Com ou Sem Seção
    Rep_Compra.GroupHeader[1].Visible  := True;
    Rep_Compra.GroupFooter[1].Visible  := True;

    if chk_agrupado_secao_media.Checked and (gp_sec.Visible) then
    begin
      Rep_Compra.GroupHeader[1].Visible  := False;
      Rep_Compra.GroupFooter[1].Visible  := False;
    end;

    //Com ou Sem Marca/Fabricante
    Rep_Compra.GroupHeader[2].Visible  := not chkNaoAgrupaMarcaFabric.Checked;
    Rep_Compra.GroupFooter[2].Visible  := not chkNaoAgrupaMarcaFabric.Checked;

    lblUnComp.Visible := rgTipoRelMedMov.ItemIndex = 1;
    edtUnComp.Visible := rgTipoRelMedMov.ItemIndex = 1;

    //Retrato
    if rgTipoRelMedMov.ItemIndex = 0 then
    begin
      Rep_Compra.PrinterSetup.Orientation := poPortrait;
      regDatePagMedMov.Left := LEFT_REG_DATE_PAG_MED_MOV;
      regCabecMedMov.Left   := LEFT_REG_CABEC_MED_MOV;
      regItensMedMov.Left   := LEFT_REG_ITENS_MED_MOV;
      regTotalMedMov.Left   := LEFT_REG_TOTAL_MED_MOV;
      ppDBText117.Width     := WIDTH_PROD_DESCR_MED_MOV;
    end
    else //Paisagem
    begin
      Rep_Compra.PrinterSetup.Orientation := poLandscape;
      regDatePagMedMov.Left := LEFT_REG_DATE_PAG_MED_MOV + LANDSCAPE;
      regCabecMedMov.Left   := LEFT_REG_CABEC_MED_MOV + LANDSCAPE;
      lblUnComp.Left        := regCabecMedMov.Left - lblUnComp.Width;
      regItensMedMov.Left   := LEFT_REG_ITENS_MED_MOV + LANDSCAPE;
      edtUnComp.Left        := regItensMedMov.Left - edtUnComp.Width;
      regTotalMedMov.Left   := LEFT_REG_TOTAL_MED_MOV + LANDSCAPE;
      ppDBText117.Width     := WIDTH_PROD_DESCR_MED_MOV + LANDSCAPE -
        IfThen(edtUnComp.Visible, edtUnComp.Width, 0);
    end;
  end;

  mCalculo  := StrToInt(edt_mediaCalculo.Text);
  mSugestao := StrToInt(edt_mediaSugestao.Text);

  with DM_Geral do
  begin
    if chk_media_produto.Checked then
      AProduto := '%'
    else
      AProduto := qry_CadastroProdutoPRO_ID.AsString;

    if chk_media_departamento.Checked then
      ADepart := '%'
    else
      ADepart := qryCadDepartdep_id.AsString;

    if chk_media_secao.Checked then
      ASecao := '%'
    else
      ASecao := qryCadSecaoSEC_ID.AsString;

    if chk_media_marcaFabricante.Checked then
      AMarca := '%'
    else
      AMarca := qryMarcaMRC_ID.AsString;
  end;

  AFiltroEmMeses := (rg_mediaTipo.ItemIndex = 0);

  DM_RelProduto.ImprimeSugestao(AProduto, ADepart, ASecao, AMarca, mCalculo,
    mSugestao, chk_ProdSemMovto_Media.Checked, chk_ProdAtivos_Media.Checked,
    chk_SugestaoZerada_Media.Checked, GeraExcel, AFiltroEmMeses);
end;

procedure Tfrm_RelProduto.ConfigMovimentacao;
const
   {$REGION 'SQLs'}
    SQL_Movto =
    ' select '+
    '    p.sec_id, sec_descricao, p.dep_id, dep_descricao, '+
    '    v.pro_id, p.pro_referencia, p.pro_descricao, pro_unidade, '+
    '    sum(qtde_entrada) as QTDE_ENTRADA, '+
    '    sum(qtde_saida) as QTDE_SAIDA  '+
    ' from '+
    '    VW_PRODUTO_EXTRATO v  '+
    ' inner join '+
    '    produto p on (p.pro_id = v.pro_id) '+
    ' inner join '+
    '    departamento d on (p.dep_id = d.dep_id) '+
    ' left join '+
    '    secao s on (p.sec_id = s.sec_id) '+
    ' where  '+
    '     data between :dtini and :dtfim and '+
    '     convert(varchar(5),d.dep_id) like :dep_id ';
    {$ENDREGION}
begin
    If not(chk_mov11.Checked) and (lkp_dep11.Text = '') then
    Begin
      MessageBox(handle,'Escolha um Departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
      Abort;
    End;
    //
    If not(CheckBox4.Checked) and (DBLookupComboBox5.Text = '') and (gp_sec3.Visible) then
    Begin
      MessageBox(handle,'Escolha uma Seção ou Todas', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
      Abort;
    End;
    //
    with DM_RelProduto do
    Begin
        qryMovimentacao.Close;
        qryMovimentacao.SQL.Clear;
        qryMovimentacao.SQL.Add(SQL_Movto);

        qryMovimentacao.Parameters[0].Value:= dt_inicial.Date;
        qryMovimentacao.Parameters[1].Value:= dt_final.Date;
        //
        If not(chk_mov11.Checked) Then
          qryMovimentacao.Parameters[2].Value:= DM_Geral.qryCadDepartdep_id.Value
        else
          qryMovimentacao.Parameters[2].Value := '%';
        //
        If (gp_sec3.Visible) then
        Begin
          if not(CheckBox4.Checked) then
          Begin
            qryMovimentacao.SQL.Add('  and (convert(varchar(10),p.sec_id) like :secao) ');
            qryMovimentacao.Parameters[3].Value := DM_Geral.qrycadSecaoSEC_ID.Value;
          end;
        end;
        //
        qryMovimentacao.SQL.Add(' group by p.sec_id, sec_descricao, v.pro_id, p.dep_id, dep_descricao, ');
        qryMovimentacao.SQL.Add('          p.pro_referencia, p.pro_descricao, pro_unidade ');
        qryMovimentacao.SQL.Add(' Order by dep_descricao, p.pro_descricao ');
        qryMovimentacao.Open;
        //
        If qryMovimentacao.IsEmpty Then
        Begin
          MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
          Abort;
        End;
        //Com ou Sem Seção
        if TrabSecao then
        begin
          ppMovimentacao.GroupHeader[1].Visible  := True;
          ppMovimentacao.GroupFooter[1].Visible  := True;
        end
        else
        begin
          ppMovimentacao.GroupHeader[1].Visible  := False;
          ppMovimentacao.GroupFooter[1].Visible  := False;
        end;
    End;
    //
end;

procedure Tfrm_RelProduto.ConfigNaturezaFiscal_Aliquota_Depto;
const
  {$REGION 'SQLs'}
  SQL_AliqDepto =
    ' select '+
    '   dep_descricao, pro_ean1, pro_referencia, pro_descricao, '+
    '   pro_unidade, cst_id, pro_estoque, pro_vlrcusto, pro_vlrmedio, '+
    '  (pro_estoque * pro_vlrcusto) as Custo, '+
    '  (pro_estoque * pro_vlrmedio) as Medio, '+
    '   naf_aliquota,naf_descricao '+
    ' from '+
    '   produto p '+
    ' inner join '+
    '   departamento d  on (d.dep_id = p.dep_id) '+
    ' inner join '+
    '   natureza_fiscal f on (f.naf_codfiscal = p.naf_codfiscal) '+
    ' where '+
    '   p.pro_ativo = ''A'' and '+
    '   ((convert(varchar(5),d.dep_id) like :dep_id)) and '+
    '   ((convert(varchar(10),f.naf_codfiscal) like :naf_codfiscal)) and '+
    '   ((convert(varchar(10),cst_id) like :cst_id)) ';
  {$ENDREGION}
begin
    If not(chk_aliq.Checked) and (lkp_aliq.Text = '') then
    Begin
        MessageBox(handle,'Escolha um Departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
    End;
    //
    If not(CheckBox14.Checked) and (DBLookupComboBox7.Text = '') then
    Begin
        MessageBox(handle,'Escolha uma Natureza Fiscal ou todas', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
    End;
    //
    with DM_RelProduto do
    Begin
        qryAliq.Close;
        qryAliq.SQL.Clear;
        qryAliq.SQL.Text := SQL_AliqDepto;
        //
        if not (chk_zeradoAliq.Checked) then
          qryAliq.SQL.Add('Order by p.naf_codfiscal, pro_descricao')
        else
          qryAliq.SQL.Add('and p.pro_estoque > 0 Order by p.naf_codfiscal, pro_descricao');
        //
        If chk_aliq.Checked Then
          qryAliq.Parameters[0].value := '%'
        else
          qryAliq.Parameters[0].value := DM_Geral.qryCadDepartdep_id.AsInteger;
        //
        If CheckBox14.Checked Then
          qryAliq.Parameters[1].value := '%'
        else
          qryAliq.Parameters[1].value :=  Dm_Geral.qrynaf_codfiscalNAF_CODFISCAL.Value;        //
        If CheckBox15.Checked Then
          qryAliq.Parameters[2].value := '%'
        else
          qryAliq.Parameters[2].value := DM_Geral.qryCadCstCST_ID.Value;
        //
        qryAliq.Open;
        //
        If qryAliq.IsEmpty Then
        Begin
            MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
        End;
    End;
    //
end;

procedure Tfrm_RelProduto.ConfigPisCofins;
const
  {$REGION 'SQL PIS/COFINS'}
    QUERY =
        ' SELECT ' +
        ' 	PRO_REFERENCIA, PRO_DESCRICAO, STPC_CODIGO,' +
        ' 	STPC_CODIGO_SAI, PRO_ALIQPIS, PRO_ALIQCOFINS,' +
        '   PRO_ALIQPIS_SAI, PRO_ALIQCOFINS_SAI, PRO_CODIGONBM,' +
        '   NAT_BC_CODIGO, NAT_CODIGO' +
        ' FROM ' +
        '	  PRODUTO' +
        ' WHERE' +
        '   (pro_ativo like :atv)'+
        '   and CONVERT(VARCHAR(10), PRO_ID) LIKE :PROID '+
        '   and CONVERT(VARCHAR(10), STPC_CODIGO) LIKE :StEnt '+
        '   and CONVERT(VARCHAR(10), STPC_CODIGO_SAI) LIKE :StSai '+
        '   and isnull(CONVERT(VARCHAR(10), NAT_CODIGO),'''') LIKE :NAT_CODIGO '+
        '   and isnull(CONVERT(VARCHAR(10), NAT_BC_CODIGO),'''') LIKE :NAT_BC_CODIGO %s '+
        ' ORDER BY' +
        '   PRO_DESCRICAO';

      WHERE_NATCREDITO_NULL =
        ' and NAT_BC_CODIGO IS NULL %s';

      WHERE_NATRECEITA_NULL =
        ' and NAT_CODIGO IS NULL';
  {$ENDREGION}
var
  sSQL: string;
begin
    ValidaCampos;

    with DM_RelProduto.qry_ProdPisCofins do
    Begin
        Close;
        Sql.Clear;
        //
        sSql := QUERY;
        if chk_SemNatCredito.Checked then
          sSql := Format(sSQL,[WHERE_NATCREDITO_NULL]);

        if chk_SemNatReceita.Checked then
          sSql := Format(sSql,[WHERE_NATRECEITA_NULL])
        else
          sSQL := Format(sSql, ['']);
        //
        Sql.Text := sSQL;
        //
        case rg_Inativo_PisCofins.ItemIndex of
          0:Parameters[0].Value := 'A';
          1:Parameters[0].Value := 'I';
          2:Parameters[0].Value := 'B';
          3:Parameters[0].Value := '%';
        end;
        //
        If CheckBox5.Checked then
          Parameters[1].Value := '%'
        else
          Parameters[1].Value := DM_Geral.qry_CadastroProdutoPRO_ID.AsString;
        //
        If chk_CodTribPisCofinsEntrada.Checked then
          Parameters[2].Value := '%'
        else
          Parameters[2].Value := DM_Geral.qry_SitTribPisCofinsEntradaSTPC_CODIGO.Value;
        //
        If chk_CodTribPisCofinsSaida.Checked then
          Parameters[3].Value := '%'
        else
          Parameters[3].Value := Dm_Geral.qry_SitTribPisCofinsSaidaSTPC_CODIGO.Value;
        //
        if (chk_NatReceita.Checked) then
          Parameters[4].Value := '%'
        else
          Parameters[4].Value := dm_geral.qry_NatReceitaNAT_CODIGO.Value;
        //
        if chk_NatCredito.Checked then
          Parameters[5].Value := '%'
        else
          Parameters[5].Value := dm_geral.qry_NatCreditoNAT_BC_CODIGO.Value;
        //
        Open;
        //
        If IsEmpty Then
        begin
          MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
          Abort;
        end;
    End;
    //
end;

procedure Tfrm_RelProduto.ConfigProdutosNaoMovimentados;
const
  {$REGION 'SQLs'}
  SQL_ProdNaoMovto =
    ' SELECT ' +
    '    P.PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_ESTOQUE, ' +
    '    PRO_ULTVENDA, PRO_ATIVO ' +
    ' FROM ' +
    '    PRODUTO P ' +
    ' LEFT JOIN ' +
    '    ( ' +
    '        SELECT PRO_ID, SUM(QTDE_ENTRADA) AS ENTRADA, SUM(QTDE_SAIDA) AS SAIDA ' +
    '        FROM VW_PRODUTO_EXTRATO ' +
    '        WHERE DATA BETWEEN :DTINI AND :DTFIM ' +
    '        GROUP BY PRO_ID ' +
    '    ) AS V ON P.PRO_ID = V.PRO_ID ' +
    ' WHERE ' +
    '    CONVERT(VARCHAR(10), P.PRO_ID) LIKE :PRO_ID AND ' +
    '    PRO_ATIVO LIKE :PRO_ATIVO AND ' +
    '    (SAIDA IS NULL OR SAIDA < (ENTRADA * :PERC /100))';
  {$ENDREGION}
begin
    with Dm_RelProduto do
    Begin
        If (Trim(dblkp_ProdNaoMovto.Text) = '') and (chk_ProdnaoMovto.Checked = false) then
        Begin
          MessageBox(handle,'Selecione um Produto', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
          dblkp_ProdNaoMovto.DropDown;
          Abort;
        End;

        try
            update;
            pnl_aguarde_nao_movimentados.Visible := True;
            update;

            qry_ProdNaoMovto.Close;
            qry_ProdNaoMovto.SQL.Clear;
            qry_ProdNaoMovto.SQL.Text := SQL_ProdNaoMovto;

            if chk_ProdnaoMovto_EstoqueZerado.Checked then
              qry_ProdNaoMovto.SQL.Add(' and PRO_ESTOQUE > 0 ');

            qry_ProdNaoMovto.SQL.Add(' order by PRO_ATIVO, PRO_DESCRICAO ');

            qry_ProdNaoMovto.CommandTimeout := 0;

            qry_ProdNaoMovto.Parameters[0].Value := dt_ini_ProdNaoMovto.DateTime;
            qry_ProdNaoMovto.Parameters[1].Value := dt_fim_ProdNaoMovto.DateTime;

            if chk_ProdnaoMovto.Checked then
              qry_ProdNaoMovto.Parameters[2].Value := '%'
            else
              qry_ProdNaoMovto.Parameters[2].Value := DM_Geral.qry_CadastroProdutoPRO_ID.AsString;

            case rg_tipo_ProdNMovto.ItemIndex of
              0: qry_ProdNaoMovto.Parameters[3].Value := 'A';
              1: qry_ProdNaoMovto.Parameters[3].Value := 'I';
              2: qry_ProdNaoMovto.Parameters[3].Value := 'B';
              3: qry_ProdNaoMovto.Parameters[3].Value := '%';
            end;

            qry_ProdNaoMovto.Parameters[4].Value := StrToFloat(edtMargemProdSemMov.Text);

            qry_ProdNaoMovto.Open;

            If (qry_ProdNaoMovto.IsEmpty) Then
            begin
              MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!',
                MB_ICONINFORMATION + MB_OK);
              Abort;
            end;
        finally
          update;
          pnl_aguarde_nao_movimentados.Visible := False;
          update;
        end;
      End;
end;

procedure Tfrm_RelProduto.btn_imprimirClick(Sender: TObject);
const
  {$REGION 'Constantes do relatório geral'}
  LANDSCAPE = 2.5;

  //Geral
  LEFT_REG_DATE_PAG = 5.8542;
  LEFT_REG_CABECALHO = 3.7083;
  LEFT_REG_ITENS = 3.7083;
  LEFT_REG_TOTAL = 3.2708;
  WIDTH_PROD_DESCR = 2.6146;
  {$ENDREGION}

  {$REGION 'SQLs'}
  SQL_Geral =
    ' select '+
    '   dep_descricao, pro_ean1, pro_referencia, pro_descricao, '+
    '   pro_unidade, pro_quant_unid, pro_estoque, pro_estoqmin, '+
    '   pro_vlrcusto, pro_margem, pro_vlrvenda, pro_vlrprazo, '+
    '   NAF_ALIQUOTA '+
    ' from '+
    '   produto p '+
    ' inner join '+
    '  NATUREZA_FISCAL n on (n.NAF_CODFISCAL = p.NAF_CODFISCAL) '+
    ' inner join '+
    '  DEPARTAMENTO d on (d.dep_id = p.dep_id) '+
    ' where '+
    '  p.pro_ativo = ''A'' ';

  SQL_EXTRATO_DISC =
    ' select ' +
    '    DATA, DOCTO,PRO_ID, REFERENCIA, DESCRICAO, ' +
    '    SUM(QTDE_ENTRADA) AS ENTRADA, ' +
    '    SUM(QTDE_SAIDA) AS SAIDA, SISTEMA, ETG_ID ' +
    ' from ' +
    '    VW_PRODUTO_EXTRATO ' +
    ' where ' +
    '    DATA BETWEEN :DTINI AND :DTFIM AND ' +
    '    CONVERT(VARCHAR(10), PRO_ID) LIKE :PRO_ID AND ' +
    '    CONVERT(VARCHAR(10), DEP_ID) LIKE :DEP_ID ' +
    ' group by ' +
    '    DATA, DOCTO,PRO_ID, REFERENCIA, DESCRICAO, ' +
    '    SISTEMA, ETG_ID ' +
    ' order by ' +
    '    SISTEMA, DESCRICAO, DATA';

  SQL_EXTRATO_HORA =
    ' select ' +
    '    HORA, DOCTO,PRO_ID, REFERENCIA, DESCRICAO, ' +
    '    SISTEMA, SUM(QTDE_ENTRADA) AS ENTRADA, ' +
    '    SUM(QTDE_SAIDA) AS SAIDA ' +
    ' from ' +
    '    VW_PRODUTO_EXTRATO ' +
    ' where ' +
    '    DATEADD(dd, DATEDIFF(dd, 0, HORA), 0) BETWEEN :DTINI AND :DTFIM AND ' +
    '    CONVERT(VARCHAR(10), PRO_ID) LIKE :PRO_ID AND ' +
    '    CONVERT(VARCHAR(10), DEP_ID) LIKE :DEP_ID ' +
    ' group by ' +
    '    HORA, DOCTO,PRO_ID, REFERENCIA, DESCRICAO, ' +
    '    SISTEMA ' +
    ' order by ' +
    '    DESCRICAO, HORA, SISTEMA';

  SQL_PROMO_PRODUTO =
    ' select ' +
    '    PRO_REFERENCIA, PRO_DESCRICAO, PRO_PROMOCAO_DTINI, ' +
    '    PRO_PROMOCAO_DTFIM, PRO_PROMOCAO_VLR ' +
    ' from ' +
    '    PRODUTO ' +
    ' where ' +
    '    CONVERT(VARCHAR(10), PRO_ID) LIKE :PRO_ID and ' +
    '    ( ' +
    '      (:DT_INI <= PRO_PROMOCAO_DTINI or :DT_INI <= PRO_PROMOCAO_DTFIM) and ' +
    '      (:DT_FIN >= PRO_PROMOCAO_DTINI or :DT_FIN >= PRO_PROMOCAO_DTFIM) ' +
    '    ) ' +
    ' order by ' +
    '    PRO_DESCRICAO, PRO_PROMOCAO_DTINI, PRO_PROMOCAO_DTFIM';

  SQL_PROMO_TABELA =
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
    '    CONVERT(VARCHAR(10), ISNULL(P.MRC_ID,'''')) LIKE :MRC_ID and ' +
    '    ( ' +
    '      (:DT_INI <= PRM_DT_INICIAL or :DT_INI <= PRM_DT_FINAL) and ' +
    '      (:DT_FIN >= PRM_DT_INICIAL or :DT_FIN >= PRM_DT_FINAL) ' +
    '    ) ' +
    ' order by ' +
    '    PRM_DESCRICAO, PRM_DT_INICIAL, PRO_DESCRICAO';

  SQL_TabelaSecao =
    ' select '+
    '   sec_descricao, pro_ean1, pro_referencia, pro_descricao, '+
    '   pro_unidade, pro_vlrvenda, pro_vlrprazo, pro_vlrcusto, '+
    '   pro_estoque, (pro_estoque * pro_vlrvenda) as total_venda, '+
    '  (pro_estoque * pro_vlrcusto) as total_custo '+
    ' from '+
    '   produto p '+
    ' inner join '+
    '   secao s  on (s.sec_id = p.sec_id) '+
    ' where '+
    '   p.pro_ativo = ''A'' and '+
    '   convert(varchar(10), s.sec_id) like :sec_id ';

  SQL_DtUltimaVenda =
    ' select '+
    '   pro_referencia,pro_descricao, pro_unidade, pro_ultvenda '+
    ' from '+
    '   produto '+
    ' where '+
    '   (pro_ultvenda between :dt_inic and :dt_fina) and '+
    '   convert(varchar(10),pro_id) like :pro_id ';

  SQL_Ativo_Inativo =
    ' select * from produto where (convert(varchar(5),pro_id) like :pro_id) ';

  SQL_AliqFornec =
    ' select '+
    '   for_nome, pro_referencia, pro_descricao, pro_unidade, pro_estoque, '+
    '   pro_vlrcusto, pro_vlrmedio, pro_vlrvenda, naf_aliquota, '+
    '   naf_descricao '+
    ' from '+
    '   produto p '+
    ' inner join '+
    '   fornecedores f on (f.for_id = p.for_id) '+
    ' inner join '+
    '   natureza_fiscal n  on (n.naf_codfiscal = p.naf_codfiscal) '+
    ' where '+
    '   p.pro_ativo = ''A'' and '+
    '  ((convert(varchar(5),f.for_id) like :for_id)) and '+
    '  (n.naf_codfiscal like :naf_codfiscal) ';
  {$ENDREGION}
var
  sql, Filtros: string;
begin
  Case pge_.ActivePageIndex Of
    {$REGION 'Totais'}
    0:Begin //Totais
          if not chk_TotaisDep.Checked and (lkp_TotaisDep.Text = '') then
          begin
            MessageBox(handle,'Escolha um Departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
          end;

          sql := SQL_Geral + ' and convert(varchar(10), d.dep_id) like :dep_id';

          case RadioGroup1.ItemIndex of
          0: Begin
                if not chk_naoagrupar.Checked then
                  sql := sql + ' order by dep_descricao, pro_descricao'
                else
                  sql := sql + ' order by pro_descricao';
             End;
          1: Begin
                if not chk_naoagrupar.Checked then
                  sql := sql + ' order by dep_descricao, pro_referencia'
                else
                  sql := sql + ' order by pro_referencia';
             End;
          2: Begin
                if not chk_naoagrupar.Checked then
                  sql := sql + ' order by dep_descricao, pro_ean1'
                else
                  sql := sql + ' order by pro_ean1';
             End;
          end;


          with DM_RelProduto do
          Begin
              qryTotais.Close;
              qryTotais.SQL.Text := sql;

              if chk_TotaisDep.Checked then
                qryTotais.Parameters[0].Value := '%'
              else
                qryTotais.Parameters[0].Value := Dm_geral.qryCadDepartdep_id.AsInteger;
              //
              qryTotais.Open;

              if qryTotais.IsEmpty then
              begin
                MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                Abort;
              end;

              ppTotais.GroupHeader[0].Visible :=  not chk_naoagrupar.Checked;
              ppTotais.GroupFooter[0].Visible :=  not chk_naoagrupar.Checked;

              ppTotais.Print;
          end;
     End;
    {$ENDREGION}
    {$REGION 'Geral'}
    1:
    Begin  //Geral
      case pge_TabelaPreco.ActivePageIndex of
        {$REGION 'Agrupado por departamento'}
        0:Begin
          if not(chk_DeptoPreco.Checked) and (lkp_DeptoPreco.Text = '') then
          begin
            MessageBox(handle,'Escolha um Departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
          end;

          WITH DM_RelProduto DO
          BEGIN
            if rg_Tabela.ItemIndex = 0 then
            begin//Acumulado
                qryRelDepto.Close;
                if chk_DeptoPreco.Checked then
                  qryRelDepto.Parameters[0].Value := '%'
                else
                  qryRelDepto.Parameters[0].Value := Dm_geral.qryCadDepartdep_id.AsString;
                qryRelDepto.Open;
                //
                if qryRelDepto.IsEmpty then
                Begin
                  MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                  Abort;
                End;
                //
                ppRelDepto.Print;
            end //Fim Acumulado
            else
            Begin  //Discriminado
              ConfigGeralDiscSQL;
              qryGeralDisc.Open;
              //
              If qryGeralDisc.IsEmpty Then
              Begin
                MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                Abort;
              End;
              //
              try
                var_mcontagem.Visible   := False;
                var_mTotal.Visible      := False;

                //Primeira Coluna
                lblFabric.Visible   := chk_mFabric.Checked;
                dbtxtFabric.Visible := chk_mFabric.Checked;

                //Segunda Coluna
                If chk_mQtdeUn.Checked Then
                Begin
                  ppLabel31.Visible    := True;
                  ppDBText36.Visible   := True;
                End
                Else
                Begin
                  ppLabel31.Visible  := False;
                  ppDBText36.Visible := False;
                End;

                //Terceira Coluna
                If chk_mestoque.Checked Then
                Begin
                  ppLabel20.Visible        := True;
                  ppDBText19.Visible       := True;
                  ppDBCalc14.Visible       := True;
                  ppLabel20.Caption        := 'Estoque';
                  ppDBText19.DataField     := 'PRO_ESTOQUE';
                  ppDBText19.DisplayFormat := '#,##0.000';
                End
                else if chkUnEmbComp1.Checked Then
                begin
                  ppLabel20.Visible        := True;
                  ppDBText19.Visible       := True;
                  ppDBCalc14.Visible       := False;
                  ppLabel20.Caption        := 'UN Comp.';
                  ppDBText19.DataField     := 'PRO_EMBUNIDADE';
                  ppDBText19.DisplayFormat := '';
                end
                Else
                Begin
                  ppLabel20.Visible  := False;
                  ppDBText19.Visible := False;
                  ppDBCalc14.Visible := False;
                End;

                //Quarta Coluna
                If chk_MAvista.Checked Then
                Begin
                    ppLabel18.Visible    := True;
                    ppDBText17.Visible   := True;

                    if chk_AtacadoVarejo.Checked then
                       ppLabel18.Caption   := 'Varejo'
                    else
                       ppLabel18.Caption   := 'Pr. Vista';

                    ppDBText17.DataField     := 'PRO_VLRVENDA';
                    ppDBText17.DisplayFormat := '#,##0.00';
                End
                else if chkUnEmbComp2.Checked Then
                Begin
                  ppLabel18.Visible        := True;
                  ppDBText17.Visible       := True;
                  ppLabel18.Caption        := 'UN Comp.';
                  ppDBText17.DataField     := 'PRO_EMBUNIDADE';
                  ppDBText17.DisplayFormat := '';
                End
                Else
                Begin
                  ppLabel18.Visible    := False;
                  ppDBText17.Visible   := False;
                End;

                //Quinta Coluna
                If chk_mPrazo.Checked Then
                Begin
                    ppLabel19.Visible        := True;
                    ppDBText18.Visible       := True;

                    if chk_AtacadoVarejo.Checked then
                    Begin
                        ppLabel19.Caption    := 'Atacado';
                        ppDBText18.DataField := 'PRO_VLRATACADO';
                    End
                    else
                    Begin
                        ppLabel19.Caption    := 'Pr. Prazo';
                        ppDBText18.DataField := 'PRO_VLRPRAZO';
                    End;

                    ppDBText18.DisplayFormat := '#,##0.00';
                End
                else If chk_mMinimo2.Checked Then
                Begin
                  ppLabel19.Visible        := True;
                  ppDBText18.Visible       := True;
                  ppLabel19.Caption        := 'Est. Minimo';
                  ppDBText18.DataField     := 'pro_estoqmin';
                  ppDBText18.DisplayFormat := '#,##0.00';
                End
                else if chk_mMaximo.Checked Then
                Begin
                  ppLabel19.Visible        := True;
                  ppDBText18.Visible       := True;
                  ppLabel19.Caption        := 'Est. Maximo';
                  ppDBText18.DataField     := 'pro_estoqmax';
                  ppDBText18.DisplayFormat := '#,##0.00';
                End
                else If chk_cst.Checked Then
                Begin
                  ppLabel19.Visible        := True;
                  ppDBText18.Visible       := True;
                  ppLabel19.Caption        := 'CST';
                  ppDBText18.DataField     := 'cst_id';
                  ppDBText18.DisplayFormat := '';
                End
                Else If chk_gaveta2.Checked Then
                Begin
                  ppLabel19.Visible        := True;
                  ppDBText18.Visible       := True;
                  ppLabel19.Caption        := 'Gaveta';
                  ppDBText18.DataField     := 'pro_gaveta';
                  ppDBText18.DisplayFormat := '';
                End
                else if chkComissao.Checked then
                begin
                  ppLabel19.Visible        := True;
                  ppDBText18.Visible       := True;
                  ppLabel19.Caption        := 'Comis.(%)';
                  ppDBText18.DataField     := 'PRO_COMISSAO';
                  ppDBText18.DisplayFormat := '0.00';
                end
                else
                Begin
                  ppLabel19.Visible        := False;
                  ppDBText18.Visible       := False;
                end;

                //Sexta Coluna
                If chk_mCusto.Checked Then
                Begin
                  ppLabel21.Visible        := True;
                  ppDBText21.Visible       := True;
                  ppLabel21.Caption        := 'Pr. Custo';
                  ppDBText21.DataField     := 'pro_vlrcusto';
                  ppDBText21.DisplayFormat := '#,##0.00';
                End
                Else if chk_mCustoReal.Checked Then
                Begin
                  ppLabel21.Visible        := True;
                  ppDBText21.Visible       := True;
                  ppLabel21.Caption        := 'Custo Real';
                  ppDBText21.DataField     := 'pro_custonota';
                  ppDBText21.DisplayFormat := '#,##0.00';
                End
                Else if chk_mMedio.Checked Then
                Begin
                  ppLabel21.Visible        := True;
                  ppDBText21.Visible       := True;
                  ppLabel21.Caption        := 'Pr. Medio';
                  ppDBText21.DataField     := 'pro_vlrmedio';
                  ppDBText21.DisplayFormat := '#,##0.00';
                End
                Else If chk_atacado.Checked Then
                Begin
                  ppLabel21.Visible        := True;
                  ppDBText21.Visible       := True;
                  ppLabel21.Caption        := 'Pr. Atacado';
                  ppDBText21.DataField     := 'pro_vlratacado';
                  ppDBText21.DisplayFormat := '#,##0.00';
                End
                Else If chk_mMinimo.Checked Then
                Begin
                  ppLabel21.Visible        := True;
                  ppDBText21.Visible       := True;
                  ppLabel21.Caption        := 'Est. Minimo';
                  ppDBText21.DataField     := 'pro_estoqmin';
                  ppDBText21.DisplayFormat := '#,##0.00';
                End
                Else If chk_gaveta.Checked Then
                Begin
                  ppLabel21.Visible        := True;
                  ppDBText21.Visible       := True;
                  ppLabel21.Caption        := 'Gaveta';
                  ppDBText21.DataField     := 'pro_gaveta';
                  ppDBText21.DisplayFormat := '';
                End
                Else If chk_aliquota.Checked Then
                Begin
                  ppLabel21.Visible        := True;
                  ppDBText21.Visible       := True;
                  ppLabel21.Caption        := 'Aliq. ICMS';
                  ppDBText21.DataField     := 'naf_aliquota';
                  ppDBText21.DisplayFormat := '#00';
                End
                Else if chk_CodBalanca.Checked then
                begin
                  ppLabel21.Visible        := True;
                  ppDBText21.Visible       := True;
                  ppLabel21.Caption        := 'Balança';
                  ppDBText21.DataField     := 'PRO_CODBALANCA';
                  ppDBText21.DisplayFormat := '';
                end
                else
                Begin
                  ppLabel21.Visible  := False;
                  ppDBText21.Visible := False;
                End;

                //Sétima Coluna
                If chk_mcontagem.Checked Then
                Begin
                  ppLabel115.Visible        := True;
                  ppDBText22.Visible        := False;
                  ppLabel115.Caption        := 'Est. Fisico';
                  var_mcontagem.Visible     := True;
                  ppDBCalc7.Visible         := False;
                End
                Else If chk_mTotal.Checked Then
                Begin
                  ppLabel115.Visible        := True;
                  ppDBText22.Visible        := False;
                  ppLabel115.Caption        := 'Total Venda';
                  var_mTotal.Visible        := True;
                  ppDBCalc7.Visible         := True;
                  ppDBCalc7.DataField       := 'total_venda';
                  ppDBCalc7.DisplayFormat   := '#,###,##0.00';
                End
                Else If chk_mTotalCusto.Checked Then
                Begin
                  ppLabel115.Visible        := True;
                  ppDBText22.Visible        := True;
                  ppLabel115.Caption        := 'Total Custo';
                  ppDBText22.DataField      := 'total_custo';
                  ppDBText22.DisplayFormat  := '#,##0.00';
                  ppDBCalc7.Visible         := True;
                  ppDBCalc7.DataField       := 'total_custo';
                  ppDBCalc7.DisplayFormat   := '#,###,##0.00';
                End
                Else If chk_mTotalMedio.Checked Then
                Begin
                  ppLabel115.Visible        := True;
                  ppDBText22.Visible        := True;
                  ppLabel115.Caption        := 'Total Medio';
                  ppDBText22.DataField      := 'total_medio';
                  ppDBText22.DisplayFormat  := '#,##0.00';
                  ppDBCalc7.Visible         := True;
                  ppDBCalc7.DataField       := 'total_medio';
                  ppDBCalc7.DisplayFormat   := '#,###,##0.00';
                End
                Else If chk_mTotalCustoReal.Checked Then
                Begin
                  ppLabel115.Visible        := True;
                  ppDBText22.Visible        := True;
                  ppLabel115.Caption        := 'Total C.Real';
                  ppDBText22.DataField      := 'total_custo_real';
                  ppDBText22.DisplayFormat  := '#,##0.00';
                  ppDBCalc7.Visible         := True;
                  ppDBCalc7.DataField       := 'total_custo_real';
                  ppDBCalc7.DisplayFormat   := '#,###,##0.00';
                End
                Else if chk_mSugestiva.Checked Then
                Begin
                  ppLabel115.Visible        := True;
                  ppDBText22.Visible        := True;
                  ppLabel115.Caption        := 'Sug Compra';
                  ppDBText22.DataField      := 'sugestao';
                  ppDBText22.DisplayFormat  := '#,##0.00';
                  ppDBCalc7.Visible         := True;
                  ppDBCalc7.DataField       := 'sugestao';
                  ppDBCalc7.DisplayFormat   := '#,###,##0.00';
                End
                else if chk_CodFrabric.Checked Then
                Begin
                    ppLabel115.Visible        := True;
                    ppDBText22.Visible        := True;
                    ppLabel115.Caption        := 'Cod. Fabric.';
                    ppDBText22.DataField      := 'pro_codfab1';
                    ppDBText22.DisplayFormat  := '';
                    ppDBText22.Font.Size      := 8;

                    ppDBCalc7.Visible          := False;
                End
                else if chk_CodNCM.Checked Then
                Begin
                    ppLabel115.Visible        := True;
                    ppDBText22.Visible        := True;
                    ppLabel115.Caption        := 'Cod. NCM';
                    ppDBText22.DataField      := 'PRO_CODIGONBM';
                    ppDBText22.DisplayFormat  := '';
                    ppDBText22.Font.Size      := 8;

                    ppDBCalc7.Visible          := False;
                End
                else if chk_CodCest.Checked Then
                Begin
                    ppLabel115.Visible        := True;
                    ppDBText22.Visible        := True;
                    ppLabel115.Caption        := 'Cod. CEST';
                    ppDBText22.DataField      := 'CES_CODIGO';
                    ppDBText22.DisplayFormat  := '';
                    ppDBText22.Font.Size      := 8;

                    ppDBCalc7.Visible          := False;
                End
                else
                Begin
                  ppLabel115.Visible        := False;
                  ppDBText22.Visible        := False;
                  ppDBCalc7.Visible         := False;
                End;


                //Tipo de Descrição
                if rgDescProduto.ItemIndex = 0 then //Descrição Normal
                  ppDBText15.DataField := 'PRO_DESCRICAO'
                else //Descrição Resumida
                  ppDBText15.DataField := 'PRO_RESUMIDO';


                //Relatório por Código EAN ou Referência
                if rg_EanouRef.ItemIndex = 0 then //EAN
                begin
                  Geral_Ref_1.Caption  := 'Cod. EAN';
                  ppDBText14.DataField := 'pro_ean1';
                  ppDBText14.Font.Size := 7;
                end
                else //referencia
                begin
                  Geral_Ref_1.Caption  := 'Ref.';
                  ppDBText14.DataField := 'pro_referencia';
                  ppDBText14.Font.Size := 7;
                end;

                //Se vai ou não ser impressa a Linha Tracejada entre os itens
                If chk_mTracejada.Checked Then
                  ppLine110.Visible  := False
                Else
                  ppLine110.Visible  := True;

                //Label Total Geral
                if ((chk_mEstoque.Checked) or (chk_mTotal.Checked) or (chk_mTotalCusto.Checked) or (chk_mTotalCustoReal.Checked) or (chk_mTotalMedio.Checked)) then
                  ppLabel24.Visible  := True
                else
                  ppLabel24.Visible  := False;

                //Com ou Sem Departamento
                if not(chk_agrupado.Checked) then
                begin
                  RepGeralDisc.GroupHeader[0].Visible  := True;
                  RepGeralDisc.GroupFooter[0].Visible  := True;
                end
                else
                begin
                  RepGeralDisc.GroupHeader[0].Visible  := False;
                  RepGeralDisc.GroupFooter[0].Visible  := False;
                end;

                //Com ou Sem Seção
                if not(chk_agrupado_secao.Checked) then
                begin
                  RepGeralDisc.GroupHeader[1].Visible  := True;
                  RepGeralDisc.GroupFooter[1].Visible  := True;
                end
                else
                begin
                  RepGeralDisc.GroupHeader[1].Visible  := False;
                  RepGeralDisc.GroupFooter[1].Visible  := False;
                end;

                //Com ou Sem Fornecedor
                if not(chkAgrupaForn.Checked) then
                begin
                  RepGeralDisc.GroupHeader[2].Visible  := True;
                  RepGeralDisc.GroupFooter[2].Visible  := True;
                end
                else
                begin
                  RepGeralDisc.GroupHeader[2].Visible  := False;
                  RepGeralDisc.GroupFooter[2].Visible  := False;
                end;
                //

                //Retrato
                if rgTipoRel.ItemIndex = 0 then
                begin
                  RepGeralDisc.PrinterSetup.Orientation := poPortrait;
                  regCabecalho.Left := LEFT_REG_CABECALHO;
                  regItens.Left     := LEFT_REG_ITENS;
                  regTotal.Left     := LEFT_REG_TOTAL;
                  ppDBText15.Width  := WIDTH_PROD_DESCR;
                end
                else //Paisagem
                begin
                  RepGeralDisc.PrinterSetup.Orientation := poLandscape;
                  regCabecalho.Left := LEFT_REG_CABECALHO + LANDSCAPE;
                  lblFabric.Left    := regCabecalho.Left - lblFabric.Width;
                  regItens.Left     := LEFT_REG_ITENS + LANDSCAPE;
                  dbtxtFabric.Left  := regItens.Left - dbtxtFabric.Width;
                  regTotal.Left     := LEFT_REG_TOTAL + LANDSCAPE;
                  ppDBText15.Width  := WIDTH_PROD_DESCR + LANDSCAPE - IfThen(dbtxtFabric.Visible, dbtxtFabric.Width, 0);
                end;

                // Configura Descrição dos Filtros do Relatório'
                Filtros := 'Produto/Geral';

                if chkSoComissao.Checked then
                  Filtros := Filtros + ' - Comissão';

                if chkSoPrecoFixo.Checked then
                  Filtros := Filtros + ' - Preço Fixo';

                if chk_TodosMinimos.Checked then
                  Filtros := Filtros + ' - Estoque Mínimo';

                if chk_SoNegativo.Checked then
                  Filtros := Filtros + ' - Estoque Negativo';

                if chk_SoZerado.Checked then
                  Filtros := Filtros + ' - Estoque Zerado';

                lbl_DescricaoFiltros.Caption := Filtros;

                RepGeralDisc.Print;
              finally
                qryGeralDisc.Close;
              end;
            end;  //Fim Discriminado
          End;
        end;
        {$ENDREGION}
        {$REGION 'Seção'}
        1:begin
          if not(chk_secao.Checked) and (lkp_secao.Text = '') then
          begin
            MessageBox(handle,'Escolha uma Seção ou todas', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
          end;

          WITH DM_RelProduto DO
          BEGIN
            qry_TabelaSecao.Close;
            qry_TabelaSecao.SQL.Clear;
            qry_TabelaSecao.SQL.Text := SQL_TabelaSecao;
            //
            if (chk_zeradoSec.Checked) then
              qry_TabelaSecao.SQL.Add(' and p.pro_estoque > 0 ')
            else if (chk_SoZeradoSec.Checked) then
              qry_TabelaSecao.SQL.Add(' and p.pro_estoque = 0 ')
            else if (chk_SoNegativoSec.Checked) then
              qry_TabelaSecao.SQL.Add(' and p.pro_estoque < 0 ');
            //
            qry_TabelaSecao.SQL.Add('Order by sec_descricao, pro_descricao');
            //
            if not(chk_secao.Checked) then
              qry_TabelaSecao.Parameters[0].Value := DM_Geral.qryCAdSecaoSEC_ID.Value
            else
              qry_TabelaSecao.Parameters[0].Value := '%';
            //
            qry_TabelaSecao.Open;
            //
            If qry_TabelaSecao.IsEmpty Then
            Begin
              MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
              Abort;
            End;
            //
            If chk_MEstoqueSec.Checked Then
            Begin
              ppLabel225.Visible  := True;
              ppDBText180.Visible := True;
              ppDBCalc38.Visible  := True;
              ppLabel218.Visible  := True;
              ppLabel29.Visible   := True;
              ppDBCalc37.Visible  := True;
              ppLine7.Visible     := True;
            End
            Else
            Begin
              ppLabel225.Visible  := False;
              ppDBText180.Visible := False;
              ppDBCalc37.Visible  := False;
              ppDBCalc38.Visible  := False;
            End;
            //
            If chk_MTotalSec.Checked Then
            Begin
              ppLabel226.Visible  := True;
              ppDBText23.Visible  := True;
              ppDBCalc30.Visible  := True;
              ppLabel218.Visible  := True;
              ppLabel29.Visible   := True;
              ppDBCalc35.Visible  := True;
              ppLine7.Visible     := True;
              ppLabel226.Caption  := 'Total Vista';
              ppDBText23.DataField:= 'total_venda';
              ppDBCalc35.DataField:= 'total_venda';
              ppDBCalc30.DataField:= 'total_venda';
            End
            Else
            If chk_mTotalCustoSec.Checked Then
            Begin
              ppLabel226.Visible  := True;
              ppDBText23.Visible  := True;
              ppDBCalc30.Visible  := True;
              ppLabel218.Visible  := True;
              ppLabel29.Visible   := True;
              ppDBCalc35.Visible  := True;
              ppLine7.Visible     := True;
              ppLabel226.Caption  := 'Total Custo';
              ppDBText23.DataField:= 'total_custo';
              ppDBCalc35.DataField:= 'total_custo';
              ppDBCalc30.DataField:= 'total_custo';
            End
            Else
            Begin
                ppLabel226.Visible  := False;
                ppDBText23.Visible := False;
                ppDBCalc30.Visible  := False;
                ppDBCalc35.Visible  := False;
                //
                if not(chk_MEstoqueSec.Checked) then
                begin
                  ppLabel218.Visible  := False;
                  ppLabel29.Visible   := False;
                  ppLine7.Visible     := False;
                end;
            End;
            //
            If chk_MVistaSec.Checked Then
            Begin
              ppLabel223.Visible    := True;
              ppDBText178.Visible   := True;
              ppLabel223.Caption    := 'Preço Vista';
              ppDBText178.DataField := 'pro_vlrvenda';
            End
            Else If chk_mCustoSec.Checked Then
            Begin
              ppLabel223.Visible    := True;
              ppDBText178.Visible   := True;
              ppLabel223.Caption    := 'Preço Custo';
              ppDBText178.DataField := 'pro_vlrcusto';
            End
            Else
            Begin
              ppLabel223.Visible:= False;
              ppDBText178.Visible:= False;
            End;
            //
            If chk_MPrazoSec.Checked Then
            Begin
              ppLabel224.Visible := True;
              ppDBText179.Visible:= True;
            End
            Else
            Begin
              ppLabel224.Visible := False;
              ppDBText179.Visible:= False;
            End;

            //Se vai ou não ser impressa a Linha Tracejada entre os itens
            If chk_mTracejadaSec.Checked Then
              ppLine111.Visible  := False
            Else
              ppLine111.Visible  := True;
            //
            pp_TabelaSecao.Print;
          End;
        end;
        {$ENDREGION}
        {$REGION 'Combustível'}
        2:Begin
          WITH DM_RelProduto DO
          BEGIN
              qry_combustivel.Open;
              ppCombustivel.Print;
              qry_combustivel.Close;
          END;
        end;
        {$ENDREGION}
        {$REGION 'Observação/Cód. Fabricante'}
        3:begin
          WITH DM_RelProduto DO
          BEGIN
              if not(chk_Dep_Obs_CodFab.Checked) and (lkp_Dep_Obs_CodFab.Text = '') then
              begin
                MessageBox(handle,'Escolha um Departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                Abort;
              end;

              if not(chk_For_Obs_CodFab.Checked) and (lkp_For_Obs_CodFab.Text = '') then
              begin
                MessageBox(handle,'Escolha um Fornecedor ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                Abort;
              end;

              qry_Obs_CodFabr.Close;

              if not chk_Dep_Obs_CodFab.Checked then
                qry_Obs_CodFabr.Parameters[0].Value := DM_Geral.qryCadDepartdep_id.Value
              else
                qry_Obs_CodFabr.Parameters[0].Value := '%';

              if not chk_For_Obs_CodFab.Checked then
                qry_Obs_CodFabr.Parameters[1].Value := DM_Geral.qryCadFornecfor_id.Value
              else
                qry_Obs_CodFabr.Parameters[1].Value := '%';

              // Produto.
              if chk_Pro_Obs_CodFab.Checked then
                qry_Obs_CodFabr.Parameters[2].Value := '%'
              else
                qry_Obs_CodFabr.Parameters[2].Value := edt_Pro_Obs_CodFab.Text + '%';

              case rg_situacao_Pro_Obs_CodFab.ItemIndex of
              0:qry_Obs_CodFabr.Parameters[3].Value := 'A';
              1:qry_Obs_CodFabr.Parameters[3].Value := 'I';
              2:qry_Obs_CodFabr.Parameters[3].Value := 'B';
              else
                qry_Obs_CodFabr.Parameters[3].Value := '%';
              end;

              qry_Obs_CodFabr.Open;

              If qry_Obs_CodFabr.IsEmpty Then
              Begin
                MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                Abort;
              End;

              //Impressão do Campo Valor de Custo
              ppLabel83.Visible   := chk_Custo_Obs_CodFab.Checked;
              ppDBText204.Visible := chk_Custo_Obs_CodFab.Checked;


              pp_Obs_CodFabr.Print;
          END;
        end;
        {$ENDREGION}
        {$REGION 'Gerar Produtos em Excel'}
        4:begin
          // Gerar produtos em Excel
          MessageBox(handle,'Pressione o botão com o icone do Excel!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        end;
        {$ENDREGION}
        {$REGION 'Preço Simplificado'}
        5: begin

          with DM_RelProduto do
          begin
            qryPrecoSimp.Close;
            qryPrecoSimp.Open;

            if qryPrecoSimp.IsEmpty then
            begin
              MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!',
                MB_ICONINFORMATION + MB_OK);
              Abort;
            end;

            case rgPrecoSimplificado.ItemIndex of
              0: begin
                ppLblPrecoVista.Visible := True;
                ppDbPrecoVista.Visible  := True;
                ppLblPrecoPrazo.Visible := False;
                ppDbPrecoPrazo.Visible  := False;
              end;
              1: begin
                ppLblPrecoVista.Visible := False;
                ppDbPrecoVista.Visible  := False;
                ppLblPrecoPrazo.Visible := True;
                ppDbPrecoPrazo.Visible  := True;
              end;
              2: begin
                ppLblPrecoVista.Visible := True;
                ppDbPrecoVista.Visible  := True;
                ppLblPrecoPrazo.Visible := True;
                ppDbPrecoPrazo.Visible  := True;
              end;
            end;

            repPrecoSimp.Print;
          end;
        end;
        {$ENDREGION}
      end;
    end;//fim geral
    {$ENDREGION}
    {$REGION 'Por Natureza Fiscal / Aliquota'}
    2:Begin //Por Natureza Fiscal / Aliquota
      WITH  DM_RelProduto do

      Case pge_1.ActivePageIndex Of
        0:Begin
              ConfigNaturezaFiscal_Aliquota_Depto;
              //
              case RadioGroup4.ItemIndex of
                0:Begin //Custo
                  ppLabel74.Caption        := 'Preço Custo';
                  ppLabel79.Caption        := 'Total Custo';
                  ppDBText37.DataField     := 'PRO_VLRCUSTO';
                  ppDBText37.DisplayFormat := '#,##0.00';
                  ppDBText57.DataField     := 'CUSTO';
                  ppDBText57.DisplayFormat := '#,##0.00';
                  ppDBCalc6.DataField      := 'CUSTO';
                  ppDBCalc6.DisplayFormat  := '#,##0.00';
                  ppDBCalc44.DataField     := 'CUSTO';
                  ppDBCalc44.DisplayFormat := '#,##0.00';
                End;
                1:Begin //Medio
                  ppLabel74.Caption        := 'Preço Médio';
                  ppLabel79.Caption        := 'Total Médio';
                  ppDBText37.DataField     := 'PRO_VLRMEDIO';
                  ppDBText37.DisplayFormat := '#,##0.00';
                  ppDBText57.DataField     := 'MEDIO';
                  ppDBText57.DisplayFormat := '#,##0.00';
                  ppDBCalc6.DataField      := 'MEDIO';
                  ppDBCalc6.DisplayFormat  := '#,##0.00';
                  ppDBCalc44.DataField     := 'MEDIO';
                  ppDBCalc44.DisplayFormat := '#,##0.00';
                End;
              end;
              ppAliq.Print;
          End;
          //
        1:Begin
          If not(chk_aliqfor.Checked) and (lkp_aliqfor.Text = '') then
          Begin
            MessageBox(handle,'Escolha um Fornecedor ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
          End;
          //
          If chk_aliqfor.Checked Then
          Begin
            qry_Aliqfor.Close;
            qry_Aliqfor.SQL.Clear;
            qry_Aliqfor.SQL.Text := SQL_AliqFornec;
            //
            if not (chk_zeradoAliqfor.Checked) then
              qry_Aliqfor.SQL.Add('Order by for_nome, naf_descricao, pro_descricao')
            else
              qry_Aliqfor.SQL.Add('and p.pro_estoque > 0 Order by for_nome, naf_descricao, pro_descricao');
            //
            qry_Aliqfor.Parameters[0].value := '%';
            //
            if chk_naf_codfiscal.Checked then
              qry_aliqfor.Parameters[1].Value := '%'
            else
              qry_aliqfor.Parameters[1].Value := Dm_geral.qrynaf_codfiscalNAF_CODFISCAL.AsString;
            //
            qry_Aliqfor.Open;
            //
            If qry_Aliqfor.IsEmpty Then
            Begin
              MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
              Abort;
            End;
            //
            ppAliqfor.Print;
          End
          Else
          Begin
            qry_Aliqfor.Close;
            qry_Aliqfor.SQL.Clear;
            qry_Aliqfor.SQL.Text := SQL_AliqFornec;
            //
            if not (chk_zeradoAliqfor.Checked) then
             qry_Aliqfor.SQL.Add('Order by for_nome, naf_descricao, pro_descricao')
            else
              qry_Aliqfor.SQL.Add('and p.pro_estoque > 0 Order by for_nome, naf_descricao, pro_descricao');
            //
            qry_Aliqfor.Parameters[0].value := DM_Geral.qryCadFornecfor_id.AsString;
            //
            if chk_naf_codfiscal.Checked then
              qry_aliqfor.Parameters[1].Value := '%'
            else
              qry_aliqfor.Parameters[1].Value := Dm_Geral.qrynaf_codfiscalNAF_CODFISCAL.AsString;
            //
            qry_Aliqfor.Open;
            //
            If qry_Aliqfor.IsEmpty Then
            Begin
              MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
              Abort;
            End;
            //
           ppAliqfor.Print;
          End;
        End;
      end;
    end;
    {$ENDREGION}
    {$REGION 'Levantamento diario'}
    3: begin//Levantamento diario

      If not(chk_departamento10.Checked) and (lkp_departamento10.Text = '') then
      Begin
        MessageBox(handle,'Escolha um Departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;
      //
      WITH DM_RelProduto DO
      BEGIN
         qryContagemDia.Close;
        //
        if not(chk_departamento10.Checked) Then
          qryContagemDia.Parameters[0].Value := DM_geral.qryCadDepartdep_id.AsString
        else
          qryContagemDia.Parameters[0].Value := '%';
        //
        qryContagemDia.Open;
        //
        If qryContagemDia.IsEmpty Then
        Begin
          MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
          Abort;
        End;
        //
        ppContagemDia.Print;
      END;

    end;//Final do 4
    {$ENDREGION}
    {$REGION 'Movimentação'}
    4:begin  //movimentação
      with dm_RelProduto do
      Begin
        ConfigMovimentacao;
        ppMovimentacao.Print;
      End;
    end;
    {$ENDREGION}
    {$REGION 'Por Fornecedor'}
    5:Begin //Por Fornecedor
      // Configura Sentença SQL.
      ConfigFornecedorSQL;
      //
      WITH DM_RelProduto DO
      BEGIN
          qryFornecedor.Open;
          //
          if qryFornecedor.IsEmpty then
          Begin
            MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
          end;
          //
          if chk_contagem2.Checked then
            ppLabel108.Visible := true
          else
            ppLabel108.Visible := false;
          //
          if chk_trac.Checked then
            ppLine70.Visible := False
          else
            ppLine70.Visible := True;
          //
          case rg_FornecedorPreco.ItemIndex of
            0: Begin
              lbl_CustoFornec.Caption    := 'Pr. Custo';
              lbl_TotalFornec.Caption    := 'Pr. Total';
              ppDBText126.DataField      := 'pro_vlrcusto';
              ppDBText126.DisplayFormat  := '#,##0.00';
              ppDBText127.DataField      := 'total';
              ppDBText127.DisplayFormat  := '#,##0.00';
              ppLabel156.Visible         := true;
              ppDBCalc8.Visible          := True;
            end;
            //
            1: Begin
              lbl_CustoFornec.Caption    := 'Pr. Vista';
              lbl_TotalFornec.Caption    := 'Pr. Prazo';
              ppDBText126.DataField      := 'PRO_VLRVENDA';
              ppDBText126.DisplayFormat  := '#,##0.00';
              ppDBText127.DataField      := 'PRO_VLRPRAZO';
              ppDBText127.DisplayFormat  := '#,##0.00';
              ppLabel156.Visible         := False;
              ppDBCalc8.Visible          := False;
            end;
          End;
          //
          ppFornecedor.Print;
      END;

    end;// fim begin do case 6
    {$ENDREGION}
    {$REGION 'Ativo - Inativo'}
    6:Begin  // Ativo - Inativo

      if not(chk_ativo_inativo.Checked) and (lkp_produto.Text = '') then
      begin
        MessageBox(handle,'Escolha um Produto ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      end;

      WITH Dm_RelProduto do
      Begin
          qry_AtivoInativo.Close;
          qry_AtivoInativo.SQL.Clear;
          qry_AtivoInativo.SQL.Text := SQL_Ativo_Inativo;
          //
          case rg_tipo_ativoinativo.ItemIndex of
            0:Begin
              qry_AtivoInativo.SQL.Add(' and (pro_ativo = ''A'')');
              ppLabel180.Caption := 'Relatório de Produto - Ativo';
            End;
            //
            1:Begin
              qry_AtivoInativo.SQL.Add(' and (pro_ativo = ''I'')');
              ppLabel180.Caption := 'Relatório de Produto - Inativo';
            End;
            //
            2:Begin
              qry_AtivoInativo.SQL.Add(' and (pro_ativo = ''B'')');
              ppLabel180.Caption := 'Relatório de Produto - Bens de Consumo';
            end;
          end;
          //
          case rg_orden_ativoinativo.ItemIndex of
            0: qry_AtivoInativo.SQL.Add(' Order by pro_descricao');
            1: qry_AtivoInativo.SQL.Add(' Order by pro_referencia');
            2: qry_AtivoInativo.SQL.Add(' Order by pro_ean1');
          end;
          //
          if not(chk_ativo_inativo.Checked) then
            qry_AtivoInativo.Parameters[0].Value := DM_Geral.qry_CadastroProdutoPRO_ID.AsString
          else
            qry_AtivoInativo.Parameters[0].Value := '%';
          //
          qry_AtivoInativo.Open;
          //
          If (qry_AtivoInativo.IsEmpty) Then
          Begin
            MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
          End;
          //ppLabel180.Caption := 'Relatório de Produto - Inativo';
          ppAtivoInativo.Print;
      End;
      //
    end;//fim do 6:begin
    {$ENDREGION}
    {$REGION 'Alteração de Preço'}
    7:Begin // Alteração de Preço
          if not(chk_DepAltPreco.Checked) and (lkp_DepAltPreco.Text = '') then
          begin
            MessageBox(handle,'Escolha um departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
          end;

          with DM_RelProduto do
          Begin
             //
              qryAlteracaoPreco.Close;
              qryAlteracaoPreco.Parameters[0].Value := dt_ini.DateTime;
              qryAlteracaoPreco.Parameters[1].Value := dt_fim.DateTime;
              //
              if not(chk_DepAltPreco.Checked) then
                qryAlteracaoPreco.Parameters[2].Value := Dm_geral.qryCadDepartdep_id.Value
              else
                qryAlteracaoPreco.Parameters[2].Value := '%';
              //
              qryAlteracaoPreco.Open;
              //
              If (qryAlteracaoPreco.IsEmpty) Then
              Begin
                MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                Abort;
              End;

              {$REGION 'Configura os Campos que vão aparecer no relatório'}
              ppDBText158.Visible := chk_Custo.Checked;
              ppLabel196.Visible  := chk_Custo.Checked;
              ppDBText155.Visible := chk_CustoReal.Checked;
              ppLabel193.Visible  := chk_CustoReal.Checked;
              ppDBText159.Visible := chk_Margem.Checked;
              ppLabel197.Visible  := chk_Margem.Checked;
              ppDBText160.Visible := chk_PrVista.Checked;
              ppLabel198.Visible  := chk_PrVista.Checked;
              ppDBText161.Visible := chk_PrPrazo.Checked;
              ppLabel199.Visible  := chk_PrPrazo.Checked;
              ppDBText162.Visible := chk_AliqValor.Checked;
              ppLabel200.Visible  := chk_AliqValor.Checked;

              case rg_RefEan.ItemIndex of
              0:begin
                ppLabel201.Caption := 'Referência';
                  ppDBText41.Visible := false;
                ppDBText163.Visible := true;

              end;
              1:begin
                ppLabel201.Caption := 'Cod. EAN';
                ppDBText41.Visible := true;
                ppDBText163.Visible := false;
              end;
              end;
              {$ENDREGION}
              //
              ppAlteracaoPreco.Print;
          End;

    end;//fim do 8:begin
    {$ENDREGION}
    {$REGION 'Gerar Estoque Por Data'}
    8: //Gerar Estoque Por Data
    begin
      with DM_RelProduto do
        try
          update;
          Pnl_aguarde_estoque_data.Visible := True;
          update;

          if Dt_GeraEstData.Date > Date then
          begin
            MessageBox(handle,'A data do Estoque não pode ser maior que a data de hoje!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Exit;
          end;
          //
          if not(chk_fornecedor.Checked) and (Trim(lkp_fornecedor.Text) = '') then
          begin
            MessageBox(handle,'Escolha um Fornecedor ou Todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            exit;
          end;

          //Configura "SQL" e parâmetros.
          ConfigGeraEstoquePorData;

          qry_AuxiliaInvetario.Open;

          if qry_AuxiliaInvetario.IsEmpty then
          begin
            MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            exit;
          end;

          ppLabel227.Caption := 'Relatório de Estoque na data: '+DateToStr(Dt_GeraEstData.date);
          pp_AuxiliaInventario.Print;
          //
        finally
          update;
          Pnl_aguarde_estoque_data.Visible := False;
          update;

          qry_AuxiliaInvetario.Close;
        end;
    end;
    {$ENDREGION}
    {$REGION 'Por Cst'}
    9:begin // Por Cst
      If not(chk_DeptoCST.Checked) and (lkp_DeptoCST.Text = '') then
      Begin
        MessageBox(handle,'Escolha um Departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;
      //
      If not(chk_todoscst.Checked) and (lkp_cst.Text = '') then
      Begin
        MessageBox(handle,'Escolha um CST ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;
      //
      With Dm_RelProduto do
      Begin
          qry_ProdCst.Close;
          //
          if not(chk_DeptoCST.Checked) then
            qry_ProdCst.Parameters[0].Value:= Dm_geral.qryCadDepartdep_id.Value
          else
            qry_ProdCst.Parameters[0].Value:= '%';
          //
          if not(chk_todoscst.Checked) then
            qry_ProdCst.Parameters[1].Value:= DM_Geral.qryCadCstCST_ID.Value
          else
            qry_ProdCst.Parameters[1].Value:= '%';
          //
          qry_ProdCst.Open;
          //
          if qry_ProdCst.IsEmpty then
          begin
            MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
            Abort;
          end;
          //
          pp_ProdCst.Print;
      End;

    end; // Fim do Por Cst
    {$ENDREGION}
    {$REGION 'Promocao'}
    10:
    begin
      If not chk_prod.Checked and (lkp_prod.Text = '') then
      Begin
        MessageBox(handle,'Escolha um Produto ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;

      If (dt_comeco.Date > dt_termino.Date) then
      Begin
        MessageBox(handle,'A data inicial não pode ser maior que a data final.', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;

      if grpPromoFabricante.Visible and not chkPromoFabricante.Checked and (Trim(lkpPromoFabricante.Text) = '') then
      begin
        Application.MessageBox('Escolha um Fabricante para continuar.', 'ATENÇÃO!', MB_ICONINFORMATION);
        Exit;
      end;

      with DM_RelProduto, DM_Geral do
      try
        qry_Promocao.SQL.Clear;

        if qry_paramsPAR_PRO_TIPO_PROMOCAO.Value = 'N' then
        begin
          qry_Promocao.SQL.Text := SQL_PROMO_PRODUTO;

          if not chk_prod.Checked then
            qry_Promocao.Parameters[0].Value := qry_CadastroProdutoPRO_ID.AsString
          else
            qry_Promocao.Parameters[0].Value := '%';
          //
        end else
        begin
          qry_Promocao.SQL.Text := SQL_PROMO_TABELA;

          if chkPromoFabricante.Checked then
            qry_Promocao.Parameters[0].Value := '%'
          else
            qry_Promocao.Parameters[0].Value := DM_Geral.qryMarcaMRC_ID.AsString;
          //
        end;

        qry_Promocao.Parameters[1].Value := dt_comeco.DateTime;
        qry_Promocao.Parameters[2].Value := dt_comeco.DateTime;
        qry_Promocao.Parameters[3].Value := dt_termino.DateTime;
        qry_Promocao.Parameters[4].Value := dt_termino.DateTime;

        qry_Promocao.Open;

        if qry_Promocao.IsEmpty then
        begin
          MessageBox(handle, 'Não há dados para opção selecionada!', 'ATENÇÃO!',
            MB_ICONINFORMATION);
          Exit;
        end;

        if qry_paramsPAR_PRO_TIPO_PROMOCAO.Value = 'N' then
          pp_Promocao.Print
        else
          RepPromoLanc.Print;
      finally
        qry_Promocao.Close;
      end;
    end;//fim promocao
    {$ENDREGION}
    {$REGION 'Última Venda'}
    11:begin//inicio data ultima venda
      with dm_relProduto do
      Begin
        qry_DtUltimaVenda.Close;
        qry_DtUltimaVenda.SQL.Clear;
        qry_DtUltimaVenda.SQL.Text := SQL_DtUltimaVenda;
        //
        if chk_ProdZerado.Checked then
          qry_DtUltimaVenda.SQL.Add(' and pro_estoque > 0 ');
        //
        if rg_ordenar.ItemIndex = 0 then
          qry_DtUltimaVenda.SQL.Add(' Order by pro_descricao, pro_ultvenda')
        else
          qry_DtUltimaVenda.SQL.Add(' Order by pro_ultvenda, pro_descricao');
        //
        qry_DtUltimaVenda.Parameters[0].Value:= dt_inic.Date;
        qry_DtUltimaVenda.Parameters[1].Value:= dt_fina.Date;
        //
        If chk_produt.Checked Then
          qry_DtUltimaVenda.Parameters[2].Value := '%'
        else
          qry_DtUltimaVenda.Parameters[2].Value := DM_Geral.qry_CadastroProdutoPRO_ID.AsString;
        //
        qry_DtUltimaVenda.Open;
        //
        If qry_DtUltimaVenda.IsEmpty Then
        Begin
          MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
          Abort;
        End;
        //
        pp_DtUltimaVenda.Print;
        qry_DtUltimaVenda.Close;
        End;

        If not(chk_produt.Checked) and (lkp_produt.Text = '') then
        Begin
          MessageBox(handle,'Escolha um produto ou Todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
          Abort;
        End;
      //

    end;//fim data ultima venda
    {$ENDREGION}
    {$REGION 'Extrato'}
    12:Begin//Inicio Extrato
        with dm_relProduto do
        Begin
           If not chk_DepExtrato.Checked and (Trim(lkp_DepartamentoExtrato.Text) = '') then
           Begin
              MessageBox(handle,'Selecione um Departamento ou marque Todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
              lkp_DepartamentoExtrato.DropDown;
              Abort;
           End;

           If (Trim(lkp_produtoExtrato.Text) = '') then
           Begin
              MessageBox(handle,'Selecione um Produto ou marque Todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
              lkp_produtoExtrato.DropDown;
              Abort;
           End;

           If dt_extrato_ini.Date > dt_extrato_fim.Date then
           Begin
              MessageBox(handle,'A data inicial não pode ser maior que a data final!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
              dt_extrato_ini.SetFocus;
              Abort;
           End;

           if chkMovSaldo.Checked then
           begin
             {$REGION 'Movimentações Saldo'}
             try
               qry_SaldoInicial.Close;
               qry_SaldoInicial.Parameters[0].Value := dt_extrato_ini.Date;
               qry_SaldoInicial.Parameters[1].Value := DM_Geral.qry_CadastroProdutoPRO_ID.AsInteger;
               qry_SaldoInicial.Parameters[2].Value := '%';
               qry_SaldoInicial.Open;

               qryExtratoProd.Close;
               qryExtratoProd.Parameters[0].Value := dt_extrato_ini.Date;
               qryExtratoProd.Parameters[1].Value := dt_extrato_fim.Date;
               qryExtratoProd.Parameters[2].Value := DM_Geral.qry_CadastroProdutoPRO_ID.AsInteger;
               qryExtratoProd.Open;

               if qryExtratoProd.IsEmpty then
               begin
                 MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                 Exit;
               end;

               ppLabel275.Caption := 'Período de '+DateToStr(dt_extrato_ini.Date)+' à '+DateToStr(dt_extrato_fim.Date);
               repExtratoProd.Print;
             finally
               qry_SaldoInicial.Close;
               qryExtratoProd.Close;
             end;
             {$ENDREGION}
           end
           else
           if not(chk_Extrato_SoEntradas.Checked) then
           Begin
               {$REGION 'Geral'}
               if rg_extratoAcum.ItemIndex = 0 then //Acumulado
               Begin
                    try
                      qryExtratoAcum.Close;
                      qryExtratoAcum.Parameters[0].Value := dt_extrato_ini.Date;
                      qryExtratoAcum.Parameters[1].Value := dt_extrato_fim.Date;
                      qryExtratoAcum.Parameters[2].Value := DM_Geral.qry_CadastroProdutoPRO_ID.Value;

                      if chk_DepExtrato.Checked then
                        qryExtratoAcum.Parameters[3].Value := '%'
                      else
                        qryExtratoAcum.Parameters[3].Value := DM_Geral.qryCadDepartdep_id.Value;

                      qryExtratoAcum.Open;

                      If (qryExtratoAcum.IsEmpty) Then
                      Begin
                         MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                         Exit;
                      end;

                      ppLabel14.Caption:= 'Extrato Movimentação Acumulado por Produto no Período de ' + DateToStr(dt_extrato_ini.Date)+ ' a '+ DateToStr(dt_extrato_fim.Date);

                      //ação before print
                      qry_SaldoInicial.Close;
                      qry_SaldoInicial.Parameters[0].Value := dt_extrato_ini.Date;
                      qry_SaldoInicial.Parameters[1].Value := DM_Geral.qry_CadastroProdutoPRO_ID.Value;

                      if chk_DepExtrato.Checked then
                        qry_SaldoInicial.Parameters[2].Value := '%'
                      else
                        qry_SaldoInicial.Parameters[2].Value := DM_Geral.qryCadDepartdep_id.Value;

                      qry_SaldoInicial.Open;

                      Rep_ExtratoAcum.Print;
                    finally
                       qryExtratoAcum.Close;
                       qry_SaldoInicial.Close;
                    end;
               end
               else
               Begin //Discriminado
                    try
                      if chk_AgrupaExtPorTipo.Checked then
                        qryExtrato.SQL.Text := SQL_EXTRATO_DISC
                      else
                        qryExtrato.SQL.Text := SQL_EXTRATO_HORA;
                      //

                      qryExtrato.Parameters[0].Value := dt_extrato_ini.Date;
                      qryExtrato.Parameters[1].Value := dt_extrato_fim.Date;
                      qryExtrato.Parameters[2].Value := DM_Geral.qry_CadastroProdutoPRO_ID.Value;

                      if chk_DepExtrato.Checked then
                        qryExtrato.Parameters[3].Value := '%'
                      else
                        qryExtrato.Parameters[3].Value := DM_Geral.qryCadDepartdep_id.Value;

                      qryExtrato.Open;

                      If (qryExtrato.IsEmpty) Then
                      Begin
                         MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                         Exit;
                      end;

                      ppLabel47.Caption:= 'Extrato Movimentação de Produto no Período de ' + DateToStr(dt_extrato_ini.Date)+ ' a '+ DateToStr(dt_extrato_fim.Date);

                      //ação before print
                      qry_SaldoInicial.Close;
                      qry_SaldoInicial.Parameters[0].Value := dt_extrato_ini.DateTime;
                      qry_SaldoInicial.Parameters[1].Value := DM_Geral.qry_CadastroProdutoPRO_ID.Value;

                      if chk_DepExtrato.Checked then
                        qry_SaldoInicial.Parameters[2].Value := '%'
                      else
                        qry_SaldoInicial.Parameters[2].Value := DM_Geral.qryCadDepartdep_id.Value;

                      qry_SaldoInicial.Open;

                      if chk_AgrupaExtPorTipo.Checked then
                        Rep_Extrato.Print
                      else
                        Rep_ExtratoHora.Print;
                      //
                    finally
                       qryExtrato.Close;
                       qry_SaldoInicial.Close;
                    end;
               end;
               {$ENDREGION}
           end
           else
           Begin
              {$REGION 'Somente Entradas'}
              with qryExtratoEnt do
              try
                Parameters[0].Value := DM_Geral.qry_CadastroProdutoPRO_ID.Value;
                Parameters[1].Value := dt_extrato_ini.Date;
                Parameters[2].Value := dt_extrato_fim.Date;

                if chk_DepExtrato.Checked then
                  Parameters[3].Value := '%'
                else
                  Parameters[3].Value := DM_Geral.qryCadDepartdep_id.Value;

                Open;

                if IsEmpty then
                Begin
                  MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
                  exit;
                End;

                ppLabel39.Caption := 'Período de '+DateToStr(dt_extrato_ini.Date)+' à '+DateToStr(dt_extrato_fim.Date);
                repExtratoEnt.Print;
              finally
                Close;
              end;
              {$ENDREGION}
           end;
        end;
    end; //Fim Extrato / Movimentação
    {$ENDREGION}
    {$REGION 'Media / Movimentação'}
    13:
    begin// Media / Movimentação
      GeraExcel := False;

      If not(chk_media_produto.Checked) and (lkp_media_produto.Text = '') then
      Begin
        MessageBox(handle,'Escolha um Produto ou Todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;
      //
      If not(chk_media_departamento.Checked) and (lkp_media_departamento.Text = '') then
      Begin
        MessageBox(handle,'Escolha um Departamento ou Todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;
      //
      If not(chk_media_marcaFabricante.Checked) and (lkp_media_marcaFabricante.Text = '') then
      Begin
        MessageBox(handle,'Escolha uma Marca/Fabricante ou Todas', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;
      //
      If not(chk_media_secao.Checked) and (lkp_media_secao.Text = '') and (gp_sec.Visible) then
      Begin
        MessageBox(handle,'Escolha uma Seção ou Todas', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
      End;
      //
      if (Trim(edt_mediaCalculo.Text) = '') then
      Begin
        MessageBox(handle,PChar('Informe a quantidade de '+lbl_mediaCalculo.Caption+' que pretende efetuar a media de vendas'), 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        edt_mediaCalculo.SetFocus;
        Abort;
      End;
      //
      If (Trim(edt_mediaSugestao.Text) = '') then
      Begin
        MessageBox(handle,PChar('Informe a quantidade de '+lbl_mediaSugestao.Caption+' que deseja obter a sugestão de compras'), 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        edt_mediaSugestao.SetFocus;
        Abort;
      End;
      //

      Panel3.Visible := True;
      Update;

      try
        ConfigMediaMovimentacao;
      finally
        Panel3.Visible := False;
        Update;
      end;
    end;
    {$ENDREGION}
    {$REGION 'Pis/Cofins'}
    14: Begin //Pis/Cofins
      with Dm_RelProduto do
      Begin
        ConfigPisCofins;
        //
        pp_ProdPisCofins.Print;
      End;

    End;
    {$ENDREGION}
    {$REGION 'Produtos não Movimentados'}
    15: Begin
          with Dm_RelProduto do
          Begin
            ConfigProdutosNaoMovimentados;
            //
            ppLabel87.Text := 'Relatório de Produtos não Movimentados no período de '+
                             FormatDateTime('dd/mm/yyyy',dt_ini_ProdNaoMovto.Date)+' ate '+
                             FormatDateTime('dd/mm/yyyy',dt_fim_ProdNaoMovto.Date);

            pp_ProdNaoMovto.Print;
          End;
    End;
    {$ENDREGION}
    {$REGION 'Lote'}
    16:Begin //inicio Estoque por Lote
        With Dm_RelProduto do
        Begin
          If not(chk_lote_produto.Checked) and (Trim(lkp_lote_produto.Text) = '') then
           Begin
              MessageBox(handle,'Digite o nome do produto ou parte dele', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
              Abort;
           End;

           qry_lote.Close;
           if not(chk_lote_produto.Checked) then
              qry_lote.Parameters[0].Value :=  DM_Geral.qry_CadastroProdutoPRO_ID.AsString
           else
              qry_lote.Parameters[0].Value := '%';

           qry_lote.Open;

           If qry_lote.IsEmpty Then
           Begin
              MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
              Abort;
           End;

           Rep_lote.Print;
        End;
     end;//fim Estoque por Lote
     {$ENDREGION}
  end; //fim do case
end;

procedure Tfrm_RelProduto.FormCreate(Sender: TObject);
begin
  Application.HintPause     := 500;   //meio segundo para mostrar o hint
  Application.HintHidePause := 10000; //tempo de duração = 10 segundos

  with Dm_RelProduto do
  Begin
    TrabSecao := DM_Geral.qry_paramsPAR_PRODUTO_SECAO.Value = 'S';

    //Validando se é posto
    Tab_Geral_Combustivel.TabVisible := DM_Geral.qry_paramsPAR_ESTABELECIMENTO.Value = 'P';

    //Validando se é farmacia
    tab_lote.TabVisible := DM_Geral.qry_paramsPAR_ESTABELECIMENTO.Value = 'F';
    //
    pge_.ActivePage := tabTotais;
    pge_TabelaPreco.TabIndex := 0;
    //
    if not(TrabSecao) then
    Begin
        Tab_Geral_Secao.TabVisible := false;
        gp_sec.Visible             := False;
        gp_sec3.Visible            := False;
        gp_sec4.Visible            := False;
    end
    else
    Begin
        Tab_Geral_Secao.TabVisible := true;
        gp_sec.Visible             := True;
        gp_sec3.Visible            := True;
        gp_sec4.Visible            := True;
    end;
  End;

  with DM_Geral do
  begin
    //Condição Especial utilizada Apenas Pela Mundo Cell na Geração da Planilha de Importação
    Tab_Geral_ProdExcel.TabVisible := qry_paramsPAR_ORC_IMPORTA_EXCEL.Value = 'S';

    grpPromoProduto.Visible    := qry_paramsPAR_PRO_TIPO_PROMOCAO.Value = 'N';
    grpPromoFabricante.Visible := qry_paramsPAR_PRO_TIPO_PROMOCAO.Value <> 'N';

    { Altera os nomes dos campos em
    Relatório/Cadastro/Produto/Geral/Gerar Produtos em Excel / Filtro: Valo }
    if qry_paramsPAR_CAD_PRO_ALT_NOME_CAMPOS.Value = 'S' then
    begin
      rgValor.Items.Clear;
      rgValor.Items.Add('Tabela Distribuidor');
      rgValor.Items.Add('Tabela Alto Atacado');
      rgValor.Items.Add('Tabela Atacado');
      rgValor.ItemIndex := 0;
    end;
  end;
end;

procedure Tfrm_RelProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frm_RelProduto := nil;
end;

procedure Tfrm_RelProduto.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_RelProduto.lkp_clienteEnter(Sender: TObject);
begin
  if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).DropDown;
end;

procedure Tfrm_RelProduto.tsh_RepShow(Sender: TObject);
begin
  RadioGroup1.Enabled     := False;
  lbl_DeptoPreco.Enabled  := False;
  chk_DeptoPreco.Enabled  := False;
  lkp_DeptoPreco.Enabled  := False;
end;

procedure Tfrm_RelProduto.tsh_totaisShow(Sender: TObject);
begin
  RadioGroup1.Enabled     := False;
  lbl_DeptoPreco.Enabled  := False;
  chk_DeptoPreco.Enabled  := False;
  lkp_DeptoPreco.Enabled  := False;
end;

procedure Tfrm_RelProduto.lkp_totaisEnter(Sender: TObject);
begin
  if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).DropDown;
end;

procedure Tfrm_RelProduto.rg_mediaTipoClick(Sender: TObject);
begin
 edt_mediaCalculo.Clear;
 edt_mediaSugestao.Clear;

 if rg_mediaTipo.ItemIndex = 0 then
 Begin
   edt_mediaCalculo.MaxLength  := 2;
   edt_mediaSugestao.MaxLength := 2;
 End
 else
 Begin
   edt_mediaCalculo.MaxLength  := 3;
   edt_mediaSugestao.MaxLength := 3;
 End;

lbl_mediaCalculo.Caption  := Format('%s', [rg_mediaTipo.Items[rg_mediaTipo.ItemIndex]]);
lbl_mediaSugestao.Caption := Format('%s', [rg_mediaTipo.Items[rg_mediaTipo.ItemIndex]]);
end;

procedure Tfrm_RelProduto.lkp_reposEnter(Sender: TObject);
begin
  if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).DropDown;
end;

procedure Tfrm_RelProduto.tsh_inventShow(Sender: TObject);
begin
  RadioGroup1.Enabled     := False;
  lbl_DeptoPreco.Enabled  := False;
  chk_DeptoPreco.Enabled  := False;
  lkp_DeptoPreco.Enabled  := False;
end;

procedure Tfrm_RelProduto.chkAgrupaFornClick(Sender: TObject);
begin
  if not chkAgrupaForn.Checked then
  begin
    chk_agrupado.Checked := True;
    chk_agrupado_secao.Checked := True;
  end;

  chk_agrupado.Enabled       := chkAgrupaForn.Checked;
  chk_agrupado_secao.Enabled := chkAgrupaForn.Checked;
end;

procedure Tfrm_RelProduto.chkComissaoClick(Sender: TObject);
begin
  chkPadraoClick(Sender);

  chkSoComissao.Visible := chkComissao.Checked;
  if not chkSoComissao.Visible then
    chkSoComissao.Checked := False;
end;

procedure Tfrm_RelProduto.chkFornecedorClick(Sender: TObject);
begin
  lkpFornecedor.Enabled       := not chkFornecedor.Checked;
  lblFornecedor.Enabled       := not chkFornecedor.Checked;
  spd_GeralFornecedor.Visible := not chkFornecedor.Checked;
end;

procedure Tfrm_RelProduto.chkMarcaClick(Sender: TObject);
begin
  lkpMarca.Enabled := not chkMarca.Checked;
  lblMarca.Enabled := not chkMarca.Checked;
  spdMarca.Visible := not chkMarca.Checked;
end;

procedure Tfrm_RelProduto.chkMovSaldoClick(Sender: TObject);
begin
  if chkMovSaldo.Checked then
  begin
    chk_DepExtrato.Checked         := True;
    chk_Extrato_SoEntradas.Checked := False;
    chk_AgrupaExtPorTipo.Checked   := False;
  end;

  chk_DepExtrato.Enabled         := not chkMovSaldo.Checked;
  chk_DepExtrato.Enabled         := not chkMovSaldo.Checked;
  chk_Extrato_SoEntradas.Enabled := not chkMovSaldo.Checked;
  chk_AgrupaExtPorTipo.Enabled   := not chkMovSaldo.Checked;
  rg_extratoAcum.Enabled         := not chkMovSaldo.Checked;
end;

procedure Tfrm_RelProduto.chkPadraoClick(Sender: TObject);
var
  AControl: TControl;
  i: Integer;
begin
  if not(Sender is TCheckBox) or not(Sender as TCheckBox).Checked or
     not(TCheckBox(Sender).Parent is TGroupBox) then
    Exit;
  //
  with (TCheckBox(Sender).Parent as TGroupBox) do
  for i := 0 to ControlCount - 1 do
  begin
    AControl := Controls[i];

    if (AControl <> Sender) and (AControl is TCheckBox) then
      TCheckBox(AControl).Checked := False;
  end;
end;

procedure Tfrm_RelProduto.chkPromoFabricanteClick(Sender: TObject);
begin
  lblPromoFabricante.Enabled := not chkPromoFabricante.Checked;
  lkpPromoFabricante.Enabled := not chkPromoFabricante.Checked;
end;

procedure Tfrm_RelProduto.chk_aliqClick(Sender: TObject);
begin
  lkp_aliq.Enabled := not chk_aliq.Checked;
  lbl_aliq.Enabled := not chk_aliq.Checked;
  spd_aliq.Visible := not chk_aliq.Checked;
end;

procedure Tfrm_RelProduto.lkp_aliqEnter(Sender: TObject);
begin
  if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).DropDown;
end;

procedure Tfrm_RelProduto.chk_departamento10Click(Sender: TObject);
begin
  lkp_departamento10.Enabled := not chk_departamento10.Checked;
  lbl_departamento10.Enabled := not chk_departamento10.Checked;
  spd_DeptoLevDiario.Visible := not chk_departamento10.Checked;
end;

procedure Tfrm_RelProduto.chk_GerarProdExcelClick(Sender: TObject);
begin
   lkp_GerarProdExcel.Enabled := not chk_GerarProdExcel.Checked;
   lbl_GerarProdExcel.Enabled := not chk_GerarProdExcel.Checked;
end;

procedure Tfrm_RelProduto.chk_TotaisDepClick(Sender: TObject);
begin
  lkp_TotaisDep.Enabled := not chk_TotaisDep.Checked;
  lbl_TotaisDep.Enabled := not chk_TotaisDep.Checked;
  spd_TotaisDep.Visible := not chk_TotaisDep.Checked;
end;

procedure Tfrm_RelProduto.chk_mov11Click(Sender: TObject);
begin
  lkp_dep11.Enabled           := not chk_mov11.Checked;
  lbl_dep11.Enabled           := not chk_mov11.Checked;
  spd_depMovimentacao.Visible := not chk_mov11.Checked;
end;

procedure Tfrm_RelProduto.chk_forncClick(Sender: TObject);
begin
  lkp_fornc.Enabled  := not chk_fornc.Checked;
  lbl_fornc.Enabled  := not chk_fornc.Checked;
  spd_forn.Visible   := not chk_fornc.Checked;
end;

procedure Tfrm_RelProduto.chk_aliqforClick(Sender: TObject);
begin
  lkp_aliqfor.Enabled := not chk_aliqfor.Checked;
  lbl_aliqfor.Enabled := not chk_aliqfor.Checked;
end;

procedure Tfrm_RelProduto.chk_naf_codfiscalClick(Sender: TObject);
begin
  lkp_naf_codfiscal.Enabled := not chk_naf_codfiscal.Checked;
  lbl_naf_codfiscal.Enabled := not chk_naf_codfiscal.Checked;
end;

procedure Tfrm_RelProduto.chk_NatCreditoClick(Sender: TObject);
begin
  lkp_Natcredito.Enabled := not chk_NatCredito.Checked;
  lbl_NatCredito.Enabled := not chk_NatCredito.Checked;
end;

procedure Tfrm_RelProduto.chk_NatReceitaClick(Sender: TObject);
begin
  lkp_NatReceita.Enabled      := not chk_NatReceita.Checked;
  lbl_NaturezaReceita.Enabled := not chk_NatReceita.Checked;
end;

procedure Tfrm_RelProduto.chk_ativo_inativoClick(Sender: TObject);
begin
  lkp_produto.Enabled   := not chk_ativo_inativo.Checked;
  Label5.Enabled        := not chk_ativo_inativo.Checked;
  spd_ProdAitvo.Visible := not chk_ativo_inativo.Checked;
end;

procedure Tfrm_RelProduto.chk_CodTribPisCofinsEntradaClick(Sender: TObject);
begin
  lbl_CodTribPisCofinsEntrada.Enabled    := not chk_CodTribPisCofinsEntrada.Checked;
  dblk_CodTribPisCofinsEntrada.Enabled   := not chk_CodTribPisCofinsEntrada.Checked;
end;

procedure Tfrm_RelProduto.chk_CodTribPisCofinsSaidaClick(Sender: TObject);
begin
  lbl_CodTribPisCofinsSaida.Enabled    := not chk_CodTribPisCofinsSaida.Checked;
  dblk_CodTribPisCofinsSaida.Enabled   := not chk_CodTribPisCofinsSaida.Checked;
end;

procedure Tfrm_RelProduto.chk_DepAltPrecoClick(Sender: TObject);
begin
  lkp_DepAltPreco.Enabled := not chk_DepAltPreco.Checked;
  lbl_DepAltPreco.Enabled := not chk_DepAltPreco.Checked;
  spd_DepAltPreco.Visible := not chk_DepAltPreco.Checked;
end;

procedure Tfrm_RelProduto.chk_secaoClick(Sender: TObject);
begin
  lkp_secao.Enabled := not(chk_secao.Checked);
  lbl_secao.Enabled := not(chk_secao.Checked);
end;

procedure Tfrm_RelProduto.chk_DepExtratoClick(Sender: TObject);
begin
  lbl_DepartamentoExtrato.Enabled := not chk_DepExtrato.Checked;
  lkp_DepartamentoExtrato.Enabled := not chk_DepExtrato.Checked;
  btn_LocDepExtrato.Enabled       := not chk_DepExtrato.Checked;
end;

procedure Tfrm_RelProduto.chk_DeptoCSTClick(Sender: TObject);
begin
  lkp_DeptoCST.Enabled := not chk_DeptoCST.Checked;
  lbl_DeptoCST.Enabled := not chk_DeptoCST.Checked;
  spd_DeptoCST.Visible := not chk_DeptoCST.Checked;
end;

procedure Tfrm_RelProduto.chk_prodClick(Sender: TObject);
begin
  lkp_prod.Enabled := not chk_prod.Checked;
  lbl_prod.Enabled := not chk_prod.Checked;
  spd_prod.Visible := not chk_prod.Checked;
end;

procedure Tfrm_RelProduto.chk_ProdnaoMovtoClick(Sender: TObject);
begin
  dblkp_ProdNaoMovto.Enabled := not chk_ProdnaoMovto.Checked;
  lbl_ProdNaoMovto.Enabled   := not chk_ProdnaoMovto.Checked;
  SpeedButton6.Visible       := not chk_ProdnaoMovto.Checked;
end;

procedure Tfrm_RelProduto.rg_TabelaClick(Sender: TObject);
begin

  case rg_Tabela.ItemIndex of
    0:
    begin
      GroupBox1.Enabled         := false;
      chk_mEstoque.Enabled      := false;
      chk_mAvista.Enabled       := false;
      chk_mPrazo.Enabled        := false;
      chk_mTotal.Enabled        := false;
      chk_mCusto.Enabled        := false;
      chk_mCustoReal.Enabled    := false;
      chk_mMedio.Enabled        := false;
      chk_zerado.Enabled        := false;
      chk_mcontagem.Enabled     := false;
      chk_mTracejada.Enabled    := false;
      chk_mMinimo.Enabled       := false;
      chk_atacado.Enabled       := false;
      chk_cst.Enabled           := false;
      chk_gaveta.Enabled        := false;
      chk_aliquota.Enabled      := false;
      chk_mTotalCusto.Enabled   := false;
      chk_mTotalMedio.Enabled   := false;
      chk_SoZerado.Enabled      := false;
      chk_mMinimo2.Enabled      := false;
      chk_mQtdeUn.Enabled       := false;
      chk_SoNegativo.Enabled    := false;
      chk_mMaximo.Enabled       := false;
      chk_mSugestiva.Enabled    := false;
      chk_todos.Checked         := true;
      chk_todos.Enabled         := false;
      GroupBox14.Enabled        := false;
      chk_agrupado.Enabled      := false;
      chk_AtacadoVarejo.Enabled := false;
      rg_ordem.Enabled          := false;
      rg_EanouRef.Enabled       := false;
      btn_GeralDiscXLS.Visible  := false;
      chk_CodFrabric.Enabled    := false;
      chk_CodNCM.Enabled        := false;
      chk_gaveta2.Enabled       := False;
      rg_tipo.Enabled           := False;
      rgTipoRel.ItemIndex       := 0;
      rgDescProduto.Enabled     := False;
      rgTipoRel.Enabled         := False;
      chkUnEmbComp1.Enabled     := False;
      chkUnEmbComp2.Enabled     := False;
      chkComissao.Enabled       := False;
      chk_CodBalanca.Enabled    := False;
      chkSoPrecoFixo.Enabled    := False;
      chkSoComissao.Enabled     := False;
    end;

    1:
    begin
      GroupBox1.Enabled         := True;
      chk_mEstoque.Enabled      := True;
      chk_mAvista.Enabled       := True;
      chk_mPrazo.Enabled        := True;
      chk_mCusto.Enabled        := True;
      chk_mCustoReal.Enabled    := True;
      chk_mMedio.Enabled        := True;
      chk_mcontagem.Enabled     := true;
      chk_mTracejada.Enabled    := true;
      chk_mMinimo.Enabled       := True;
      chk_atacado.Enabled       := True;
      chk_cst.Enabled           := True;
      chk_gaveta.Enabled        := True;
      chk_aliquota.Enabled      := True;
      chk_mMinimo2.Enabled      := True;
      chk_mQtdeUn.Enabled       := True;
      chk_SoNegativo.Enabled    := True;
      chk_mMaximo.Enabled       := True;
      chk_mSugestiva.Enabled    := True;
      chk_todos.Enabled         := True;
      GroupBox14.Enabled        := True;
      chk_agrupado.Enabled      := True;
      chk_AtacadoVarejo.Enabled := True;
      rg_ordem.Enabled          := True;
      rg_EanouRef.Enabled       := True;
      btn_GeralDiscXLS.Visible  := True;
      chk_CodFrabric.Enabled    := True;
      chk_CodNCM.Enabled        := true;
      chk_gaveta2.Enabled       := True;
      rg_tipo.Enabled           := True;
      rgTipoRel.Enabled         := True;
      rgDescProduto.Enabled     := True;
      chkUnEmbComp1.Enabled     := True;
      chkUnEmbComp2.Enabled     := True;
      chkComissao.Enabled       := True;
      chk_CodBalanca.Enabled    := True;
      chkSoPrecoFixo.Enabled    := True;
      chkSoComissao.Enabled     := True;

      chk_mAvistaClick(self);
      chk_mCustoClick(self);
      chk_mMedioClick(self);
      chk_zeradoClick(self);
      chk_SoZeradoClick(self);
    end;
  end;
end;

procedure Tfrm_RelProduto.spdMarcaClick(Sender: TObject);
begin
  lkpMarca.KeyValue := Tfrm_PesqMarca.GetResult;
  lkpMarca.SetFocus;
end;

procedure Tfrm_RelProduto.spd_aliqClick(Sender: TObject);
begin
  lkp_aliq.KeyValue := Tfrm_PesqDepartamento.GetResult;
  lkp_aliq.SetFocus;
end;

procedure Tfrm_RelProduto.spd_DepAltPrecoClick(Sender: TObject);
begin
  lkp_DepAltPreco.KeyValue := Tfrm_PesqDepartamento.GetResult;
  lkp_DepAltPreco.SetFocus;
end;

procedure Tfrm_RelProduto.spd_depMovimentacaoClick(Sender: TObject);
begin
  lkp_dep11.KeyValue := Tfrm_PesqDepartamento.GetResult;
  lkp_dep11.SetFocus;
end;

procedure Tfrm_RelProduto.spd_DeptoCSTClick(Sender: TObject);
begin
  lkp_DeptoCST.KeyValue := Tfrm_PesqDepartamento.GetResult;
  lkp_DeptoCST.SetFocus;
end;

procedure Tfrm_RelProduto.spd_DeptoLevDiarioClick(Sender: TObject);
begin
  lkp_departamento10.KeyValue := Tfrm_PesqDepartamento.GetResult;
  lkp_departamento10.SetFocus;
end;

procedure Tfrm_RelProduto.spd_DeptoPrecoClick(Sender: TObject);
begin
  lkp_DeptoPreco.KeyValue := Tfrm_PesqDepartamento.GetResult;
  lkp_DeptoPreco.SetFocus;
end;

procedure Tfrm_RelProduto.spd_Dep_Obs_CodFabClick(Sender: TObject);
begin
  lkp_Dep_Obs_CodFab.KeyValue := Tfrm_PesqDepartamento.GetResult;
  lkp_Dep_Obs_CodFab.SetFocus;
end;

procedure Tfrm_RelProduto.spd_fornClick(Sender: TObject);
begin
  lkp_fornc.KeyValue := Tfrm_PesqFornecedor.GetResult;
  lkp_fornc.SetFocus;
end;

procedure Tfrm_RelProduto.spd_fornecedorClick(Sender: TObject);
begin
  lkp_fornecedor.KeyValue := Tfrm_PesqFornecedor.GetResult;
  lkp_fornecedor.SetFocus;
end;

procedure Tfrm_RelProduto.spd_For_Obs_CodFabClick(Sender: TObject);
begin
  lkp_For_Obs_CodFab.KeyValue:= Tfrm_PesqFornecedor.GetResult;
  lkp_For_Obs_CodFab.SetFocus;
end;

procedure Tfrm_RelProduto.spd_GeralFornecedorClick(Sender: TObject);
begin
  lkpFornecedor.KeyValue:= Tfrm_PesqFornecedor.GetResult;
  lkpFornecedor.SetFocus;
end;

procedure Tfrm_RelProduto.spd_ImportaExcelClick(Sender: TObject);
const
  {$REGION 'SQLs'}
  GerarProdExcel =
    ' select' +
    '   P.DEP_ID, DEP_DESCRICAO, PRO_REFERENCIA, PRO_DESCRICAO, %s' +
    ' from' +
    '   PRODUTO P' +
    ' inner join' +
    '   DEPARTAMENTO D on P.DEP_ID = D.DEP_ID' +
    ' where' +
    '   convert(varchar(20),P.DEP_ID) like :DEP_ID and PRO_ATIVO = ''A'' %s' +
    ' %s';
  {$ENDREGION}
var
  ValueField, WithStock: string;
begin

    if not(chk_GerarProdExcel.Checked) and (lkp_GerarProdExcel.Text = '') then
    begin
        MessageBox(handle,'Escolha um Departamento ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
        Abort;
    end;


    with DM_relProduto do
    Begin
       qry_GeraProdExcel.Close;
       qry_GeraProdExcel.SQL.Clear;

       case rgValor.ItemIndex of
        0:ValueField := 'PRO_VLRVENDA'; //Preço a VISTA
        1:ValueField := 'PRO_VLRPRAZO'; //Preço a PRAZO
        2:ValueField := 'PRO_VLRATACADO'; //Preço de atacado
       end;

       //Se irá gerar somente produtos com estoque ou não
       WithStock := '';
       if chkProdEstoq.Checked then
         WithStock := 'and PRO_ESTOQUE > 0';

       //Ordenando por referencia ou descrição
       if rg_GerarProdExcel.ItemIndex = 0 then
         qry_GeraProdExcel.SQL.Text := Format(GerarProdExcel, [
           ValueField, WithStock, 'order by DEP_DESCRICAO, P.DEP_ID, PRO_DESCRICAO, PRO_REFERENCIA'
         ])
       else
         qry_GeraProdExcel.SQL.Text := Format(GerarProdExcel, [
           ValueField, WithStock, 'order by DEP_DESCRICAO, P.DEP_ID, PRO_REFERENCIA, PRO_DESCRICAO'
         ]);

       if not(chk_GerarProdExcel.Checked) then
         qry_GeraProdExcel.Parameters[0].Value := DM_Geral.qryCadDepartdep_id.Value
       else
         qry_GeraProdExcel.Parameters[0].Value := '%';

       qry_GeraProdExcel.Open;

       If qry_GeraProdExcel.IsEmpty Then
       Begin
           MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
           Abort;
       End;

       // Gera a planilha.
       TGeraPlanilhaExcel.GeraPDA_XLS(
         qry_GeraProdExcel, DM_Geral.qry_paramsPAR_SENHAEXCEL.AsString,
         DM_Geral.qry_paramsPAR_REL_PROD_DIR_PICTURE.AsString
       );
    End;
end;

procedure Tfrm_RelProduto.spd_lote_produtoClick(Sender: TObject);
begin
  lkp_lote_produto.KeyValue:= Tfrm_PesqProduto.GetCodResult;
  lkp_lote_produto.SetFocus;
end;

procedure Tfrm_RelProduto.spd_media_departamentoClick(Sender: TObject);
begin
  lkp_media_departamento.KeyValue:= Tfrm_PesqDepartamento.GetResult;
  lkp_media_departamento.SetFocus;
end;

procedure Tfrm_RelProduto.spd_media_marcaFabricanteClick(Sender: TObject);
begin
  lkp_media_marcaFabricante.KeyValue:= Tfrm_PesqMarca.GetResult;
  lkp_media_marcaFabricante.SetFocus;
end;

procedure Tfrm_RelProduto.spd_media_produtoClick(Sender: TObject);
begin
  lkp_media_produto.KeyValue:= Tfrm_PesqProduto.GetCodResult;
  lkp_media_produto.SetFocus;
end;

procedure Tfrm_RelProduto.spd_ProdAitvoClick(Sender: TObject);
begin
  lkp_produto.KeyValue:= Tfrm_PesqProduto.GetCodResult;
  lkp_produto.SetFocus;
end;

procedure Tfrm_RelProduto.chk_mCustoClick(Sender: TObject);
begin
  chkPadraoClick(Sender);
  EnabledChkMTotalCusto;
end;

procedure Tfrm_RelProduto.chk_mMedioClick(Sender: TObject);
begin
  chkPadraoClick(Sender);
  EnabledChkMTotalMedio;
end;

procedure Tfrm_RelProduto.chk_mMinimoClick(Sender: TObject);
begin
  chkPadraoClick(Sender);
  EnabledChkMSugestiva;
  VisibleChkTodosMinimos;
end;

procedure Tfrm_RelProduto.chk_todoscstClick(Sender: TObject);
begin
  lkp_cst.Enabled := not chk_todoscst.Checked;
  lbl_cst.Enabled := not chk_todoscst.Checked;
end;

procedure Tfrm_RelProduto.chk_atacadoClick(Sender: TObject);
begin
  chkPadraoClick(Sender);
  chk_AtacadoVarejo.Enabled := not chk_atacado.Checked;
end;

procedure Tfrm_RelProduto.chk_mAvistaClick(Sender: TObject);
begin
  chkPadraoClick(Sender);
  EnabledChkMTotal;
end;

procedure Tfrm_RelProduto.chk_mEstoqueClick(Sender: TObject);
begin
  chkPadraoClick(Sender);
  EnabledChkMTotal;
  EnabledChkMTotalCusto;
  EnabledChkMTotalCustoReal;
  EnabledChkMSugestiva;
  EnabledChkMTotalMedio;
end;

procedure Tfrm_RelProduto.chk_lote_produtoClick(Sender: TObject);
begin
  lkp_lote_produto.Enabled   := not chk_lote_produto.Checked;
  lbl_lote_produto.Enabled   := not chk_lote_produto.Checked;
  spd_lote_produto.Visible   := not chk_lote_produto.Checked;
end;

procedure Tfrm_RelProduto.chk_zeradoClick(Sender: TObject);
begin
  chk_SoZerado.Enabled   := not(chk_zerado.Checked);
  chk_SoNegativo.Enabled := not(chk_zerado.Checked);
end;

procedure Tfrm_RelProduto.chk_SoZeradoClick(Sender: TObject);
begin
  chk_Zerado.Enabled     := not(chk_SoZerado.Checked);
  chk_SoNegativo.Enabled := not(chk_SoZerado.Checked);
end;

procedure Tfrm_RelProduto.chk_produtClick(Sender: TObject);
begin
  lkp_produt.Enabled  := not chk_produt.Checked;
  lbl_produt.Enabled  := not chk_produt.Checked;
  spd_product.Visible := not chk_produt.Checked;
end;

procedure Tfrm_RelProduto.chk_Pro_Obs_CodFabClick(Sender: TObject);
begin
  lbl_Pro_Obs_CodFab.Enabled := not(chk_Pro_Obs_CodFab.Checked);
  edt_Pro_Obs_CodFab.Enabled := not(chk_Pro_Obs_CodFab.Checked);
end;

procedure Tfrm_RelProduto.chk_mMinimo2Click(Sender: TObject);
begin
  chkPadraoClick(Sender);
  VisibleChkTodosMinimos;
end;

procedure Tfrm_RelProduto.chk_SemNatCreditoClick(Sender: TObject);
begin
  chk_NatCredito.Checked := True;
  chk_NatCredito.Enabled := not chk_SemNatCredito.Checked;
end;

procedure Tfrm_RelProduto.chk_SemNatReceitaClick(Sender: TObject);
begin
  chk_NatReceita.Checked := True;
  chk_NatReceita.Enabled := not chk_SemNatReceita.Checked;
end;

procedure Tfrm_RelProduto.chk_SoNegativoClick(Sender: TObject);
begin
  chk_Zerado.Enabled   := not(chk_SoNegativo.Checked);
  chk_SoZerado.Enabled := not(chk_SoNegativo.Checked);
end;

procedure Tfrm_RelProduto.chk_todosClick(Sender: TObject);
begin
  lbl_produto.Enabled := not(chk_todos.Checked);
  edt_produto.Enabled := not(chk_todos.Checked);
end;

procedure Tfrm_RelProduto.chk_mMaximoClick(Sender: TObject);
begin
  chkPadraoClick(Sender);
  EnabledChkMSugestiva;
end;

procedure Tfrm_RelProduto.spd_prodClick(Sender: TObject);
begin
  lkp_prod.KeyValue:= Tfrm_PesqProduto.GetCodResult;
  lkp_prod.SetFocus;
end;

procedure Tfrm_RelProduto.spd_productClick(Sender: TObject);
begin
  lkp_produt.KeyValue:= Tfrm_PesqProduto.GetCodResult;
  lkp_produt.SetFocus;
end;

procedure Tfrm_RelProduto.btn_LocDepExtratoClick(Sender: TObject);
begin
  lkp_DepartamentoExtrato.KeyValue := Tfrm_PesqDepartamento.GetResult;
  lkp_DepartamentoExtrato.SetFocus;
end;

procedure Tfrm_RelProduto.btn_LocProdExtratoClick(Sender: TObject);
begin
  lkp_ProdutoExtrato.KeyValue := Tfrm_PesqProduto.GetCodResult;
  lkp_ProdutoExtrato.SetFocus;
end;

procedure Tfrm_RelProduto.spd_TotaisDepClick(Sender: TObject);
begin
  lkp_TotaisDep.KeyValue:= Tfrm_PesqDepartamento.GetResult;
  lkp_TotaisDep.SetFocus;
end;

procedure Tfrm_RelProduto.chk_media_departamentoClick(Sender: TObject);
begin
  lkp_media_departamento.Enabled := not chk_media_departamento.Checked;
  lbl_media_departamento.Enabled := not chk_media_departamento.Checked;
  spd_media_departamento.Visible := not chk_media_departamento.Checked;
end;

procedure Tfrm_RelProduto.chk_media_marcaFabricanteClick(Sender: TObject);
begin
  lkp_media_marcaFabricante.Enabled := not chk_media_marcaFabricante.Checked;
  lbl_media_marcaFabricante.Enabled := not chk_media_marcaFabricante.Checked;
  spd_media_marcaFabricante.Visible := not chk_media_marcaFabricante.Checked;
end;

procedure Tfrm_RelProduto.chk_media_secaoClick(Sender: TObject);
begin
  lkp_media_secao.Enabled   := not chk_media_secao.Checked;
  lbl_media_secao.Enabled   := not chk_media_secao.Checked;
end;

procedure Tfrm_RelProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=VK_RETURN Then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure Tfrm_RelProduto.edtMargemProdSemMovExit(Sender: TObject);
var
  valor: double;
begin
  if not TryStrToFloat(edtMargemProdSemMov.Text, valor) then
  begin
    ShowMessage('O valor digitado não é válido!');
    edtMargemProdSemMov.SetFocus;
    Exit;
  end;

  edtMargemProdSemMov.Text := FormatFloat('#0.00', valor);
end;

procedure Tfrm_RelProduto.edtMargemProdSemMovKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', ',', Chr(8)]) then
    Key := #0;
end;

procedure Tfrm_RelProduto.edt_mediaCalculoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',Chr(8),chr(32)]) then
    Key:= #0;
end;

procedure Tfrm_RelProduto.edt_mediaSugestaoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',Chr(8),chr(32)]) then
    Key:= #0;
end;

procedure Tfrm_RelProduto.EnabledChkMSugestiva;
begin
  chk_mSugestiva.Enabled := chk_mEstoque.Checked and chk_mMaximo.Checked and chk_mMinimo.Checked;

  if not chk_mSugestiva.Enabled then
    chk_mSugestiva.Checked := False;
end;

procedure Tfrm_RelProduto.EnabledChkMTotal;
begin
  chk_mTotal.Enabled := chk_mEstoque.Checked and chk_mAvista.Checked;

  if not chk_mTotal.Enabled then
    chk_mTotal.Checked:= False;
end;

procedure Tfrm_RelProduto.EnabledChkMTotalCusto;
begin
  chk_mTotalCusto.Enabled := chk_mEstoque.Checked and chk_mCusto.Checked;

  if not chk_mTotalCusto.Enabled then
    chk_mTotalCusto.Checked := False;
end;

procedure Tfrm_RelProduto.EnabledChkMTotalCustoReal;
begin
  chk_mTotalCustoReal.Enabled := chk_mEstoque.Checked and chk_mCustoReal.Checked;

  if not chk_mTotalCustoReal.Enabled then
    chk_mTotalCustoReal.Checked := False;
end;

procedure Tfrm_RelProduto.EnabledChkMTotalMedio;
begin
  chk_mTotalMedio.Enabled := chk_mEstoque.Checked and chk_mMedio.Checked;

  if not chk_mTotalMedio.Enabled then
    chk_mTotalMedio.Checked := False;
end;

procedure Tfrm_RelProduto.chk_mCustoRealClick(Sender: TObject);
begin
  chkPadraoClick(Sender);
  EnabledChkMTotalCustoReal;
end;

procedure Tfrm_RelProduto.chk_MVistaSecClick(Sender: TObject);
begin
  if chk_MVistaSec.Checked then
  begin
    chk_mCustoSec.Checked := false;
  //
  if chk_MEstoqueSec.Checked then
    chk_MTotalSec.Enabled:= True;
  end
  else
  begin
    chk_MTotalSec.Checked := false;
    chk_MTotalSec.Enabled := false;
  end;
end;

procedure Tfrm_RelProduto.chk_mCustoSecClick(Sender: TObject);
begin
  if chk_mCustoSec.Checked then
  begin
    chk_MVistaSec.Checked := false;
    //
    if chk_MEstoqueSec.Checked then
      chk_mTotalCustoSec.Enabled:= True;
  end
  else
  begin
    chk_mTotalCustoSec.Checked := false;
    chk_mTotalCustoSec.Enabled := false;
  end;
end;

procedure Tfrm_RelProduto.chk_MTotalSecClick(Sender: TObject);
begin
  if chk_MTotalSec.Checked then
    chk_mTotalCustoSec.Checked := false;
end;

procedure Tfrm_RelProduto.chk_mTotalCustoSecClick(Sender: TObject);
begin
  if chk_mTotalCustoSec.Checked then
    chk_MTotalSec.Checked := false;
end;

procedure Tfrm_RelProduto.chk_MEstoqueSecClick(Sender: TObject);
begin
  if chk_MEstoqueSec.Checked then
  begin
    if chk_MVistaSec.Checked then
      chk_MTotalSec.Enabled := True
    else if chk_mCustoSec.Checked then
      chk_mTotalCustoSec.Enabled:= True;
  //
  end
  else
  begin
    chk_MTotalSec.Checked       := False;
    chk_MTotalSec.Enabled       := False;
    chk_mTotalCustoSec.Checked  := False;
    chk_mTotalCustoSec.Enabled  := False;
  end;
end;

procedure Tfrm_RelProduto.chk_zeradoSecClick(Sender: TObject);
begin
  chk_SoZeradoSec.Enabled   := not(chk_zeradoSec.Checked);
  chk_SoNegativoSec.Enabled := not(chk_zeradoSec.Checked);
end;

procedure Tfrm_RelProduto.chk_SoZeradoSecClick(Sender: TObject);
begin
  chk_zeradoSec.Enabled     := not(chk_SoZeradoSec.Checked);
  chk_SoNegativoSec.Enabled := not(chk_SoZeradoSec.Checked);
end;

procedure Tfrm_RelProduto.chk_SoNegativoSecClick(Sender: TObject);
begin
  chk_zeradoSec.Enabled   := not(chk_SoNegativoSec.Checked);
  chk_SoZeradoSec.Enabled := not(chk_SoNegativoSec.Checked);
end;

procedure Tfrm_RelProduto.btn_excelClick(Sender: TObject);
begin
  GeraExcel := True;

  with Dm_RelProduto do
  Begin
    Panel3.Visible := True;
    Update;

    try
      ConfigMediaMovimentacao;
    finally
      Panel3.Visible := False;
      Update;
    end;

    qry_Compra.Open;

    if qry_Compra.IsEmpty then
    Begin
      MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
      Abort;
    end;

    qry_CompraPRO_UNIDADE.Visible    := rgTipoRelMedMov.ItemIndex = 0;
    qry_CompraPRO_EMBUNIDADE.Visible := rgTipoRelMedMov.ItemIndex = 1;

    TGeraPlanilhaExcel.GeraXLS(qry_Compra);
  End;
end;

procedure Tfrm_RelProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //fechadno o Form com a Tecla Esc - Rodrigo
  If Key = #27 Then
    Close;
end;

procedure Tfrm_RelProduto.FormShow(Sender: TObject);
begin
  dt_inicial.Date:= date - 7;
  dt_final.Date  := date;
  dt_ini.Date := date;
  dt_fim.Date := date;
  dt_ini_ProdNaoMovto.Date := date;
  dt_fim_ProdNaoMovto.Date := date;
  dt_comeco.Date := date;
  dt_termino.Date:= date;
  dt_inic.Date := date;
  dt_fina.Date := date;

  dt_extrato_ini.Date := Date;
  dt_extrato_fim.Date := Date;
  Dt_GeraEstData.Date := Date;

  edtMargemProdSemMov.Text := FormatFloat('#0.00', 0);
end;

procedure Tfrm_RelProduto.CheckBox4Click(Sender: TObject);
begin
  DBLookupComboBox5.Enabled := not(CheckBox4.Checked);
  Label21.Enabled           := not(CheckBox4.Checked);
end;

procedure Tfrm_RelProduto.CheckBox5Click(Sender: TObject);
begin
  dblkp_ProdPisCofins.Enabled := not CheckBox5.Checked;
  lbl_ProdPisCofins.Enabled   := not CheckBox5.Checked;
  SpeedButton4.Visible        := not CheckBox5.Checked;
end;

procedure Tfrm_RelProduto.chk_media_produtoClick(Sender: TObject);
begin
  lkp_media_produto.Enabled  := not chk_media_produto.Checked;
  lbl_media_produto.Enabled  := not chk_media_produto.Checked;
  spd_media_produto.Visible  := not chk_media_produto.Checked;
end;

procedure Tfrm_RelProduto.CheckBox16Click(Sender: TObject);
begin
  DBLookupComboBox9.Enabled  := not CheckBox16.Checked;
  label25.Enabled            := not CheckBox16.Checked;
end;

procedure Tfrm_RelProduto.chk_AtacadoVarejoClick(Sender: TObject);
begin
  if chk_AtacadoVarejo.Checked then
  begin
    chk_mAvista.Caption := 'Pr. de Varejo';
    chk_mPrazo.Caption  := 'Pr. de Atacado';
    chk_atacado.Checked := False;
  end else
  begin
    chk_mAvista.Caption := 'Preço a Vista';
    chk_mPrazo.Caption  := 'Preço a Prazo';
  end;
  //
  chk_atacado.Enabled := not chk_AtacadoVarejo.Checked;
end;

procedure Tfrm_RelProduto.ConfigGeraEstoquePorData;
const
  {$REGION 'Comandos SQL'}
  SQL =
    ' select ' +
    '	  P.PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_UNIDADE,PRO_VLRCUSTO,' +
    '	  (PRO_ESTOQUE -' +
    '	  SUM(SAIDA_DIMINUI) + SUM(SAIDA_AUMENTA) -' +
    '	  SUM(ENTRADA_DIMINUI) + SUM(ENTRADA_AUMENTA) -' +
    '	  SUM(MOVTO_DIMINUI) + SUM(MOVTO_AUMENTA) +' +
    '   SUM(SERIED_AUMENTA)+ SUM(DETALHE_AUMENTA) -' +
    '	  SUM(PRODUCAO_DIMINUI) + SUM(PRODUCAO_AUMENTA) + SUM(ORCAMENTO_AUMENTA)) AS PRO_ESTOQUE,' +
    '	  ((PRO_ESTOQUE -' +
    '	  SUM(SAIDA_DIMINUI) + SUM(SAIDA_AUMENTA) -' +
    '	  SUM(ENTRADA_DIMINUI) + SUM(ENTRADA_AUMENTA) -' +
    '	  SUM(MOVTO_DIMINUI) + SUM(MOVTO_AUMENTA) +' +
    '	  SUM(SERIED_AUMENTA)+ SUM(DETALHE_AUMENTA) -' +
    '	  SUM(PRODUCAO_DIMINUI) + SUM(PRODUCAO_AUMENTA) + SUM(ORCAMENTO_AUMENTA)) * PRO_VLRCUSTO) as TOTAL' +
    ' from' +
    '	  VW_ESTOQUE_DATA v' +
    ' inner join' +
    '	  PRODUTO P on (v.pro_id = p.pro_id) and PRO_ATIVO like :PRO_ATIVO' +
    ' where' +
    '	  dt_movto %s :DT and' +
    '   convert(varchar(10), p.for_id) like :FOR_ID' +
    ' GROUP BY' +
    '	  PRO_ESTOQUE, P.PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO, PRO_UNIDADE,PRO_VLRCUSTO' +
    ' HAVING' +
    '	  (PRO_ESTOQUE -' +
    '	  SUM(SAIDA_DIMINUI) + SUM(SAIDA_AUMENTA) -' +
    '	  SUM(ENTRADA_DIMINUI) + SUM(ENTRADA_AUMENTA) -' +
    '	  SUM(MOVTO_DIMINUI) + SUM(MOVTO_AUMENTA) +' +
    '	  SUM(SERIED_AUMENTA)+ SUM(DETALHE_AUMENTA) -' +
    '	  SUM(PRODUCAO_DIMINUI) + SUM(PRODUCAO_AUMENTA) + SUM(ORCAMENTO_AUMENTA)) > 0';
  {$ENDREGION}
var
  sSQL : String;
begin
  //estoque no inicio ou final do dia
  case rg_GeraEstData.ItemIndex of
    0: sSQL := Format(SQL, ['>=']);
    1: sSQL := Format(SQL, ['>']);
  end;

  //configura parâmetros
  with DM_RelProduto do
  begin
    qry_AuxiliaInvetario.Close;
    qry_AuxiliaInvetario.SQL.Clear;
    qry_AuxiliaInvetario.SQL.Add(sSQL);

    case groupAtivo.ItemIndex of
      0: qry_AuxiliaInvetario.Parameters[0].Value := 'A';
      1: qry_AuxiliaInvetario.Parameters[0].Value := 'I';
      2: qry_AuxiliaInvetario.Parameters[0].Value := 'B';
      3: qry_AuxiliaInvetario.Parameters[0].Value := '%';
    end;

    qry_AuxiliaInvetario.Parameters[1].Value := Dt_GeraEstData.DateTime;

    if not(chk_fornecedor.Checked) then
      qry_AuxiliaInvetario.Parameters[2].Value := DM_geral.qryCadFornecfor_id.AsString
    else
      qry_AuxiliaInvetario.Parameters[2].Value := '%';
  end;
end;

procedure Tfrm_RelProduto.ConfigGeralDiscSQL;
const
   {$REGION 'SQL'}
  SQL_Geral =
    ' select '+
    '    %s as DEP_DESCRICAO, %s as SEC_ID, %s as FOR_ID, %s as FOR_NOME, '+
    '    PRO_EAN1, PRO_REFERENCIA, PRO_DESCRICAO, PRO_RESUMIDO, PRO_QUANT_UNID, '+
    '    PRO_UNIDADE, PRO_VLRVENDA, PRO_VLRPRAZO, PRO_ESTOQUE, '+
    '    PRO_VLRCUSTO, PRO_CUSTONOTA, PRO_VLRMEDIO, '+
    '    (PRO_ESTOQUE * PRO_VLRVENDA) as TOTAL_VENDA, '+
    '    (PRO_VLRCUSTO * PRO_ESTOQUE) as TOTALCUSTO, ' +
    '    (PRO_ESTOQUE * PRO_CUSTONOTA) as TOTAL_CUSTO_REAL, '+
    '    (PRO_VLRMEDIO * PRO_ESTOQUE) as TOTAL_MEDIO, PRO_ESTOQMIN, PRO_VLRATACADO, '+
    '    (PRO_ESTOQUE * PRO_VLRCUSTO) as TOTAL_CUSTO, CST_ID, PRO_GAVETA, ' +
    '    NAF_ALIQUOTA, PRO_ESTOQMAX, (PRO_ESTOQMAX - PRO_ESTOQUE) as SUGESTAO, '+
    '    pro_codfab1, PRO_CODIGONBM, PRO_CODBALANCA, PRO_EMBUNIDADE, '+
    '    M.MRC_DESCRICAO, P.PRO_COMISSAO, CES_CODIGO ' +
    ' from '+
    '    PRODUTO P '+
    ' inner join '+
    '    DEPARTAMENTO D on D.DEP_ID = P.DEP_ID '+
    ' inner join '+
    '    NATUREZA_FISCAL N on N.NAF_CODFISCAL = P.NAF_CODFISCAL '+
    ' inner join ' +
    '    FORNECEDORES F on P.FOR_ID = F.FOR_ID' +
    ' left join ' +
    '   MARCA M on P.MRC_ID = M.MRC_ID' +
    ' where '+
    '    P.PRO_ATIVO like :tipo and PRO_DESCRICAO like :PRO_DESCRICAO and '+
    '    convert(varchar(10), D.DEP_ID) like :DEP_ID and '+
    '    convert(varchar(10), P.FOR_ID) like :FOR_ID and ' +
    '    isnull(P.PRO_GAVETA, '''') like :PRO_GAVETA and ' +
    '    convert(varchar(10), isnull(P.MRC_ID,'''')) LIKE :MRC_ID ';
  {$ENDREGION}
var
   sGaveta : String;
begin
  with DM_relProduto do
  Begin
    qryGeralDisc.Close;
    qryGeralDisc.SQL.Clear;
    qryGeralDisc.SQL.Text := SQL_Geral;
    //
    if (chk_zerado.Checked) then
      qryGeralDisc.SQL.Add(' and p.pro_estoque > 0 ')
    else if (chk_SoZerado.Checked) then
      qryGeralDisc.SQL.Add(' and p.pro_estoque = 0 ')
    else if (chk_SoNegativo.Checked) then
      qryGeralDisc.SQL.Add(' and p.pro_estoque < 0 ');

    //so preço mínimo
    if chkSoPrecoFixo.Checked then
      qryGeralDisc.SQL.Add(' and p.pro_preco_fixo = ''S'' ');

    //Produto com comissão
    if chkSoComissao.Checked then
      qryGeralDisc.SQL.Add(' and P.PRO_COMISSAO > 0 ');

    if (chk_CodBalanca.Checked) then
      qryGeralDisc.SQL.Add(' and PRO_BALANCA = ''S'' AND PRO_CODBALANCA IS NOT NULL ');

    //Estoque Minimo
    if (chk_mMinimo.Checked or chk_mMinimo2.Checked) and
       (not chk_TodosMinimos.Checked) then
    qryGeralDisc.SQL.Add(' and p.pro_estoque < p.pro_estoqmin ');

    //Se trabalha ocm Seção
    if (gp_sec4.Visible) then
      if not(CheckBox16.Checked) then
         qryGeralDisc.SQL.Add('  and (convert(varchar(10),p.sec_id) like :secao) ');

    //Agrupado por fornecedor
    if not chkAgrupaForn.Checked then
    begin
      qryGeralDisc.SQL.Text := Format(qryGeralDisc.SQL.Text, ['''1''', '1', 'P.FOR_ID', 'FOR_NOME']);
      qryGeralDisc.SQL.Add(' group by p.for_id, for_nome, pro_ean1, pro_referencia,');
      qryGeralDisc.SQL.Add(' pro_descricao, pro_resumido, pro_unidade, pro_quant_unid, pro_estoque, pro_vlrcusto, pro_vlrmedio,');
      qryGeralDisc.SQL.Add(' pro_vlrvenda, pro_vlrprazo, pro_estoqmin,pro_vlratacado, cst_id, pro_gaveta,');
      qryGeralDisc.SQL.Add(' naf_aliquota, pro_estoqmax, pro_custonota, pro_codfab1, pro_codigonbm, CES_CODIGO, ');
      qryGeralDisc.SQL.Add(' PRO_CODBALANCA, PRO_EMBUNIDADE, M.MRC_DESCRICAO, P.PRO_COMISSAO');

      case rg_ordem.ItemIndex of
        0:Begin
             if rgDescProduto.ItemIndex = 0 then //Ordenar 1ª Descrição Normal
               qryGeralDisc.SQL.Add(' Order by for_nome, pro_descricao, pro_resumido, pro_referencia, pro_ean1 ')
             else //Ordenar 1ª Descrição Resumida
               qryGeralDisc.SQL.Add(' Order by for_nome, pro_resumido, pro_descricao, pro_referencia, pro_ean1 ');
          end;
        1:qryGeralDisc.SQL.Add(' Order by for_nome, pro_referencia, pro_descricao, pro_ean1 ');
        2:qryGeralDisc.SQL.Add(' Order by for_nome, pro_ean1, pro_descricao, pro_referencia ');
        3:qryGeralDisc.SQL.Add(' Order by for_nome, pro_gaveta, pro_descricao ');
      end;
    end
    else
    begin
      qryGeralDisc.SQL.Text := Format(qryGeralDisc.SQL.Text, ['DEP_DESCRICAO', 'SEC_ID', 'P.FOR_ID', 'FOR_NOME']);
      qryGeralDisc.SQL.Add(' group by dep_descricao, sec_id, p.for_id, for_nome, pro_ean1, pro_referencia,');
      qryGeralDisc.SQL.Add(' pro_descricao, pro_resumido, pro_unidade, pro_quant_unid, pro_estoque, pro_vlrcusto, pro_vlrmedio,');
      qryGeralDisc.SQL.Add(' pro_vlrvenda, pro_vlrprazo, pro_estoqmin,pro_vlratacado, cst_id, pro_gaveta,');
      qryGeralDisc.SQL.Add(' naf_aliquota, pro_estoqmax, pro_custonota, pro_codfab1, pro_codigonbm, CES_CODIGO, ');
      qryGeralDisc.SQL.Add(' PRO_CODBALANCA, PRO_EMBUNIDADE, M.MRC_DESCRICAO, P.PRO_COMISSAO');

      //agrupado por departamento e não agrupado por seção
      if not(chk_agrupado.Checked) and (chk_agrupado_secao.Checked) then
        case rg_ordem.ItemIndex of
          0:Begin
               if rgDescProduto.ItemIndex = 0 then //Ordenar 1ª Descrição Normal
                 qryGeralDisc.SQL.Add(' Order by dep_descricao, pro_descricao, pro_resumido, pro_referencia, pro_ean1 ')
               else //Ordenar 1ª Descrição Resumida
                 qryGeralDisc.SQL.Add(' Order by dep_descricao, pro_resumido, pro_descricao, pro_referencia, pro_ean1 ');
            end;
          1:qryGeralDisc.SQL.Add(' Order by dep_descricao, pro_referencia, pro_descricao, pro_resumido, pro_ean1 ');
          2:qryGeralDisc.SQL.Add(' Order by dep_descricao, pro_ean1, pro_descricao, pro_referencia ');
          3:qryGeralDisc.SQL.Add(' Order by dep_descricao, pro_gaveta, pro_descricao ');
        end
      //nao agrupado por departamento e não agrupado por seção
      else if (chk_agrupado.Checked) and (chk_agrupado_secao.Checked) then
        case rg_ordem.ItemIndex of
          0:Begin
               if rgDescProduto.ItemIndex = 0 then //Ordenar 1ª Descrição Normal
                 qryGeralDisc.SQL.Add(' Order by pro_descricao, pro_resumido, pro_referencia, pro_ean1 ')
               else //Ordenar 1ª Descrição Resumida
                 qryGeralDisc.SQL.Add(' Order by pro_resumido, pro_descricao, pro_referencia, pro_ean1 ');
            end;
          1:qryGeralDisc.SQL.Add(' Order by pro_referencia, pro_descricao, pro_resumido, pro_ean1 ');
          2:qryGeralDisc.SQL.Add(' Order by pro_ean1, pro_descricao, pro_resumido, pro_referencia ');
          3:qryGeralDisc.SQL.Add(' Order by pro_gaveta, pro_descricao, pro_resumido ');
        end
      //agrupado por departamento e agrupado por seção
      else if not(chk_agrupado.Checked) and not(chk_agrupado_secao.Checked) then
        case rg_ordem.ItemIndex of
          0:Begin
               if rgDescProduto.ItemIndex = 0 then //Ordenar 1ª Descrição Normal
                 qryGeralDisc.SQL.Add(' Order by dep_descricao, sec_id, pro_descricao, pro_resumido, pro_referencia, pro_ean1 ')
               else //Ordenar 1ª Descrição Resumida
                 qryGeralDisc.SQL.Add(' Order by dep_descricao, sec_id, pro_resumido, pro_descricao, pro_referencia, pro_ean1 ');
            end;
          1:qryGeralDisc.SQL.Add(' Order by dep_descricao, sec_id, pro_referencia, pro_descricao, pro_resumido, pro_ean1 ');
          2:qryGeralDisc.SQL.Add(' Order by dep_descricao, sec_id, pro_ean1, pro_descricao, pro_resumido, pro_referencia ');
          3:qryGeralDisc.SQL.Add(' Order by dep_descricao, sec_id, pro_gaveta, pro_descricao, pro_resumido ');
        end
      //nao agrupado por departamento e agrupado por seção
      else if (chk_agrupado.Checked) and (chk_agrupado_secao.Checked) then
        case rg_ordem.ItemIndex of
          0:Begin
               if rgDescProduto.ItemIndex = 0 then //Ordenar 1ª Descrição Normal
                 qryGeralDisc.SQL.Add(' Order by sec_id, pro_descricao, pro_resumido, pro_referencia, pro_ean1 ')
               else
                 qryGeralDisc.SQL.Add(' Order by sec_id, pro_resumido, pro_descricao, pro_referencia, pro_ean1 ');
            end;
          1:qryGeralDisc.SQL.Add(' Order by sec_id, pro_referencia, pro_descricao, pro_resumido, pro_ean1 ');
          2:qryGeralDisc.SQL.Add(' Order by sec_id, pro_ean1, pro_descricao, pro_resumido, pro_referencia ');
          3:qryGeralDisc.SQL.Add(' Order by sec_id, pro_gaveta, pro_descricao, pro_resumido ');
        end;
  end;

  // Tipo.
  case rg_tipo.ItemIndex of
   0: qryGeralDisc.Parameters[0].Value := 'A';
   1: qryGeralDisc.Parameters[0].Value := 'I';
   2: qryGeralDisc.Parameters[0].Value := 'B';
   3: qryGeralDisc.Parameters[0].Value := '%';
  end;

  // Produto.
  if chk_todos.Checked then
    qryGeralDisc.Parameters[1].Value := '%'
  else
    qryGeralDisc.Parameters[1].Value := edt_produto.Text + '%';

  // Departamento.
  if chk_DeptoPreco.Checked then
    qryGeralDisc.Parameters[2].Value := '%'
  else
    qryGeralDisc.Parameters[2].Value := DM_Geral.qryCadDepartdep_id.AsInteger;

  // Fornecedor.
  if chkFornecedor.Checked then
    qryGeralDisc.Parameters[3].Value := '%'
  else
    qryGeralDisc.Parameters[3].Value := Dm_geral.qryCadFornecfor_id.AsInteger;

  // Gaveta.
  sGaveta := '%';
  if (rg_ordem.ItemIndex = 3) and not(Trim(edtGaveta.Text) = '') then
    sGaveta := Trim(edtGaveta.Text);

  qryGeralDisc.Parameters[4].Value := sGaveta;

  //Marca/Fabricante
  if chkMarca.Checked then
    qryGeralDisc.Parameters[5].Value := '%'
  else
    qryGeralDisc.Parameters[5].Value := Dm_geral.qryMarcaMRC_ID.Value;

  // Seção.
  if (gp_sec4.Visible) then
    if not(CheckBox16.Checked) then
      qryGeralDisc.Parameters[6].Value := DM_Geral.qryCAdSecaoSEC_ID.Value;
  End;
  //
end;

procedure Tfrm_RelProduto.btn_GeraExcel_prodNaoMovimentadosClick(
  Sender: TObject);
begin
   ConfigProdutosNaoMovimentados;
   TGeraPlanilhaExcel.GeraXLS(dm_RelProduto.qry_ProdNaoMovto);
end;

procedure Tfrm_RelProduto.btn_GeralDiscXLSClick(Sender: TObject);
var
  i: Integer;
begin
  with DM_RelProduto do
  Begin
       // Configura Sentença SQL.
  ConfigGeralDiscSQL;
  // Configura Campos que irao aparecer na planilha.
  for i := 0 to qryGeralDisc.FieldCount - 1 do
    qryGeralDisc.Fields[i].Visible := False;
  // EAN ou Referencia.
  if rg_EanouRef.ItemIndex = 0 then
    qryGeralDiscpro_ean1.Visible := True
  else
    qryGeralDiscpro_referencia.Visible := True;
  // Descrição e Unidade.
  qryGeralDiscpro_descricao.Visible := True;
  qryGeralDiscpro_unidade.Visible   := True;
  //Fabricante
  if chk_mFabric.Checked then
    qryGeralDiscMRC_DESCRICAO.Visible := True;
  // Qtde Unidade.
  If chk_mQtdeUn.Checked Then
    qryGeralDiscpro_quant_unid.Visible := True;
  // Estoque
  If chk_mestoque.Checked Then
    qryGeralDiscpro_estoque.Visible := True
  else if chkUnEmbComp1.Checked then
    qryGeralDiscPRO_EMBUNIDADE.Visible := True;
  // Preço a Vista.
  If chk_MAvista.Checked Then
    qryGeralDiscpro_vlrvenda.Visible := True
  else if chkUnEmbComp2.Checked then
    qryGeralDiscPRO_EMBUNIDADE.Visible := True;
  // Pr. Prazo, Estoque Min., Estoque Max., CST
  If chk_mPrazo.Checked Then
    qryGeralDiscpro_vlrprazo.Visible := True
  else If chk_mMinimo2.Checked Then
    qryGeralDiscpro_estoqmin.Visible := True
  else if chk_mMaximo.Checked Then
    qryGeralDiscpro_estoqmax.Visible := True
  else If chk_cst.Checked Then
    qryGeralDisccst_id.Visible := True
  else if chkComissao.Checked then
    qryGeralDiscpro_comissao.Visible := True;

  // Pr. Custo, Custo Real, Pr. Medio, Pr. Atacado, Estoque Min, Gaveta, Aliquota
  If chk_mCusto.Checked Then
    qryGeralDiscpro_vlrcusto.Visible := True
  Else if chk_mCustoReal.Checked Then
    qryGeralDiscpro_custonota.Visible := True
  Else if chk_mMedio.Checked Then
    qryGeralDiscpro_vlrmedio.Visible := True
  Else If chk_atacado.Checked Then
    qryGeralDiscpro_vlratacado.Visible := True
  Else If chk_mMinimo.Checked Then
    qryGeralDiscpro_estoqmin.Visible := True
  Else If chk_gaveta.Checked Then
    qryGeralDiscpro_gaveta.Visible := True
  Else If chk_aliquota.Checked Then
    qryGeralDiscnaf_aliquota.Visible := True;
  // Total: Venda, Custo, Custo Real, Medio; PISCOFINS; Sugestao.
  If chk_mTotal.Checked Then
    qryGeralDisctotal_venda.Visible := True
  Else If chk_mTotalCusto.Checked Then
    qryGeralDisctotal_custo.Visible := True
  Else If chk_mTotalMedio.Checked Then
    qryGeralDisctotal_medio.Visible := True
  Else If chk_CodFrabric.Checked Then
    qryGeralDiscpro_codfab1.Visible := True
  Else If chk_CodNCM.Checked Then
    qryGeralDiscPRO_CODIGONBM.Visible := True
  Else If chk_mTotalCustoReal.Checked Then
    qryGeralDisctotal_custo_real.Visible := True
  Else if chk_mSugestiva.Checked Then
    qryGeralDiscsugestao.Visible := True;
  // Departamento
  if not(chk_agrupado.Checked) then
    qryGeralDiscdep_descricao.Visible := True;
  // Seção
  if not(chk_agrupado_secao.Checked) then
    qryGeralDiscsec_descricao.Visible := True;
  //atacado e varejo
  if (chk_AtacadoVarejo.Checked) then
    qryGeralDiscpro_vlrvenda.DisplayLabel := 'Varejo';
  if (chk_AtacadoVarejo.Checked) then
    qryGeralDiscpro_vlrprazo.DisplayLabel := 'Atacado';
  if not (chkAgrupaForn.Checked) then
    qryGeralDiscfor_nome.Visible := true;

  if (chk_CodBalanca.Checked) then
    qryGeralDiscPRO_CODBALANCA.Visible := true;


  // Gera a planilha.
  TGeraPlanilhaExcel.GeraXLS(qryGeralDisc);
  End;

end;

procedure Tfrm_RelProduto.ConfigFornecedorSQL;
const
  {$REGION 'SQLs'}
  SQL_Fornecedor =
    ' select '+
    '     for_nome, pro_ean1, pro_referencia, pro_descricao, '+
    '     pro_unidade, pro_estoque, pro_vlrcusto, '+
    '    (pro_estoque * pro_vlrcusto) as total,  '+
    '     PRO_VLRVENDA, PRO_VLRPRAZO '+
    ' from '+
    '   produto p, fornecedores f  '+
    ' where '+
    '   f.for_id = p.for_id and '+
    '   (convert(varchar(10),f.for_id) like :for_id)  and '+
    '   p.pro_ativo = ''A'' ';
  {$ENDREGION}
begin
  If not(chk_fornc.Checked) and (lkp_fornc.Text = '') then
  Begin
    MessageBox(handle,'Escolha um Fornecedor ou todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
    Abort;
  End;
  //
  with Dm_RelProduto do
  Begin
     qryFornecedor.Close;
     qryFornecedor.SQL.Clear;
     qryFornecedor.SQL.Add(SQL_Fornecedor);
    //
    if chk_estzero.Checked then
      qryFornecedor.SQL.Add(' and p.pro_estoque > 0 ');
    //
    qryFornecedor.SQL.Add(' Group by for_nome, pro_descricao,pro_ean1, pro_referencia, pro_unidade, pro_estoque, pro_vlrcusto, PRO_VLRVENDA, PRO_VLRPRAZO ');
    qryFornecedor.SQL.Add(' Order by for_nome, pro_descricao,pro_ean1, pro_referencia, pro_unidade, pro_estoque, pro_vlrcusto ');
    //
    if not(chk_fornc.Checked) then
      qryFornecedor.Parameters[0].Value := Dm_geral.qryCadFornecfor_id.Value
    else
      qryFornecedor.Parameters[0].Value := '%';
  End;

end;

procedure Tfrm_RelProduto.btn_FornecedorXLSClick(Sender: TObject);
begin
  with DM_RelProduto do
  Begin
       // Configura Sentença SQL.
      ConfigFornecedorSQL;
      case rg_FornecedorPreco.ItemIndex of
        0: Begin
          qryFornecedorpro_vlrcusto.Visible := True;
          qryFornecedortotal.Visible        := true;
          qryFornecedorPRO_VLRVENDA.Visible := False;
          qryFornecedorPRO_VLRPRAZO.Visible := False;
        end;
        1: Begin
          qryFornecedorpro_vlrcusto.Visible := False;
          qryFornecedortotal.Visible        := False;
          qryFornecedorPRO_VLRVENDA.Visible := True;
          qryFornecedorPRO_VLRPRAZO.Visible := True;
        end;
      End;
      // Gera a planilha.
      TGeraPlanilhaExcel.GeraXLS(qryFornecedor);
  End;
end;

procedure Tfrm_RelProduto.rgTipoRelClick(Sender: TObject);
begin
  if rgTipoRel.ItemIndex = 0 then
  begin
    chk_mFabric.Checked := False;
    chkMarca.Checked := True;
  end;
  //
  chk_mFabric.Enabled := rgTipoRel.ItemIndex = 1;
  gbMarca.Visible     := rgTipoRel.ItemIndex = 1;
end;

procedure Tfrm_RelProduto.rg_extratoAcumClick(Sender: TObject);
begin
  chk_AgrupaExtPorTipo.Enabled := not chk_Extrato_SoEntradas.Checked and (rg_extratoAcum.ItemIndex > 0);
  chk_AgrupaExtPorTipo.Checked := chk_AgrupaExtPorTipo.Enabled;
end;

procedure Tfrm_RelProduto.rg_ordemClick(Sender: TObject);
begin
  lblGaveta.Visible := rg_ordem.ItemIndex = 3;
  edtGaveta.Visible := rg_ordem.ItemIndex = 3;
end;

procedure Tfrm_RelProduto.CheckBox14Click(Sender: TObject);
begin
  DBLookupComboBox7.Enabled := not CheckBox14.Checked;
  Label26.Enabled           := not CheckBox14.Checked;
end;

procedure Tfrm_RelProduto.SpeedButton3Click(Sender: TObject);
begin
  ConfigNaturezaFiscal_Aliquota_Depto;
  with dm_RelProduto do
  TGeraPlanilhaExcel.GeraXLS(qryAliq);
end;

procedure Tfrm_RelProduto.SpeedButton4Click(Sender: TObject);
begin
  dblkp_ProdPisCofins.KeyValue:= Tfrm_PesqProduto.GetCodResult;
  dblkp_ProdPisCofins.SetFocus;
end;

procedure Tfrm_RelProduto.SpeedButton5Click(Sender: TObject);
begin
    ConfigPisCofins;
    with dm_RelProduto do
    TGeraPlanilhaExcel.GeraXLS(qry_ProdPisCofins);
end;

procedure Tfrm_RelProduto.SpeedButton6Click(Sender: TObject);
begin
  dblkp_ProdNaoMovto.KeyValue:= Tfrm_PesqProduto.GetCodResult;
  dblkp_ProdNaoMovto.SetFocus;
end;

procedure Tfrm_RelProduto.SpeedButton7Click(Sender: TObject);
begin
  ConfigMovimentacao;
  with dm_RelProduto do
  TGeraPlanilhaExcel.GeraXLS(qryMovimentacao);
end;

procedure Tfrm_RelProduto.btnProdSemMovMargemHelpClick(Sender: TObject);
begin
  Application.MessageBox(PChar(
    'Esta margem será comparada com as saídas de cada produto'#13#10 +
    'em relação as entradas. Por exemplo:'#13#10 +
    ' - Produto X teve 50 entradas e 10 saídas no período.'#13#10 +
    'Se o valor da margem for 30%, então o sistema considera'#13#10 +
    'o produto como sem movimento, pois não atingiu a margem.'#13#10 +
    ' - 50 * 30 / 100 = 15 (15 é maior que as 10 saídas).'#13#10 +
    'Porém se a margem for 10% este produto tem como alvo 5 saídas.'#13#10 +
    'Logo o sistema considera que houve movimento.'),
    'AVISO', MB_ICONINFORMATION
  );
end;

procedure Tfrm_RelProduto.btn_EstoquePorDataXLSClick(Sender: TObject);
begin
  with dm_RelProduto do
  try
    Pnl_aguarde_estoque_data.Visible := True;
    update;

    if Dt_GeraEstData.Date > Date then
    begin
      MessageBox(handle,'A data do Estoque não pode ser maior que a data de hoje!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
      Exit;
    end;

    if not(chk_fornecedor.Checked) and (Trim(lkp_fornecedor.Text) = '') then
    begin
      MessageBox(handle,'Escolha um Fornecedor ou Todos', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    ConfigGeraEstoquePorData;

    qry_AuxiliaInvetario.Open;

    if qry_AuxiliaInvetario.IsEmpty then
    begin
      MessageBox(handle,'Não há dados para opção selecionada!', 'ATENÇÃO!', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    TGeraPlanilhaExcel.GeraXLS(qry_AuxiliaInvetario);
  finally
      Pnl_aguarde_estoque_data.Visible := False;
      update;

    qry_AuxiliaInvetario.Close;
  end;
end;

procedure Tfrm_RelProduto.CheckBox15Click(Sender: TObject);
begin
  DBLookupComboBox8.Enabled := not CheckBox15.Checked;
  Label27.Enabled           := not CheckBox15.Checked;
end;

procedure Tfrm_RelProduto.chk_fornecedorClick(Sender: TObject);
begin
  lkp_fornecedor.Enabled  := not chk_fornecedor.Checked;
  lbl_fornecedor.Enabled  := not chk_fornecedor.Checked;
  spd_fornecedor.Visible  := not chk_fornecedor.Checked;
end;

procedure Tfrm_RelProduto.chk_For_Obs_CodFabClick(Sender: TObject);
begin
  lkp_For_Obs_CodFab.Enabled  := not chk_For_Obs_CodFab.Checked;
  lbl_For_Obs_CodFab.Enabled  := not chk_For_Obs_CodFab.Checked;
  spd_For_Obs_CodFab.Visible  := not chk_For_Obs_CodFab.Checked;
end;

end.
