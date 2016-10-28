unit U_SystemUsuario;

interface

{$HINTS OFF}

type
  TUsuario = class
  strict private
    class var usuario: TUsuario;

    {$REGION 'attributes'}
    FId: integer;
    FNome: string;
    FEspBloqGeral: Boolean;
    FEspBloqComposicao: Boolean;
    FEmailServidorSMTP : string;
    FEmailPorta: integer;
    FEmailUsuario: string;
    FEmailSenha: string;
    FEmailContato: string;
    FEmailConfLeitura: Boolean;
    FEmailSSL: Boolean;
    FEmailTLS: Boolean;
    FEncerraPDACeramica: boolean;
    {$ENDREGION}

    {$REGION 'static methods'}
    class function GetId: integer; static;
    class function GetNome: string; static;
    class function GetEspBloqGeral: Boolean; static;
    class function GetEspBloqComposicao: Boolean; static;
    class function GetEmailServidorSMTP : string; static;
    class function GetEmailPorta: integer; static;
    class function GetEmailUsuario: string; static;
    class function GetEmailSenha: string; static;
    class function GetEmailContato: string; static;
    class function GetEmailConfLeitura: Boolean; static;
    class function GetEmailSSL: Boolean; static;
    class function GetEmailTLS: Boolean; static;
    class function GetEncerraPDACeramica: Boolean; static;
    {$ENDREGION}

    {$REGION 'overrides'}
    class function NewInstance: TObject; override;
    procedure FreeInstance; override;
    {$ENDREGION}
  public
    class property Id: integer read GetId;
    class property Nome: string read GetNome;
    class property EspBloqGeral: Boolean read GetEspBloqGeral;
    class property EspBloqComposicao: Boolean read GetEspBloqComposicao;
    class property EmailServidorSMTP: string read GetEmailServidorSMTP;
    class property EmailPorta: integer read GetEmailPorta;
    class property EmailUsuario: string read GetEmailUsuario;
    class property EmailSenha: string read GetEmailSenha;
    class property EmailContato: string read GetEmailContato;
    class property EmailConfLeitura: Boolean read GetEmailConfLeitura;
    class property EmailSSL: Boolean read GetEmailSSL;
    class property EmailTLS: Boolean read GetEmailTLS;
    class property EncerraPDACeramica: Boolean read GetEncerraPDACeramica;

    class procedure ChangeUser;
  end;


implementation

uses
  U_DmRet, DBClient;

{ TUsuario }

class procedure TUsuario.ChangeUser;
begin
  if Assigned(usuario) then
  Begin
    usuario.Free;
    usuario := nil;
  End;
end;

procedure TUsuario.FreeInstance;
begin
  inherited;
  usuario := nil;
end;

class function TUsuario.GetEmailConfLeitura: Boolean;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEmailConfLeitura;
end;

class function TUsuario.GetEmailContato: string;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEmailContato;
end;

class function TUsuario.GetEmailPorta: integer;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEmailPorta;
end;

class function TUsuario.GetEmailSenha: string;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEmailSenha;
end;

class function TUsuario.GetEmailServidorSMTP: string;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEmailServidorSMTP;
end;

class function TUsuario.GetEmailSSL: Boolean;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEmailSSL;
end;

class function TUsuario.GetEmailTLS: Boolean;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEmailTLS;
end;

class function TUsuario.GetEmailUsuario: string;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEmailUsuario;
end;

class function TUsuario.GetEncerraPDACeramica: Boolean;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEncerraPDACeramica;
end;

class function TUsuario.GetEspBloqComposicao: Boolean;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEspBloqComposicao;
end;

class function TUsuario.GetEspBloqGeral: Boolean;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FEspBloqGeral;
end;

class function TUsuario.GetId: integer;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FId;
end;

class function TUsuario.GetNome: string;
begin
  usuario := TUsuario(TUsuario.NewInstance);
  Result  := usuario.FNome;
end;

class function TUsuario.NewInstance: TObject;
const
  SQL =
    ' select' +
    ' 	AUT_USUARIO, isnull(USU_ID, -1) as USU_ID, '+
    '   isnull(USU_ESPECIAL_BLOQGERAL,''N'') as USU_ESPECIAL_BLOQGERAL, '+
    '   isnull(USU_ESPECIAL_BLOQCOMPOSICAO,''N'') as USU_ESPECIAL_BLOQCOMPOSICAO, ' +
    '   USU_EMAIL_SERVIDORSMTP, USU_EMAIL_PORTA, USU_EMAIL_USUARIO, '+
    '   USU_EMAIL_SENHA, USU_EMAIL_CONTATO, '+
    '   USU_EMAIL_CONF_LEITURA, USU_EMAIL_SSL, USU_EMAIL_TLS,USU_PDA_ENCERRA_CERAMICA '+
    ' from' +
    ' 	AUTENTICACAO A' +
    ' left join' +
    ' 	USUARIO U on A.AUT_USUARIO = U.USU_NOME' +
    ' where' +
    ' 	A.AUT_HOST = HOST_NAME()';
begin
  if not Assigned(usuario) then
  begin
    usuario := TUsuario(inherited NewInstance);

    with TClientDataSet.Create(nil) do
    try
      Data := DMRet.GetData(SQL, []);
      if not IsEmpty then
      begin
        //Rotinas basicas
        usuario.FId   := Fields.FieldByName('USU_ID').AsInteger;
        usuario.FNome := Fields.FieldByName('AUT_USUARIO').AsString;
        //Rotinas Especiais
        usuario.FEspBloqGeral      := Fields.FieldByName('USU_ESPECIAL_BLOQGERAL').AsString = 'S';
        usuario.FEspBloqComposicao := Fields.FieldByName('USU_ESPECIAL_BLOQCOMPOSICAO').AsString = 'S';
        usuario.FEmailServidorSMTP := Fields.FieldByName('USU_EMAIL_SERVIDORSMTP').AsString;
        usuario.FEmailPorta        := Fields.FieldByName('USU_EMAIL_PORTA').AsInteger;
        usuario.FEmailUsuario      := Fields.FieldByName('USU_EMAIL_USUARIO').AsString;
        usuario.FEmailSenha        := Fields.FieldByName('USU_EMAIL_SENHA').AsString;
        usuario.FEmailContato      := Fields.FieldByName('USU_EMAIL_CONTATO').AsString;
        usuario.FEmailConfLeitura  := Fields.FieldByName('USU_EMAIL_CONF_LEITURA').AsString = 'S';
        usuario.FEmailSSL          := Fields.FieldByName('USU_EMAIL_SSL').AsString = 'S';
        usuario.FEmailTLS          := Fields.FieldByName('USU_EMAIL_TLS').AsString = 'S';
        usuario.FEncerraPDACeramica:= Fields.FieldByName('USU_PDA_ENCERRA_CERAMICA').AsString = 'S';
      end;
    finally
      Free;
    end;
  end;
  Result := usuario;
end;


{$HINTS ON}

end.

