unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort, ExtCtrls, Buttons, System.UITypes, Vcl.Menus,
  Vcl.Imaging.pngimage;

type
  TFrmPrincipal = class(TForm)
    ComPort1: TComPort;
    Panel2: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    lblVermelho: TLabel;
    lblVerde: TLabel;
    lblAzul: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    imgProduto: TImage;
    imgVendas: TImage;
    imgConfiguracao: TImage;
    lblBranco: TLabel;
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    function VerificaConexao: Boolean;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure GetCor(ACor: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgProdutoClick(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
    procedure imgConfiguracaoClick(Sender: TObject);
    procedure imgVendasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UConProduto, Uvendas;

{$R *.dfm}
function TFrmPrincipal.VerificaConexao: Boolean;
begin
  Result := False;

  try
    if not(ComPort1.Connected) then
      ComPort1.Connected := True;

    Result := True;
  except
    MessageDlg('N�o foi encontrada comunica��o com a porta serial, verifique as configura��es!',mtError, [mbOK], 0);
    label6.Caption := 'Desconectado';
    label6.Font.Color := clRed;
  end;
end;

procedure TFrmPrincipal.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  Buffer: String;
  Contador: integer;
begin
  Buffer := '';
  Sleep(250);
  Contador := ComPort1.InputCount;
  ComPort1.ReadStr(Buffer, Contador);

  GetCor(Buffer);
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComPort1.Connected := False;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  if (VerificaConexao) then
  begin
    label6.Caption    := 'Conectado  ';
    label6.font.Color := clGreen;
  end else
  begin
   label6.Caption := 'Desconectado  ';
   label6.font.Color:=clRed;
  end;

  //Limpar memoria da placa para retornar a partir do momento iniciado.
  ComPort1.ClearBuffer(true, true);
end;

procedure TFrmPrincipal.GetCor(ACor: string);
var
  Cor: string;
  CountRed, CountGreen, CountBlue: Integer;
begin
  case ACor[1] of
    '0':
    begin
      Cor := 'Vermelho';
      Inc(CountRed);
      lblVermelho.Caption := Inttostr((Strtoint(lblVermelho.Caption) + CountRed));
    end;
    '1':
    begin
      Cor := 'Verde';
      Inc(CountGreen);
      lblVerde.Caption := Inttostr((Strtoint(lblVerde.Caption) + CountGreen ));
    end;
    '2':
    begin
      Cor := 'Azul';
      Inc(CountBlue);
      lblAzul.Caption := Inttostr((Strtoint(lblAzul.Caption) + CountBlue ));
    end;
  end;
end;

procedure TFrmPrincipal.imgConfiguracaoClick(Sender: TObject);
begin
  Comport1.ShowSetupDialog;
  comport1.Connected := false;
  VerificaConexao();
end;

procedure TFrmPrincipal.imgFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.imgProdutoClick(Sender: TObject);
begin
  frmConProduto :=  TfrmConProduto.Create(self);
  frmConProduto.Show;
end;

procedure TFrmPrincipal.imgVendasClick(Sender: TObject);
begin
  frmVendas :=  TfrmVendas.Create(self);
  frmVendas.Show;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  Comport1.ShowSetupDialog;
  comport1.Connected := false;
  VerificaConexao();
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
