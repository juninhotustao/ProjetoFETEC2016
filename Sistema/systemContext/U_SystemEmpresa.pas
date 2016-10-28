unit U_SystemEmpresa;

interface

{$HINTS OFF}

type
  TTipoEstab = (tiPosto, tiLoja, tiFarmacia, tiRestaurante, tiSupermercado,
                tiOtica, tiAgropecuaria);

  TEmpresa = class
  strict private
    class var empresa: TEmpresa;

    {$REGION 'attributes'}
    FTipo: TTipoEstab;
    FCnpj: string;
    FRazao: string;
    FUF: string;
    FIE: string;
    FIM: string;
    FEndereco: string;
    FNumero: string;
    FBairro: string;
    FCidade: string;
    FCep: string;
    FComplemento: string;
    FNomeFantasia: string;
    FCodEmpContab: string;
    FTelefone: string;
    FRepresNome: string;
    FRepresCPF: string;
    FContadorNome: string;
    FContadorCRC: string;
    FRegJunta: string;
    FEmail: string;
    FSerialDemo: Boolean;
    FMunicipioCod : Integer;
    FRegimeTributario : String;
    FEmailSmtp : String;
    FEmailPorta : Integer;
    FEmailUsuario : String;
    FEmailSenha : String;
    FEmailSSL : Boolean;
    FEmailTLS : Boolean;
    FEmailConfLeitura : Boolean;
    FEmailMensagem : String;
    FCNAE : String;
    FRNTRC : String;
    FMdfeTipoEmit : String;
    FEmpIncentCult : Integer;
    FSpedFiscalAtividade : String;
    FCalculaSubstProduto :String;
    FAliqCredito: Double;
    {$ENDREGION}

    {$REGION 'static methods'}
    class function GetTipo: TTipoEstab; static;
    class function GetCnpj: string; static;
    class function GetRazao: string; static;
    class function GetUF: string; static;
    class function GetIE: string; static;
    class function GetIM: string; static;
    class function GetEndereco: string; static;
    class function GetNumero: string; static;
    class function GetBairro: string; static;
    class function GetCidade: string; static;
    class function GetCep: string; static;
    class function GetComplemento: string; static;
    class function GetNomeFantasia: string; static;
    class function GetCodEmpContab: string; static;
    class function GetTelefone: string; static;
    class function GetRepresNome: string; static;
    class function GetRepresCPF: string; static;
    class function GetContadorNome: string; static;
    class function GetContadorCRC: string; static;
    class function GetRegJunta: string; static;
    class function GetEmail: string; static;
    class function GetSerialDemo: Boolean; static;
    class function GetMunicipioCod : Integer; static;
    class function GetRegimeTributario : String; static;
    class function GetEmailSmtp : String; static;
    class function GetEmailPorta : Integer; static;
    class function GetEmailUsuario : String; static;
    class function GetEmailSenha : String; static;
    class function GetEmailSSL : Boolean; static;
    class function GetEmailTLS : Boolean; static;
    class function GetEmailConfLeitura : Boolean; static;
    class function GetEmailMensagem : String; static;
    class function GetCNAE : String; static;
    class function GetRNTRC : String; static;
    class function GetMdfeTipoEmit : String; static;
    class function GetEmpIncentCult : Integer; static;
    class function GetSpedFiscalAtividade : String; static;
    class function GetCalculaSubstProduto : String; static;
    class function GetAliqCredito: Double; static;
    {$ENDREGION}

    {$REGION 'overrides'}
    class function NewInstance: TObject; override;
    procedure FreeInstance; override;
    {$ENDREGION}
  public
    {$REGION 'property'}
    class property Tipo: TTipoEstab read GetTipo;
    class property Cnpj: string read GetCnpj;
    class property Razao: string read GetRazao;
    class property UF: string read GetUF;
    class property IE: string read GetIE;
    class property IM: string read GetIM;
    class property Endereco: string read GetEndereco;
    class property Numero: string read GetNumero;
    class property Bairro: string read GetBairro;
    class property Cidade: string read GetCidade;
    class property Cep: string read GetCep;
    class property Complemento: string read GetComplemento;
    class property NomeFantasia: string read GetNomeFantasia;
    class property CodEmpContab: string read GetCodEmpContab;
    class property Telefone: string read GetTelefone;
    class property RepresNome: string read GetRepresNome;
    class property RepresCPF: string read GetRepresCPF;
    class property ContadorNome: string read GetContadorNome;
    class property ContadorCRC: string read GetContadorCRC;
    class property RegJunta: string read GetRegJunta;
    class property Email: string read GetEmail;
    class property SerialDemo: Boolean read GetSerialDemo;
    class property MunicipioCod : Integer read GetMunicipioCod;
    class property RegimeTributario : String read GetRegimeTributario;
    class property EmailSmtp : String read GetEmailSmtp;
    class property EmailPorta : Integer read GetEmailPorta;
    class property EmailUsuario : String read GetEmailUsuario;
    class property EmailSenha : String read GetEmailSenha;
    class property EmailSSL : Boolean read GetEmailSSL;
    class property EmailTLS : Boolean read GetEmailTLS;
    class property EmailConfLeitura : Boolean read GetEmailConfLeitura;
    class property EmailMensagem : String read GetEmailMensagem;
    class property CNAE : String read GetCNAE;
    class property RNTRC : String read GetRNTRC;
    class property MdfeTipoEmit : string read GetMdfeTipoEmit;
    class property EmpIncentCult : Integer read GetEmpIncentCult;
    class property SpedFiscalAtividade : String read GetSpedFiscalAtividade;
    class property CalculaSubstProduto : String read GetCalculaSubstProduto;
    class property AliqCredito : Double read GetAliqCredito;
    {$ENDREGION}
  end;

implementation

uses
  U_DmRet, DBClient;

{ TEmpresa }

procedure TEmpresa.FreeInstance;
begin
  inherited;
  empresa := nil;
end;

class function TEmpresa.GetAliqCredito: Double;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FAliqCredito;
end;

class function TEmpresa.GetBairro: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FBairro;
end;

class function TEmpresa.GetCalculaSubstProduto: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FCalculaSubstProduto;
end;

class function TEmpresa.GetCep: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FCep;
end;

class function TEmpresa.GetCidade: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FCidade;
end;

class function TEmpresa.GetCNAE: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FCNAE;
end;

class function TEmpresa.GetCnpj: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FCnpj;
end;

class function TEmpresa.GetCodEmpContab: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FCodEmpContab;
end;

class function TEmpresa.GetComplemento: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FComplemento;
end;

class function TEmpresa.GetContadorCRC: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FContadorCRC;
end;

class function TEmpresa.GetContadorNome: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FContadorNome;
end;

class function TEmpresa.GetEmail: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmail;
end;

class function TEmpresa.GetEmailMensagem: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmailMensagem;
end;

class function TEmpresa.GetEmailPorta: Integer;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmailPorta;
end;

class function TEmpresa.GetEmailSenha: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmailSenha;
end;

class function TEmpresa.GetEmailSmtp: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmailSmtp;
end;

class function TEmpresa.GetEmailSSL: Boolean;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmailSSL;
end;

class function TEmpresa.GetEmailTLS: Boolean;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmailTLS;
end;

class function TEmpresa.GetEmailConfLeitura: Boolean;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmailConfLeitura;
end;

class function TEmpresa.GetEmailUsuario: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmailUsuario;
end;

class function TEmpresa.GetEndereco: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEndereco;
end;

class function TEmpresa.GetIE: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FIE;
end;

class function TEmpresa.GetIM: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FIM;
end;

class function TEmpresa.GetMdfeTipoEmit: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FMdfeTipoEmit;
end;

class function TEmpresa.GetEmpIncentCult: Integer;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FEmpIncentCult;
end;

class function TEmpresa.GetMunicipioCod: Integer;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FMunicipioCod;
end;

class function TEmpresa.GetNomeFantasia: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FNomeFantasia;
end;

class function TEmpresa.GetNumero: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FNumero;
end;

class function TEmpresa.GetRazao: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FRazao;
end;

class function TEmpresa.GetRegimeTributario: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FRegimeTributario;
end;

class function TEmpresa.GetRegJunta: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FRegJunta;
end;

class function TEmpresa.GetRepresCPF: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FRepresCPF;
end;

class function TEmpresa.GetRepresNome: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FRepresNome;
end;

class function TEmpresa.GetRNTRC: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FRNTRC;
end;

class function TEmpresa.GetSerialDemo: Boolean;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FSerialDemo;
end;

class function TEmpresa.GetSpedFiscalAtividade: String;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result := empresa.FSpedFiscalAtividade;
end;

class function TEmpresa.GetTelefone: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FTelefone;
end;

class function TEmpresa.GetTipo: TTipoEstab;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FTipo;
end;

class function TEmpresa.GetUF: string;
begin
  empresa := TEmpresa(TEmpresa.NewInstance);
  Result  := empresa.FUF;
end;

class function TEmpresa.NewInstance: TObject;
const
  SQL =
    ' select '+
    '    PAR_ESTABELECIMENTO, EMP_CGC, EMP_NOME, EMP_ESTADO, '+
    '    EMP_INSCRICAOESTADUAL, EMP_ENDERECO, EMP_NUMERO, EMP_BAIRRO, '+
    '    EMP_CIDADE, EMP_CEP, EMP_COMPLEMENTO, EMP_FANTASIA, '+
    '    EMP_INCRICAOMUNICIPAL, EMP_NUMCONTABILIDADE, EMP_TELEFONE, '+
    '    EMP_NOMEREPRES, EMP_REPRESCPF, EMP_NOMECONTADOR, EMP_CRCCONTADOR, '+
    '    EMP_NUMEROREGISTROJUNTA, EMP_EMAIL, SRL_KEY, MUN_COD, '+
    '    EMP_REGIME_TRIBUTARIO, EMP_NFEEMAIL_SERVIDORSMTP, EMP_NFEEMAIL_PORTA, ' +
    '    EMP_NFEEMAIL_USUARIO, EMP_NFEEMAIL_SENHA, EMP_NFEEMAIL_CONEXAO_SEGURA, ' +
    '    EMP_EMAIL_CONF_LEITURA, EMP_EMAIL_TLS, '+
    '    EMP_NFEEMAIL_MENSAGEM, EMP_CNAE, EMP_RNTRC, EMP_MDFE_TIPO_EMIT, '+
    '    EMP_INCENT_CULTURAL, EMP_SPEDFISCAl_ATIVIDADE, EMP_CALC_SUBST_PROD, ' +
    '    EMP_ALIQ_CREDITO' +
    ' from '+
    '    EMPRESAS, PARAMS';
begin
  if not Assigned(empresa) then
  begin
    empresa := TEmpresa(inherited NewInstance);

    with TClientDataSet.Create(nil) do
    try
      Data := DMRet.GetData(SQL, []);
      if not IsEmpty then
      begin


        //Tipo de estabelecimento
        case FieldByName('PAR_ESTABELECIMENTO').AsString[1] of
          'P': empresa.FTipo := tiPosto;
          'F': empresa.FTipo := tiFarmacia;
          'R': empresa.FTipo := tiRestaurante;
          'S': empresa.FTipo := tiSupermercado;
          'O': empresa.FTipo := tiOtica;
          'A': empresa.FTipo := tiAgropecuaria;
          else
              empresa.FTipo := tiLoja;
        end;

        empresa.FCnpj          := FieldByName('EMP_CGC').AsString;
        empresa.FRazao         := FieldByName('EMP_NOME').AsString;
        empresa.FUF            := FieldByName('EMP_ESTADO').AsString;
        empresa.FIE            := FieldByName('EMP_INSCRICAOESTADUAL').AsString;
        empresa.FIM            := FieldByName('EMP_INCRICAOMUNICIPAL').AsString;
        empresa.FEndereco      := FieldByName('EMP_ENDERECO').AsString;
        empresa.FNumero        := FieldByName('EMP_NUMERO').AsString;
        empresa.FBairro        := FieldByName('EMP_BAIRRO').AsString;
        empresa.FCidade        := FieldByName('EMP_CIDADE').AsString;
        empresa.FCep           := FieldByName('EMP_CEP').AsString;
        empresa.FComplemento   := FieldByName('EMP_COMPLEMENTO').AsString;
        empresa.FNomeFantasia  := FieldByName('EMP_FANTASIA').AsString;
        empresa.FCodEmpContab  := FieldByName('EMP_NUMCONTABILIDADE').AsString;
        empresa.FTelefone      := FieldByName('EMP_TELEFONE').AsString;
        empresa.FRepresNome    := FieldByName('EMP_NOMEREPRES').AsString;
        empresa.FRepresCPF     := FieldByName('EMP_REPRESCPF').AsString;
        empresa.FContadorNome  := FieldByName('EMP_NOMECONTADOR').AsString;
        empresa.FContadorCRC   := FieldByName('EMP_CRCCONTADOR').AsString;
        empresa.FRegJunta      := FieldByName('EMP_NUMEROREGISTROJUNTA').AsString;
        empresa.FEmail         := FieldByName('EMP_EMAIL').AsString;
        empresa.FEmailSmtp     := FieldByName('EMP_NFEEMAIL_SERVIDORSMTP').AsString;
        empresa.FEmailPorta    := FieldByName('EMP_NFEEMAIL_PORTA').AsInteger;
        empresa.FEmailUsuario  := FieldByName('EMP_NFEEMAIL_USUARIO').AsString;
        empresa.FEmailSenha    := FieldByName('EMP_NFEEMAIL_SENHA').AsString;
        empresa.FEmailSSL      := FieldByName('EMP_NFEEMAIL_CONEXAO_SEGURA').AsString = 'S';
        empresa.FEmailTLS      := FieldByName('EMP_EMAIL_TLS').AsString = 'S';
        empresa.FEmailConfLeitura := FieldByName('EMP_EMAIL_CONF_LEITURA').AsString = 'S';
        empresa.FEmailMensagem := FieldByName('EMP_NFEEMAIL_MENSAGEM').AsString;
        empresa.FCNAE          := FieldByName('EMP_CNAE').AsString;
        empresa.FRNTRC         := FieldByName('EMP_RNTRC').AsString;
        empresa.FMunicipioCod        := FieldByName('MUN_COD').AsInteger;
        empresa.FRegimeTributario    := FieldByName('EMP_REGIME_TRIBUTARIO').AsString[1];
        empresa.FMdfeTipoEmit        := FieldByName('EMP_MDFE_TIPO_EMIT').AsString[1];
        empresa.FEmpIncentCult       := FieldByName('EMP_INCENT_CULTURAL').AsInteger;
        empresa.FSpedFiscalAtividade := FieldByName('EMP_SPEDFISCAl_ATIVIDADE').AsString;
        empresa.FCalculaSubstProduto := FieldByName('EMP_CALC_SUBST_PROD').AsString[1];
        empresa.FAliqCredito         := FieldByName('EMP_ALIQ_CREDITO').AsFloat;

        empresa.FSerialDemo := True;
        if not(FieldByName('SRL_KEY').IsNull) and
           (copy(FieldByName('SRL_KEY').AsString,1,1) = '9') then
          empresa.FSerialDemo := False;

      end;
    finally
      Free;
    end;
  end;

  Result := empresa;
end;

{$HINTS ON}

end.

