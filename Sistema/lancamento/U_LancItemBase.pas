unit U_LancItemBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, Buttons, Mask, DBCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.ImgList;

type
  TCampo = (Acrescimo, Desconto);

  TParams = record
    ParBloqEstNegativo: ShortString;
    ParSenhaNegativo: ShortString;
    ParOrcBloqPrMinimo: ShortString;
    ParSenhaPrMinimo: ShortString;
    ParOrcDescAutoCliente: ShortString;
    ParOrcAltDesc: ShortString;
    ParOrcUmVendedor: ShortString;
    ParBalPrefixo1: ShortString;
    ParBalPrefixo2: ShortString;
    ParBalTamCodProduto: ShortString;
    ParComissao: ShortString;
    ParOrcAlteraVlrTotal: ShortString;
    ParOrcBloqVenda:ShortString;
    ParTolBloqMaximo:Integer;
    ParSenhaLibera:ShortString;
  end;

  TItemCad = class
  strict private
    FTipo: Integer;
    FEstoque: Double;
    FPrMinimo: Double;

    procedure SetTipo(const Value: Integer);
    procedure SetEstoque(const Value: Double);
    procedure SetPrMinimo(const Value: Double);
  public
    property Tipo: Integer read FTipo write SetTipo;
    property Estoque: Double read FEstoque write SetEstoque;
    property PrMinimo: Double read FPrMinimo write SetPrMinimo;
  end;

  Tfrm_LancItemBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btn_Confirma: TBitBtn;
    btn_Cancela: TBitBtn;
    DS_Item: TDataSource;
    DS: TDataSource;
    Icones: TImageList;
    ToolBar1: TToolBar;
    btn_nov: TToolButton;
    btn_alt: TToolButton;
    btn_exc: TToolButton;
    btn_can: TToolButton;
    btn_sal: TToolButton;
    ToolButton26: TToolButton;
    btn_con: TToolButton;
    ToolButton25: TToolButton;
    btn_sai: TToolButton;
    procedure btn_CancelaClick(Sender: TObject);
    procedure btn_ConfirmaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FTipoProd: String;
    FParams : TParams;
    FItemCad: TItemCad;
  protected
    property TipoProd: String read FTipoProd;
    property Params : TParams read FParams;
    property ItemCad: TItemCad read FItemCad;

    procedure CheckFieldNull(Edt: TDBEdit);
  public
    { Public declarations }
  end;

  Tfrm_LancItemBaseClass = class of Tfrm_LancItemBase;

var
  frm_LancItemBase: Tfrm_LancItemBase;

implementation

uses
  U_DMRet, U_LancBase, DBClient;

{$R *.dfm}

procedure Tfrm_LancItemBase.btn_CancelaClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_LancItemBase.btn_ConfirmaClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to (DS_Item.DataSet.FieldCount-1) do
   if DS_Item.DataSet.Fields[i].Required then
   begin
     if ((DS_Item.DataSet.Fields[i].IsNull) or (Trim(DS_Item.DataSet.Fields[i].Value) = '')) then
     begin
        MessageBox(Handle,Pchar('O campo "'+DS_Item.DataSet.Fields[i].DisplayLabel+'" não pode ficar vazio.'),'AVISO',MB_ICONINFORMATION);
        DS_Item.DataSet.Fields[i].FocusControl;
        Exit;
     end
     else if (DS_Item.DataSet.Fields[i].DataType = ftFMTBcd) and (DS_Item.DataSet.Fields[i].Value <= 0) then
     begin
        MessageBox(Handle,Pchar('O campo "'+DS_Item.DataSet.Fields[i].DisplayLabel+'" não pode ficar zerado ou negativo.'),'AVISO',MB_ICONINFORMATION);
        DS_Item.DataSet.Fields[i].FocusControl;
        Exit;
     end;
   end
   else if (DS_Item.DataSet.Fields[i].DataType = ftFMTBcd) and (DS_Item.DataSet.Fields[i].Value < 0) then
   begin
     MessageBox(Handle,Pchar('O campo "'+DS_Item.DataSet.Fields[i].DisplayLabel+'" não pode ficar negativo.'),'AVISO',MB_ICONINFORMATION);
     DS_Item.DataSet.Fields[i].FocusControl;
     Exit;
   end;
  //
  try
    DS_Item.DataSet.Post;
  except
    on E:Exception do
      raise Exception.Create('Erro ao Salvar o Item do(a) '+
        frm_LancBase.TipoLancto+'.'+#10#13+'Erro: '+E.Message);
  end;
  //
  Close;
end;

procedure Tfrm_LancItemBase.CheckFieldNull(Edt: TDBEdit);
begin
  if (Edt.Field.IsNull) or (Trim(Edt.Field.Value) = '') then
    Edt.Field.Value := 0;
end;

procedure Tfrm_LancItemBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DS_Item.DataSet.State in [dsInsert, dsEdit] then
    DS_Item.DataSet.Cancel;
end;

procedure Tfrm_LancItemBase.FormCreate(Sender: TObject);
const
  SqlParams =
    ' select '+
    '   PAR_BLOQ_EST_NEGATIVO, PAR_SENHANEGATIVO, PAR_ORC_BLOQ_PRMINIMO, '+
    '   PAR_SENHAPRMINIMO, PAR_ORC_DESC_AUTO_CLIENTE, PAR_ORC_ALTDESC, '+
    '   PAR_ORC_TIPO_ATIVO, PAR_ORC_TIPO_INATIVO, PAR_ORC_TIPO_BENSCONS, '+
    '   PAR_ORC_UMVENDEDOR, PAR_BAL_PREFIXO1, PAR_BAL_PREFIXO2,' +
    '   PAR_BAL_TAM_COD_PRODUTO, PAR_COMISSAO,PAR_ORC_ALTERAVLRTOTAL, '+
    '   PAR_ORC_BLOQUEAVENDA, PAR_ORC_TOLERANCIA_BLOQ_VLRMAXIMO, '+
    '   PAR_SENHALIBERA '+
    ' from '+
    '   PARAMS';
begin
  inherited;
  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(SqlParams,[]);
    if IsEmpty then Exit;
    //
    FTipoProd := '';

    if FieldByName('PAR_ORC_TIPO_ATIVO').Value = 'S' then
      FTipoProd := QuotedStr('A');

    if FieldByName('PAR_ORC_TIPO_INATIVO').Value = 'S' then
      if FTipoProd <> '' then
        FTipoProd := FTipoProd + ', ' + QuotedStr('I')
      else
        FTipoProd := QuotedStr('I');

    if FieldByName('PAR_ORC_TIPO_BENSCONS').Value = 'S' then
      if FTipoProd <> '' then
        FTipoProd := FTipoProd + ', ' + QuotedStr('B')
      else
        FTipoProd := QuotedStr('B');
    //
    with FParams do
    begin
      ParBloqEstNegativo    := FieldByName('PAR_BLOQ_EST_NEGATIVO').AsString;
      ParSenhaNegativo      := FieldByName('PAR_SENHANEGATIVO').AsString;
      ParOrcBloqPrMinimo    := FieldByName('PAR_ORC_BLOQ_PRMINIMO').AsString;
      ParSenhaPrMinimo      := FieldByName('PAR_SENHAPRMINIMO').AsString;
      ParOrcDescAutoCliente := FieldByName('PAR_ORC_DESC_AUTO_CLIENTE').AsString;
      ParOrcAltDesc         := FieldByName('PAR_ORC_ALTDESC').AsString;
      ParOrcUmVendedor      := FieldByName('PAR_ORC_UMVENDEDOR').AsString;
      ParBalPrefixo1        := FieldByName('PAR_BAL_PREFIXO1').AsString;
      ParBalPrefixo2        := FieldByName('PAR_BAL_PREFIXO2').AsString;
      ParBalTamCodProduto   := FieldByName('PAR_BAL_TAM_COD_PRODUTO').AsString;
      ParComissao           := FieldByName('PAR_COMISSAO').AsString;
      ParOrcAlteraVlrTotal  := FieldByName('PAR_ORC_ALTERAVLRTOTAL').AsString;
      ParOrcBloqVenda       := FieldByName('PAR_ORC_BLOQUEAVENDA').AsString;
      ParTolBloqMaximo      := FieldByName('PAR_ORC_TOLERANCIA_BLOQ_VLRMAXIMO').AsInteger;
      ParSenhaLibera        := FieldByName('PAR_SENHALIBERA').AsString;
    end;
  finally
    Free;
  end;
  //
  FItemCad := TItemCad.Create;
end;

procedure Tfrm_LancItemBase.FormDestroy(Sender: TObject);
begin
  if Assigned(FItemCad) then
    FItemCad.Free;
end;

procedure Tfrm_LancItemBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN Then
    Perform(WM_NEXTDLGCTL,0,0)
  else if Key = VK_ESCAPE then
    Close;
end;

{ TItemCad }

procedure TItemCad.SetTipo(const Value: Integer);
begin
  FTipo := Value;
end;

procedure TItemCad.SetEstoque(const Value: Double);
begin
  FEstoque := Value;
end;

procedure TItemCad.SetPrMinimo(const Value: Double);
begin
  FPrMinimo := Value;
end;

end.
