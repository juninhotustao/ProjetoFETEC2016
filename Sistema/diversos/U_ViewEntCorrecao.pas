unit U_ViewEntCorrecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, DBGrids, Grids, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, U_DMRet, StdCtrls, ExtCtrls;

type
  Tfrm_ViewEntCorrecao = class(TForm)
    Grid: TDBGrid;
    QRYViewEntCorrecao: TSQLQuery;
    DspViewEntCorrecao: TDataSetProvider;
    CDSViewEntCorrecao: TClientDataSet;
    ds_ViewEntCorrecao: TDataSource;
    CDSViewEntCorrecaoENT_NUMNOTA: TIntegerField;
    CDSViewEntCorrecaoENT_SERIE: TStringField;
    CDSViewEntCorrecaoMOD_ID: TStringField;
    CDSViewEntCorrecaoENT_DT_EMISSAO: TSQLTimeStampField;
    CDSViewEntCorrecaoFOR_NOME: TStringField;
    CDSViewEntCorrecaoFOR_ESTADO: TStringField;
    Panel1: TPanel;
    Memo1: TMemo;
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ViewEntCorrecao: Tfrm_ViewEntCorrecao;

implementation

{$R *.dfm}

procedure Tfrm_ViewEntCorrecao.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    Grid.Canvas.Brush.Color := clActiveCaption;
    Grid.Canvas.Font.Color  := clWhite;
  end
  else
  begin
    Grid.Canvas.Brush.Color := $00F4FFFF;
    Grid.Canvas.Font.Color  := clWindowText;
  end;

  Grid.DefaultDrawDataCell(Rect, Grid.Columns[DataCol].Field, State);
end;

procedure Tfrm_ViewEntCorrecao.GridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

end.
