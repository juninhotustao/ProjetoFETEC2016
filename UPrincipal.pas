unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort, ExtCtrls, Buttons, System.UITypes, Vcl.Menus,
  Vcl.Imaging.pngimage, UAtualizar, Vcl.Imaging.jpeg;
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
    lblMarrom: TLabel;
    lblAmarelo: TLabel;
    lblLaranja: TLabel;
    imgRelatorio: TImage;
    imgMarron: TImage;
    ImgAmarelo: TImage;
    ImgAzul: TImage;
    ImgVerde: TImage;
    ImgVermelho: TImage;
    ImgLaranja: TImage;
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
    procedure imgRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    FAtualiza: TAtualizarEstoque;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UConProduto, Uvendas, URelatorio;

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

  lblLaranja.Color := $000080FF;

  //Limpar memoria da placa para retornar a partir do momento iniciado.
  ComPort1.ClearBuffer(true, true);
end;

procedure TFrmPrincipal.GetCor(ACor: string);
var
  Cor: string;
  CountMarrom, CountAmarelo, CountLaranja, CountRed, CountGreen, CountBlue: Integer;
begin
  case ACor[1] of
    '1':
    begin
      Cor := 'MARROM';
      Inc(CountMarrom);
      lblMarrom.Caption := Inttostr((Strtoint(lblMarrom.Caption) + CountMarrom));

      FAtualiza.AtualizarEstoque('E', 1, '1');
    end;
    '2':
    begin
      Cor := 'AMARELO';
      Inc(CountAmarelo);
      lblAmarelo.Caption := Inttostr((Strtoint(lblAmarelo.Caption) + CountAmarelo ));

      FAtualiza.AtualizarEstoque('E', 1, '2');
    end;
    '3':
    begin
      Cor := 'VERDE';
      Inc(CountGreen);
      lblVerde.Caption := Inttostr((Strtoint(lblVerde.Caption) + CountGreen ));

      FAtualiza.AtualizarEstoque('E', 1, '3');
    end;
    '4':
    begin
      Cor := 'VERMELHO';
      Inc(CountRed);
      lblVermelho.Caption := Inttostr((Strtoint(lblVermelho.Caption) + CountRed ));

      FAtualiza.AtualizarEstoque('E', 1, '4');
    end;
    '5':
    begin
      Cor := 'AZUL';
      Inc(CountBlue);
      lblAzul.Caption := Inttostr((Strtoint(lblAzul.Caption) + CountBlue ));

      FAtualiza.AtualizarEstoque('E', 1, '5');
    end;
    '6':
    begin
      Cor := 'LARANJA';
      Inc(CountLaranja);
      lblLaranja.Caption := Inttostr((Strtoint(lblLaranja.Caption) + CountLaranja ));

      FAtualiza.AtualizarEstoque('E', 1, '6');
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

procedure TFrmPrincipal.imgRelatorioClick(Sender: TObject);
begin
  frm_Relatorio :=  Tfrm_Relatorio.Create(self);
  frm_Relatorio.ShowModal;
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
