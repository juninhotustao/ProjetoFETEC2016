unit U_ACBrChaveAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  Tfrm_ACBrChaveAcesso = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Label1: TLabel;
    edt_chave: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function SetChave(CHV:string) : Boolean;
  end;

var
  frm_ACBrChaveAcesso: Tfrm_ACBrChaveAcesso;

implementation

{$R *.dfm}

procedure Tfrm_ACBrChaveAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree; //destrói o form automaticamente
end;

procedure Tfrm_ACBrChaveAcesso.Button1Click(Sender: TObject);
begin
  Close;
end;

class function Tfrm_ACBrChaveAcesso.SetChave(CHV: string): Boolean;
begin
    with Tfrm_ACBrChaveAcesso.Create(nil) do
    try
        edt_chave.Text := CHV;
        ShowModal;
    finally
        Free;
    end;
end;

end.
