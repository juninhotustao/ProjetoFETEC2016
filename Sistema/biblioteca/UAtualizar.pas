unit UAtualizar;

interface

type
  TAtualizarEstoque = class
  strict private
    FEstoque: Double;
    FPro_id: Integer;

  public
    procedure AtualizarEstoque(AMovimento: string; AQtde: Double; APro_id: Integer);

  end;

implementation

uses
  U_DMRet;

{ TAtualizarEstoque }

procedure TAtualizarEstoque.AtualizarEstoque(AMovimento: string; AQtde:
  Double; APro_id: Integer);
const
  EXECUTA_ATUALIZAR =
    'EXEC ATUALIZA_ESTOQUE :MOVIMENTO, :QTDE, :PRO_ID';
begin
  DMRet.ExecuteSQL(EXECUTA_ATUALIZAR, [AMovimento, AQtde, APro_id]);
end;

end.
