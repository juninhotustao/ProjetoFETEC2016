unit U_PesqLancBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, DB, DBClient,
  Provider, Generics.Collections, FMTBcd, SqlExpr, Menus;

type
  Tfrm_PesqBaseClass = class of Tfrm_PesqLancBase;

  TPesquisa = TDictionary<string,Variant>;

  Tfrm_PesqLancBase = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btn_Confirma: TBitBtn;
    DSP: TDataSetProvider;
    CDS: TClientDataSet;
    DS: TDataSource;
    lbl_Periodo: TLabel;
    lbl_a: TLabel;
    lbl_nro: TLabel;
    dt_inicial: TDateTimePicker;
    dt_final: TDateTimePicker;
    chk_datas: TCheckBox;
    edt_nro: TEdit;
    chk_Num: TCheckBox;
    QRY: TSQLQuery;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure chk_datasClick(Sender: TObject);
    procedure chk_NumClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FPesquisa: TPesquisa;
  protected
    FIdConsulta : Variant;
    //
    property Pesquisa: TPesquisa read FPesquisa write FPesquisa;
  public
    property IdConsulta : Variant read FIdConsulta;
    //
    class function GetIdConsulta(var APesquisa: TPesquisa;
      SoPendentes: Boolean = False): Variant; virtual; abstract;
  end;


var
  frm_PesqLancBase: Tfrm_PesqLancBase;

implementation

uses
  U_DMRet;

{$R *.dfm}

procedure Tfrm_PesqLancBase.chk_datasClick(Sender: TObject);
begin
  lbl_Periodo.Enabled := not(chk_datas.Checked);
  dt_inicial.Enabled  := not(chk_datas.Checked);
  lbl_a.Enabled       := not(chk_datas.Checked);
  dt_final.Enabled    := not(chk_datas.Checked);
end;

procedure Tfrm_PesqLancBase.chk_NumClick(Sender: TObject);
begin
  lbl_nro.Enabled := not(chk_Num.Checked);
  edt_nro.Enabled := not(chk_Num.Checked);
end;

procedure Tfrm_PesqLancBase.DBGrid1DblClick(Sender: TObject);
begin
  if CDS.IsEmpty then
  begin
    ShowMessage('Não há nada a ser selecionado!');
    Exit;
  end;
  //
  ModalResult := mrOk;
end;

procedure Tfrm_PesqLancBase.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGrid1DblClick(Sender);
end;

procedure Tfrm_PesqLancBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_PesqLancBase.FormDestroy(Sender: TObject);
begin
  CDS.Close;
end;

procedure Tfrm_PesqLancBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_RETURN) and (ActiveControl <> DBGrid1) Then
    Perform(WM_NEXTDLGCTL,0,0)
  else if Key = VK_ESCAPE then
    Close;
end;

procedure Tfrm_PesqLancBase.FormShow(Sender: TObject);
begin
  FIdConsulta := Null;
  dt_inicial.DateTime := Date;
  dt_final.DateTime   := Date;
end;

end.
