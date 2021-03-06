unit U_PedidoBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_LancBase, FMTBcd, Menus, DB, DBClient, Provider, SqlExpr, DBCtrls,
  StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, ToolWin, Mask, Buttons,
  U_EncerraDavBase, ImgList, vcl.Wwdbdatetimepicker;

type
  TParams = record
    ParBloqDebito : ShortString;
    ParSenhaDebito : ShortString;
    ParDiasCarencia : Integer;
    ParOrcBloqueaVenda : ShortString;
    ParSenhaLibera : ShortString;
    ParOrcTolerVlrMax : Integer;
    ParOrcSenhaVendedor : ShortString;
    ParOrcObsCliente : ShortString;
    ParMsgFixa: string;
    ParOrcDataRetro: ShortString;
    ParSenhaEntregaOS: string;
    ParEncerraCeramica: ShortString;
  end;

  Tfrm_PedidoBase = class(Tfrm_LancBase)
    CDS_Cliente: TClientDataSet;
    DS_Cliente: TDataSource;
    gp_encerra: TGroupBox;
    btn_encerra: TSpeedButton;
    DSP_Cliente: TDataSetProvider;
    CDS_ClienteCLI_ID: TStringField;
    CDS_ClienteCLI_ENDERECO: TStringField;
    CDS_ClienteCLI_BAIRRO: TStringField;
    CDS_ClienteCLI_CEP: TStringField;
    CDS_ClienteCLI_ESTADO: TStringField;
    CDS_ClienteCLI_DATACADASTRO: TSQLTimeStampField;
    CDS_ClienteCLI_CONDICAOPAGAMENTO: TStringField;
    CDS_ClienteCLI_DATAPAGTO: TSQLTimeStampField;
    CDS_ClienteCLI_NOME: TStringField;
    DSP_Vendedor: TDataSetProvider;
    CDS_Vendedor: TClientDataSet;
    DS_Vendedor: TDataSource;
    CDS_VendedorVDD_ID: TIntegerField;
    CDS_VendedorVDD_NOME: TStringField;
    CDS_ClienteCLI_CIDADE: TStringField;
    Panel8: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    Label17: TLabel;
    DBText11: TDBText;
    Label5: TLabel;
    DBText13: TDBText;
    DBText10: TDBText;
    Label2: TLabel;
    Label6: TLabel;
    lkp_Cliente: TDBLookupComboBox;
    Label13: TLabel;
    lkp_Vendedor: TDBLookupComboBox;
    Label14: TLabel;
    CDS_ItemREFERENCIA: TStringField;
    CDS_ItemNUM_ITEM: TIntegerField;
    Label15: TLabel;
    DBText12: TDBText;
    btn_ConsCliente: TSpeedButton;
    DS_TipoPagto: TDataSource;
    CDS_TipoPagto: TClientDataSet;
    DSP_TipoPagto: TDataSetProvider;
    CDS_TipoPagtoTPG_ID: TIntegerField;
    CDS_TipoPagtoTPG_DESCRICAO: TStringField;
    CDS_TipoPagtoTPG_PRECO: TStringField;
    Label16: TLabel;
    lkp_TipoPagto: TDBLookupComboBox;
    Label18: TLabel;
    db_Observacao: TDBMemo;
    CDS_ClienteCLI_TIPOPES: TStringField;
    CDS_ClienteCLI_CGC: TStringField;
    CDS_ClienteCLI_CPF: TStringField;
    CDS_ClienteCLI_INSCRICAO: TStringField;
    CDS_ClienteCLI_TELEFONE: TStringField;
    CDS_ClienteCLI_TELEFONE2: TStringField;
    CDS_ClienteMAXCOMPRAS: TFMTBCDField;
    CDS_ClienteCLI_NUMERO: TStringField;
    CDS_ClienteRES_DESCRICAO: TStringField;
    CDS_ClienteRES_SENHA: TStringField;
    CDS_ClienteRES_SITUACAO: TStringField;
    CDS_ClienteRES_BLOQ_DEBITOS: TStringField;
    CDS_VendedorVDD_SENHA: TStringField;
    CDS_ClienteCLI_DESCMAX: TFMTBCDField;
    Alterar1: TMenuItem;
    CDS_TipoPagtoTPG_PAGAMENTO: TStringField;
    Excluir1: TMenuItem;
    CDS_ClienteVDD_ID: TIntegerField;
    edt_Data: TwwDBDateTimePicker;
    CDS_ClienteCLI_ATIVO: TStringField;
    QRY_Cliente: TSQLQuery;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DSStateChange(Sender: TObject);
    procedure pnl_CabecalhoExit(Sender: TObject);
    procedure lkp_ClienteEnter(Sender: TObject);
    procedure btn_salClick(Sender: TObject);
    procedure btn_ConsClienteClick(Sender: TObject);
    procedure lkp_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure db_ObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure CDS_ItemCalcFields(DataSet: TDataSet);
    procedure btn_encerraClick(Sender: TObject);
    procedure lkp_ClienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lkp_VendedorExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure CDSAfterInsert(DataSet: TDataSet);
    procedure db_ObservacaoEnter(Sender: TObject);
  private
    FParams : TParams;
    FFrmEncerraDav: Tfrm_EncerraDavBaseClass;
  protected
    property Params : TParams read FParams;
    property EncerraDavBase : Tfrm_EncerraDavBaseClass read FFrmEncerraDav write FFrmEncerraDav;
  public
    class function PedidoPendente(const APedId : Variant): Boolean; virtual; abstract;
  end;

var
  frm_PedidoBase: Tfrm_PedidoBase;

implementation

uses
  U_DMRet, U_PesqCliente, U_FuncUtils, U_Extrato, U_ObsCliente;

{$R *.dfm}

procedure Tfrm_PedidoBase.btn_ConsClienteClick(Sender: TObject);
var
  Codigo : Variant;
begin
  inherited;

  Codigo := Tfrm_PesqCliente.GetResult;
  lkp_Cliente.SetFocus;

  if VarIsNull(Codigo) or (Codigo = '') then
    Exit;

  lkp_Cliente.Field.Value := Codigo;
end;

procedure Tfrm_PedidoBase.btn_encerraClick(Sender: TObject);
begin
  inherited;

  if CDS.IsEmpty then
  begin
    MessageBox(Handle, pchar('Lan�e primeiramente um Novo '+TipoLancto+' para depois encerr�-lo.'),'AVISO',MB_ICONINFORMATION);
    Exit;
  end;

  if not PedidoPendente(CDS.Fields[0].AsLargeInt) then
  begin
    MessageBox(Handle,
      PChar(Format('N�o � poss�vel encerrar um %s se a situa��o for FINALIZADO.', [FTipoLancto])),
      'AVISO',MB_ICONINFORMATION);
    Exit;
  end;

  with EncerraDavBase.Create(Self) do
  try
    try
      CDS.Edit;
    except
      on E:Exception do
        raise Exception.Create('Erro ao encerrar o '+TipoLancto+'.'+
          #10#13+'Erro: '+E.Message);
    end;
    //
    ShowModal;
  finally
    Free;
  end;
end;

procedure Tfrm_PedidoBase.btn_salClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to CDS.FieldCount -1 do
    if CDS.Fields[i].Required then
    begin
      if ((CDS.Fields[i].IsNull) or (Trim(CDS.Fields[i].Value) = '')) then
      begin
        MessageBox(Handle,Pchar('O campo "'+CDS.Fields[i].DisplayLabel+'" n�o pode ficar vazio.'),'AVISO',MB_ICONINFORMATION);
        CDS.Fields[i].FocusControl;
        Exit;
      end
      else if (CDS.Fields[i].DataType = ftBCD) and (CDS.Fields[i].Value <= 0) then
      begin
        MessageBox(Handle,Pchar('O campo "'+CDS.Fields[i].DisplayLabel+'" n�o pode ficar zerado ou negativo.'),'AVISO',MB_ICONINFORMATION);
        CDS.Fields[i].FocusControl;
        Exit;
      end;
    end
    else if (CDS.Fields[i].DataType = ftBCD) and (CDS.Fields[i].Value < 0) then
    begin
      MessageBox(Handle,Pchar('O campo "'+CDS.Fields[i].DisplayLabel+'" n�o pode ficar negativo.'),'AVISO',MB_ICONINFORMATION);
      DS_Item.DataSet.Fields[i].FocusControl;
      Exit;
    end;

  if CDS_ClienteCLI_ATIVO.AsString <> 'A' then
  begin
    MessageBox(Handle, 'Cliente est� Inativo. Altere sua situa��o no cadastro e tente novamente !', 'Aten��o', MB_ICONEXCLAMATION + MB_OK);
    lkp_Cliente.SetFocus;
    abort;
  end;

  inherited;
end;

procedure Tfrm_PedidoBase.CDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  db_Observacao.Field.Value := FParams.ParMsgFixa;
end;

procedure Tfrm_PedidoBase.CDS_ItemCalcFields(DataSet: TDataSet);
const
  SqlItem =
    'select REFERENCIA from VW_ITEM where TIPO = :TIPO and ID = :ID';
var
  Tipo, Id : Integer;
begin
  inherited;
//  //
////  if DataSet.FieldByName('PRO_ID').IsNull and
////    DataSet.FieldByName('SERV_CODIGO').IsNull then Exit;
//  //
//  if not(DataSet.FieldByName('PRO_ID').IsNull) then
//  begin
//    Tipo := 0;
//    Id   := DataSet.FieldByName('PRO_ID').Value;
//  end else
//  begin
//    Tipo := 2;
//    Id   := DataSet.FieldByName('SERV_CODIGO').Value;
//  end;
//  //
//  with TClientDataSet.Create(nil) do
//  try
//    Data :=  DMRet.GetData(SqlItem,[Tipo, Id]);
//    //
//    DataSet.FieldByName('REFERENCIA').AsString := Fields[0].AsString;
//    DataSet.FieldByName('NUM_ITEM').AsInteger  := DataSet.RecNo;
//  finally
//    Free;
//  end;
end;

procedure Tfrm_PedidoBase.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) and not CDS_Item.IsEmpty then
    btn_encerra.Click;
  //
end;

procedure Tfrm_PedidoBase.db_ObservacaoEnter(Sender: TObject);
begin
  inherited;
  TDBMemo(Sender).SelStart := TDBMemo(Sender).GetTextLen;
end;

procedure Tfrm_PedidoBase.db_ObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then Key := #0;

  Key := AnsiUpperCase(key)[1];
end;

procedure Tfrm_PedidoBase.DSStateChange(Sender: TObject);
begin
  inherited;

//  if DS.State in [dsInsert,dsEdit] then
//    CDS_Cliente.Filter := 'CLI_ATIVO = ''A'''
//  else
//    CDS_Cliente.Filter := '';

  //

  pnl_Cabecalho.Enabled    := DS.State in [dsInsert, dsEdit];
  btn_nov.Enabled          := DS.State = dsBrowse;
  btn_alt.Enabled          := DS.State = dsBrowse;
  btn_exc.Enabled          := DS.State = dsBrowse;
  btn_can.Enabled          := DS.State in [dsInsert, dsEdit];
  btn_sal.Enabled          := DS.State in [dsInsert, dsEdit];
  btn_con.Enabled          := DS.State = dsBrowse;
  NovaPrVenda1.Enabled     := DS.State = dsBrowse;
  Alterar1.Enabled         := DS.State = dsBrowse;
  Excluir1.Enabled         := DS.State = dsBrowse;
  Cancelar1.Enabled        := DS.State in [dsInsert, dsEdit];
  Salvar1.Enabled          := DS.State in [dsInsert, dsEdit];
  ConsultaPrVenda1.Enabled := DS.State = dsBrowse;
end;

procedure Tfrm_PedidoBase.FormCreate(Sender: TObject);
const
  SqlParams =
    'select PAR_BLOQ_DEBITO, PAR_SENHADEBITO, PAR_DIASDECARENCIA, '+
    'PAR_ORC_BLOQUEAVENDA, PAR_SENHALIBERA, PAR_ORC_TOLERANCIA_BLOQ_VLRMAXIMO, '+
    'PAR_ORC_SENHA_VENDEDOR, PAR_ORC_OBSCLIENTE, ' +
    'PAR_ORC_MSGFIXA, PAR_ORC_DATARETRO,PAR_SENHA_ENTREGA_OS from PARAMS';
begin
  inherited;
  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(SqlParams,[]);
    if IsEmpty then Exit;
    //
    with FParams do
    begin
      ParBloqDebito       := FieldByName('PAR_BLOQ_DEBITO').AsString;
      ParSenhaDebito      := FieldByName('PAR_SENHADEBITO').AsString;
      ParDiasCarencia     := FieldByName('PAR_DIASDECARENCIA').AsInteger;
      ParOrcBloqueaVenda  := FieldByName('PAR_ORC_BLOQUEAVENDA').AsString;
      ParSenhaLibera      := FieldByName('PAR_SENHALIBERA').AsString;
      ParOrcTolerVlrMax   := FieldByName('PAR_ORC_TOLERANCIA_BLOQ_VLRMAXIMO').AsInteger;
      ParOrcSenhaVendedor := FieldByName('PAR_ORC_SENHA_VENDEDOR').AsString;
      ParOrcObsCliente    := FieldByName('PAR_ORC_OBSCLIENTE').AsString;
      ParMsgFixa          := FieldByName('PAR_ORC_MSGFIXA').AsString;
      ParOrcDataRetro     := FieldByName('PAR_ORC_DATARETRO').AsString;
      ParSenhaEntregaOS   := FieldByName('PAR_SENHA_ENTREGA_OS').AsString;
      //
    end;
  finally
    Free;
  end;

  edt_data.ReadOnly := FParams.ParOrcDataRetro = 'N';
end;

procedure Tfrm_PedidoBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=VK_RETURN Then
    Perform(WM_NEXTDLGCTL,0,0)
end;

procedure Tfrm_PedidoBase.FormShow(Sender: TObject);
begin
  inherited;
  CDS_Cliente.Open;
  CDS_Vendedor.Open;
  CDS_TipoPagto.Open;
end;

procedure Tfrm_PedidoBase.lkp_ClienteEnter(Sender: TObject);
begin
  inherited;
  if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).DropDown;
end;

procedure Tfrm_PedidoBase.lkp_ClienteExit(Sender: TObject);
const
  {$REGION 'SQLs'}
  SqlDebito =
    'select count(REC_ID) from RECEBER where DATARECEBIMENTO is null '+
    'and DATAVENCIMENTO + :CARENCIA  < convert(varchar(10), '+
    'getdate(),102) and CLI_ID like :CLI_ID and DOCTOSUBSTITUICAO is '+
    'null and VALORARECEBER > 0';

  SqlVlrDebito =
    'select sum(VALORARECEBER) from RECEBER where DATARECEBIMENTO '+
    'is null and DOCTOSUBSTITUICAO is null and VALORARECEBER > 0 '+
    'and CLI_ID like :CLI_ID';
  {$ENDREGION}
begin
  inherited;

  if not(CDS.State in [dsInsert, dsEdit]) then Exit;

  if CDS_ClienteCLI_ATIVO.AsString <> 'A' then
  begin
    MessageBox(Handle, 'Cliente est� Inativo. Altere sua situa��o no cadastro e tente novamente !', 'Aten��o', MB_ICONEXCLAMATION + MB_OK);
    lkp_Cliente.SetFocus;
    abort;
  end;

  if CDS.FieldByName('CLI_ID').IsNull then Exit;

  //Verifica se vai mostrar as observa��es do cliente
  if Params.ParOrcObsCliente = 'S' then
    Tfrm_ObsCliente.OpenObsCliente(CDS.FieldByName('CLI_ID').AsString);

  //Extrato da contas a receber do cliente
  Tfrm_Extrato.OpenExtrato(CDS.FieldByName('CLI_ID').AsString);

  //Verifica se tem debitos em Atraso
  if (FParams.ParBloqDebito = 'S') and (CDS_ClienteRES_BLOQ_DEBITOS.Value = 'S') and
     (DMRet.OpenSQL(SqlDebito,[FParams.ParDiasCarencia, CDS.FieldByName('CLI_ID').AsString]) > 0) then
  begin
    ShowMessage('ESTE CLIENTE POSSUI D�BITOS EM ATRASO!');

    if TFuncUtils.PasswordInputBox('Libera clientes com d�bitos em atraso',
      'Digite a senha de libera��o:', Self.Color, 203) <> FParams.ParSenhaDebito then
    begin
      MessageBox(handle,'Opera��o Inv�lida! Senha Incorreta!', Pchar(Application.Title),
        MB_ICONINFORMATION);
      lkp_Cliente.SetFocus;
      Exit;
    end;
  end;

  //Verifica restri��o para o cliente
  if CDS_ClienteRES_SITUACAO.Value = 'S' then
  begin
    ShowMessage('Cliente restrito com a op��o: '+UpperCase(CDS_ClienteRES_DESCRICAO.Value));

    if TFuncUtils.PasswordInputBox(UpperCase(CDS_ClienteRES_DESCRICAO.Value),
      'Digite a senha de Libera��o:', Self.Color, 200) <> CDS_ClienteRES_SENHA.Value then
    begin
      MessageBox(handle,'Opera��o Inv�lida! Senha Incorreta!',Pchar(Application.Title),
        MB_ICONINFORMATION);
      lkp_Cliente.SetFocus;
      Exit;
    end;
  end;

  //Verifica se o Limite foi Ultrapassado
  if (FParams.ParOrcBloqueaVenda = 'S') and (CDS_ClienteMAXCOMPRAS.AsFloat > 0) and
     (DMRet.OpenSQL(SqlVlrDebito,[CDS.FieldByName('CLI_ID').AsString]) >=
     CDS_ClienteMAXCOMPRAS.AsFloat * (1 + FParams.ParOrcTolerVlrMax/100)) then
  begin
    ShowMessage('VALOR M�XIMO DE COMPRAS EXCEDIDO!');

    if TFuncUtils.PasswordInputBox('Libera cliente com limite de compras excedido',
      'Digite a senha de Libera��o:', Self.Color, 245) <> FParams.ParSenhaLibera then
    begin
      MessageBox(handle,'Opera��o Inv�lida! Senha Incorreta!',Pchar(Application.Title),
        MB_ICONINFORMATION);
      lkp_Cliente.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_PedidoBase.lkp_ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F7 then
    btn_ConsClienteClick(Sender);
end;

procedure Tfrm_PedidoBase.lkp_VendedorExit(Sender: TObject);
begin
  inherited;
  if not(CDS.State in [dsInsert, dsEdit]) then Exit;

  if CDS.FieldByName('VDD_ID').IsNull then Exit;

  if (Params.ParOrcSenhaVendedor = 'S') and
     (TFuncUtils.PasswordInputBox('� obrigat�rio informar uma senha',
     copy(lkp_Vendedor.text,1,13)+' informe sua senha para continuar:',
     Self.Color, 270) <> CDS_VendedorVDD_SENHA.Value) then
  begin
    MessageBox(handle,'Opera��o Inv�lida! Senha Incorreta!', Pchar(Application.Title),
      MB_ICONINFORMATION);
    lkp_Vendedor.SetFocus;
    Exit;
  end;
end;

procedure Tfrm_PedidoBase.pnl_CabecalhoExit(Sender: TObject);
begin
  inherited;
  if DS.State in [dsInsert, dsEdit] then
    btn_sal.Click;
end;

end.
