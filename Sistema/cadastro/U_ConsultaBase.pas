unit U_ConsultaBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls, DB,
  DBClient, U_CadastroBase, FMTBcd, SqlExpr, Provider, Menus, Vcl.ImgList;

type
  TCadBase = class of TFrm_CadastroBase;

  TFrm_ConsultaBase = class(TForm)
    pnlRodape: TPanel;
    lblBusca: TLabel;
    edt_pesq: TEdit;
    tbMenu: TToolBar;
    btn_nov: TToolButton;
    btn_alt: TToolButton;
    btn_exc: TToolButton;
    ToolButton23: TToolButton;
    btn_con: TToolButton;
    ToolButton26: TToolButton;
    btn_sai: TToolButton;
    Grid: TDBGrid;
    DS: TDataSource;
    dbxDTS: TSQLDataSet;
    DSP: TDataSetProvider;
    CDS: TClientDataSet;
    Pop_Atalho: TPopupMenu;
    Consulta1: TMenuItem;
    Novo1: TMenuItem;
    Altarar1: TMenuItem;
    Excluir1: TMenuItem;
    Sair1: TMenuItem;
    Icones: TImageList;
    btnPesquisar: TButton;
    procedure btn_priClick(Sender: TObject);
    procedure btn_proClick(Sender: TObject);
    procedure btn_antClick(Sender: TObject);
    procedure btn_ultClick(Sender: TObject);
    procedure btn_novClick(Sender: TObject);
    procedure btn_altClick(Sender: TObject);
    procedure btn_excClick(Sender: TObject);
    procedure btn_conClick(Sender: TObject);
    procedure btn_saiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_pesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure rgTipoBuscaClick(Sender: TObject);
    procedure CDSReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSAfterPost(DataSet: TDataSet);
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure CDSPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CDSAfterInsert(DataSet: TDataSet);
    procedure GridTitleClick(Column: TColumn);
    procedure edt_pesqEnter(Sender: TObject);
    procedure edt_pesqExit(Sender: TObject);
    procedure btnClonarClick(Sender: TObject);
  private
    procedure ClonarItem;
  protected
    CadBase: TCadBase;
    MultEmp: shortstring;
    TabelaNome, FCondicaoClonar: string;
    FClonar: Boolean;
    procedure SearchByParams(const AParams: array of Variant); overload;
    procedure SearchByParams(const ASQL: string; const AParams: array of Variant); overload;
    procedure SearchByLocate(const AFields: string; const AValues: array of Variant);
    procedure RotinasAposClonagem; virtual;
    function GetCondicao: string; virtual;
    function GetCamposRemovidos: TStringList; virtual;
    function GenerateKey(const AField, ATable: string): integer;
  public
    { Public declarations }
  end;

var
  Frm_ConsultaBase: TFrm_ConsultaBase;

implementation

uses StrUtils, Math, U_DMRet;

{$R *.dfm}

{ TFrm_ConsultaBase }

procedure TFrm_ConsultaBase.btn_altClick(Sender: TObject);
begin
  if CDS.IsEmpty then
  begin
    MessageBox(handle, 'N�o h� registro para alterar!', PChar(Application.Title),
      MB_ICONINFORMATION + MB_OK);
    Abort;
  end;

  if MultEmp <> 'F' then
  try
    CDS.Edit;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

  if not Assigned(CadBase) then
    raise Exception.Create('O formul�rio de cadastro n�o foi configurado');
  //

  with CadBase.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFrm_ConsultaBase.btn_antClick(Sender: TObject);
begin
  CDS.Prior;
end;

procedure TFrm_ConsultaBase.btn_conClick(Sender: TObject);
begin
  if pnlRodape.Visible then
    pnlRodape.Visible := False
  else
  begin
    pnlRodape.Visible := True;
    //
    if edt_pesq.Visible and edt_pesq.Enabled then
      edt_pesq.SetFocus;
  end;
end;

procedure TFrm_ConsultaBase.btn_excClick(Sender: TObject);
begin
  if MultEmp = 'F' then Exit;

  if CDS.IsEmpty then
  begin
    MessageBox(handle, 'N�o h� registro para excluir!', PChar(Application.Title),
      MB_ICONINFORMATION + MB_OK);
    Abort;
  end;

  if Application.MessageBox(
      'Deseja realmente excluir este registro?',
      'ATEN��O!', MB_ICONQUESTION + MB_YESNO) = IDYES then
  try
    CDS.Delete;
  except
    on E: Exception do
      if E.Message <> 'Operation aborted' then
        raise Exception.Create(E.Message);
  end;
end;

procedure TFrm_ConsultaBase.btn_novClick(Sender: TObject);
begin
  if MultEmp = 'F' then Exit;

  if not Assigned(CadBase) then
    raise Exception.Create('O formul�rio de cadastro n�o foi configurado');

  with CadBase.Create(nil) do
  try
    try
      CDS.Insert;

      if FClonar then
        ClonarItem;

    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;

    ShowModal;
  finally
    FClonar := False;
    Free;
  end;
end;

procedure TFrm_ConsultaBase.btn_priClick(Sender: TObject);
begin
  CDS.First;
end;

procedure TFrm_ConsultaBase.btn_proClick(Sender: TObject);
begin
  CDS.Next;
end;

procedure TFrm_ConsultaBase.btn_saiClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_ConsultaBase.btn_ultClick(Sender: TObject);
begin
  CDS.Last;
end;

procedure TFrm_ConsultaBase.CDSAfterDelete(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TFrm_ConsultaBase.CDSAfterInsert(DataSet: TDataSet);
var
  i: integer;
begin
  for i := 0 to CDS.FieldCount - 1 do
    if CDS.Fields[i] is TIntegerField then
      Continue
    else if CDS.Fields[i] is TNumericField then
      CDS.Fields[i].AsFloat := 0;
    //
end;

procedure TFrm_ConsultaBase.CDSAfterPost(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TFrm_ConsultaBase.CDSPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message = 'Key violation.' then
  begin
    MessageDlg('Registro duplicado! O Campo chave j� existe!', mtError, [mbOK], 0);
    Action := daAbort;
  end;
end;

procedure TFrm_ConsultaBase.CDSReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
var
  Tipo: Variant;
begin
  Action := raCancel;

  if AnsiContainsStr(E.Message, 'DELETE') or
     AnsiStartsStr('Children still exist in', E.Message) then
    Tipo := 'exclu�-lo.'
  else if AnsiContainsStr(E.Message, 'UPDATE') then
    Tipo := 'alter�-lo.';
  //

  if not VarIsEmpty(Tipo) then
  begin
    MessageDlg('Este registro tem movimenta��es e n�o ser� poss�vel ' + Tipo,
      mtError, [mbOK], 0);
    Exit;
  end;

  MessageDlg(E.Message, mtError, [mbOK], 0);

end;

procedure TFrm_ConsultaBase.ClonarItem;
const
  SQL = 'SELECT * FROM %s';
var
  i: integer;
  CamposRemovidos: TStringList;
begin
  CamposRemovidos := GetCamposRemovidos;
  
  with TClientDataSet.Create(nil) do
  try
    Data := DMRet.GetData(Format(SQL,[FCondicaoClonar]),[]);

    //Preecnhe a lista de campos e a lista de valores que ser�o clonados.
    for i := 0 to FieldCount - 1 do
      if (CamposRemovidos.IndexOf(Fields[i].FieldName) = -1) and 
        (CDS.FindField(Fields[i].FieldName) <> nil) then
          CDS.FieldByName(Fields[i].FieldName).Value := Fields[i].Value;
    RotinasAposClonagem;
  finally
    CamposRemovidos.Free;
    Free;
  end;
end;

procedure TFrm_ConsultaBase.DSPAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  ASql: string;
  i: integer;
begin
  if UpdateKind <> ukInsert then Exit;

  ASql := Format('SELECT IDENT_CURRENT(''%s'')', [TabelaNome]);

  for i := 0 to DeltaDS.Fields.Count - 1 do
    if (pfInKey in DeltaDS.Fields[i].ProviderFlags) and DeltaDS.Fields[i].IsNull then
    begin
      DeltaDS.Fields[i].NewValue := DMRet.OpenSQL(ASql, []);
      Break;
    end;
end;

procedure TFrm_ConsultaBase.edt_pesqEnter(Sender: TObject);
begin
  TEdit(Sender).Color := clNavy;
  TEdit(Sender).Font.Color := clWhite;
end;

procedure TFrm_ConsultaBase.edt_pesqExit(Sender: TObject);
begin
  TEdit(Sender).Color := $00F4FFFF;
  TEdit(Sender).Font.Color := clBlack;
end;

procedure TFrm_ConsultaBase.edt_pesqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) then
    Grid.SetFocus
  else if Key = VK_RETURN then
    btnPesquisar.SetFocus;
  //
end;

procedure TFrm_ConsultaBase.edt_pesqKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnPesquisar.SetFocus;
end;

procedure TFrm_ConsultaBase.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDataSet then
      (Components[i] as TDataSet).Close;
    //
  Action := caFree;
end;

procedure TFrm_ConsultaBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure TFrm_ConsultaBase.FormShow(Sender: TObject);
var
  PStart, PEnd: integer;
  STable, ASql: string;
begin
  if MultEmp = 'F' then
  begin
    btn_nov.Visible := False;
    btn_exc.Visible := False;
    btn_alt.Caption := 'Visualizar';
  end;

  try
    CDS.Open;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      raise;
    end;
  end;

  ASql := StringReplace(dbxDTS.CommandText, #13, ' ', [rfReplaceAll]);
  ASql := StringReplace(ASql, #10, '', [rfReplaceAll]);
  ASql := StringReplace(ASql, #9, '', [rfReplaceAll]);
  ASql := UpperCase(ASql);

  PStart := Pos('FROM', ASql) + 4;
  STable := Trim(Copy(ASql, PStart, Length(ASql)));

  PEnd := Pos(' ', STable);
  PEnd := IfThen(PEnd = 0, Length(STable), PEnd);

  TabelaNome := Trim(Copy(STable, 1, PEnd));
end;

function TFrm_ConsultaBase.GenerateKey(const AField, ATable: string): integer;
const
  SQL =
    'SELECT isnull(MAX(convert(bigint, %0:s)),0) FROM %1:s ' +
    'WHERE isnumeric(%0:s) = 1 and charindex(''.'', %0:s) = 0 and charindex('','', %0:s) = 0';
begin
  Result := DMRet.OpenSQL(Format(SQL, [AField, ATable]), []) + 1;
end;

function TFrm_ConsultaBase.GetCamposRemovidos: TStringList;
begin
  raise Exception.Create('Implemente o m�todo "GetCamposRemovidos".');

end;

function TFrm_ConsultaBase.GetCondicao: string;
begin
  raise Exception.Create('Implemente o m�todo "GetCondicao".');

end;

procedure TFrm_ConsultaBase.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    Grid.Canvas.Brush.Color := clActiveCaption;
    Grid.Canvas.Font.Color  := clWhite;
  end else
  begin
    if Odd(CDS.RecNo) then
    begin
      Grid.Canvas.Brush.Color := $00F0F0F0; //$00F4FFFF;
      Grid.Canvas.Font.Color  := clWindowText;
    end else
    begin
      Grid.Canvas.Brush.Color := clWhite;
      Grid.Canvas.Font.Color  := clWindowText;
    end;
  end;

  Grid.DefaultDrawDataCell(Rect, Grid.Columns[DataCol].Field, State);
end;

procedure TFrm_ConsultaBase.GridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btn_altClick(Sender);
end;

procedure TFrm_ConsultaBase.GridTitleClick(Column: TColumn);
begin
  if Column.Field.FieldKind in [fkCalculated, fkLookup, fkInternalCalc, fkAggregate] then Exit;

  if not CDS.IsEmpty then
    CDS.IndexFieldNames := Column.FieldName;
  //
end;

procedure TFrm_ConsultaBase.rgTipoBuscaClick(Sender: TObject);
begin
//  lblBusca.Caption := Format('%s:', [rgTipoBusca.Items[rgTipoBusca.ItemIndex]]);
  //
  if edt_pesq.Visible and pnlRodape.Visible then
    edt_pesq.SetFocus;
end;

procedure TFrm_ConsultaBase.RotinasAposClonagem;
begin

end;

procedure TFrm_ConsultaBase.SearchByLocate(const AFields: string;
  const AValues: array of Variant);
var
  ToSearch: Variant;
begin
  if Length(AValues) > 1 then
    ToSearch := VarArrayOf(AValues)
  else
    ToSearch := AValues[0];
  //
  if not CDS.Locate(AFields, ToSearch, [loPartialKey, loCaseInsensitive]) then
  begin
    Application.MessageBox('Nenhum registro encontrado!', 'AVISO!',
      MB_ICONINFORMATION);
    edt_pesq.SetFocus;
    Exit;
  end;
  Grid.SetFocus;
end;

procedure TFrm_ConsultaBase.SearchByParams(const ASQL: string;
  const AParams: array of Variant);
begin
  if CDS.Active then CDS.Close;

  dbxDTS.CommandText := ASQL;

  SearchByParams(AParams);
end;

procedure TFrm_ConsultaBase.SearchByParams(const AParams: array of Variant);
var
  i: Integer;
begin
  if CDS.Active then CDS.Close;

  CDS.FetchParams;

  for i := 0 to High(AParams) do
    CDS.Params[i].Value := AParams[i];

  try
    CDS.Open;
    if CDS.IsEmpty then
    begin
      Application.MessageBox('Nenhum registro encontrado!', 'AVISO!',
        MB_ICONINFORMATION);
      if edt_pesq.Visible and edt_pesq.Enabled then
        edt_pesq.SetFocus;
      Exit;
    end;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;

  Grid.SetFocus;
end;

procedure TFrm_ConsultaBase.btnClonarClick(Sender: TObject);
begin
 if CDS.IsEmpty then
 begin
   ShowMessage('N�o existe nada para clonar!');
   Exit;
 end;

 FClonar := True;
 FCondicaoClonar := GetCondicao;

 btn_novClick(Sender);
end;

end.
