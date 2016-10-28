unit U_ImpComandaINF;

interface

uses U_ImpVenda, DBClient, Generics.Collections;

const
  NUM_COLUNAS = 48;

type
  TImpComandaINF = class(TImpVenda)
  strict protected
    FCdsVenda: TClientDataSet;
    function PreencheCabecalho: TBloco; override;
//    function PreencheRodape: TBloco; override;
//    function PreencheTituloItens: TLinha; override;
//    function PreencheItens: TBloco; override;
    function PreencheSomatorioItens: TBloco; override;
//    function PreencheLinhaFixa: TLinha; override;
  public
//    constructor Create;
//    destructor Destroy; override;
//    class procedure Imprimir(const AConId: integer); overload;
  end;
implementation

uses SysUtils, MaskUtils, Math, U_DMRet, U_FuncUtils;

{ TImpComandaINF }

//constructor TImpComandaINF.Create;
//begin
//  inherited Create(TModelo.Bobina, NUM_COLUNAS, TSize.S17cpp, false, '');
//  NumPaginas.Linha   := 1;
//  NumPaginas.Margem  := NUM_COLUNAS;
//  ImpUltItemNaUltPag := False;
//
//  FCdsVenda := TClientDataSet.Create(nil);
//end;

//destructor TImpComandaINF.Destroy;
//begin
//  if Assigned(FCdsVenda) then
//    FreeAndNil(FCdsVenda);
//
//  inherited;
//end;

//class procedure TImpComandaINF.Imprimir(const AConId: integer);
//const
//  SQL =
//    ' SELECT' +
//    '   C.CON_ID, CON_NUM, CON_DT_ABERT, CON_SITUACAO,CON_DESCONTO,' +
//    '   ICC_ID, CON_ID_ORIGEM,  PRO_DESCRICAO,' +
//    '   ICC_QTDE, ICC_VLR_UNIT, ICC_VLR_TOTAL,' +
//    '   ICC_SITUACAO' +
//    ' FROM' +
//    '   CONTA_CLIENTE C' +
//    ' INNER JOIN' +
//    '   ITEM_CONTA_CLIENTE I ON C.CON_ID = I.CON_ID' +
//    ' INNER JOIN' +
//    '   PRODUTO P ON I.PRO_ID = P.PRO_ID' +
//    ' WHERE' +
//    '   C.CON_ID = :CON_ID';
//begin
//  with TImpComandaINF.Create do
//  try
//    FCdsVenda.Data := DMRet.GetData(SQL,[AConId]);
//
//    while not FCdsVenda.Eof do
//    begin
//      Imprimir;
//      FCdsVenda.Next;
//    end;
//
//    Fechar;
//  finally
//    Free;
//  end;
//end;

function TImpComandaINF.PreencheCabecalho: TBloco;
const
  {$REGION 'Comandos SQL'}
  SQL_PAR_VDD =
    'SELECT isnull(PAR_COM_VENDEDOR,0) FROM PARAMS';

  SQL_EMP =
    'SELECT EMP_NOME FROM EMPRESAS';

  SQL_VDD =
    'SELECT isnull(VDD_NOME,''GERAL'') FROM VENDEDOR WHERE VDD_ID = :VDD_ID';

  SQL =
    ' SELECT' +
    '   CON_NUM,CON_DT_ABERT, ' +
    '   CONVERT(VARCHAR(5),CON_DT_ABERT,114) as HORA_ENT   ' +
    ' FROM' +
    '   CONTA_CLIENTE' +
    ' WHERE' +
    '   CON_ID = :CON_ID';
  {$ENDREGION}
var
  Estabelecimento, Mesa, Atendente: string;
  ParamVdd: Integer;
  HoraEntrada: TDateTime;
begin
  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(SQL,[FCdsVenda.FieldByName('CON_ID').AsInteger]);

    if IsEmpty then
      Exit;

    HoraEntrada := FieldByName('HORA_ENT').AsDateTime;
    Mesa        := FieldByName('CON_NUM').AsString;
    HoraEntrada := FieldByName('HORA_ENT').AsDateTime;
  finally
    Free
  end;

  Estabelecimento := Copy(DMRet.OpenSQL(SQL_EMP,[]),1,30);
  ParamVdd        := DMRet.OpenSQL(SQL_PAR_VDD,[]);

  if ParamVdd > 0 then
    Atendente := DMRet.OpenSQL(SQL_VDD,[ParamVdd]);

  Result := TBloco.Create;

  with FCdsVenda do
  begin
    Result.AddLinha([
      TColuna.Create((NUM_COLUNAS div 2) - 10, 'DOCUMENTO NAO FISCAL')
    ]);

    Result.AddLinha([
      TColuna.Create((NUM_COLUNAS div 2) - (Length(Estabelecimento) div 2), Estabelecimento)
    ]);

    Result.AddLinha([TColuna.Create(01, StringOfChar('-', NUM_COLUNAS))]);

    Result.AddLinha([TColuna.Create(01,
      'MESA: ' +  Mesa, [])
    ]);

    Result.AddLinha([TColuna.Create(01,
      'Data Abertura: ' +  Copy(FieldByName('CON_DT_ABERT').AsString,1,10),
      [])
    ]);

    Result.AddLinha([TColuna.Create(01,
      'Hora Entrada:  ' +  TimeToStr(HoraEntrada),[])
    ]);

    Result.AddLinha([TColuna.Create(01,
      'Hora Saída:    ' +  TimeToStr(Time),[])
    ]);

    Result.AddLinha([TColuna.Create(01,
      'Permanencia:   ' +  TimeToStr(HoraEntrada - Time),[])
    ]);
  end;
end;

//function TImpComandaINF.PreencheItens: TBloco;
//const
//  SQL =
//    ' SELECT' +
//    '   C.CON_ID, CON_NUM, CON_DT_ABERT, CON_SITUACAO, CON_DESCONTO, ' +
//    '   ICC_ID, CON_ID_ORIGEM, ICC_SITUACAO, ICC_OBSERVACAO,' +
//    '   CASE WHEN ICC_SITUACAO = ''N'' AND CON_ID_ORIGEM IS NULL THEN PRO_DESCRICAO' +
//    '   WHEN ICC_SITUACAO = ''C'' AND CON_ID_ORIGEM IS NULL THEN PRO_DESCRICAO + ''**CANCELADO**''' +
//    '   ELSE PRO_DESCRICAO +''**Transf. conta: '' + CONVERT(VARCHAR(10),CON_ID_ORIGEM)' +
//    '   END AS PRO_DESCRICAO, CASE WHEN ICC_SITUACAO = ''N'' THEN ICC_QTDE' +
//    '   ELSE 0 END AS ICC_QTDE, CASE WHEN ICC_SITUACAO = ''N'' THEN ICC_VLR_UNIT ELSE 0 END AS ICC_VLR_UNIT,' +
//    '   CASE WHEN ICC_SITUACAO = ''N'' THEN ICC_VLR_TOTAL ELSE 0 END AS ICC_VLR_TOTAL' +
//    ' FROM' +
//    '   CONTA_CLIENTE C' +
//    ' INNER JOIN' +
//    '   ITEM_CONTA_CLIENTE I ON C.CON_ID = I.CON_ID' +
//    ' INNER JOIN' +
//    '   PRODUTO P ON I.PRO_ID = P.PRO_ID' +
//    ' WHERE' +
//    '   C.CON_ID = :CON_ID';
//
//  SQL_ADC =
//    ' SELECT' +
//    '   PRO_DESCRICAO AS DESC_ADC' +
//    ' FROM' +
//    '   ITEM_CONTA_CLIENTE_ADICIONAIS A' +
//    ' INNER JOIN' +
//    '   PRODUTO P ON A.PRO_ID = P.PRO_ID' +
//    ' WHERE' +
//    '   ICC_ID = :ICC_ID';
//var
//  Linha: TLinha;
//  CdsAdc: TClientDataSet;
//begin
//  Result := TBloco.Create;
//
//  with TClientDataSet.Create(nil) do
//  try
//    Data := DMRet.GetData(SQL, [FCdsVenda.FieldByName('CON_ID').AsInteger]);
//
//    if IsEmpty then
//      Exit;
//
//    while not Eof do
//    begin
//      Linha := TLinha.Create;
//      Linha.Add(TColuna.Create(01, FieldByName('ICC_QTDE').AsString,[]));
//      Linha.Add(TColuna.Create(07, Copy(FieldByName('PRO_DESCRICAO').AsString,1,20),[]));
//      Linha.Add(TColuna.Create(28, '#,##0.00', FieldByName('ICC_VLR_UNIT').AsFloat , []));
//      Linha.Add(TColuna.Create(37, '#,##0.00', FieldByName('ICC_VLR_TOTAL').AsFloat , []));
//      Result.AddLinha(Linha);
//
//      //Adicionais
//      CdsAdc := TClientDataSet.Create(nil);
//      try
//        CdsAdc.Data := DMRet.GetData(SQL_ADC, [FieldByName('ICC_ID').AsInteger]);
//
//        while not CdsAdc.Eof do
//        begin
//          Result.AddLinha([TColuna.Create(07, Copy('+ ' + CdsAdc.FieldByName('DESC_ADC').AsString,1,41))]);
//          CdsAdc.Next;
//        end;
//      finally
//        CdsAdc.Free;
//      end;
//
//      //Observação
//      if Trim(FieldByName('ICC_OBSERVACAO').AsString) <> '' then
//        Result.AddLinha([TColuna.Create(07, Copy(FieldByName('ICC_OBSERVACAO').AsString,1,41))]);
//
//      Next;
//    end;
//  finally
//    Free;
//  end;
//end;

//function TImpComandaINF.PreencheLinhaFixa: TLinha;
//begin
//  Result := TLinha.Create;
////  Result.Add(TColuna.Create(1, '', []));
//end;

//function TImpComandaINF.PreencheRodape: TBloco;
//begin
//  Result := TBloco.Create;
////  Result.AddLinha([TColuna.Create(1, '', [])]);
//end;

function TImpComandaINF.PreencheSomatorioItens: TBloco;
var
  I: Integer;
  Total, Desconto : Double;
begin
  Total := 0;
  Result := TBloco.Create;

  with FCdsVenda do
  begin
    while not FCdsVenda.Eof do
    begin
      Total := Total + FieldByName('ICC_VLR_TOTAL').AsFloat;
      Next;
    end;

    Desconto := FieldByName('CON_DESCONTO').AsFloat;

    Result.AddLinha([TColuna.Create(01, StringOfChar('-', NUM_COLUNAS))]);

    if Desconto > 0 then
    begin
      Result.AddLinha([
        TColuna.Create(01, 'SubTotal', []),
        TColuna.Create(37, '#,##0.00', Total, [])
      ]);

      Result.AddLinha([
        TColuna.Create(01, 'Desconto', []),
        TColuna.Create(37, '#,##0.00', Desconto, [])
      ]);
    end;

    Result.AddLinha([
      TColuna.Create(01,   'Total', []),
      TColuna.Create(37, '#,##0.00', Total - Desconto, [])
    ]);
  end;

  for I := 1 to 9 do
    Result.AddLinha([TColuna.Create(1, '', [])]);
  //
  Result.AddLinha([TColuna.Create(01, StringOfChar('-', NUM_COLUNAS))]);
end;

//function TImpComandaINF.PreencheTituloItens: TLinha;
//begin
//  Result := TLinha.Create;
//  Result.Add(TColuna.Create(01, 'QTD', []));
//  Result.Add(TColuna.Create(07, 'DESCRICAO', []));
//  Result.Add(TColuna.Create(31, 'V.UNI ', []));
//  Result.Add(TColuna.Create(40, 'TOTAL', []));
//end;

end.
