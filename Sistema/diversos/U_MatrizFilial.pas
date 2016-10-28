unit U_MatrizFilial;

interface

uses
  Windows, SysUtils, Graphics, StdCtrls, Forms, Controls, Dialogs, DB,
  Messages, Variants, DBCtrls, Classes, DBClient;

type
  TMatrizFilial = class
    class procedure AtualizaEstoqueMatriz(Modulo: HMODULE; Cnpj: ShortString; Tipo: char = 'P'; AID: integer = 0); overload;
  end;

implementation

uses U_DMRet, U_FuncUtils;

{ TMatrizFilial }


/// <summary>
///   Passa o estoque da Filial para camada Servidora (Matriz) - Alan Thales
/// </summary>
class procedure TMatrizFilial.AtualizaEstoqueMatriz(Modulo: HMODULE;
  Cnpj: ShortString; Tipo: char; AID: integer);
const
  SQL_PROD = 'select PRO_ID, PRO_ESTOQUE, PRO_ESTOQUE_DEP from PRODUTO where %s';

  SQL_ITEM = 'select P.PRO_ID, PRO_ESTOQUE, PRO_ESTOQUE_DEP from ITEM_SAIDA I ' +
             'inner join PRODUTO P on P.PRO_ID = I.PRO_ID where SAI_ID = :SAI_ID';

var
  UpdateEstoque: procedure(Cnpj: ShortString; ProId: integer; Estoque: double);
  SQL: string;
begin
  if Modulo = 0 then Exit;

  @UpdateEstoque := TFuncUtils.GetFunction(Modulo, 'UpdateEstoque');

  case Tipo of
    'S': SQL := SQL_ITEM;
    'E': SQL := Format(SQL_PROD, ['PRO_ID = :PRO_ID']);
    else
      SQL := Format(SQL_PROD, ['1 = 1']);
  end;

  with TClientDataSet.Create(nil) do
  try
    if AID = 0 then
      Data := DMRet.GetData(SQL, [])
    else
      Data := DMRet.GetData(SQL, [AID]);

    while not Eof do
    begin
      UpdateEstoque(Cnpj, Fields[0].AsInteger, Fields[1].AsFloat);
      Application.ProcessMessages;
      Next;
    end;
  finally
    Free;
  end;
end;

end.
