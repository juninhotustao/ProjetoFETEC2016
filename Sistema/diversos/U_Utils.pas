unit U_Utils;

interface

uses
  U_Calculos;

type
  TMestre = class
  private
    FMesCoo: Integer;
    FPdvId: Integer;
    FMesData: TDateTime;
    FTotalDesc: Double;
    FVDD_ID: Variant;
  public
    property MesCoo: Integer read FMesCoo;
    property PdvId: Integer read FPdvId;
    property MesData: TDateTime read FMesData;
    property TotalDesc: Double read FTotalDesc;
    property VDD_ID: Variant read FVDD_ID;

    constructor Create(AMesCoo, APdvId: Integer; AMesData: TDateTime;
      ATotalDesc: Double; AVDD_ID:Variant); overload;
  end;

  TFieldsItemEnt = U_Calculos.TFieldsItemEnt;

  TTipoItem = (Produto, Combustivel, Servico, Bico);

  TItemVenda = class
  strict private
    FTipo : TTipoItem;
    FId : Integer;
    FDescricao : String;
    FUn : String;
    FCst : String;
    FCstFora : String;
    FAliquota : Double;
    FCfopDentro : Integer;
    FCfopFora : Integer;
    FAtivo : String;
    FVlrCusto : Double;
    FVlrCustoReal : Double;
    FVlrVenda : Double;
    FVlrAtacado : Double;
	  FVlrPrazo : Double;
	  FVlrMedio : Double;
	  FVlrPromocao : Double;
    FMva : Double;
    FMvaAjustada : Double;
    FCfsId : String;
    FComissao : Double;
    FDescResumida : String;
    FStpcCodigoSai : Integer;
    FPisCofinsTipoCalcSai : Variant;
    FAliqST : Double;
    FAliqSTFora : Double;
    FAliqPisSai : Double;
    FAliqCofinsSai : Double;
    FAliqPisVlrSai : Double;
    FAliqCofinsVlrSai : Double;
    FReducaoBaseCalc : Double;
    FAliqCsosn: Double;
    FCalcDescIcms: Boolean;
    FCodNcm: String;
    FStiCodigoSai : Variant;
    FIPITipoCalcSai : Variant;
    FAliqIPISai : Double;
    FAliqIPIVlrSai : Double;
    FCfopCupom : Integer;
    FAliqCompra: Double;
    FStiCodigo: Variant;
    FAliqIPI: Double;
    FIPITipoCalc: Variant;
    FAliqIPIVlr: Double;
    FMargemVenda: Double;
    FMargemPrazo: Double;
    FMargemAtacado: Double;
    FStpcCodigo: Integer;
    FPisCofinsTipoCalc: Variant;
    FAliqPisVlr: Double;
    FAliqCofinsVlr: Double;
    FAliqPis: Double;
    FAliqCofins: Double;
    FTipoDescAcres: Char;
    FDescAcresAutom: Double;
    FNcmAliqFed: Double;
    FNcmAliqEst: Double;
    FNcmAliqMun: Double;
    FNcmFonte: String;
    FNcmChave: String;
    FVlrMinimo : Double;
    FMargemMinimo: Double;
  public
    property Tipo : TTipoItem read FTipo;
    property Id : Integer read FId;
    property Descricao : String read FDescricao;
    property Un : String read FUn;
    property Cst : String read FCst;
    property CstFora : String read FCstFora;
    property Aliquota : Double read FAliquota;
    property CfopDentro : Integer read FCfopDentro;
    property CfopFora : Integer read FCfopFora;
    property Ativo : String read FAtivo;
    property VlrCusto : Double read FVlrCusto;
    property VlrCustoReal : Double read FVlrCustoReal;
    property VlrVenda : Double read FVlrVenda;
    property VlrAtacado : Double read FVlrAtacado;
	  property VlrPrazo : Double read FVlrPrazo;
	  property VlrMedio : Double read FVlrMedio;
	  property VlrPromocao : Double read FVlrPromocao;
    property Mva : Double read FMva;
    property MvaAjustada : Double read FMvaAjustada;
    property CfsId : String read FCfsId;
    property Comissao : Double read FComissao;
    property DescResumida : String read FDescResumida;
    property StpcCodigoSai : Integer read FStpcCodigoSai;
    property PisCofinsTipoCalcSai : Variant read FPisCofinsTipoCalcSai;
    property AliqST : Double read FAliqST;
    property AliqSTFora : Double read FAliqSTFora;
    property AliqPisSai : Double read FAliqPisSai;
    property AliqCofinsSai : Double read FAliqCofinsSai;
    property AliqPisVlrSai : Double read FAliqPisVlrSai;
    property AliqCofinsVlrSai : Double read FAliqCofinsVlrSai;
    property ReducaoBaseCalc : Double read FReducaoBaseCalc;
    property AliqCsosn : Double read FAliqCsosn;
    property CalcDescIcms : Boolean read FCalcDescIcms;
    property CodNcm: String read FCodNcm;
    property NcmAliqFed: Double read FNcmAliqFed;
    property NcmAliqEst: Double read FNcmAliqEst;
    property NcmAliqMun: Double read FNcmAliqMun;
    property NcmFonte: String read FNcmFonte;
    property NcmChave: String read FNcmChave;
    property StiCodigoSai : Variant read FStiCodigoSai;
    property IPITipoCalcSai : Variant read FIPITipoCalcSai;
    property AliqIPISai : Double read FAliqIPISai;
    property AliqIPIVlrSai : Double read FAliqIPIVlrSai;
    property CfopCupom : Integer read FCfopCupom;
    property AliqCompra: Double read FAliqCompra;
    property StiCodigo : Variant read FStiCodigo;
    property IPITipoCalc : Variant read FIPITipoCalc;
    property AliqIPI : Double read FAliqIPI;
    property AliqIPIVlr : Double read FAliqIPIVlr;
    property MargemVenda: Double read FMargemVenda;
    property MargemPrazo: Double read FMargemPrazo;
    property MargemAtacado: Double read FMargemAtacado;
    property StpcCodigo: Integer read FStpcCodigo;
    property PisCofinsTipoCalc: Variant read FPisCofinsTipoCalc;
    property AliqPis: Double read FAliqPis;
    property AliqCofins: Double read FAliqCofins;
    property AliqPisVlr: Double read FAliqPisVlr;
    property AliqCofinsVlr: Double read FAliqCofinsVlr;
    property TipoDescAcres: Char read FTipoDescAcres;
    property DescAcresAutom: Double read FDescAcresAutom;
    property VlrMinimo : Double read FVlrMinimo;
    property MargemMinimo: Double read FMargemMinimo;
    //
    constructor Create(
      Tipo: TTipoItem; Id, CfopDentro, CfopFora, CfopCupom, StpcCodigoSai,
      StpcCodigo: Integer; Descricao, Un, Cst, CstFora, Ativo, CfsId,
      DescResumida, CodNcm, NcmFonte, NcmChave: String; NcmAliqFed, NcmAliqEst, NcmAliqMun,
      Aliquota, VlrCusto, VlrCustoReal, VlrVenda,
      VlrAtacado, VlrPrazo, VlrMedio, VlrPromocao, Mva, MvaAjustada, AliqST,
      AliqSTFora, Comissao, AliqPisSai, AliqCofinsSai, AliqPisVlrSai,
      AliqCofinsVlrSai, ReducaoBaseCalc, AliqCsosn, AliqIPISai, AliqIPIVlrSai,
      AliqCompra, AliqIPI, AliqIPIVlr, MargemVenda, MargemPrazo,
      MargemAtacado, AliqPis, AliqCofins, AliqPisVlr, AliqCofinsVlr,
      DescAcresAutom, VlrMinimo, MargemMinimo : Double;
      CalcDescIcms: Boolean; PisCofinsTipoCalcSai,
      StiCodigoSai, IPITipoCalcSai, StiCodigo, IPITipoCalc,
      PisCofinsTipoCalc: Variant; TipoDescAcres: Char
    ); overload;
  end;

  function GetFunction(const Module: HMODULE; const FuncName: PAnsiChar): Pointer;

implementation

uses
  Windows, SysUtils;

function GetFunction(const Module: HMODULE; const FuncName: PAnsiChar): Pointer;
begin
  Result := GetProcAddress(Module, FuncName);

  if not Assigned(Result) then
    raise Exception.Create('A fun��o remota ("' + FuncName + '") n�o foi encontrada.');
  //
end;

{ TMestre }

constructor TMestre.Create(AMesCoo, APdvId: Integer; AMesData: TDateTime;
  ATotalDesc: Double; AVDD_ID:Variant);
begin
  FMesCoo    := AMesCoo;
  FPdvId     := APdvId;
  FMesData   := AMesData;
  FTotalDesc := ATotalDesc;
  FVDD_ID    := AVDD_ID;
end;

{ TItemVenda }

constructor
  TItemVenda.Create(Tipo: TTipoItem; Id, CfopDentro, CfopFora, CfopCupom,
    StpcCodigoSai, StpcCodigo: Integer; Descricao, Un, Cst, CstFora, Ativo, CfsId,
    DescResumida, CodNcm, NcmFonte, NcmChave: String; NcmAliqFed, NcmAliqEst, NcmAliqMun,
    Aliquota, VlrCusto, VlrCustoReal, VlrVenda,
    VlrAtacado, VlrPrazo, VlrMedio,VlrPromocao, Mva, MvaAjustada, AliqST,
    AliqSTFora, Comissao, AliqPisSai, AliqCofinsSai, AliqPisVlrSai, AliqCofinsVlrSai,
    ReducaoBaseCalc, AliqCsosn, AliqIPISai, AliqIPIVlrSai, AliqCompra, AliqIPI,
    AliqIPIVlr, MargemVenda, MargemPrazo, MargemAtacado, AliqPis, AliqCofins,
    AliqPisVlr, AliqCofinsVlr, DescAcresAutom, VlrMinimo, MargemMinimo : Double;
    CalcDescIcms: Boolean;
    PisCofinsTipoCalcSai, StiCodigoSai, IPITipoCalcSai, StiCodigo, IPITipoCalc,
    PisCofinsTipoCalc: Variant; TipoDescAcres: Char);
begin
  FTipo                 := Tipo;
  FId                   := Id;
  FDescricao            := Descricao;
  FUn                   := Un;
  FCst                  := Cst;
  FCstFora              := CstFora;
  FAliquota             := Aliquota;
  FCfopDentro           := CfopDentro;
  FCfopFora             := CfopFora;
  FCfopCupom            := CfopCupom;
  FAtivo                := Ativo;
  FVlrCusto             := VlrCusto;
  FVlrCustoReal         := VlrCustoReal;
  FVlrVenda             := VlrVenda;
  FVlrAtacado           := VlrAtacado;
  FVlrPrazo             := VlrPrazo;
  FVlrMedio             := VlrMedio;
  FVlrPromocao          := VlrPromocao;
  FMva                  := Mva;
  FMvaAjustada          := MvaAjustada;
  FAliqST               := AliqST;
  FAliqSTFora           := AliqSTFora;
  FCfsId                := CfsId;
  FComissao             := Comissao;
  FDescResumida         := DescResumida;
  FCodNcm               := CodNcm;
  FNcmAliqFed           := NcmAliqFed;
  FNcmAliqEst           := NcmAliqEst;
  FNcmAliqMun           := NcmAliqMun;
  FNcmFonte             := NcmFonte;
  FNcmChave             := NcmChave;
  FStpcCodigoSai        := StpcCodigoSai;
  FAliqPisSai           := AliqPisSai;
  FAliqCofinsSai        := AliqCofinsSai;
  FAliqPisVlrSai        := AliqPisVlrSai;
  FAliqCofinsVlrSai     := AliqCofinsVlrSai;
  FReducaoBaseCalc      := ReducaoBaseCalc;
  FAliqCsosn            := AliqCsosn;
  FCalcDescIcms         := CalcDescIcms;
  FPisCofinsTipoCalcSai := PisCofinsTipoCalcSai;
  FStiCodigoSai         := StiCodigoSai;
  FIPITipoCalcSai       := IPITipoCalcSai;
  FAliqIPISai           := AliqIPISai;
  FAliqIPIVlrSai        := AliqIPIVlrSai;
  FAliqCompra           := AliqCompra;
  FStiCodigo            := StiCodigo;
  FIPITipoCalc          := IPITipoCalc;
  FAliqIPI              := AliqIPI;
  FAliqIPIVlr           := AliqIPIVlr;
  FMargemVenda          := MargemVenda;
  FMargemPrazo          := MargemPrazo;
  FMargemAtacado        := MargemAtacado;
  FStpcCodigo           := StpcCodigo;
  FPisCofinsTipoCalc    := PisCofinsTipoCalc;
  FAliqPis              := AliqPis;
  FAliqCofins           := AliqCofins;
  FAliqPisVlr           := AliqPisVlr;
  FAliqCofinsVlr        := AliqCofinsVlr;
  FTipoDescAcres        := TipoDescAcres;
  FDescAcresAutom       := DescAcresAutom;
  FVlrMinimo            := VlrMinimo;
  FMargemMinimo         := MargemMinimo;
end;

end.

