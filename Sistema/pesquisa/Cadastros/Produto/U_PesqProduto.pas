unit U_PesqProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_PesqBase, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Menus, FMTBcd, DBClient, Provider, SqlExpr;

type
  TCanvasType = (Default, Entrada);

  Tfrm_PesqProduto = class(Tfrm_PesqBase)
    Label1: TLabel;
    qryParams: TADOQuery;
    qryParamspar_estabelecimento: TStringField;
    qryParamsPAR_BLOQ_EST_NEGATIVO: TStringField;
    qryParamspar_pro_pesquisa: TStringField;
    qryParamsPAR_ORC_PESQ_CUSTONOTA: TStringField;
    qryParamsPAR_PRODUTO_CODFABRIC: TStringField;
    qryParamsPAR_ORC_DTALTPRECO: TStringField;
    qryParamsPAR_ORC_PESQ_GAVETA: TStringField;
    qryParamsPAR_ORC_PESQ_VLRATACADO: TStringField;
    qryParamsPAR_ORC_PESQ_VLRPREPOS: TStringField;
    qryParamsPAR_ORC_PESQ_VLRVISTA: TStringField;
    qryParamsPAR_ORC_PRO_PROMOCAO: TStringField;
    qryParamsPAR_ORC_PESQ_VLRMINIMO: TStringField;
    qryParamsPAR_ORC_PESQ_VLRPRAZO: TStringField;
    qryParamsPAR_CONSPRODUTO: TStringField;
    qryParamsPAR_ORC_PESQ_RED_DESC: TStringField;
    qryParamsPAR_ORC_PESQ_TAM_DESC: TIntegerField;
    qryParamsPAR_ORC_TIPO_ATIVO: TStringField;
    qryParamsPAR_ORC_TIPO_INATIVO: TStringField;
    qryParamsPAR_ORC_TIPO_BENSCONS: TStringField;
    qryParamsPAR_MULTIEMP: TStringField;
    PopupMenu1: TPopupMenu;
    ConsultaProduto1: TMenuItem;
    CodigoFabricante1: TMenuItem;
    ObservaodeProduto1: TMenuItem;
    qryParamsPAR_ORC_CONSAUTOMATICA: TStringField;
    CDSPRO_ID: TIntegerField;
    CDSPRO_EAN1: TStringField;
    CDSPRO_EAN2: TStringField;
    CDSPRO_EAN3: TStringField;
    CDSPRO_REFERENCIA: TStringField;
    CDSCST_ID: TStringField;
    CDSNAF_CODFISCAL: TStringField;
    CDSDEP_ID: TIntegerField;
    CDSPRO_UNIDADE: TStringField;
    CDSPRO_QUANT_UNID: TFMTBCDField;
    CDSPRO_ESTOQUE: TFMTBCDField;
    CDSPRO_ESTOQMIN: TFMTBCDField;
    CDSPRO_VLRCUSTO: TFMTBCDField;
    CDSPRO_VLRPREPOS: TFMTBCDField;
    CDSPRO_VLRMEDIO: TFMTBCDField;
    CDSPRO_VLRPRAZO: TFMTBCDField;
    CDSPRO_ULTCOMP: TSQLTimeStampField;
    CDSPRO_ULTVENDA: TSQLTimeStampField;
    CDSPRO_QTDEULTCOM: TFMTBCDField;
    CDSPRO_DTALTPRECO: TSQLTimeStampField;
    CDSPRO_DESCRICAO: TStringField;
    CDSPRO_MARGEM: TFMTBCDField;
    CDSPRO_COMISSAO: TFMTBCDField;
    CDSPRO_VLRVENDA: TFMTBCDField;
    CDSPRO_OBSERVACOES: TStringField;
    CDSPRO_BALANCA: TStringField;
    CDSPRO_CODBALANCA: TStringField;
    CDSPRO_VALIDADE: TSQLTimeStampField;
    CDSPRO_ESTOQUE_DEP: TFMTBCDField;
    CDSPRO_VLRCUSTO_DEP: TFMTBCDField;
    CDSPRO_ATIVO: TStringField;
    CDSPRO_CUSTONOTA: TFMTBCDField;
    CDSPRO_VLRATACADO: TFMTBCDField;
    CDSPRO_MARGEMPRAZO: TFMTBCDField;
    CDSPRO_GAVETA: TStringField;
    CDSFOR_ID: TIntegerField;
    CDSPRO_CODFAB1: TStringField;
    CDSPRO_PROMOCAO_VLR: TFMTBCDField;
    CDSPRO_VLRMINIMO: TFMTBCDField;
    CDSPRO_RESUMIDO: TStringField;
    CDSLAB_ID: TIntegerField;
    CDSLAB_DESCRICAO: TStringField;
    CDSPRO_REGISTRO_MS: TStringField;
    qryParamsPAR_ORC_NATFISCAL: TStringField;
    CDSIPPT: TStringField;
    CDSIAT: TStringField;
    qryParamsPAR_ORC_IAT_IPPT: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edt_pesqChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_confirmaClick(Sender: TObject);
    procedure ConsultaProduto1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ModuloMultiEmpresa: HMODULE;

    Cod, qtde_colunas : Integer;
    Ref, RegMS, TiposProd : String;

    farmacia, custo_real, CodFabricante, DtAltPreco, ConsAutom,
    Gaveta, Atacado, Reposicao, Vista, Prazo : Boolean;

    class var BensConsumoEnabled: Boolean;

    function GetFunction(const Module: HMODULE; const FuncName: PAnsiChar): Pointer;
    procedure ShowEstoques;
    procedure ValidateCanvasType(ACanvasType: TCanvasType);
  public
    { Public declarations }
    class function GetCodResult(ACanvasType: TCanvasType = Default; HabilitaBensConsumo: Boolean = False): Integer;
    class function GetRefResult(ACanvasType: TCanvasType = Default; HabilitaBensConsumo: Boolean = False): String;
    class function GetRegistroMSResult(ACanvasType: TCanvasType = Default; HabilitaBensConsumo: Boolean = False): String;
  end;

var
  frm_PesqProduto: Tfrm_PesqProduto;

implementation

const
  SQl_Normal =
    ' SELECT '+
    '    PRO_ID, PRO_EAN1, PRO_EAN2, PRO_EAN3, PRO_REFERENCIA, CST_ID, NAF_CODFISCAL,  '^m+
    '    DEP_ID, PRO_UNIDADE, PRO_QUANT_UNID, PRO_ESTOQUE, PRO_ESTOQMIN, PRO_VLRCUSTO, PRO_VLRPREPOS, '^m+
    '    PRO_VLRMEDIO, PRO_VLRPRAZO, PRO_ULTCOMP, PRO_ULTVENDA, PRO_QTDEULTCOM, PRO_DTALTPRECO, '^m+
    '    PRO_DESCRICAO, PRO_MARGEM, PRO_COMISSAO, PRO_VLRVENDA, PRO_OBSERVACOES, PRO_BALANCA, '^m+
    '    PRO_CODBALANCA, PRO_VALIDADE, PRO_ESTOQUE_DEP, PRO_VLRCUSTO_DEP, PRO_ATIVO, PRO_CUSTONOTA, '^m+
    '    PRO_VLRATACADO, PRO_MARGEMPRAZO, PRO_GAVETA, FOR_ID, PRO_CODFAB1, PRO_PROMOCAO_VLR, '^m+
    '    PRO_VLRMINIMO, PRO_RESUMIDO, P.LAB_ID, LAB_DESCRICAO, PRO_REGISTRO_MS, '^m+
    '    cast(PRO_COD_ORIGEM as varchar(1)) as IPPT, cast(''T'' as varchar(1)) as IAT  '^m+
    ' FROM '^m+
    '    PRODUTO P '^m+
    ' LEFT JOIN   '^m+
    '    LABORATORIO L ON (P.LAB_ID = L.LAB_ID) ';

  SQl_Resumido =
    ' SELECT '+
    '    PRO_ID, PRO_EAN1, PRO_EAN2, PRO_EAN3, PRO_REFERENCIA, CST_ID, NAF_CODFISCAL,  '^m+
    '    DEP_ID, PRO_UNIDADE, PRO_QUANT_UNID, PRO_ESTOQUE, PRO_ESTOQMIN, PRO_VLRCUSTO, PRO_VLRPREPOS, '^m+
    '    PRO_VLRMEDIO, PRO_VLRPRAZO, PRO_ULTCOMP, PRO_ULTVENDA, PRO_QTDEULTCOM, PRO_DTALTPRECO, '^m+
    '    (PRO_RESUMIDO) AS PRO_DESCRICAO, PRO_MARGEM, PRO_COMISSAO, PRO_VLRVENDA, PRO_OBSERVACOES, PRO_BALANCA, '^m+
    '    PRO_CODBALANCA, PRO_VALIDADE, PRO_ESTOQUE_DEP, PRO_VLRCUSTO_DEP, PRO_ATIVO, PRO_CUSTONOTA, '^m+
    '    PRO_VLRATACADO, PRO_MARGEMPRAZO, PRO_GAVETA, FOR_ID, PRO_CODFAB1, PRO_PROMOCAO_VLR, '^m+
    '    PRO_VLRMINIMO, PRO_RESUMIDO, P.LAB_ID, LAB_DESCRICAO, PRO_REGISTRO_MS, '^m+
    '    cast(PRO_COD_ORIGEM as varchar(1)) as IPPT, cast(''T'' as varchar(1)) as IAT  '^m+
    ' FROM '^m+
    '    PRODUTO P '^m+
    ' LEFT JOIN   '^m+
    '    LABORATORIO L ON (P.LAB_ID = L.LAB_ID) ';

{$R *.dfm}

procedure Tfrm_PesqProduto.btn_confirmaClick(Sender: TObject);
var
  search: string;
begin
  inherited;
  search := Trim(edt_pesq.Text);

  CDS.Close;
  CDS.CommandText := '';

  case rgTipoBusca.ItemIndex of
    0: Begin  //Descri��o
          CDS.CommandText:= SQl_Normal+' where (pro_descricao like :pro_descricao) and (PRO_ATIVO in ('+TiposProd+')) order by PRO_DESCRICAO ';
          //
          if (qryParamspar_pro_pesquisa.Value = 'S') then
             SearchByParams([search + '%'])
          else
             SearchByParams(['%' + search + '%']);
       End;
    1: Begin //Descri��o Resumida
          CDS.CommandText:= SQl_Resumido+' where (pro_resumido like :resumido) and (PRO_ATIVO in ('+TiposProd+')) order by PRO_RESUMIDO ';
          //
          if (qryParamspar_pro_pesquisa.Value = 'S') then
             SearchByParams([search + '%'])
          else
             SearchByParams(['%' + search + '%']);
       End;
    2: Begin   //EAN
          CDS.CommandText:= SQl_Normal+' where (pro_EAN1 like :codbarra) and (PRO_ATIVO in ('+TiposProd+')) order by PRO_DESCRICAO ';
          //
          SearchByParams([search + '%']);
       End;
    3: Begin //Referencia
          CDS.CommandText:= SQl_Normal+' where (pro_referencia like :referencia) and (PRO_ATIVO in ('+TiposProd+')) order by PRO_REFERENCIA ';
          //
          SearchByParams([search + '%']);
       End;
    4: Begin //c�digo NCM
          CDS.CommandText:= SQl_Normal+' where PRO_CODIGONBM = :cod order by pro_descricao';
          //
          SearchByParams([search]);
       End;
    5: Begin //Cod. Balan�a
           if (qryParamspar_estabelecimento.Value = 'S') then
           begin
               CDS.CommandText:= SQl_Normal+' where pro_codbalanca like :codbalanca and (pro_balanca = ''S'') and (PRO_ATIVO in ('+TiposProd+')) order by convert(int,pro_codbalanca)';
               //
               SearchByParams([search+ '%']);
           end
           else
           begin
              CDS.CommandText:= SQl_Normal+' where (PRO_CODFAB1 = :PRO_CODFAB1) OR (PRO_CODFAB2 = :PRO_CODFAB2) OR (PRO_CODFAB3 = :PRO_CODFAB3) OR  (PRO_CODFAB4 = :PRO_CODFAB4) OR '+
                                           ' (PRO_CODFAB5 = :PRO_CODFAB5) OR (PRO_CODFAB6 = :PRO_CODFAB6) OR (PRO_CODFAB7 = :PRO_CODFAB7) OR (PRO_CODFAB8 = :PRO_CODFAB8) '+
                                           ' OR (PRO_CODFAB9 = :PRO_CODFAB9) OR (PRO_CODFAB10 = :PRO_CODFAB10) and (PRO_ATIVO in ('+TiposProd+')) ';
               //
               SearchByParams([search,search,search,search,search,search,search,search,search,search]);
           end;
       End;
    6: Begin //Codigo do fabricante
          CDS.CommandText:= SQl_Normal+' where (PRO_CODFAB1 = :PRO_CODFAB1) OR (PRO_CODFAB2 = :PRO_CODFAB2) OR (PRO_CODFAB3 = :PRO_CODFAB3) OR  (PRO_CODFAB4 = :PRO_CODFAB4) OR '+
                                           ' (PRO_CODFAB5 = :PRO_CODFAB5) OR (PRO_CODFAB6 = :PRO_CODFAB6) OR (PRO_CODFAB7 = :PRO_CODFAB7) OR (PRO_CODFAB8 = :PRO_CODFAB8) '+
                                           ' OR (PRO_CODFAB9 = :PRO_CODFAB9) OR (PRO_CODFAB10 = :PRO_CODFAB10) and (PRO_ATIVO in ('+TiposProd+')) ';
          //
          SearchByParams([search,search,search,search,search,search,search,search,search,search]);
       End;
  end;
end;

procedure Tfrm_PesqProduto.ConsultaProduto1Click(Sender: TObject);
begin
  inherited;
  edt_pesq.SetFocus;
end;

procedure Tfrm_PesqProduto.edt_pesqChange(Sender: TObject);
begin
  inherited;
  if ConsAutom then
  Begin
     if edt_pesq.Text <> '' then
     begin
          CDS.Close;
          CDS.CommandText := SQl_Normal;
          CDS.Open;

          case rgTipoBusca.ItemIndex of
             0:Begin
                 CDS.Filter        := 'PRO_DESCRICAO LIKE '+QuotedStr(edt_pesq.Text+'%');
                 CDS.Filtered      := True;
               end;
             1:Begin
                 CDS.Filter        := 'PRO_RESUMIDO LIKE '+QuotedStr(edt_pesq.Text+'%');
                 CDS.Filtered      := True;
               end;
             2:Begin
                 CDS.Filter        := 'PRO_EAN1 LIKE '+QuotedStr(edt_pesq.Text+'%');
                 CDS.Filtered      := True;
               end;
             3:Begin
                 CDS.Filter        := 'PRO_REFERENCIA LIKE '+QuotedStr(edt_pesq.Text+'%');
                 CDS.Filtered      := True;
               end;

             4:Begin

                 CDS.Filtered := False;
               end;

             5:Begin
                     if (qryParamspar_estabelecimento.Value = 'S') then
                     Begin
                         CDS.Filter        := 'PRO_CODBALANCA LIKE '+QuotedStr(edt_pesq.Text+'%');
                         CDS.Filtered      := True;
                     end
                     else
                         CDS.Filtered := False;
               end;
             6:Begin
                    //N�o ativar este recurso para o Codigo do fabricante pois, acarreta em erro grave de pesquisa no sistema - Rodrigo 20/01/2011
                         CDS.Filtered := False;
               end;
           end;
     end;
end;
end;

procedure Tfrm_PesqProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  Begin
       Cod   := CDSPRO_ID.Value;
       Ref   := CDSPRO_REFERENCIA.AsString;
       RegMS := CDSPRO_REGISTRO_MS.AsString;
  End;
  //
  inherited;

  if ModuloMultiEmpresa <> 0 then
  begin
      UnRegisterModuleClasses(ModuloMultiEmpresa);
      UnloadPackage(ModuloMultiEmpresa);
  end;
end;

procedure Tfrm_PesqProduto.FormCreate(Sender: TObject);
begin
  inherited;
  qtde_colunas   := 3;


  qryparams.Open;
  farmacia      := qryParamspar_estabelecimento.Value    = 'F';
  custo_real    := qryParamsPAR_ORC_PESQ_CUSTONOTA.Value = 'S';
  CodFabricante := qryParamsPAR_PRODUTO_CODFABRIC.Value  = 'S';
  DtAltPreco    := qryParamsPAR_ORC_DTALTPRECO.Value     = 'S';
  ConsAutom     := qryParamsPAR_ORC_CONSAUTOMATICA.Value = 'S';
  Gaveta        := qryParamsPAR_ORC_PESQ_GAVETA.Value    = 'S';
  Atacado       := qryParamsPAR_ORC_PESQ_VLRATACADO.Value= 'S';
  Reposicao     := qryParamsPAR_ORC_PESQ_VLRPREPOS.Value = 'S';
  Vista         := qryParamsPAR_ORC_PESQ_VLRVISTA.Value  = 'S';
  Prazo         := qryParamsPAR_ORC_PESQ_VLRPRAZO.Value  = 'S';

  if farmacia then
  begin
     Grid.Columns[2].Visible := true;
     Grid.Columns[2].Width   := 140;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[2].Visible := false;


  //Campo UNIDADE
  Grid.Columns[3].Visible := true;

  if CodFabricante then
  begin
     Grid.Columns[4].Visible := true;
     Grid.Columns[4].Width   := 105;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[4].Visible := false;


  if Vista then
  Begin
     Grid.Columns[6].Visible := true;
     Grid.Columns[6].Width   := 75;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[6].Visible := false;

  if Prazo then
  Begin
     Grid.Columns[7].Visible := true;
     Grid.Columns[7].Width   := 75;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[7].Visible := false;

  if Atacado then
  begin
      Grid.Columns[8].Visible := True;
      Grid.Columns[8].Width   := 75;
      qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[8].Visible := false;

  if Gaveta then
  Begin
     Grid.Columns[9].Visible := true;
     Grid.Columns[9].Width   := 75;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[9].Visible := false;

  if custo_real then
  Begin
     Grid.Columns[10].Visible   := True;
     Grid.Columns[10].Width   := 75;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[10].Visible   := False;

  if Reposicao then
  begin
      Grid.Columns[11].Visible:= true;
      Grid.Columns[11].Width   := 75;
      qtde_colunas := qtde_colunas + 1;
  end;

  if DtAltPreco then
  Begin
     Grid.Columns[12].Visible := True ;
     Grid.Columns[12].Width   := 75;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[12].Visible := False;


  if qryParamsPAR_ORC_PRO_PROMOCAO.Value = 'S' then
  Begin
     Grid.Columns[13].Visible := True;
     Grid.Columns[13].Width   := 75;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[13].Visible := false;

  if qryParamsPAR_ORC_PESQ_VLRMINIMO.Value = 'S' then
  Begin
     Grid.Columns[14].Visible := True;
     Grid.Columns[14].Width   := 75;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[14].Visible := false;


  if qryParamsPAR_ORC_NATFISCAL.Value = 'S' then
  Begin
     Grid.Columns[15].Visible := True;
     Grid.Columns[15].Width   := 75;
     qtde_colunas := qtde_colunas + 1;
  end
  else
     Grid.Columns[15].Visible := false;

  //Informa��es necessarias para Homologa��o
  if qryParamsPAR_ORC_IAT_IPPT.Value = 'S' then
  Begin
     Grid.Columns[16].Visible := True;
     Grid.Columns[16].Width   := 35;
     Grid.Columns[17].Visible := True;
     Grid.Columns[17].Width   := 35;
     qtde_colunas := qtde_colunas + 1;
  end
  else
  Begin
     Grid.Columns[16].Visible := false;
     Grid.Columns[17].Visible := false;
  End;


    //Determina o Tamanho do Campo Descri��o Conforme o numero de colunas visiveis.
    if not(qryParams.Active) then
         qryParams.Open;

    //validando se o sistema vai controlar o tamanho do campo descri��o automaticamente
    if (qryParamsPAR_ORC_PESQ_RED_DESC.Value = 'A') then
    Begin
        if not(farmacia) then
        Begin
            if qtde_colunas <= 3 then
              Grid.Columns[1].Width   := 540
            else if qtde_colunas = 4 then
              Grid.Columns[1].Width   := 465
            else if (qtde_colunas = 5) then
              Grid.Columns[1].Width   := 389
            else if qtde_colunas = 6 then
              Grid.Columns[1].Width   := 313
            else if qtde_colunas >= 7 then
              Grid.Columns[1].Width   := 240;
        end
        else  //Se for farmacia habilita o campo laboratorio
        begin
            if qtde_colunas <= 4 then
              Grid.Columns[1].Width   := 330
            else if qtde_colunas = 5 then
              Grid.Columns[1].Width   := 265
            else if (qtde_colunas >= 6) then
              Grid.Columns[1].Width   := 200;
        end;
    end
    else
       Grid.Columns[1].Width   := qryParamsPAR_ORC_PESQ_TAM_DESC.Value;// controlado manualmente

    //Verficando se a consulta vai pegar os produtos: Ativos, Inativos e Bens de Consumo
    TiposProd := '';
    //Produtos Ativos
    if qryParamsPAR_ORC_TIPO_ATIVO.Value = 'S' then
      TiposProd := '''A''';
    //Produtos Inativos
    if qryParamsPAR_ORC_TIPO_INATIVO.Value = 'S' then
      if TiposProd = '' then
        TiposProd := '''I'''
      else
        TiposProd := TiposProd + ', ''I''';
    //Produtos Bens de Consumo
    if BensConsumoEnabled or (qryParamsPAR_ORC_TIPO_BENSCONS.Value = 'S') then
      if TiposProd = '' then
        TiposProd := '''B'''
      else
        TiposProd := TiposProd + ', ''B''';

  if qryParamsPAR_MULTIEMP.Value <> 'N' then
    ModuloMultiEmpresa := LoadPackage('MultiEmpresa.bpl');
  //
end;

procedure Tfrm_PesqProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
     Close;
     Exit;
  end;

  if (Key = VK_F8) and (ModuloMultiEmpresa <> 0) then ShowEstoques;
end;

procedure Tfrm_PesqProduto.FormShow(Sender: TObject);
var
  Tipo : Integer;
begin
  inherited;

    qryParams.open;
    rgTipoBusca.Items.Clear;
    rgTipoBusca.Items.Add('&Descri��o ');
    rgTipoBusca.Items.Add('De&sc. Resumida');
    rgTipoBusca.Items.Add('&EAN ');
    rgTipoBusca.Items.Add('&Refer�ncia ');
    rgTipoBusca.Items.Add('C�digo &NCM ');

    if (qryParamspar_estabelecimento.Value = 'S') then
        rgTipoBusca.Items.Add('Cod. &Balan�a ');

    if (qryParamspar_produto_codfabric.Value = 'S') then
        rgTipoBusca.Items.Add('Cod. &Fabricante ');

       Tipo := 0;
       if qryParamsPAR_CONSPRODUTO.Value = 'D' then  //Descri��o Normal
          Tipo  := 0
       else if qryParamsPAR_CONSPRODUTO.Value = 'S' then //Descri��o Resumida
          Tipo  := 1
       else if qryParamsPAR_CONSPRODUTO.Value = 'E' then //EAN
          Tipo  := 2
       else if qryParamsPAR_CONSPRODUTO.Value = 'R' then //Referencia
          Tipo  := 3
       else if qryParamsPAR_CONSPRODUTO.Value = 'N' then //C�digo NCM
          Tipo  := 4
       else if qryParamsPAR_CONSPRODUTO.Value = 'C' then //C�digo de Balan�a
          Tipo  := 5
       else if qryParamsPAR_CONSPRODUTO.Value = 'F' then //C�digo do fabricante
          Tipo  := 6;

    //Se no parametros tiver marcado para padr�o cod Balanca porem cod balan�a tiver invisivel ele marca padr�o Descri��o
    if (qryParamspar_consproduto.Value = 'C') and not(qryParamspar_estabelecimento.Value = 'S') then
          Tipo := 0;

    //Se no parametros tiver marcado para padr�o cod Fabricante porem cod Fabricante tiver invisivel ele marca padr�o Descri��o
    if (qryParamspar_consproduto.Value = 'F') and not(qryParamspar_produto_codfabric.Value = 'S') then
          Tipo := 0;

    rgTipoBusca.ItemIndex := Tipo;
end;

function Tfrm_PesqProduto.GetFunction(const Module: HMODULE;
  const FuncName: PAnsiChar): Pointer;
begin
  Result := GetProcAddress(Module, FuncName);

  if not Assigned(Result) then
    raise Exception.Create('A fun��o remota ("' + FuncName + '") n�o foi encontrada.');
  //
end;

class function Tfrm_PesqProduto.GetCodResult(ACanvasType: TCanvasType = Default;
  HabilitaBensConsumo: Boolean = False): Integer;
begin
  BensConsumoEnabled := HabilitaBensConsumo;

  with Tfrm_PesqProduto.Create(nil) do
  try
    ValidateCanvasType(ACanvasType);
    //
    ShowModal;
    Result := Cod;
  finally
    Free;
  end;
end;

class function Tfrm_PesqProduto.GetRefResult(ACanvasType: TCanvasType = Default;
  HabilitaBensConsumo: Boolean = False): String;
begin
  BensConsumoEnabled := HabilitaBensConsumo;

  with Tfrm_PesqProduto.Create(nil) do
  try
    ValidateCanvasType(ACanvasType);
    //
    ShowModal;
    Result := Ref;
  finally
    Free;
  end;
end;

class function Tfrm_PesqProduto.GetRegistroMSResult(ACanvasType: TCanvasType = Default;
  HabilitaBensConsumo: Boolean = False): String;
begin
  BensConsumoEnabled := HabilitaBensConsumo;

  with Tfrm_PesqProduto.Create(nil) do
  try
    ValidateCanvasType(ACanvasType);
    //
    ShowModal;
    Result := RegMS;
  finally
    Free;
  end;
end;

procedure Tfrm_PesqProduto.ShowEstoques;
var
  NewPesqEstoques: function(ProId: integer): TForm;
  Frm: TForm;
begin
  if CDS.IsEmpty then Exit;

  @NewPesqEstoques := GetFunction(ModuloMultiEmpresa, 'NewPesqEstoques');

  Frm := NewPesqEstoques(CDSPRO_ID.Value);
  try
    Frm.ShowModal;
  finally
    Frm.Free;
  end;
end;

procedure Tfrm_PesqProduto.ValidateCanvasType(ACanvasType: TCanvasType);
begin
  if ACanvasType = Entrada then
    TiposProd := '''A'', ''B''';
end;

end.
