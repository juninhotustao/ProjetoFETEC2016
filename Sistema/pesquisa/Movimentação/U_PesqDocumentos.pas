unit U_PesqDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_PesqBase, FMTBcd, DBClient, Provider, DB, SqlExpr, ADODB, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids;

type
  Tfrm_PesqDocumentos = class(Tfrm_PesqBase)
    procedure btn_confirmaClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
  private
    FResult: Integer;
    FID: Integer;
    FData: TDateTime;
  public
    class function RetornaDocID(AModulo: Smallint): Integer; overload;
    class function RetornaDocID(AModulo: Smallint; out AID: Integer; out AData: TDateTime): Integer; overload;
  end;

var
  frm_PesqDocumentos: Tfrm_PesqDocumentos;

implementation

{$R *.dfm}

{ Tfrm_PesqDocumento }

class function Tfrm_PesqDocumentos.RetornaDocID(AModulo: Smallint): Integer;
var
  AID: Integer;
  AData: TDateTime;
begin
  Result := RetornaDocID(AModulo, AID, AData);
end;

procedure Tfrm_PesqDocumentos.btn_confirmaClick(Sender: TObject);
var
  search: string;
begin
  inherited;

  search := Trim(edt_pesq.Text);
  SearchByParams([search + '%']);
end;

procedure Tfrm_PesqDocumentos.GridDblClick(Sender: TObject);
begin
  inherited;

  FResult := CDS.Fields[0].AsInteger;
  FData   := CDS.Fields[2].AsDateTime;
  FID     := CDS.Fields[CDS.FieldCount -1].AsInteger;
end;

procedure Tfrm_PesqDocumentos.GridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  FResult := CDS.Fields[0].AsInteger;
  FData   := CDS.Fields[2].AsDateTime;
  FID     := CDS.Fields[CDS.FieldCount -1].AsInteger;
end;

class function Tfrm_PesqDocumentos.RetornaDocID(AModulo: Smallint;
  out AID: Integer; out AData: TDateTime): Integer;
const
  SQL_ENTRADA =
    ' select ' +
    '   ENT_ID as DOC_ID, ENT_NUMNOTA as NUMDOC, ENT_DT_ENTRADA	as DATA,' +
    '   FOR_NOME as CLIFOR, ENT_TOTAL_NOTA as VLR_TOTAL, F.FOR_ID' +
    ' from' +
    '   ENTRADA N ' +
    ' left join' +
    '   FORNECEDORES F on F.FOR_ID = N.FOR_ID' +
    ' where' +
    '   convert(varchar(10), ENT_NUMNOTA) LIKE :NUMNOTA' +
    ' order by' +
    '   ENT_DT_ENTRADA';

  SQL_SAIDA =
    ' select ' +
    '	  SAI_ID as DOC_ID, SAI_NUMNOTA as NUMDOC, SAI_DT_EMISSAO as DATA,' +
    '	  CLI_NOME as CLIFOR, SAI_TOTAL_NOTA as VLR_TOTAL, C.CLI_ID' +
    ' from' +
    '	  SAIDA N' +
    ' left join' +
    '   CLIENTES C on C.CLI_ID = N.CLI_ID' +
    ' where' +
    '	  convert(varchar(10), SAI_NUMNOTA) LIKE :NUMNOTA' +
    ' order by' +
    '   SAI_DT_EMISSAO';

  SQL_FRETE =
    ' select' +
    '	  FRE_NUMERO as DOC_ID, FRE_NUMERO as NUMDOC, FRE_DATA_ENTRADA as DATA,' +
    '	  FOR_NOME as CLIFOR, FRE_TOTAL_FRETE as VLR_TOTAL, F.FOR_ID' +
    ' from' +
    '	  FRETE N' +
    ' left join' +
    '	  FORNECEDORES F on F.FOR_ID = N.FOR_ID' +
    ' where' +
    '	  convert(varchar(10), FRE_NUMERO) LIKE :NUMNOTA';

  SQL_SERIED =
    ' select' +
    '	  SER_ID as DOC_ID, SER_NUM_NOTA as NUMDOC, SER_DT_EMISSAO as DATA,' +
    '	  CLI_NOME as CLIFOR, SER_TOTAL as VLR_TOTAL, C.CLI_ID' +
    ' from' +
    '   SERIED_INDIVIDUAL N' +
    ' left join' +
    '	  CLIENTES C on convert(bigint,  + C.CLI_CGC) = N.SER_CNPJ_CPF or' +
    '	  convert(bigint, C.CLI_CPF) = N.SER_CNPJ_CPF' +
    ' where' +
    '	  convert(varchar(10), SER_NUM_NOTA) LIKE :NUMNOTA';

  SQL_CUPOM =
    ' select' +
    '	  MES_COO as DOC_ID, MES_COO as NUMDOC, MES_DATA as DATA,' +
    '	  CLI_NOME as CLIFOR, MES_TOTAL as VLR_TOTAL, PDV_ID' +
    ' from' +
    '	  MESTRE N' +
    ' left join' +
    '	  CLIENTES C on C.CLI_ID = N.CLI_ID' +
    ' where' +
    '	  convert(varchar(10), MES_COO) LIKE :NUMNOTA';
begin
  with Tfrm_PesqDocumentos.Create(Application) do
  try
    case AModulo of
      0: QRY.SQL.Text := SQL_ENTRADA;
      1: QRY.SQL.Text := SQL_SAIDA;
      2: QRY.SQL.Text := SQL_FRETE;
      3: QRY.SQL.Text := SQL_SERIED;
      4: QRY.SQL.Text := SQL_CUPOM;
    end;

    CDS.FetchParams;
    ShowModal;
  finally
    Result := FResult;
    AID    := FID;
    AData  := FData;
    Free;
  end;
end;

end.
