unit U_LimpezaPeriodica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  Tfrm_LimpezaPeriodica = class(TForm)
    gb_periodo: TGroupBox;
    dt_final: TDateTimePicker;
    lbl_periodo: TLabel;
    btn_confirma: TBitBtn;
    btn_cancela: TBitBtn;
    rg_tabelas: TGroupBox;
    chk_OrcVenda: TCheckBox;
    chk_MovEstLoja: TCheckBox;
    chk_EntMerc: TCheckBox;
    chk_SaiMerc: TCheckBox;
    chk_SaiServ: TCheckBox;
    chk_PedCompra: TCheckBox;
    chk_Reducoes: TCheckBox;
    chk_SerieD: TCheckBox;
    chk_Frete: TCheckBox;
    chk_Cupons: TCheckBox;
    chk_Receber: TCheckBox;
    chk_Pagar: TCheckBox;
    chk_CaixaBanco: TCheckBox;
    chk_todos: TCheckBox;
    chk_VerificaLog: TCheckBox;
    chk_EmissaoCheque: TCheckBox;
    chk_Credito: TCheckBox;
    chk_LimpaReceberAbert: TCheckBox;
    chk_LimpaPagarAbert: TCheckBox;
    chk_CTe: TCheckBox;
    pnl_Aguarde: TPanel;
    procedure btn_cancelaClick(Sender: TObject);
    procedure chk_todosClick(Sender: TObject);
    procedure btn_confirmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chk_ReceberClick(Sender: TObject);
    procedure chk_PagarClick(Sender: TObject);
  private
    { PPrivate declarations }
  public
    { Public declarations }
  end;

var
  frm_LimpezaPeriodica: Tfrm_LimpezaPeriodica;

implementation

uses U_DMRet, U_InsLog, StrUtils;

{$R *.dfm}

procedure Tfrm_LimpezaPeriodica.btn_cancelaClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_LimpezaPeriodica.chk_PagarClick(Sender: TObject);
begin
  chk_LimpaPagarAbert.Visible := chk_Pagar.Checked;
  if not chk_LimpaPagarAbert.Visible then
    chk_LimpaPagarAbert.Checked := False;
  //
end;

procedure Tfrm_LimpezaPeriodica.chk_ReceberClick(Sender: TObject);
begin
  chk_LimpaReceberAbert.Visible := chk_Receber.Checked;
  if not chk_LimpaReceberAbert.Visible then
    chk_LimpaReceberAbert.Checked := False;
  //
end;

procedure Tfrm_LimpezaPeriodica.chk_todosClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TCheckBox) then
      TCheckBox(Self.Components[i]).Checked := chk_todos.Checked;
end;

procedure Tfrm_LimpezaPeriodica.btn_confirmaClick(Sender: TObject);
const
  SP_LIMPEZA_PERIODICA =
    'exec LIMPEZA_PERIODICA :DTFIN, :VENDA, :LANC, :ENTRADA, :SAIDA, :SERV, ' +
    '  :PEDIDO, :REDUCOES, :FRETE, :SERIED, :MESTRE, :RECEBER, :RECABERTO, ' +
    '  :PAGAR, :PAGABERTO, :CAIXA, :LOG, :CHEQUE, :CREDITO, :CTE';
var
  i, TotalCheck: Integer;
  sTexto: string;
begin
  //Verificando a quantidade de checbox selecionado
  TotalCheck := 0;
  for i:= 0 to componentcount - 1 do
  begin
    if (components[i] is TCheckBox) and ((components[i] as TCheckBox).Checked)
     and (components[i].Name <> 'chk_todos') then
      TotalCheck := TotalCheck + 1;
  end;

  if TotalCheck = 0 then
  begin
    ShowMessage('Selecione pelo menos uma opção!');
    exit;
  end;

  if MessageBox(Handle, 'Deseja Limpar a(s) Tabela(s)?', 'ATENÇÃO',
    MB_ICONQUESTION + MB_YESNO) = IDYES then
    if MessageBox(Handle, 'Tem certeza que Deseja Limpar a(s) Tabela(s)?',
      'ATENÇÃO', MB_ICONQUESTION + MB_YESNO) = IDYES then
      if MessageBox(Handle,
        'Limpando a(s) Tabela(s) os Dados Não Poderão Ser Retornados' +
          #13'Deseja Limpar?', 'ATENÇÃO', MB_ICONQUESTION + MB_YESNO)
        = IDYES then
      begin
        try
          pnl_Aguarde.Visible := true;
          Update;

          try
            //Executa Procedure para limpeza dos dados
            DMRet.ExecuteSQL(SP_LIMPEZA_PERIODICA, [
              dt_final.DateTime,
              IfThen(chk_OrcVenda.Checked, 'S', 'N'),
              IfThen(chk_MovEstLoja.Checked, 'S', 'N'),
              IfThen(chk_EntMerc.Checked, 'S', 'N'),
              IfThen(chk_SaiMerc.Checked, 'S', 'N'),
              IfThen(chk_SaiServ.Checked, 'S', 'N'),
              IfThen(chk_PedCompra.Checked, 'S', 'N'),
              IfThen(chk_Reducoes.Checked, 'S', 'N'),
              IfThen(chk_Frete.Checked, 'S', 'N'),
              IfThen(chk_SerieD.Checked, 'S', 'N'),
              IfThen(chk_Cupons.Checked, 'S', 'N'),
              IfThen(chk_Receber.Checked, 'S', 'N'),
              IfThen(chk_LimpaReceberAbert.Checked, 'S', 'N'),
              IfThen(chk_Pagar.Checked, 'S', 'N'),
              IfThen(chk_LimpaPagarAbert.Checked, 'S', 'N'),
              IfThen(chk_CaixaBanco.Checked, 'S', 'N'),
              IfThen(chk_VerificaLog.Checked, 'S', 'N'),
              IfThen(chk_EmissaoCheque.Checked, 'S', 'N'),
              IfThen(chk_Credito.Checked, 'S', 'N'),
              IfThen(chk_CTe.Checked, 'S', 'N')
            ]);

             //Grava Log
             sTexto :=
               'Foram excluídos os dados no período antes de ' + DateToStr(dt_final.Date);
             TInsLog.GeraLog('L', 'LIMPEZA', sTexto);
          except
            on E: Exception do
            begin
              Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_ICONERROR);
              Exit;
            end;
          end;

          Application.MessageBox('Operação concluida com sucesso!', PChar(Application.Title),
            MB_ICONINFORMATION);
        finally
          pnl_Aguarde.Visible := False;
          Update;
        end;
      end;
end;

procedure Tfrm_LimpezaPeriodica.FormCreate(Sender: TObject);
begin
  dt_final.DateTime := Date - 365;
  pnl_Aguarde.Align := alClient;
end;

procedure Tfrm_LimpezaPeriodica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: Perform(WM_NEXTDLGCTL, 0, 0);
    VK_ESCAPE: Close;
  end;
end;

end.
