unit U_Calculos;

interface

uses
  Windows, ADODB, Messages, Dialogs, Forms, SysUtils, DB, DBClient;

type
  TPisCofins = class
  strict protected
    FStpcCodigo : string;
    FTipoCalculo : string;
    FBaseCalc : string;
    FAliqPerc : string;
    FAliqVlr : string;
    FQtdeBaseCalc : string;
    FValor : String;
  public
    property StpcCodigo : string read FStpcCodigo;
    property TipoCalculo : string read FTipoCalculo;
    property BaseCalc : string read FBaseCalc;
    property AliqPerc : string read FAliqPerc;
    property AliqVlr : string read FAliqVlr;
    property QtdeBaseCalc : string read FQtdeBaseCalc;
    property Valor : string read FValor;
    constructor Create(AStpcCodigo, ATipoCalculo, ABaseCalc, AAliqPerc,
      AAliqVlr, AQtdeBaseCalc, AValor: string); overload;
  end;

  TFieldsItemEnt = class
  private
    FCst: string;
    FVlrIcms: string;
    FQtde: string;
    FVlrUnitReal: string;
    FVlrUnit: string;
    FVlrDescItem: string;
    FVlrDesc: string;
    FRateioFreteBC: string;
    FRateioSeguroBC: string;
    FRateioOutrasBC: string;
    FVlrIpi: string;
    FVlrIcmsSubst: string;
    FVlrPis: string;
    FVlrCofins: string;
  public
    constructor Create(ACst, AVlrIcms, AQtde, AVlrUnitReal, AVlrUnit,
      AVlrDescItem, AVlrDesc, ARateioFreteBC, ARateioSeguroBC, ARateioOutrasBC,
      AVlrIpi, AVlrIcmsSubst, AVlrPis, AVlrCofins: string); overload;
  end;

  TCorrecao = class
  strict private
    FVlrPerc: Double;
    FDiasCarencia: integer;
  public
    property VlrPerc: Double read FVlrPerc;
    property DiasCarencia: Integer read FDiasCarencia;

    class function getCorrecao: TCorrecao;
  end;

  TCalculos = class
    class procedure CalculaRateioSubst(var Dts:TADODataSet; Cst_Habilita_Subst, CampoVlrItem : String; CampoRateioOutras : array of String; TotalItem : Extended; VlrOutras : array of Extended; Saida : Boolean);
    class procedure CalculaRateioICMS(var Dts:TADODataSet; CampoVlrItem : String; CampoRateioOutras : array of String; TotalItem : Extended; VlrOutras : array of Extended);
    class procedure CalculaPrCustoReal(AFieldsItemEnt: TFieldsItemEnt; ADataSet: TDataSet);
    class procedure LimpaPisCofins(const APisCofins: TPisCofins; var ADataSet: TDataSet);
    class function ValidaPisCofins(APisCofins : TPisCofins; ADataSet : TDataSet): Boolean;
    class function CalculoReceberCorrigido(VlrReceber: Double; DtRecebto,
      DtVencto: TDateTime; Correcao: TCorrecao):Double;
    class function GetPrecoMedio(AEstoque, AEstoqueInf, ACusto, ACustoInf: Double): Double;
    class function GetPrecoVenda(ACusto, AMargem: Double):Double;
    class function GetValorCusto(CustoReal, Margem, Quantidade: Double; iProId:Integer): Double;
  end;

implementation

uses U_DMRet, Math, Variants, U_FuncUtils, U_GeraPlanilhaExcel, U_Percentual;

{ TCalculos }

class procedure TCalculos.CalculaPrCustoReal(AFieldsItemEnt: TFieldsItemEnt;
  ADataSet: TDataSet);
  {$REGION 'SQL'}
const
  SqlParams =
      ' select '+
      '   PAR_CALCPRECOCUSTOREAL, '+
      '   PAR_CALCREAL_SOMA_DESCONTO, PAR_CALCREAL_SOMA_ICMS, '+
      '   PAR_CALCREAL_SOMA_ICMSST, PAR_CALCREAL_SOMA_PISCOFINS, '+
      '   PAR_CALCREAL_SOMA_FRETE, PAR_CALCREAL_SOMA_SEGURO, '+
      '   PAR_CALCREAL_SOMA_OUTRAS, PAR_CALCREAL_SOMA_IPI, '+
      '   PAR_CALCREAL_DIMI_DESCONTO, PAR_CALCREAL_DIMI_ICMS, '+
      '   PAR_CALCREAL_DIMI_ICMSST, PAR_CALCREAL_DIMI_PISCOFINS, '+
      '   PAR_CALCREAL_DIMI_FRETE, PAR_CALCREAL_DIMI_SEGURO, '+
      '   PAR_CALCREAL_DIMI_OUTRAS, PAR_CALCREAL_DIMI_IPI '+
      ' from '+
      '   PARAMS ';
  {$ENDREGION}
var
  tmpDesc, VlrDescItem, VlrIcms, VlrIcmsST, VlrPis, VlrCofins, VlrFrete,
  VlrSeguro, VlrOutras, VlrIPI,  VlrSoma, VlrDiminui : Double;

  pAutomatico, pDesconto_S, pIcms_S, pIcmsST_S, pPisCofins_S, pFrete_S,
  pSeguro_S, pOutras_S, pIPI_S, pDesconto_D, pIcms_D, pIcmsST_D, pPisCofins_D,
  pFrete_D, pSeguro_D, pOutras_D, pIPI_D : Boolean;
begin
  {$REGION 'Buscando os Parametros'}
  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(SqlParams, []);

    pAutomatico   := (FieldByName('PAR_CALCPRECOCUSTOREAL').Value = 'A');
    pDesconto_S   := (FieldByName('PAR_CALCREAL_SOMA_DESCONTO').Value = 'S');
    pIcms_S       := (FieldByName('PAR_CALCREAL_SOMA_ICMS').Value = 'S');
    pIcmsST_S     := (FieldByName('PAR_CALCREAL_SOMA_ICMSST').Value = 'S');
    pPisCofins_S  := (FieldByName('PAR_CALCREAL_SOMA_PISCOFINS').Value = 'S');
    pFrete_S      := (FieldByName('PAR_CALCREAL_SOMA_FRETE').Value = 'S');
    pSeguro_S     := (FieldByName('PAR_CALCREAL_SOMA_SEGURO').Value = 'S');
    pOutras_S     := (FieldByName('PAR_CALCREAL_SOMA_OUTRAS').Value = 'S');
    pIPI_S        := (FieldByName('PAR_CALCREAL_SOMA_IPI').Value = 'S');
    pDesconto_D   := (FieldByName('PAR_CALCREAL_DIMI_DESCONTO').Value = 'S');
    pIcms_D       := (FieldByName('PAR_CALCREAL_DIMI_ICMS').Value = 'S');
    pIcmsST_D     := (FieldByName('PAR_CALCREAL_DIMI_ICMSST').Value = 'S');
    pPisCofins_D  := (FieldByName('PAR_CALCREAL_DIMI_PISCOFINS').Value = 'S');
    pFrete_D      := (FieldByName('PAR_CALCREAL_DIMI_FRETE').Value = 'S');
    pSeguro_D     := (FieldByName('PAR_CALCREAL_DIMI_SEGURO').Value = 'S');
    pOutras_D     := (FieldByName('PAR_CALCREAL_DIMI_OUTRAS').Value = 'S');
    pIPI_D        := (FieldByName('PAR_CALCREAL_DIMI_IPI').Value = 'S');
  finally
    Free;
  end;
  {$ENDREGION}

  if not(pAutomatico) then Exit;

  {$REGION 'Inicializando as Variaveis'}
  VlrIcms     := 0;
  VlrIcmsST   := 0;
  VlrPis      := 0;
  VlrCofins   := 0;
  VlrFrete    := 0;
  VlrSeguro   := 0;
  VlrOutras   := 0;
  VlrIPI      := 0;
  VlrDescItem := 0;

  VlrSoma     := 0;
  VlrDiminui  := 0;
  {$ENDREGION}

  with ADataSet, AFieldsItemEnt do
  begin
      {$REGION 'Atribuindo valores as Variaveis'}
      //Inicio Calculo Desconto
      if Trim(FVlrDescItem) = '' then  //Utilizado para quando não tem dois campos de desconto, como por exemplo a importação do XML
        tmpDesc := 0
      else
        tmpDesc := FieldByName(FVlrDescItem).Value;

      VlrDescItem := (tmpDesc + FieldByName(FVlrDesc).Value) / FieldByName(FQtde).Value;
      //Final Calculo Desconto

      VlrIcms    := FieldByName(FVlrIcms).Value / FieldByName(FQtde).Value;
      VlrIcmsST  := FieldByName(FVlrIcmsSubst).Value / FieldByName(FQtde).Value;
      VlrPis     := FieldByName(FVlrPis).Value / FieldByName(FQtde).Value;
      VlrCofins  := FieldByName(FVlrCofins).Value / FieldByName(FQtde).Value;
      VlrFrete   := FieldByName(FRateioFreteBC).Value / FieldByName(FQtde).Value;
      VlrSeguro  := FieldByName(FRateioSeguroBC).Value / FieldByName(FQtde).Value;
      VlrOutras  := FieldByName(FRateioOutrasBC).Value / FieldByName(FQtde).Value;
      VlrIPI     := FieldByName(FVlrIpi).Value / FieldByName(FQtde).Value;
      {$ENDREGION}

      {$REGION 'Tratando a condição que SOMA'}
      //Iniciando a condição que soma
      if pDesconto_S then VlrSoma := VlrSoma + VlrDescItem;
      if pIcms_S then VlrSoma := VlrSoma + VlrIcms;
      if pIcmsST_S then VlrSoma := VlrSoma + VlrIcmsST;
      if pPisCofins_S then VlrSoma := VlrSoma + VlrPis + VlrCofins;
      if pFrete_S then VlrSoma := VlrSoma + VlrFrete;
      if pSeguro_S then VlrSoma := VlrSoma + VlrSeguro;
      if pOutras_S then VlrSoma := VlrSoma + VlrOutras;
      if pIPI_S then VlrSoma := VlrSoma + VlrIPI;
      {$ENDREGION}

      {$REGION 'Tratando a condição que DIMINUI'}
      //Iniciando a condição que diminui
      if pDesconto_D then VlrDiminui := VlrDiminui + VlrDescItem;
      if pIcms_D then VlrDiminui := VlrDiminui + VlrIcms;
      if pIcmsST_D then VlrDiminui := VlrDiminui + VlrIcmsST;
      if pPisCofins_D then VlrDiminui := VlrDiminui + VlrPis + VlrCofins;
      if pFrete_D then VlrDiminui := VlrDiminui + VlrFrete;
      if pSeguro_D then VlrDiminui := VlrDiminui + VlrSeguro;
      if pOutras_D then VlrDiminui := VlrDiminui + VlrOutras;
      if pIPI_D then VlrDiminui := VlrDiminui + VlrIPI;
      {$ENDREGION}

      //Calcula preço de custo real
      FieldByName(FVlrUnitReal).value := FieldByName(FVlrUnit).Value +
                                                             VlrSoma -
                                                             VlrDiminui;
  end;
end;

class function TCalculos.GetPrecoMedio(AEstoque, AEstoqueInf, ACusto,
  ACustoInf: Double): Double;
begin
  if AEstoque <= 0 then
    Result := ACustoInf
  else
    Result := ((AEstoque*ACusto) + (AEstoqueInf*ACustoInf)) / (AEstoque+AEstoqueInf);
end;

class function TCalculos.GetPrecoVenda(ACusto, AMargem: Double): Double;
begin
  Result := ACusto * (1 + AMargem/100);
end;

class function TCalculos.GetValorCusto(CustoReal, Margem, Quantidade: Double;
iProId:Integer): Double;
const
  {$REGION 'Comandos SQL'}
  SQL_PRODUTO =
    ' select' +
    '	  PRO_ESTOQUE, PRO_VLRMEDIO '+
    ' from' +
    '	  PRODUTO' +
    ' where' +
    '	  PRO_ID = :PRO_ID';

  SQL_PARAMS =
    'SELECT PAR_PROD_ALT_PRECO_VENDA, PAR_CALC_MARG_MEDIO FROM PARAMS';
  {$ENDREGION}
var
  PAlteraPrecoVenda, PMargemPorPrecoMedio : Char;
  Estoque, Custo: Double;
begin
  Result := 0;

  //Carrega os parâmtros
  with TClientDataSet.Create(nil) do
  begin
    Data := DMRet.GetData(SQL_PARAMS,[]);
    PAlteraPrecoVenda    := FieldByName('PAR_PROD_ALT_PRECO_VENDA').AsString[1];
    PMargemPorPrecoMedio := FieldByName('PAR_CALC_MARG_MEDIO').AsString[1];
  end;

  //Varifica se está configruado para alterar preço de venda
  if PAlteraPrecoVenda <> 'S' then
    Exit;

  //Valida o Custo e real e margem
  if (CustoReal <= 0) or (Margem <= 0) then
    Exit;

  //Carrega as informações do produto
  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(SQL_PRODUTO, [iProId]);

    Estoque := FieldByName('PRO_ESTOQUE').AsFloat;
    Custo   := FieldByName('PRO_VLRMEDIO').AsFloat;
  finally
    Free;
  end;

  //Valida se o valor para calcular a margem será o custo medio ou custo real
  if PMargemPorPrecoMedio = 'S' then
    Result := TCalculos.GetPrecoMedio(Estoque, Quantidade, Custo, CustoReal)
  else
    Result := CustoReal;

end;

class procedure TCalculos.CalculaRateioICMS(var Dts: TADODataSet;
  CampoVlrItem: String; CampoRateioOutras: array of String; TotalItem: Extended;
  VlrOutras: array of Extended);
var
  i: Integer;
begin
  if not (Dts.State in [dsInsert, dsEdit]) then Exit;

  try
    //rateio Frete, Seguro e Outras Despesas
    for i := Low(CampoRateioOutras) to High(CampoRateioOutras) do
      Dts.FieldByName(CampoRateioOutras[i]).Value  := TFuncUtils.Arredondar(Dts.FieldByName(CampoVlrItem).Value * VlrOutras[i]/TotalItem,2);
  except
    raise Exception.Create('Falha no Rateio do Frete, Seguro e Outras Despesas');
  end;
end;

class procedure TCalculos.CalculaRateioSubst(var Dts: TADODataSet;
  Cst_Habilita_Subst, CampoVlrItem: String; CampoRateioOutras: array of String;
  TotalItem: Extended; VlrOutras: array of Extended; Saida: Boolean);
var
  i: Integer;
begin
  if not (Dts.State in [dsInsert, dsEdit]) then Exit;

  try
    //Somente os cst abaixo e o paramentro no cadastro de empresa estiver marcado que irá gerar o rateio
    if (Dts.FieldByName(Cst_Habilita_Subst).Value = 'S') and (DMRet.OpenSQL('select emp_calc_subst_prod from empresas', []) = 'S') then
    begin
      //rateio Frete, Seguro e Outras Despesas
      for i := Low(CampoRateioOutras) to High(CampoRateioOutras) do
        Dts.FieldByName(CampoRateioOutras[i]).Value  := TFuncUtils.Arredondar(Dts.FieldByName(CampoVlrItem).Value * VlrOutras[i]/TotalItem,2);
    end else
    begin
      //Frete, Seguro e Outras Despesas recebendo 0, pois nao atendem as condições acima estabelecidas
      for i := Low(CampoRateioOutras) to High(CampoRateioOutras) do
        Dts.FieldByName(CampoRateioOutras[i]).Value  := 0;
    end;
  except
    raise Exception.Create('Falha no Rateio do Frete, Seguro e Outras Despesas');
  end;
end;

class function TCalculos.CalculoReceberCorrigido(VlrReceber: Double; DtRecebto,
  DtVencto: TDateTime; Correcao: TCorrecao): Double;
const
  SQL_PARAMS = ' select '+
               '   PAR_REC_CORRECAOTELA, '+
               '   cast(PAR_FATOR_COEF2 as Numeric(13,4)) as PAR_FATOR_COEF2, '+
               '   isnull(PAR_REC_DIASDECARENCIA,0) as PAR_REC_DIASDECARENCIA '+
               ' from '+
               '   params';
var
  Present: TDateTime;
  NumeroDias: integer;
  M, C, i, t: Extended;
begin
  //Buscando a data que seja pago para corrigir o documento
  Present:= DtRecebto;

  //Pega o Numero de dias Atrasados
  if (Correcao.DiasCarencia > 0) then
    NumeroDias := trunc(Present) -  trunc(DtVencto) - Correcao.DiasCarencia
  else
    NumeroDias := trunc(Present) -  trunc(DtVencto);

  if (NumeroDias < 0) then
      NumeroDias := 0;

  //Calculando o Valor Corrigido
  C := VlrReceber;//Valor a corrigir
  i := (Correcao.VlrPerc/100);//Taxa
  t := (NumeroDias/30);//Coeficiente para calculo dos juros no periodo
  M := C * Power(1 + i, t);//Valor Final

  result := strToFloat(FormatFloat('0.00',M));
end;

class procedure TCalculos.LimpaPisCofins(const APisCofins: TPisCofins;
  var ADataSet: TDataSet);
begin
  with APisCofins, ADataSet do
  case FieldByName(StpcCodigo).AsInteger of
    1,2:
    begin
      FieldByName(TipoCalculo).AsString := 'P';
      FieldByName(QtdeBaseCalc).AsFloat := 0;
    end;

    3:
    begin
      FieldByName(TipoCalculo).AsString := 'V';
      FieldByName(BaseCalc).AsFloat     := 0;
    end;

    4,6..9,70..74:
    begin
      FieldByName(TipoCalculo).AsVariant := NULL;
      FieldByName(BaseCalc).AsFloat      := 0;
      FieldByName(QtdeBaseCalc).AsFloat  := 0;
      FieldByName(AliqPerc).AsFloat      := 0;
      FieldByName(Valor).AsFloat         := 0;
    end;

    49,50..56,60..67,98,99:
    begin
      if FieldByName(TipoCalculo).IsNull then
      begin
        FieldByName(BaseCalc).AsFloat      := 0;
        FieldByName(QtdeBaseCalc).AsFloat  := 0;
        FieldByName(AliqPerc).AsFloat      := 0;
        FieldByName(Valor).AsFloat         := 0;
      end
      else if FieldByName(TipoCalculo).AsString = 'V' then
        FieldByName(BaseCalc).AsFloat := 0
      else
        FieldByName(QtdeBaseCalc).AsFloat := 0;
      //
    end;
  end;
end;

class function TCalculos.ValidaPisCofins(APisCofins: TPisCofins;
  ADataSet: TDataSet): Boolean;
begin
  Result := True;
  //
  with APisCofins, ADataSet do
  begin
    if FieldByName(StpcCodigo).AsInteger in [70,71,72,73,74] then
      Exit;

    if FieldByName(TipoCalculo).IsNull then
    begin
      Application.MessageBox(pchar('O campo "'+FieldByName(TipoCalculo).DisplayName+
        '" deve ser preechido!'),PChar(Application.Title),MB_ICONINFORMATION);
      Result := False;
      Exit;
    end;

    // Outras Entradas
    if FieldByName(StpcCodigo).AsInteger in [75,98,99] then
    begin
      // Percentual
      if FieldByName(TipoCalculo).Value = 'P' then
      begin
        if ((FieldByName(BaseCalc).Value  > 0) or (FieldByName(AliqPerc).Value > 0) or
           (FieldByName(Valor).Value > 0)) and ((FieldByName(BaseCalc).Value = 0) or
           (FieldByName(AliqPerc).Value = 0) or (FieldByName(Valor).Value = 0)) then
        begin
          Application.MessageBox(
            pchar('Quando informado '+FieldByName(BaseCalc).DisplayName+', '+
            FieldByName(AliqPerc).DisplayName+' ou '+
            FieldByName(Valor).DisplayName+' todos estes devem ser preechidos.'),
            'ATENÇÃO!', MB_ICONINFORMATION);
          Result := False;
          Exit;
        end;
      end
      else //Qtde
        if ((FieldByName(QtdeBaseCalc).Value  > 0) or (FieldByName(AliqVlr).Value > 0) or
           (FieldByName(Valor).Value > 0)) and ((FieldByName(QtdeBaseCalc).Value = 0) or
           (FieldByName(AliqVlr).Value = 0) or (FieldByName(Valor).Value = 0)) then
        begin
          Application.MessageBox(
            pchar('Quando informado '+FieldByName(QtdeBaseCalc).DisplayName+', '+
            FieldByName(AliqVlr).DisplayName+' ou '+
            FieldByName(Valor).DisplayName+' todos estes devem ser preechidos.'),
            'ATENÇÃO!', MB_ICONINFORMATION);
          Result := False;
          Exit;
        end;
    end
    else
    begin
      //Percentual
      if FieldByName(TipoCalculo).Value = 'P' then
      begin
        if not(TFuncUtils.ValidNumericField(TNumericField(FieldByName(BaseCalc)))) then
        begin
          Result := False;
          Exit;
        end;
        //
        if not(TFuncUtils.ValidNumericField(TNumericField(FieldByName(AliqPerc)))) then
        begin
          Result := False;
          Exit;
        end;
      end
      else //Qtde
      begin
        if not(TFuncUtils.ValidNumericField(TNumericField(FieldByName(AliqVlr)))) then
        begin
          Result := False;
          Exit;
        end;
        //
        if not(TFuncUtils.ValidNumericField(TNumericField(FieldByName(QtdeBaseCalc)))) then
        begin
          Result := False;
          Exit;
        end;
      end;
      //Validando Valor PIS/COFINS
      if not(TFuncUtils.ValidNumericField(TNumericField(FieldByName(Valor)))) then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

{ TFieldsItemEnt }

constructor TFieldsItemEnt.Create(ACst, AVlrIcms, AQtde, AVlrUnitReal, AVlrUnit,
  AVlrDescItem, AVlrDesc, ARateioFreteBC, ARateioSeguroBC, ARateioOutrasBC,
  AVlrIpi, AVlrIcmsSubst, AVlrPis, AVlrCofins: string);
begin
  FCst            := ACst;
  FVlrIcms        := AVlrIcms;
  FQtde           := AQtde;
  FVlrUnitReal    := AVlrUnitReal;
  FVlrUnit        := AVlrUnit;
  FVlrDescItem    := AVlrDescItem;
  FVlrDesc        := AVlrDesc;
  FRateioFreteBC  := ARateioFreteBC;
  FRateioSeguroBC := ARateioSeguroBC;
  FRateioOutrasBC := ARateioOutrasBC;
  FVlrIpi         := AVlrIpi;
  FVlrIcmsSubst   := AVlrIcmsSubst;
  FVlrPis         := AVlrPis;
  FVlrCofins      := AVlrCofins;
end;

{ TCorrecao }
class function TCorrecao.getCorrecao: TCorrecao;
const
  Sql =
    ' select'+
    '   isnull(PAR_REC_DIASDECARENCIA,0), PAR_REC_CORRECAOTELA, PAR_FATOR_COEF2'+
    ' from'+
    '   PARAMS';
begin
  Result := TCorrecao.Create;

  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(Sql, []);
    //
    Result.FDiasCarencia := Fields[0].Value;
    //
    if Fields[1].Value = 'N' then
    begin
      if Fields[2].AsFloat = 0 then
        raise Exception.Create('Em configurações o campo percentual de correção' +
          'de juros está vázio ou com o valor zerado!');
      //
      Result.FVlrPerc := Fields[2].AsFloat;
    end
    else
      Result.FVlrPerc := Tfrm_Percentual.GetResult;
  finally
    Free;
  end;
end;

{ TPisCofins }

constructor TPisCofins.Create(AStpcCodigo, ATipoCalculo, ABaseCalc, AAliqPerc,
  AAliqVlr, AQtdeBaseCalc, AValor: string);
begin
  FStpcCodigo   := AStpcCodigo;
  FTipoCalculo  := ATipoCalculo;
  FBaseCalc     := ABaseCalc;
  FAliqPerc     := AAliqPerc;
  FAliqVlr      := AAliqVlr;
  FQtdeBaseCalc := AQtdeBaseCalc;
  FValor        := AValor;
end;

end.
