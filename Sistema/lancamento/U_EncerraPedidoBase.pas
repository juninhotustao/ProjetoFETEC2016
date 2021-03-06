unit U_EncerraPedidoBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_EncerraDavBase, DB, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons;

type
  Tfrm_EncerraPedidoBase = class(Tfrm_EncerraDavBase)
    lblEntrada: TLabel;
    edtEntrada: TDBEdit;
    DS_TipoPagto: TDataSource;
    DS_Cliente: TDataSource;
    DS_TipoPedido: TDataSource;
    procedure btn_EncerraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure GeraFinanceiro; override;
    procedure RateioDesconto; override;
    //
    function GetKeyField: string; override;
  public
    { Public declarations }
  end;

var
  frm_EncerraPedidoBase: Tfrm_EncerraPedidoBase;

implementation

uses U_PedidoBase, U_FuncUtils, Math, U_Receber, U_Caixa, U_ConAlteraParc_subst;

{$R *.dfm}

procedure Tfrm_EncerraPedidoBase.btn_EncerraClick(Sender: TObject);
var
  CompareTo: smallint;
begin
  if not Tfrm_PedidoBase(Owner).PedidoPendente(DS.DataSet.FieldByName('VEN_ID').Value) then
  begin
    MessageBox(Handle, 'N�o � poss�vel encerrar este pedido, pois a situa��o do '+
      'mesmo � diferente de Pendente.','AVISO',MB_ICONINFORMATION);
    btn_PendenteClick(Sender);
    Exit;
  end;

  if (DS_TipoPedido.DataSet <> nil) and
     (DS_TipoPedido.DataSet.FieldByName('TPP_VLR_TOTAL_ZERADO').Value = 'S') then
    CompareTo := -1
  else
    CompareTo := 0;

  // Verificando se o total est� ficando negativo
  if CompareValue(Double(DBText2.Field.Value), 0, 0) <= CompareTo then
  begin
    MessageBox(Handle, 'Total n�o permitido, altere o desconto ou a entrada.',
      'AVISO', MB_ICONINFORMATION);
    edt_Desconto.SetFocus;
    Exit;
  end;

  DS.DataSet.FieldByName('VEN_SITUACAO').Value := 'F';

  inherited;
end;

procedure Tfrm_EncerraPedidoBase.FormShow(Sender: TObject);
//var
//  HabilitaEntrada: Boolean;
begin
  inherited;
//  HabilitaEntrada    := DS_TipoPagto.DataSet.FieldByName('TPG_PAGAMENTO').AsString[1] in ['P', 'C'];
//  lblEntrada.Enabled := HabilitaEntrada;
//  edtEntrada.Enabled := HabilitaEntrada;
  if DS_TipoPedido.DataSet <> nil then
    ImprimiRel := DS_TipoPedido.DataSet.FieldByName('TPP_TIPO').Value <> 'F';
  //]
end;

procedure Tfrm_EncerraPedidoBase.GeraFinanceiro;
var
  i: Integer;
  Parcela, Historico, AWhere, ACliente: string;
  Parcelas: array of Integer;
  TipoPagto: Char;
  AData: TDateTime;
begin
  inherited;

  if DS_TipoPedido.DataSet <> nil then
    if DS_TipoPedido.DataSet.FieldByName('TPP_GERA_FINANC').Value = 'N' then
      Exit;
  //
  TipoPagto := DS_TipoPagto.DataSet.FieldByName('TPG_PAGAMENTO').AsString[1];
  with DS.DataSet do
  begin
    if Params.ParOrcDataCaixa = 'V' then
      AData := FieldByName('VEN_DATA').Value
    else
      AData := FieldByName('VEN_DT_ENTREGA').Value;

    with DS_Cliente do
    if DataSet.Locate('CLI_ID', FieldByName('CLI_ID').AsString, []) then
      ACliente := DataSet.FieldByName('CLI_NOME').Value;
    //

    //Gerando o caixa quando for venda a vista
    if Params.ParOrcGeraCai and (TipoPagto = 'V') then
    begin
      Historico := Format('VENDA CONF. DOC. N�: %s CLIENTE: %s', [
        FieldByName('VEN_ID').Value,
        ACliente
      ]);

      TLancCaixa.Insere(Params.ParCaixa, Params.ParOrcCaixaClass,
        FieldByName('VDD_ID').Value, FieldByName('VEN_ID').Value, 1, AData,
        FieldByName('TOTAL_LIQDO').Value, Historico,
        FieldByName('VEN_ID').Value, TTipoNota.tpOrcamento
      );
    end
    //Gerando o contas a receber e o caixa quando houver entrada
    else if Params.ParOrcGeraRec or (TipoPagto in ['P', 'C']) then
    begin
      //Se houver entrada
      if Params.ParOrcGeraCai and (FieldByName('VEN_ENTRADA').AsFloat > 0) then
      begin
        Historico := Format('ENTRADA DE VENDA CONF. DOC. N�: %s CLIENTE: %s', [
          FieldByName('VEN_ID').Value,
          ACliente
        ]);

        TLancCaixa.Insere(Params.ParCaixa, Params.ParOrcCaixaClass,
          FieldByName('VDD_ID').Value, FieldByName('VEN_ID').Value, 1, AData,
          FieldByName('VEN_ENTRADA').Value, Historico,
          FieldByName('VEN_ID').Value, TTipoNota.tpOrcamento
        );
      end;

      //Gerando as parcelas
      for i := 1 to 12 do
      begin
        Parcela := FieldByName('VEN_VECTO'+IntToStr(i)).AsString;

        if Trim(Parcela) = '' then
          Break;
        //
        SetLength(Parcelas, i);
        Parcelas[i-1] := StrToInt(Parcela);
      end;

      //Gerando o contas a receber
      TReceber.GeraReceber(TTipoNota.tpOrcamento, FieldByName('VEN_ID').Value,
        Parcelas, FieldByName('TOTAL_LIQDO').Value);

      AWhere := ' VEN_ID = ' + FieldByName('VEN_ID').AsString;

      //chama a tela de alterar as parcelas do contas a receber gerado.
      if Params.ParAlteraParcReceber = 'S' then
        Tfrm_ConAlteraParc_subst.OpenForm(AWhere,True);
    end;
  end;
end;

function Tfrm_EncerraPedidoBase.GetKeyField: string;
begin
  Result := 'VEN_ID';
end;

procedure Tfrm_EncerraPedidoBase.RateioDesconto;
var
  VlrRateioDesc, VlrTotalDesc: Double;
begin
  VlrTotalDesc := 0;

  with DS_Item.DataSet do
  begin
    First;

    while not Eof do
    begin
      VlrRateioDesc :=
        TFuncUtils.Arredondar(
          (FieldByName('ITV_VALORTOTAL').AsFloat *
          DS.DataSet.FieldByName('VEN_DESCONTO').AsFloat)/
          FieldByName('TOTAL_PEDIDO').Value, 2
        );

      VlrTotalDesc := VlrTotalDesc + VlrRateioDesc;

      if RecNo = RecordCount then
        VlrRateioDesc := VlrRateioDesc +
          (DS.DataSet.FieldByName('VEN_DESCONTO').AsFloat - VlrTotalDesc);
      //

      Edit;
      FieldByName('ITV_VLR_RATEIO_DESC').AsFloat := VlrRateioDesc;
      Post;

      Next;
    end;
  end;
end;

end.
