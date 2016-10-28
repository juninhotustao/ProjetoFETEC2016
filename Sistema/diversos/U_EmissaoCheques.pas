unit U_EmissaoCheques;

interface

uses DBClient, RDprint;

type
  TCheque = class
  strict private
    FBanId: Integer;
    FNominal: string;
    FCidade: string;
    FEmpresa: string;
    FValor: Double;
    FBomPara: Variant;
    FData: TDateTime;
    FRel: TRDprint;
    FCDS: TClientDataSet;

    class function Create: TCheque; overload;
    function ImprimirPadrao(const ABomPara: boolean = True) : Boolean;
  public
    procedure Imprimir;
    procedure ImprimirCopia(NumCheque, Motivo: string);

    constructor Create(BanId: Integer; Valor: Double; Nominal, Cidade,
      Empresa: string; Data: TDateTime; BomPara: Variant); overload;

    constructor Create(EmiId: Integer); overload;

    destructor Destroy; override;
  end;

implementation

uses
  SysUtils, Dialogs, U_DMRet, DateUtils, Math, U_FuncUtils, U_SystemEmpresa,
  Variants;

{ TCheque }

class function TCheque.Create: TCheque;
begin
  raise Exception.Create('Not implemented');
end;

constructor TCheque.Create(BanId: Integer; Valor: Double; Nominal, Cidade,
  Empresa: string; Data: TDateTime; BomPara: Variant);
begin
  FBanId   := BanId;
  FValor   := Valor;
  FNominal := Nominal;
  FCidade  := Cidade;
  FEmpresa := Empresa;
  FData    := Data;
  FBomPara := BomPara;
  FRel     := TRDprint.Create(nil);
  FCDS     := TClientDataSet.Create(nil);
end;

constructor TCheque.Create(EmiId: Integer);
const
  SQL =
    ' select' +
    '   EMI_ID,EMI_NUMCHEQUE,EMI_DATAEMISSAO,EMI_VLR,CLF_ID,' +
    '   BAN_ID,EMI_OPERACAO,EMI_TIPO,EMI_NOMINAL,EMI_HISTORICO,' +
    '   EMI_INTEGRA,BAN_ID_INTEGRA,CLF_ID_INTEGRA,EMI_OPERACAO_INTEGRA,' +
    '   EMI_IMPRESSO,EMI_BOMPARA,TAL_ID' +
    ' from' +
    '   EMISSAO_CHEQUE' +
    ' where' +
    '   EMI_ID = :EMI_ID';
begin
  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(SQL,[EmiId]);

    FBanId   := FieldByName('BAN_ID').Value;
    FValor   := FieldByName('EMI_VLR').Value;
    FNominal := FieldByName('EMI_NOMINAL').Value;
    FCidade  := TEmpresa.Cidade;
    FEmpresa := TEmpresa.Razao;
    FData    := FieldByName('EMI_DATAEMISSAO').Value;
    FBomPara := FieldByName('EMI_BOMPARA').Value;
    FRel     := TRDprint.Create(nil);
    FCDS     := TClientDataSet.Create(nil);
  finally
    Free;
  end;
end;

destructor TCheque.Destroy;
begin
  FRel.Free;
  FCDS.Free;
  //
  inherited;
end;

procedure TCheque.Imprimir;
begin
  ImprimirPadrao;

  FRel.Fechar;
end;

procedure TCheque.ImprimirCopia(NumCheque, Motivo: string);
var
  ColEmp: Integer;
  ANome, ABanco: string;
begin
  ImprimirPadrao(False);

  with FCDS do
  begin
    ANome  := FieldByName('BAN_NOME').AsString;  //Nome do Caixa/Banco
    ABanco := FieldByName('BAN_BANCO').AsString; //Nome da Agência

    FRel.ImpF(11,12, Format('BANCO: %s', [ABanco]), [negrito]);
    FRel.ImpF(12,12, Format('CONTA: %s', [FieldByName('BAN_CONTA').AsString]) + ' - ' + ANome, [negrito]);
    FRel.ImpF(13,11, Format('CHEQUE: %s', [NumCheque]), [negrito]);
    FRel.ImpF(14,11, Format('MOTIVO: %s', [Motivo]), [negrito]);

    FRel.ImpF(16,50, TFuncUtils.Replicate('-',40), [negrito]);

    ColEmp := 70 - TFuncUtils.Arredondar(Length(ANome)/2);
//    FRel.ImpF(17, ColEmp, FEmpresa, [negrito]);
    FRel.ImpF(17, ColEmp, ANome, [negrito]);
  end;

  FRel.Fechar;
end;

function TCheque.ImprimirPadrao(const ABomPara: boolean = True): Boolean;
const
  Sql =
    ' select ' +
    '   BAN_CH_VLRLIN, BAN_CH_VLRCOL, BAN_CH_LI1LIN, BAN_CH_LI1COL, BAN_CH_LI2LIN, ' +
    '   BAN_CH_LI2COL, BAN_CH_NOMLIN, BAN_CH_NOMCOL, BAN_CH_CIDLIN, BAN_CH_CIDCOL, ' +
    '   BAN_CH_DIALIN, BAN_CH_DIACOL, BAN_CH_MESLIN, BAN_CH_MESCOL, BAN_CH_ANOLIN, ' +
    '   BAN_CH_ANOCOL, BAN_CH_BOMLIN, BAN_CH_BOMCOL, BAN_CH_NUMLINHAS, ' +
    '   BAN_CH_CARACLIN1, BAN_CH_CARACLIN2, BAN_CH_TAMFONTE, BAN_NOME, BAN_CONTA, BAN_BANCO ' +
    ' from ' +
    '   CAIXA ' +
    ' where ' +
    '   BAN_ID = :BAN_ID';
var
  NumExtenso: string;
begin
  Result := True;

  with FCDS do
  begin
    Data := DMRet.GetData(Sql,[FBanId]);

    if IsEmpty then
    begin
      ShowMessage('Não foi encontrado o banco com o id '+IntToStr(FBanId));
      Result := False;
      Exit;
    end;

    FRel.PortaComunicacao       := 'LPT1';
    FRel.TamanhoQteLinhas       := FieldByName('BAN_CH_NUMLINHAS').AsInteger;
    FRel.TamanhoQteColunas      := 160;
    FRel.TamanhoQteLPP          := Oito;
    FRel.TitulodoRelatorio      := 'DAV';
    FRel.Acentuacao             := SemAcento;
    FRel.OpcoesPreview.BotaoLer := Inativo;
    FRel.OpcoesPreview.Preview  := True;

    //Verificando o tamanho da fonte a ser impressa
    case FieldByName('BAN_CH_TAMFONTE').AsInteger of
       5: FRel.FonteTamanhoPadrao := S05cpp;
      10: FRel.FonteTamanhoPadrao := S10cpp;
      12: FRel.FonteTamanhoPadrao := S12cpp;
      17: FRel.FonteTamanhoPadrao := S17cpp;
      else FRel.FonteTamanhoPadrao := S20cpp
    end;

    FRel.Abrir;

    //Valor
    FRel.ImpF(FieldByName('BAN_CH_VLRLIN').Value, FieldByName('BAN_CH_VLRCOL').Value,
      '#'+FormatFloat('#,##0.00', FValor)+'#',[negrito]);

    //Valor por Extenso
    NumExtenso := UpperCase(TFuncUtils.ValorExtenso(FValor));

    if Length(NumExtenso) <= FieldByName('BAN_CH_CARACLIN1').Value then
    begin
      NumExtenso := NumExtenso + TFuncUtils.Replicate('#', FieldByName('BAN_CH_CARACLIN1').Value
        - Length(NumExtenso));

      FRel.Impf(FieldByName('BAN_CH_LI1LIN').Value, FieldByName('BAN_CH_LI1COL').Value,
        NumExtenso, [negrito]);

      NumExtenso := TFuncUtils.Replicate('#', FieldByName('BAN_CH_CARACLIN2').Value);
      FRel.Impf(FieldByName('BAN_CH_LI2LIN').Value, FieldByName('BAN_CH_LI2COL').Value,
        NumExtenso,[negrito]);
    end
    else
    begin
      FRel.Impf(FieldByName('BAN_CH_LI1LIN').Value, FieldByName('BAN_CH_LI1COL').Value,
        copy(NumExtenso,1,FieldByName('BAN_CH_CARACLIN1').AsInteger), [negrito]);

      NumExtenso := copy(NumExtenso, FieldByName('BAN_CH_CARACLIN1').AsInteger+1,
        FieldByName('BAN_CH_CARACLIN2').AsInteger);

      NumExtenso := NumExtenso + TFuncUtils.Replicate('#', FieldByName('BAN_CH_CARACLIN2').Value
        - Length(NumExtenso));

      FRel.Impf(FieldByName('BAN_CH_LI2LIN').Value, FieldByName('BAN_CH_LI2COL').Value,
        NumExtenso,[negrito]);
    end;

    //Nominal
    FRel.impf(FieldByName('BAN_CH_NOMLIN').Value, FieldByName('BAN_CH_NOMCOL').Value,
      UpperCase(copy(FNominal,1,100)),[negrito]);

    //Cidade
    FRel.impf(FieldByName('BAN_CH_CIDLIN').Value, FieldByName('BAN_CH_CIDCOL').Value,
      copy(FCidade,1,25),[negrito]);

    //Dia
    FRel.impf(FieldByName('BAN_CH_DIALIN').Value, FieldByName('BAN_CH_DIACOL').Value,
      CurrToStr(DayOf(FData)),[negrito]);

    //Mês
    FRel.impf(FieldByName('BAN_CH_MESLIN').Value, FieldByName('BAN_CH_MESCOL').Value,
      UpperCase(TFuncUtils.Mesextenso(MonthOf(FData))),[negrito]);

    //Ano
    FRel.impf(FieldByName('BAN_CH_ANOLIN').Value, FieldByName('BAN_CH_ANOCOL').Value,
      CurrToStr(YearOf(FData)),[negrito]);

    //Bom para
    if ABomPara and not VarIsNull(FBomPara) then
      FRel.impf(FCDS.FieldByName('BAN_CH_BOMLIN').Value,
        FCDS.FieldByName('BAN_CH_BOMCOL').Value, Format('BOM PARA: %s',
        [DateToStr(FBomPara)]), [negrito]);
  end;
end;

end.
