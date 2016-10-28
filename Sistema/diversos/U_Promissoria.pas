unit U_Promissoria;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, U_DMRet, ppDB, ppDBPipe,
  ppParameter, ppCtrls, ppStrtch, ppRegion, ppBands, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDesignLayer;

type
  TEmpresa = record
    Nome: string;
    Cnpj: ShortString;
    Cidade: ShortString;
    GeraRec: Boolean;
  end;

  TDM_Promissoria = class(TDataModule)
    cdsProm: TClientDataSet;
    dsProm: TDataSource;
    repProm: TppReport;
    ppDetailBand2: TppDetailBand;
    ppRegion1: TppRegion;
    lblVencto: TppLabel;
    ppLabel6: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    lbl_empresa: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    lbl_data: TppLabel;
    ppLabel10: TppLabel;
    ppRegion2: TppRegion;
    ppRegion3: TppRegion;
    ppLabel12: TppLabel;
    lbl_extenso_1: TppLabel;
    ppRegion4: TppRegion;
    lbl_extenso_2: TppLabel;
    ppParameterList2: TppParameterList;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppLabel9: TppLabel;
    ppRegion5: TppRegion;
    lblDescr1: TppLabel;
    cdsPromCNPJ_CPF: TStringField;
    cdsPromCLI_NOME: TStringField;
    cdsPromENDERECO: TStringField;
    pipProm: TppDBPipeline;
    cdsPromNUM_PROMIS: TStringField;
    cdsPromDT_VENCTO: TDateTimeField;
    ppDBText4: TppDBText;
    cdsPromVALOR: TBCDField;
    ppDBText5: TppDBText;
    ppLabel3: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    cdsPromDT_EMISSAO: TDateTimeField;
    procedure lblVenctoGetText(Sender: TObject; var Text: string);
    procedure DataModuleCreate(Sender: TObject);
    procedure lbl_empresaGetText(Sender: TObject; var Text: string);
    procedure lbl_extenso_1GetText(Sender: TObject; var Text: string);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ppLabel3GetText(Sender: TObject; var Text: string);
    procedure ppLabel14GetText(Sender: TObject; var Text: string);
    procedure ppLabel16GetText(Sender: TObject; var Text: string);
    procedure ppLabel19GetText(Sender: TObject; var Text: string);
    procedure lbl_extenso_2GetText(Sender: TObject; var Text: string);
    procedure lbl_dataGetText(Sender: TObject; var Text: string);
  private
    FEmpresa: TEmpresa;
    function GetNumParcelas(AFields: TFields): integer;
  public
    class procedure Imprimir(AVenId: Integer);
  end;

var
  DM_Promissoria: TDM_Promissoria;

implementation

uses U_FuncUtils, Dialogs;

{$R *.dfm}

procedure TDM_Promissoria.DataModuleCreate(Sender: TObject);
const
  SQL =
    'select EMP_NOME, EMP_CGC, EMP_CIDADE, PAR_ORC_GERAREC ' +
    'from EMPRESAS, PARAMS';
begin
  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(SQL, []);

    if IsEmpty then Exit;

    FEmpresa.Nome    := Fields[0].Value;
    FEmpresa.Cnpj    := Fields[1].Value;
    FEmpresa.Cidade  := Fields[2].Value;
    FEmpresa.GeraRec := Fields[3].Value = 'S';
  finally
    Free;
  end;
end;

procedure TDM_Promissoria.DataModuleDestroy(Sender: TObject);
begin
  cdsProm.Close;
end;

function TDM_Promissoria.GetNumParcelas(AFields: TFields): integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to 12 do
    if Trim(AFields.FieldByName('VEN_VECTO'+IntToStr(i)).AsString) <> '' then
      Inc(Result);
end;

class procedure TDM_Promissoria.Imprimir(AVenId: Integer);
const
  SQL_VENDA =
    ' select' +
    '   VEN_ID, VEN_DT_ENTREGA, (VEN_TOTAL - VEN_DESCONTO) as TOTAL,' +
    '   VEN_VECTO1, VEN_VECTO2, VEN_VECTO3, VEN_VECTO4, VEN_VECTO5,' +
    '   VEN_VECTO6, VEN_VECTO7, VEN_VECTO8, VEN_VECTO9, VEN_VECTO10,' +
    '   VEN_VECTO11, VEN_VECTO12, C.CLI_ID + '' - '' + CLI_NOME as CLI_NOME,' +
    '   case CLI_TIPOPES when ''F'' then CLI_CPF else CLI_CGC end as CNPJ_CPF,' +
    '   isnull(CLI_ENDERECO, '''') + '', '' + isnull(CLI_NUMERO,'''') +' +
    '   '', '' + isnull(CLI_COMPLEMENTO,'''') + '', '' + isnull(CLI_BAIRRO,'''') +' +
    '   '', '' + isnull(CLI_CIDADE,'''') + '', '' + isnull(CLI_ESTADO,'''') as ENDERECO' +
    ' from' +
    '   VENDA V' +
    ' inner join' +
    '   CLIENTES C on V.CLI_ID = C.CLI_ID' +
    ' where' +
    '   VEN_ID = :VEN_ID';

  SQL_RECEBER =
    ' select' +
    '   DOCUMENTO, DATAVENCIMENTO, VALORORIGINAL, DATAEMISSAO,' +
    '   C.CLI_ID + '' - '' + CLI_NOME as CLI_NOME,' +
    '   case CLI_TIPOPES when ''F'' then CLI_CPF else CLI_CGC end as CNPJ_CPF,' +
    '   isnull(CLI_ENDERECO, '''') + '', '' + isnull(CLI_NUMERO,'''') +' +
    '   '', '' + isnull(CLI_COMPLEMENTO,'''') + '', '' + isnull(CLI_BAIRRO,'''') +' +
    '   '', '' + isnull(CLI_CIDADE,'''') + '', '' + isnull(CLI_ESTADO,'''') as ENDERECO' +
    ' from' +
    '   RECEBER R' +
    ' inner join' +
    '   CLIENTES C on R.CLI_ID = C.CLI_ID' +
    ' where' +
    '   VEN_ID = :VEN_ID';
var
  TotalParcelas, i: integer;
begin
  with TDM_Promissoria.Create(nil) do
  try
    with TClientDataSet.Create(nil) do
    try
      if FEmpresa.GeraRec then
        Data := DMRet.GetData(SQL_RECEBER, [AVenId])
      else
        Data := DMRet.GetData(SQL_VENDA, [AVenId]);
      //

      if IsEmpty then
      begin
        ShowMessage('Não há dados para a opção selecionada!');
        Exit;
      end;

      if FEmpresa.GeraRec then
      begin
        {$REGION 'Gera a promissória a partir do receber'}
        while not Eof do
        begin
          cdsProm.Append;

          cdsPromNUM_PROMIS.Value := FieldByName('DOCUMENTO').AsString;
          cdsPromDT_VENCTO.Value  := FieldByName('DATAVENCIMENTO').AsDateTime;
          cdsPromVALOR.Value      := FieldByName('VALORORIGINAL').AsFloat;
          cdsPromCNPJ_CPF.Value   := FieldByName('CNPJ_CPF').AsString;
          cdsPromCLI_NOME.Value   := FieldByName('CLI_NOME').AsString;
          cdsPromENDERECO.Value   := FieldByName('ENDERECO').AsString;
          cdsPromDT_EMISSAO.Value := FieldByName('DATAEMISSAO').AsDateTime;

          try
            cdsProm.Post;
          except
            on E:Exception do raise Exception.Create(E.Message);
          end;

          Next;
        end;
        {$ENDREGION}
      end else
      begin
        {$REGION 'Gera a partir da venda'}
        TotalParcelas := GetNumParcelas(Fields);

        if TotalParcelas = 0 then
        begin
          ShowMessage('Não existe parcelas nesta venda!');
          Exit;
        end;

        for i := 1 to TotalParcelas do
        begin
          cdsProm.Append;

          cdsPromNUM_PROMIS.Value := FieldByName('VEN_ID').AsString + '/' + IntToStr(i);
          cdsPromDT_VENCTO.Value  := FieldByName('VEN_DT_ENTREGA').AsDateTime + FieldByName('VEN_VECTO'+IntToStr(i)).AsInteger;
          cdsPromVALOR.Value      := TFuncUtils.Arredondar(FieldByName('TOTAL').AsFloat/TotalParcelas, 2);
          cdsPromCNPJ_CPF.Value   := FieldByName('CNPJ_CPF').AsString;
          cdsPromCLI_NOME.Value   := FieldByName('CLI_NOME').AsString;
          cdsPromENDERECO.Value   := FieldByName('ENDERECO').AsString;
          cdsPromDT_EMISSAO.Value := FieldByName('VEN_DT_ENTREGA').AsDateTime;

          try
            cdsProm.Post;
          except
            on E:Exception do raise Exception.Create(E.Message);
          end;
        end;
        {$ENDREGION}
      end;
    finally
      Free;
    end;

    repProm.Print;
  finally
    Free;
  end;
end;

procedure TDM_Promissoria.lblVenctoGetText(Sender: TObject; var Text: string);
const
  TXT = 'Vencimento em %d de %s de %d';
var
  Year, Month, Day: Word;
begin
  DecodeDate(cdsPromDT_VENCTO.AsDateTime, Year, Month, Day);
  Text := Format(TXT, [Day, TFuncUtils.MesExtenso(Month), Year]);
end;

procedure TDM_Promissoria.lbl_dataGetText(Sender: TObject; var Text: string);
const
  TXT = '%s, %d de %s de %d';
var
  Year, Month, Day: Word;
begin
  DecodeDate(cdsPromDT_EMISSAO.AsDateTime, Year, Month, Day);
  Text := Format(TXT,[
    FEmpresa.Cidade, Day, TFuncUtils.MesExtenso(Month), Year
  ]);
end;

procedure TDM_Promissoria.lbl_empresaGetText(Sender: TObject; var Text: string);
const
  TXT = 'a %s, CNPJ: %s';
begin
  Text := Format(TXT, [FEmpresa.Nome, TFuncUtils.FormataCPFeCNPJ(FEmpresa.Cnpj)]);
end;

procedure TDM_Promissoria.lbl_extenso_1GetText(Sender: TObject;
  var Text: string);
var
  NumExtenso: string;
  i: Integer;
begin
  NumExtenso := TFuncUtils.ValorExtenso(cdsPromVALOR.Value);

  if Length(NumExtenso) > 90 then
    NumExtenso := copy(NumExtenso,1,90);

  for i := 1 to 100 - Length(NumExtenso) do
    NumExtenso := NumExtenso + '.x';

  Text := NumExtenso;
end;

procedure TDM_Promissoria.lbl_extenso_2GetText(Sender: TObject;
  var Text: string);
var
  NumExtenso: string;
  i: Integer;
begin
  NumExtenso := TFuncUtils.ValorExtenso(cdsPromVALOR.Value);

  if Length(NumExtenso) > 90 then
    NumExtenso := copy(NumExtenso,91,90)
  else
    NumExtenso := '';

  for i := 1 to 100 - Length(NumExtenso) do
    NumExtenso := NumExtenso + '.x';

  Text := NumExtenso;
end;

procedure TDM_Promissoria.ppLabel14GetText(Sender: TObject; var Text: string);
var
  Year, Month, Day: Word;
begin
  DecodeDate(cdsPromDT_VENCTO.AsDateTime, Year, Month, Day);
  Text := TFuncUtils.MesExtenso(Month);
end;

procedure TDM_Promissoria.ppLabel16GetText(Sender: TObject; var Text: string);
var
  Year, Month, Day: Word;
begin
  DecodeDate(cdsPromDT_VENCTO.AsDateTime, Year, Month, Day);
  Text := IntToStr(Year);
end;

procedure TDM_Promissoria.ppLabel19GetText(Sender: TObject; var Text: string);
begin
  Text := FEmpresa.Cidade;
end;

procedure TDM_Promissoria.ppLabel3GetText(Sender: TObject; var Text: string);
var
  Year, Month, Day: Word;
begin
  DecodeDate(cdsPromDT_VENCTO.AsDateTime, Year, Month, Day);
  Text := TFuncUtils.NumeroExtenso(Day);
end;

end.
