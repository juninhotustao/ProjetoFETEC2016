unit UConProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_ConsultaBase, Data.FMTBcd,
  Vcl.ImgList, Vcl.Menus, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmConProduto = class(TFrm_ConsultaBase)
    dbxDTSPRO_ID: TIntegerField;
    dbxDTSPRO_COD_BARRAS: TStringField;
    dbxDTSPRO_REFERENCIA: TStringField;
    dbxDTSPRO_DESCRICAO: TStringField;
    dbxDTSPRO_ESTOQUE: TFMTBCDField;
    dbxDTSPRO_PRECO_VENDA: TFMTBCDField;
    dbxDTSPRO_PRECO_CUSTO: TFMTBCDField;
    dbxDTSPRO_ESTOQUE_MAX: TIntegerField;
    CDSPRO_ID: TIntegerField;
    CDSPRO_COD_BARRAS: TStringField;
    CDSPRO_REFERENCIA: TStringField;
    CDSPRO_DESCRICAO: TStringField;
    CDSPRO_ESTOQUE: TFMTBCDField;
    CDSPRO_PRECO_VENDA: TFMTBCDField;
    CDSPRO_PRECO_CUSTO: TFMTBCDField;
    CDSPRO_ESTOQUE_MAX: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConProduto: TfrmConProduto;

implementation

uses
  UCadProduto;
{$R *.dfm}

procedure TfrmConProduto.btnPesquisarClick(Sender: TObject);
var
  Params: array of Variant;
begin
  inherited;
  CDS.Close;

  SetLength(Params, 1);

  Params[0] := edt_pesq.Text+'%';

  CDS.Params[0].Value := Params[0];

  CDS.Open;
end;

procedure TfrmConProduto.FormShow(Sender: TObject);
begin
  inherited;
  CadBase := TfrmCadProduto;
end;

end.
