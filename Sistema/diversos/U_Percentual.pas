unit U_Percentual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB;

type
  Tfrm_Percentual = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edt_Correcao: TEdit;
    btn_confirma: TBitBtn;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_CorrecaoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_confirmaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    VlrPercentual : Double;
  public
    class function GetResult : Double;
  end;

var
  frm_Percentual: Tfrm_Percentual;

implementation

uses U_DMRet;

{$R *.dfm}

procedure Tfrm_Percentual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
    VlrPercentual := StrToFloat(edt_Correcao.Text);
end;

procedure Tfrm_Percentual.edt_CorrecaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['0'..'9',',',char(8)]) then Key:= #0;
end;

procedure Tfrm_Percentual.btn_confirmaClick(Sender: TObject);
begin
  try
    VlrPercentual := StrToFloat(edt_Correcao.Text)
  except
  on x:Exception do
    begin
      MessageBox(Handle,pchar(x.Message),pchar(Application.Title),MB_ICONERROR+MB_OK);
      edt_Correcao.SetFocus;
      abort;
    end;
  end;

  Close;
end;

procedure Tfrm_Percentual.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
If Key=VK_RETURN Then
   Perform(WM_NEXTDLGCTL,0,0);
end;

class function Tfrm_Percentual.GetResult: Double;
begin
   with Tfrm_Percentual.Create(nil) do
    try
        ShowModal;
        Result := VlrPercentual;
    finally
        Free;
    end;
end;

procedure Tfrm_Percentual.FormActivate(Sender: TObject);
const
  SQL_COEF = 'select isnull(PAR_FATOR_COEF2,0) as PAR_FATOR_COEF2 from params';
var
  fCoef : Currency;
begin
  fCoef := DMRet.OpenSQL(SQL_COEF,[]);
  //
  edt_Correcao.Text:= FormatFloat('0.00',fCoef);
  edt_Correcao.SelectAll;
end;

end.
