unit UPesqVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_PesqLancBase, Data.FMTBcd,
  Data.SqlExpr, Data.DB, Datasnap.DBClient, Datasnap.Provider, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPesqVendas = class(Tfrm_PesqLancBase)
    CDSVEN_ID: TIntegerField;
    CDSVEN_TOTAL: TFMTBCDField;
    CDSVEN_OBSERVACAO: TStringField;
    CDSVEN_DATA: TSQLTimeStampField;
    procedure btn_ConfirmaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetId: Integer;
  end;

var
  FrmPesqVendas: TFrmPesqVendas;

implementation

uses
  U_DMRet, UVendas;
{$R *.dfm}

procedure TFrmPesqVendas.btn_ConfirmaClick(Sender: TObject);
var
  Params: array of Variant;
begin
  inherited;
  CDS.Close;

  SetLength(Params, 3);

  if chk_datas.Checked then
  begin
    Params[0] := StrToDateTime('01/01/1753');
    Params[1] := StrToDateTime('31/12/9999');
  end
  else
    begin
    Params[0] := dt_inicial.DateTime;
    Params[1] := dt_final.DateTime;
  end;

  if chk_num.Checked then
    Params[2] := '%'
  else
    Params[2] := edt_nro.Text;

  CDS.Params[0].Value := Params[0];
  CDS.Params[1].Value := Params[1];
  CDS.Params[2].Value := Params[2];

  CDS.Open;
end;

procedure TFrmPesqVendas.DBGrid1DblClick(Sender: TObject);
begin
  //Carregar a venda
  frmVendas.CDS.Params[0].Value := GetId;
  frmVendas.CDS.Open;
  frmVendas.CDS.Refresh;
  //Carregar os itens
  frmVendas.CDS_ITEM.Params[0].Value := GetId;
  frmVendas.CDS_ITEM.Open;
  frmVendas.CDS_ITEM.Refresh;

  inherited;
end;

function TFrmPesqVendas.GetId: Integer;
begin
  Result := CDSVEN_ID.AsInteger;

end;

end.
