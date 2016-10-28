/// <summary>
///   Atualizador automático web. Baixa e instala as atulizações do sistema
///  integrado. Alan Thales - 15/12/2014
/// </summary>
unit U_AtualizacaoAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, jpeg, IdComponent, IdAntiFreezeBase,
  Vcl.IdAntiFreeze, IdBaseComponent, IdTCPConnection, IdTCPClient, IdHTTP;

const
  WM_EXECROUTINES = WM_APP + 321;

type
  Tfrm_AtualizacaoAuto = class(TForm)
    pnlFundo: TPanel;
    imgLogo: TImage;
    lblStatus: TLabel;
    ProgressBar: TProgressBar;
    IdHTTP: TIdHTTP;
    IdAntiFreeze: TIdAntiFreeze;
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormShow(Sender: TObject);
  private
    function BaixaArquivo: boolean;
    procedure ExecArquivo(const AFileName: string);
    procedure ExecutaRotinas(var Message: TMessage); message WM_EXECROUTINES;
  public
    class function TemAtualizacao: boolean;
  end;

var
  frm_AtualizacaoAuto: Tfrm_AtualizacaoAuto;

implementation

uses U_Backup, U_InsLog;

const
  URL_BASE = 'http://www.datacamp.net.br/phocadownload/atualizacao/%s';

{$R *.dfm}

function Tfrm_AtualizacaoAuto.BaixaArquivo: boolean;
const
  ARQ = 'patchs.exe';
var
  ms: TMemoryStream;
  sUrl: string;
begin
  Result := True;
  sUrl   := Format(URL_BASE, [ARQ]);
  ms     := TMemoryStream.Create;

  try
    try
      IdHTTP.Get(sUrl, ms);
      ms.SaveToFile(ARQ);
    except
      on E: Exception do
      begin
        Result := False;
        TInsLog.GeraLog('I', 'AUTOUPDWEB',
          Format('Ocorreu um erro ao baixar a atualização.'#13#10'%s', [E.Message]));
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Close;
      end;
    end;
  finally
    ms.Free;
  end;
end;

procedure Tfrm_AtualizacaoAuto.ExecArquivo(const AFileName: string);
var
  Path: string;
begin
  Application.ProcessMessages;
  Path := ExtractFilePath(Application.ExeName) + AFileName;
  try
    WinExec(PAnsiChar(AnsiString(Path)), SW_NORMAL);
  except
    on E: Exception do
    begin
      TInsLog.GeraLog('I', 'AUTOUPDWEB',
        Format('Ocorreu um erro ao executar "%s".'#13#10'%s', [AFileName, E.Message]));
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Close;
    end;
  end;
end;

procedure Tfrm_AtualizacaoAuto.ExecutaRotinas(var Message: TMessage);
begin
  if TemAtualizacao then
  begin
    if not BaixaArquivo then
      Exit;
    //

    TInsLog.GeraLog('I', 'AUTOUPDWEB', 'Atualização automática iniciada.');

    lblStatus.Caption := 'Instalando...';
    Tfrm_Backup.GerarBackup('',False);
    ExecArquivo('patchs.exe');
    Sleep(3000);
  end
  else
  begin
    Application.MessageBox('Não existe atualização a ser baixada.', 'ATENÇÃO!',
      MB_ICONINFORMATION);
    Close;
  end;
end;

procedure Tfrm_AtualizacaoAuto.FormShow(Sender: TObject);
begin
  lblStatus.Caption    := 'Verificando Atualizações...';
  ProgressBar.Position := 0;
  PostMessage(Self.Handle, WM_EXECROUTINES, 0, 0);
end;

procedure Tfrm_AtualizacaoAuto.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  ProgressBar.Position := Trunc(AWorkCount / 1024);
end;

procedure Tfrm_AtualizacaoAuto.IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  lblStatus.Caption := 'Baixando...';
  ProgressBar.Max   := Trunc(AWorkCountMax / 1024);
end;

procedure Tfrm_AtualizacaoAuto.IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  lblStatus.Caption := 'Terminado';
end;

class function Tfrm_AtualizacaoAuto.TemAtualizacao: boolean;
const
  TXT_FILE = 'version.txt';
var
  sUrl, Versao: string;
  verLocal, verWeb: TDateTime;
begin
  sUrl   := Format(URL_BASE, [TXT_FILE]);
  Versao := '';

  with TIdHTTP.Create(nil) do
  try
    ReadTimeout := 5000;
    HandleRedirects := False;

    try
      Versao := Get(sUrl);
    except
      on E: Exception do
      begin
        Result := False;
        TInsLog.GeraLog('I', 'AUTOUPDWEB',
          Format('Ocorreu um erro ao verificar atualização.'#13#10'%s', [E.Message]));
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Exit;
      end;
    end;
  finally
    Free;
  end;

  if not FileExists(TXT_FILE) then
  begin
    Result := True;
    Exit;
  end;

  verWeb := StrToDateTime(Trim(Versao));

  with TStringList.Create do
  try
    LoadFromFile(TXT_FILE);
    verLocal := StrToDateTime(Strings[0]);
  finally
    Free;
  end;

  Result := verLocal < verWeb;
end;

end.
