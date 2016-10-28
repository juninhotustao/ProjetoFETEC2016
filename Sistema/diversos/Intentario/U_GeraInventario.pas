unit U_GeraInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBClient;

type
  Tfrm_GeraInventario = class(TForm)
    pnl_botoes: TPanel;
    btn_confirma: TBitBtn;
    btn_cancela: TBitBtn;
    gb_principal: TGroupBox;
    gb_situacao: TGroupBox;
    chk_bens: TCheckBox;
    chk_inativo: TCheckBox;
    chk_ativo: TCheckBox;
    lbl_Msg: TLabel;
    dt_fechamento: TDateTimePicker;
    rg_TipoEstoque: TRadioGroup;
    pnl_Aguarde: TGroupBox;
    lbl_Msg_Aguarde: TLabel;
    lbl_DtFechamento: TLabel;
    procedure btn_confirmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_GeraInventario: Tfrm_GeraInventario;

implementation

uses U_DMRet;

{$R *.dfm}

procedure Tfrm_GeraInventario.btn_confirmaClick(Sender: TObject);
const
  {$REGION 'Consultas SQL'}
  SQL_ESTOQDATA =
    ' SELECT ' +
    '    P.PRO_ID, P.PRO_REFERENCIA, P.NAF_CODFISCAL, P.PRO_CODIGONBM, P.CST_ID, ' +
    '    cast(P.PRO_VLRCUSTO as numeric(13,2)) as PRO_VLRCUSTO, ' +
    '    cast(P.PRO_VLRMEDIO as numeric(13,2)) as PRO_VLRMEDIO, ' +
    '    cast(P.PRO_CUSTONOTA as numeric(13,2)) as PRO_CUSTONOTA, ' +
    '    cast(P.PRO_VLRVENDA as numeric(13,2)) as PRO_VLRVENDA, ' +
    '    cast( ' +
    '        PRO_ESTOQUE - ' +
    '        SUM(SAIDA_DIMINUI) + SUM(SAIDA_AUMENTA) - ' +
    '        SUM(ENTRADA_DIMINUI) + SUM(ENTRADA_AUMENTA) - ' +
    '        SUM(MOVTO_DIMINUI) + SUM(MOVTO_AUMENTA) + ' +
    '        SUM(SERIED_AUMENTA)+ SUM(DETALHE_AUMENTA) - ' +
    '        SUM(PRODUCAO_DIMINUI) + SUM(PRODUCAO_AUMENTA) as numeric(13,3) ' +
    '    ) AS ESTOQUE ' +
    ' FROM ' +
    '    PRODUTO P ' +
    ' LEFT JOIN ' +
    '    VW_ESTOQUE_DATA V ON P.PRO_ID = V.PRO_ID ' +
    ' WHERE ' +
    '    DT_MOVTO >= :DT_INV AND PRO_ATIVO IN (%s) ' +
    ' GROUP BY ' +
    '    P.PRO_ID, P.PRO_REFERENCIA, P.NAF_CODFISCAL, P.PRO_VLRCUSTO, '+
    '    P.PRO_VLRMEDIO, P.PRO_CUSTONOTA, P.PRO_VLRVENDA, PRO_ESTOQUE, '+
    '    P.PRO_CODIGONBM, P.CST_ID ';

  SQL_ESTOQATUAL =
    ' SELECT ' +
    '    PRO_ID, PRO_REFERENCIA, NAF_CODFISCAL, PRO_CODIGONBM, CST_ID, '+
    '    PRO_VLRCUSTO, PRO_VLRMEDIO, PRO_CUSTONOTA, '+
    '    cast(PRO_VLRVENDA as numeric(13,2)) as PRO_VLRVENDA, ' +
    '    PRO_ESTOQUE as ESTOQUE ' +
    ' FROM ' +
    '    PRODUTO ' +
    ' WHERE ' +
    '    PRO_ATIVO IN (%s)';

  INS_INV_PRODUTO =
    ' INSERT INTO INVENTARIO '+
    '   (INV_DATA, INV_ID_PROD, PRO_ID, INV_QTDE, INV_VLR_CUSTO, '+
	  '    INV_VLR_MEDIO, INV_VLR_CUSTOREAL, INV_VLR_VENDA, '+
    '    NAF_CODFISCAL, NCM_COD, CST_ID) '+
    ' VALUES '+
    '   (:INV_DATA, :INV_ID_PROD, :PRO_ID, :INV_QTDE, :INV_VLR_CUSTO, '+
	  '    :INV_VLR_MEDIO, :INV_VLR_CUSTOREAL, :INV_VLR_VENDA, '+
    '    :NAF_CODFISCAL, :NCM_COD, :CST_ID) ';

  SQL_COMBUSTIVEL =
    ' select '+
    '  	 COM_CODIGO, COM_PRECUSTO, NAF_CODFISCAL, COM_CODIGONCM, CST_ID, '+
    '    isnull((select top 1 LMC_FECHAMENTO '+
    '            from LMC  '+
    '            where COM_CODIGO = C.COM_CODIGO and LMC_DATA <= :LMC_DATA '+
    '            order by LMC_DATA desc), 0) as ESTOQUE '+
    ' from '+
	  '   COMBUSTIVEL C ';

  INS_INV_COMBUSTIVEL =
    ' INSERT INTO INVENTARIO_COMB '+
    '  (INV_DATA, COM_CODIGO, INV_QTDE, INV_VLR_CUSTO, '+
    '   NAF_CODFISCAL, NCM_COD, CST_ID ) '+
    ' values '+
    '  (:INV_DATA, :COM_CODIGO, :INV_QTDE, :INV_VLR_CUSTO, '+
    '   :NAF_CODFISCAL, :NCM_COD, :CST_ID ) ';
  {$ENDREGION}
var
  posto: boolean;
  SQL, TiposProd : String;
begin
     posto := (DMRet.OpenSQL('select par_estabelecimento from params', []) = 'P');

     if not(chk_ativo.Checked) and not(chk_inativo.Checked) and not(chk_bens.Checked) then
     begin
        MessageBox(handle,'É Obrigatório selecionar no minimo uma das opções:'^m+
                          ' '^m+
                          ' * Ativo '^m+
                          ' * Inativo '^m+
                          ' * Bens Consumo / Ativo Imobilizado ',PChar(Application.Title),MB_ICONINFORMATION+MB_OK);
        Abort;
     end;

     if DMRet.OpenSQL('select count(*) from inventario where inv_data = :dtinv',[dt_fechamento.DateTime]) > 0 then
     Begin
        MessageBox(handle,'Inventário deste dia já foi gerado, Não será possível continuar.',PChar(Application.Title),MB_ICONINFORMATION+MB_OK);
        Exit;
     End
     else
     Begin
        try
            update;
            pnl_Aguarde.Visible := true;
            update;

            btn_confirma.Enabled := False;

            //Verficando se a consulta vai pegar os produtos: Ativos, Inativos e Bens de Consumo
            TiposProd := '';

            //Produtos Ativos
            if chk_ativo.Checked then
              TiposProd := '''A''';

            //Produtos Inativos
            if chk_inativo.Checked then
              if TiposProd = '' then
                TiposProd := '''I'''
              else
                TiposProd := TiposProd + ', ''I''';

            //Produtos Bens de Consumo
            if chk_bens.Checked then
              if TiposProd = '' then
                TiposProd := '''B'''
              else
                TiposProd := TiposProd + ', ''B''';


            with TClientDataSet.Create(Self) do
            try
                 case rg_TipoEstoque.ItemIndex of
                 0:Begin
                     SQL  := Format(SQL_ESTOQATUAL, [TiposProd]);
                     Data := DMRet.GetData(SQL, []);
                   end;
                 1:Begin
                     ShowMessage('ATENÇÃO, Arquivo gerado com estoque SIMULADO, podem ocorrer diferenças nos valores.');
                     SQL  := Format(SQL_ESTOQDATA, [TiposProd]);
                     Data := DMRet.GetData(SQL, [dt_fechamento.DateTime]);
                   end;
                 end;

                 if not(IsEmpty) then
                 begin
                   First;
                   while not(Eof) do
                   begin
                     DMRet.ExecuteSQL(INS_INV_PRODUTO,[dt_fechamento.DateTime,
                                                       FieldByName('PRO_REFERENCIA').AsString,
                                                       FieldByName('PRO_ID').AsInteger,
                                                       FieldByName('ESTOQUE').AsFloat,
                                                       FieldByName('PRO_VLRCUSTO').AsFloat,
                                                       FieldByName('PRO_VLRMEDIO').AsFloat,
                                                       FieldByName('PRO_CUSTONOTA').AsFloat,
                                                       FieldByName('PRO_VLRVENDA').AsFloat,
                                                       FieldByName('NAF_CODFISCAL').Value,
                                                       FieldByName('PRO_CODIGONBM').Value,
                                                       FieldByName('CST_ID').Value]);

                     Application.ProcessMessages;
                     Next;
                     Application.ProcessMessages;
                   end;
                 end;
            Finally
               Free;
            end;


            if posto then
            begin
                 with TClientDataSet.Create(Self) do
                 try
                   Data := DMRet.GetData(SQL_COMBUSTIVEL, [dt_fechamento.DateTime]);
                   First;
                   while not(Eof) do
                   begin
                     {Rodrigo 01/08/2016
                     Esta tela estava acoplada no executavel, nesta data eu a passei para
                     a BPL diversos, no entanto não efetuei nenhuma alteração no código,
                     porem podem ver que não esta alimentando o campo TAN_CODIGO da
                     tabela INVENTÁRIO_COMB, já era assim e deixei da mesma forma.}
                     DMRet.ExecuteSQL(INS_INV_COMBUSTIVEL,[dt_fechamento.DateTime,
                                                           FieldByName('COM_CODIGO').AsInteger,
                                                           FieldByName('ESTOQUE').AsInteger,
                                                           FieldByName('COM_PRECUSTO').AsFloat,
                                                           FieldByName('NAF_CODFISCAL').Value,
                                                           FieldByName('COM_CODIGONCM').Value,
                                                           FieldByName('CST_ID').Value]);

                      Application.ProcessMessages;
                      Next;
                      Application.ProcessMessages;
                   end;
                 finally
                   Close;
                 end;
            end;
            //
        finally
           update;
           pnl_Aguarde.Visible := False;
           update;

           btn_confirma.Enabled := True;
        end;

         MessageBox(handle,'Inventário Gerado com Sucesso!',PChar(Application.Title),MB_ICONINFORMATION+MB_OK);
     End;
end;

procedure Tfrm_GeraInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree; //destrói o form automaticamente
end;

procedure Tfrm_GeraInventario.btn_cancelaClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_GeraInventario.FormCreate(Sender: TObject);
begin
  dt_fechamento.Date := date;
  pnl_Aguarde.Align  := alClient;
end;

end.

