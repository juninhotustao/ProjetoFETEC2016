unit U_ObservacaoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, StdCtrls, Buttons, DB, DBCtrls,
  Classes, Controls, Forms, ExtCtrls, FMTBcd, SqlExpr, DBClient, Provider,
  Grids, DBGrids;

type
  Tfrm_ObservacaoProduto = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBMemo1: TDBMemo;
    DS: TDataSource;
    btn_fechar: TBitBtn;
    QRY: TSQLQuery;
    grid_similares: TDBGrid;
    dtsSimilar: TSQLDataSet;
    dtsSimilarPSI_ID: TIntegerField;
    dtsSimilarPRO_ID: TIntegerField;
    dtsSimilarPRO_ID_SIMILAR: TIntegerField;
    dtsSimilarPRO_REFERENCIA: TStringField;
    dtsSimilarPRO_DESCRICAO: TStringField;
    dspSimilar: TDataSetProvider;
    cdsSimilar: TClientDataSet;
    cdsSimilarPSI_ID: TIntegerField;
    cdsSimilarPRO_ID: TIntegerField;
    cdsSimilarPRO_ID_SIMILAR: TIntegerField;
    cdsSimilarPRO_REFERENCIA: TStringField;
    cdsSimilarPRO_EAN1: TStringField;
    cdsSimilarPRO_DESCRICAO: TStringField;
    dsSimilar: TDataSource;
    dtsSimilarPRO_ESTOQUE: TFMTBCDField;
    dtsSimilarPRO_VLRVENDA: TFMTBCDField;
    dtsSimilarPRO_VLRPRAZO: TFMTBCDField;
    cdsSimilarPRO_UNIDADE: TStringField;
    cdsSimilarPRO_ESTOQUE: TFMTBCDField;
    cdsSimilarPRO_VLRVENDA: TFMTBCDField;
    cdsSimilarPRO_VLRPRAZO: TFMTBCDField;
    dtsSimilarPRO_EAN1: TStringField;
    dtsSimilarPRO_UNIDADE: TStringField;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    trabSimilar : Boolean;
  public
    class procedure SetID(ID:Integer);
  end;

var
  frm_ObservacaoProduto: Tfrm_ObservacaoProduto;

implementation

uses U_DMRet;

{$R *.dfm}
class procedure Tfrm_ObservacaoProduto.SetID(ID: Integer);
begin
    with Tfrm_ObservacaoProduto.Create(nil) do
    try
        QRY.Close;
        QRY.Params[0].Value := ID;
        QRY.Open;

        if trabSimilar then
        Begin
            cdsSimilar.Close;
            cdsSimilar.Params[0].Value := ID;
            cdsSimilar.Open;
        End;

        ShowModal;
    finally
        Free;
    end;
end;

procedure Tfrm_ObservacaoProduto.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ObservacaoProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QRY.Close;
  Action := caFree; //destrói o form automaticamente
end;

procedure Tfrm_ObservacaoProduto.FormCreate(Sender: TObject);
begin
  trabSimilar := (DMRet.OpenSQL('select par_produto_similar from params',[]) = 'S');

  grid_similares.Visible := trabSimilar;
end;

procedure Tfrm_ObservacaoProduto.FormKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Escape then Close;
end;

procedure Tfrm_ObservacaoProduto.FormShow(Sender: TObject);
begin
   Caption := 'Observações do Produto - '+QRY.FieldByName('PRO_DESCRICAO').Value;
end;

procedure Tfrm_ObservacaoProduto.FormActivate(Sender: TObject);
begin
  if trabSimilar then
    grid_similares.SetFocus
  else
    btn_fechar.SetFocus;
end;

end.
