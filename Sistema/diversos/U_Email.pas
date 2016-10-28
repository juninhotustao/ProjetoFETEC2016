unit U_Email;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, ACBrBase, ACBrMail;

const
  WM_EXECROUTINES = WM_APP + 6245; // Sempre utilizar um valor que não exista

type
  Tfrm_Email = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    ACBrMail: TACBrMail;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ACBrMailMailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
  private
    iTentativas:Integer;

    ResultProcess, bReadingConfirmation, bSSL, bTLS :Boolean;

    sFromName, sHost, sUsername, sPassword, sPort, sAddress,
    sCC, sReplyTo, sBCC, sSubject, sbodyText, sPathAnexo:string;

    procedure ExecutaRotinas(var Message: TMessage); message WM_EXECROUTINES;
  public
    class function Enviar(FromName,Host,Email,Password,Port,Address,Subject,bodyText:string;
                          PathAnexo:string='';
                          Tentativas:Integer=3;
                          ReadingConfirmation:Boolean=False;
                          SSL:Boolean=False;
                          TLS:Boolean=False;
                          CC:string='';ReplyTo:string='';BCC:string='') : Boolean;
  end;

var
  frm_Email: Tfrm_Email;

implementation

uses U_FuncUtils, ACBrUtil;

{$R *.dfm}

{ Tfrm_EnviaEmail }

procedure Tfrm_Email.ExecutaRotinas(var Message: TMessage);
begin
    ResultProcess := False;
    try
        if sFromName = '' then
          raise Exception.Create('Não foi informado o NOME do remetende!');

        if sHost = '' then
          raise Exception.Create('Não foi informado o SERVIDOR SMTP do remetende!');

        if sUsername = '' then
          raise Exception.Create('Não foi informado EMAIL do remetende!');

        if sPassword = '' then
          raise Exception.Create('Não foi informado a SENHA do email do remetende!');

        if sPort = '' then
          raise Exception.Create('Não foi informado a PORTA do SERVIDOR SMTP do remetende!');

        if sAddress = '' then
          raise Exception.Create('Não foi informado o EMAIL do destinatário!');

        if sSubject = '' then
          raise Exception.Create('Não foi informado o ASSUNTO do email!');

        if sbodyText = '' then
          raise Exception.Create('Não foi informado o TEXTO do email!');

        if not(sPathAnexo = '') and not(FileExists(sPathAnexo)) then
          raise Exception.Create('Não foi encontrado o anexo informado!');

        ProgressBar1.Position := 1;
        Sleep(500);
        with ACBrMail do
        try
           From      := sUsername; //Email do remetente
           FromName  := sFromName; //Nome do remetente
           Host      := sHost; // troque pelo seu servidor smtp
           Username  := sUsername;
           Password  := sPassword;
           Port      := sPort; // troque pela porta do seu servidor smtp
           AddAddress(sAddress,'');

           if not(sCC = '') then
             AddCC(sCC); // opcional

           if not(sReplyTo = '') then
             AddReplyTo(sReplyTo); // opcional

           if not(sBCC = '') then
             AddBCC(sBCC); // opcional

           Subject := sSubject; // assunto
           IsHTML := False; // define que a mensagem é texto puro

           // mensagem principal do e-mail. pode ser html ou texto puro
           ReadingConfirmation := bReadingConfirmation; // solicita confirmação de leitura
           Body.Text := sbodyText;
           AltBody.Text := StripHTML(sbodyText);

           if not(sPathAnexo = '') then
             AddAttachment(sPathAnexo,'');//Anexando Arquivo

           Attempts := iTentativas;//tentativas
           SetSSL := bSSL;
           SetTLS := bTLS;

           //Enviando o Email
           Send;

           ResultProcess := True;

           Application.MessageBox(pchar('Email Enviado com Sucesso!'),'Atenção',MB_ICONINFORMATION + MB_OK);
        except
           on x: Exception do
             Application.MessageBox(pchar(x.message),'ERRO',MB_ICONERROR + MB_OK);
        end;
        //
    finally
        close;
    end;
    //
end;

procedure Tfrm_Email.FormCreate(Sender: TObject);
begin
   TFuncUtils.DesabilitarGhostingDoWindows;
end;

procedure Tfrm_Email.FormShow(Sender: TObject);
begin
   PostMessage(Self.Handle, WM_EXECROUTINES, 0, 0);
end;

procedure Tfrm_Email.ACBrMailMailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin
  ProgressBar1.Position := Integer( aStatus );

  Application.ProcessMessages;

  case aStatus of
    pmsStartProcess:
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add('Iniciando processo de envio.');
    end;
    pmsConfigHeaders:
      Memo1.Lines.Add('Configurando o cabeçalho do e-mail.');
    pmsLoginSMTP:
      Memo1.Lines.Add('Logando no servidor de e-mail.');
    pmsStartSends:
      Memo1.Lines.Add('Iniciando os envios.');
    pmsSendTo:
      Memo1.Lines.Add('Processando lista de destinatários.');
    pmsSendCC:
      Memo1.Lines.Add('Processando lista CC.');
    pmsSendBCC:
      Memo1.Lines.Add('Processando lista BCC.');
    pmsSendReplyTo:
      Memo1.Lines.Add('Processando lista ReplyTo.');
    pmsSendData:
      Memo1.Lines.Add('Enviando dados.');
    pmsLogoutSMTP:
      Memo1.Lines.Add('Fazendo Logout no servidor de e-mail.');
    pmsDone:
    begin
      Memo1.Lines.Add('Terminando e limpando.');
      ProgressBar1.Position := ProgressBar1.Max;
    end;
  end;
end;

class function Tfrm_Email.Enviar(FromName,Host,Email,Password,
Port,Address,Subject,bodyText:string; PathAnexo:string='';
Tentativas:Integer=3; ReadingConfirmation:Boolean=False;
SSL:Boolean=False; TLS:Boolean=False;
CC:string='';ReplyTo:string='';BCC:string=''): Boolean;
begin
    with Tfrm_Email.Create(nil) do
    try
        sFromName   := Trim(FromName);
        sHost       := Trim(Host);
        sUsername   := Trim(Email);
        sPassword   := Trim(Password);
        sPort       := Trim(Port);
        sAddress    := Trim(Address);
        sCC         := Trim(CC);
        sReplyTo    := Trim(ReplyTo);
        sBCC        := Trim(BCC);
        sSubject    := Trim(Subject);
        sbodyText   := Trim(bodyText);
        sPathAnexo  := Trim(PathAnexo);
        iTentativas := Tentativas;
        bReadingConfirmation := ReadingConfirmation;
        bSSL       := SSL;
        bTLS       := TLS;

        ShowModal;
        Result  := ResultProcess;
    finally
        Free;
    end;
end;

end.
