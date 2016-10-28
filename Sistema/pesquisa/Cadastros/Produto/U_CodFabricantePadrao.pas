unit U_CodFabricantePadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Menus, DB, ADODB, FMTBcd, SqlExpr;

type
  Tfrm_CodFabricantePadrao = class(TForm)
    Panel1: TPanel;
    edt_codfab1: TDBEdit;
    edt_codfab2: TDBEdit;
    Label48: TLabel;
    Label49: TLabel;
    edt_codfab3: TDBEdit;
    Label50: TLabel;
    Label51: TLabel;
    edt_codfab4: TDBEdit;
    Label52: TLabel;
    edt_codfab5: TDBEdit;
    Label57: TLabel;
    edt_codfab10: TDBEdit;
    edt_codfab9: TDBEdit;
    Label56: TLabel;
    edt_codfab8: TDBEdit;
    Label55: TLabel;
    Label54: TLabel;
    edt_codfab7: TDBEdit;
    edt_codfab6: TDBEdit;
    Label53: TLabel;
    qry_CodFabricante: TADOQuery;
    DS: TDataSource;
    QRY: TSQLQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure SetID(ID:Integer);
  end;

var
  frm_CodFabricantePadrao: Tfrm_CodFabricantePadrao;

implementation

uses U_DMRet;

{$R *.dfm}

procedure Tfrm_CodFabricantePadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QRY.Close;
  Action := caFree; //destrói o form automaticamente
end;

procedure Tfrm_CodFabricantePadrao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key=VK_RETURN Then
       Perform(WM_NEXTDLGCTL,0,0)
   else if Key = VK_Escape then
     close;
end;

procedure Tfrm_CodFabricantePadrao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #27 Then Close;
end;

class procedure Tfrm_CodFabricantePadrao.SetID(ID: Integer);
begin
    with Tfrm_CodFabricantePadrao.Create(nil) do
    try
        QRY.Params[0].Value := ID;
        QRY.Open;

        ShowModal;
    finally
        Free;
    end;
end;

end.
