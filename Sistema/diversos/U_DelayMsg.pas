unit U_DelayMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_DelayMsg = class(TForm)
    pnlFundo: TPanel;
    lblTitulo: TLabel;
    lblStatus: TLabel;
    tmDelay: TTimer;
    procedure tmDelayTimer(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure Delay(const AMsg: string; const ASecs: integer = 3);
  end;

const
  DEADLOCK_DEFMSG = 'Ocorreu deadlock no sistema. Tentativa de resolução: %d';

var
  frm_DelayMsg: Tfrm_DelayMsg;

implementation

{$R *.dfm}

{ Tfrm_DelayMsg }

class procedure Tfrm_DelayMsg.Delay(const AMsg: string; const ASecs: integer);
begin
  with Tfrm_DelayMsg.Create(nil) do
  try
    tmDelay.Interval  := ASecs * 1000;
    lblStatus.Caption := AMsg;
    ShowModal;
  finally
    Free;
  end;
end;

procedure Tfrm_DelayMsg.tmDelayTimer(Sender: TObject);
begin
  Close;
end;

end.
