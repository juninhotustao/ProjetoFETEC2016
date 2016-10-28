unit U_PesqBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBClient, ExtCtrls, Buttons, Grids, DBGrids,
  FMTBcd, Provider, SqlExpr;

type
  Tfrm_PesqBase = class(TForm)
    Panel4: TPanel;
    Grid: TDBGrid;
    Panel2: TPanel;
    lblBusca: TLabel;
    edt_pesq: TEdit;
    DTS: TADODataSet;
    DS: TDataSource;
    rgTipoBusca: TRadioGroup;
    btn_confirma: TBitBtn;
    QRY: TSQLQuery;
    DSP: TDataSetProvider;
    CDS: TClientDataSet;
    procedure edt_pesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridDblClick(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure rgTipoBuscaClick(Sender: TObject);
    procedure btn_confirmaClick(Sender: TObject);
    procedure edt_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure EditFieldExit(Sender: TObject);
    procedure EditFieldEnter(Sender: TObject);
  protected
    FId: integer;
    procedure SearchByParams(const AParams: array of Variant);
    procedure SearchByLocate(const AFields: string; const AValues: array of Variant);
  public
    { Public declarations }
  end;

var
  frm_PesqBase: Tfrm_PesqBase;

implementation

uses U_DMRet;

{$R *.dfm}

procedure Tfrm_PesqBase.edt_pesqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) then
    grid.SetFocus;
  //
end;

procedure Tfrm_PesqBase.edt_pesqKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btn_confirma.SetFocus;
end;

procedure Tfrm_PesqBase.GridDblClick(Sender: TObject);
begin
  if CDS.IsEmpty then
  begin
    MessageBox(handle,'Não há Registro para Visualizar!',
      PChar(Application.Title),MB_ICONINFORMATION+MB_OK);
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure Tfrm_PesqBase.GridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then GridDblClick(Sender);
end;

procedure Tfrm_PesqBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_PesqBase.FormCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TEdit then
    begin
      TEdit(Components[i]).OnEnter := EditFieldEnter;
      TEdit(Components[i]).OnExit  := EditFieldExit;
    end;
end;

procedure Tfrm_PesqBase.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDataSet then
      (Components[i] as TDataSet).Close;
    //
end;

procedure Tfrm_PesqBase.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_PesqBase.FormShow(Sender: TObject);
begin
  //Rotina Se fez Obrigatorio Devido tratamentos da "U_PesqChaveNFe"
  if edt_pesq.Visible then edt_pesq.SetFocus;

  try
    CDS.Open;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure Tfrm_PesqBase.rgTipoBuscaClick(Sender: TObject);
begin
  lblBusca.Caption := Format('%s:', [rgTipoBusca.Items[rgTipoBusca.ItemIndex]]);

  //Rotina Se fez Obrigatorio Devido tratamentos da "U_PesqChaveNFe"
  if edt_pesq.Visible and edt_pesq.Enabled then edt_pesq.SetFocus;
end;

procedure Tfrm_PesqBase.SearchByLocate(const AFields: string;
  const AValues: array of Variant);
begin
  if not CDS.Locate(AFields, VarArrayOf(AValues), [loPartialKey]) then
  begin
    Application.MessageBox('Nenhum registro encontrado!', 'AVISO!', MB_ICONINFORMATION);

    //Rotina Se fez Obrigatorio Devido tratamentos da "U_PesqChaveNFe"
    if edt_pesq.Visible then edt_pesq.SetFocus;

    Exit;
  end;

  Grid.SetFocus;
end;

procedure Tfrm_PesqBase.SearchByParams(const AParams: array of Variant);
var
  i: integer;
begin
  CDS.Close;

  for i := 0 to High(AParams) do
    CDS.Params[i].Value := AParams[i];

  try
    CDS.Open;

    if CDS.IsEmpty then
    begin
      Application.MessageBox('Nenhum registro encontrado!', 'AVISO!', MB_ICONINFORMATION);

      //Rotina Se fez Obrigatorio Devido tratamentos da "U_PesqChaveNFe"
      if edt_pesq.Visible and edt_pesq.Enabled then edt_pesq.SetFocus;

      Exit;
    end;

    Grid.SetFocus;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure Tfrm_PesqBase.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    Grid.Canvas.Brush.Color := clActiveCaption;
    Grid.Canvas.Font.Color  := clWhite;
  end else
  begin
    if odd(CDS.RecNo) then
    begin
      Grid.Canvas.Brush.Color := $00F4FFFF;
      Grid.Canvas.Font.Color  := clWindowText;
    end else
    begin
      Grid.Canvas.Brush.Color := clWhite;
      Grid.Canvas.Font.Color  := clWindowText;
    end;
  end;

  Grid.DefaultDrawDataCell(Rect, Grid.Columns[DataCol].Field, State);
end;

procedure Tfrm_PesqBase.btn_confirmaClick(Sender: TObject);
begin
 //
end;

procedure Tfrm_PesqBase.EditFieldEnter(Sender: TObject);
begin
  if not (Sender is TEdit) then Exit;
  TEdit(Sender).Color      := clNavy;
  TEdit(Sender).Font.Color := clWhite;
end;

procedure Tfrm_PesqBase.EditFieldExit(Sender: TObject);
begin
  if not (Sender is TEdit) then Exit;
  TEdit(Sender).Color      := $00F4FFFF;
  TEdit(Sender).Font.Color := clBlack;
end;

end.
