unit U_ImpDuplicata;

interface

uses
  Windows, Messages, Controls, SysUtils, DBClient, RDPrint,Forms;

  function ImpressaoDuplicata(VlrID:Integer; DTEmissao:TDateTime; Modulo:String='O';
                              TipImpMatricial:Boolean=True; CotaUnica:Boolean=True; FPreview:Boolean=True;
                              VlrEntrada:Double=0; VlrDesconto:Double=0; VlrTotal:Double=0;
                              EnderecoCobranca:Boolean=False): Boolean;

var
  percentual : extended;
  Impressao : TRDprint;

implementation

uses
  Math, U_DMRet, U_FuncUtils;

function ImpressaoDuplicata(VlrID:Integer; DTEmissao:TDateTime; Modulo:String='O';
                            TipImpMatricial:Boolean=True; CotaUnica:Boolean=True; FPreview:Boolean=True;
                            VlrEntrada:Double=0; VlrDesconto:Double=0; VlrTotal:Double=0;
                            EnderecoCobranca:Boolean=False): Boolean;
     {  *******  I M P O R T A N T E  *******

        Implementado por Rodrigo em 16/03/2011

      *** Valores aceitos para Modulo ***
        O = Orçamento de Vendas  (Contas a Receber Gerados a partir do orçamento de Vendas chave "ven_id" )
        S = SAIDA (Contas a receber Gerados a partir da Nota Fiscal de Saida chave "sai_id"
        V = Ordem de Serviço (Contas a Receber Gerados a partir da Ordem de Serviço chave "os_id" )
        R = Contas a Receber (Informando um Contas a receber especifico chave "rec_id" )

      *** Valores aceitos para CotaUnica  - "Definição do Tipo de Duplicata que será Impresso" ***
         TRUE = Será Impresso apenas "UMA" duplicata contendo todos os vencimentos relativo ao Modulo e ID fornecidos como parametros
        FALSE = Será Impresso varias duplicatas, uma para cada documento relativo ao Modulo e ID fornecidos como parametros
     }
Const
    {$REGION 'SQLs'}
    SQL_Duplicata = ' select  '+
                     '    CLI_ID, REC_ID, DOCUMENTO, DATAVENCIMENTO, VALORARECEBER '+
                     ' from '+
                     '    receber '+
                     ' where '+
                     '    %s = :id '+
                     ' order by '+
                     '    datavencimento ';

     SQL_Empresa = '  select '+
                   '     isnull(EMP_NOME,'''') as EMP_NOME, '+
                   '     isnull(EMP_FANTASIA,'''') as EMP_FANTASIA, '+
                   '     isnull(EMP_ENDERECO,'''') as EMP_ENDERECO, '+
                   '     isnull(EMP_BAIRRO,'''') as EMP_BAIRRO, '+
                   '     isnull(EMP_CIDADE,'''') as EMP_CIDADE, '+
                   '     isnull(EMP_ESTADO,'''') as EMP_ESTADO, '+
                   '     isnull(convert(varchar(10),EMP_CEP),'''') as EMP_CEP, '+
                   '     isnull(EMP_TELEFONE,'''') as EMP_TELEFONE, '+
                   '     isnull(EMP_CGC,'''') as EMP_CGC, '+
                   '     isnull(EMP_INSCRICAOESTADUAL,'''') as EMP_INSCRICAOESTADUAL, '+
                   '     isnull(convert(varchar(10),EMP_NUMERO),'''') as EMP_NUMERO, '+
                   '     isnull(EMP_MENSAGEMRODAPE,'''') as EMP_MENSAGEMRODAPE  '+
                   ' from '+
                   '    EMPRESAS ';

    SQL_Clientes = ' select '+
                   '     isnull(CLI_NOME,'''') as CLI_NOME, '+
                   '     isnull(CLI_CGC,'''') as CLI_CGC, '+
                   '     isnull(CLI_CPF,'''') as CLI_CPF, '+
                   '     isnull(CLI_INSCRICAO,'''') as CLI_INSCRICAO, '+
                   '     isnull(CLI_TELEFONE,'''') as CLI_TELEFONE, '+
                   '     isnull(CLI_ENDERECO,'''') as CLI_ENDERECO, '+
                   '     isnull(CLI_NUMERO,'''') as CLI_NUMERO, '+
                   '     isnull(CLI_BAIRRO,'''') as CLI_BAIRRO, '+
                   '     isnull(CLI_CEP,'''') as CLI_CEP, '+
                   '     isnull(CLI_CIDADE,'''') as CLI_CIDADE, '+
                   '     isnull(CLI_ESTADO,'''') as CLI_ESTADO, '+
                   '     isnull(CLI_ENDERECOCOBRANCA,'''') as CLI_ENDERECOCOBRANCA, '+
                   '     isnull(CLI_BAIRROCOBRANCA,'''') as CLI_BAIRROCOBRANCA, '+
                   '     isnull(CLI_CEPCOBRANCA,'''') as CLI_CEPCOBRANCA, '+
                   '     isnull(CLI_CIDADECOBRANCA,'''') as CLI_CIDADECOBRANCA, '+
                   '     isnull(CLI_ESTADOCOBRANCA,'''') as CLI_ESTADOCOBRANCA '+
                   ' from '+
                   '     CLIENTES '+
                   ' where '+
                   '     cli_id = :id ';
    {$ENDREGION}

    //Inicio das procedures utilizadas na emissão da duplicata
    {$REGION 'ImpCabecalho'}
    procedure ImpCabecalho(CodCli:Integer;DTEmissao:TDateTime);
    var
      Qry_Empresa, Qry_Cliente : TClientDataSet;
    begin
          //Buscando Dados da Empresa
          Qry_Empresa := TClientDataSet.Create(nil);
          Qry_Empresa.Data := DMRet.GetData(SQL_Empresa,[]);
          Qry_Empresa.Open;

          //Buscando Dados do Cliente
          Qry_Cliente := TClientDataSet.Create(nil);
          Qry_Cliente.Data := DMRet.GetData(SQL_Clientes,[CodCli]);
          Qry_Cliente.Open;

        try
          //imprime Topo
          Impressao.ImpF(02,03,Qry_Empresa.FieldByName('EMP_NOME').Value,[Expandido]);
          Impressao.imp(04,03,Qry_Empresa.FieldByName('EMP_ENDERECO').Value+ ', '+Qry_Empresa.FieldByName('EMP_NUMERO').Value+' - '+
                              Qry_Empresa.FieldByName('EMP_BAIRRO').Value+'  -  '+Qry_Empresa.FieldByName('EMP_CIDADE').Value+'-'+
                              Qry_Empresa.FieldByName('EMP_ESTADO').Value+'  CEP: '+Qry_Empresa.FieldByName('EMP_CEP').Value);
          Impressao.imp(05,03,'CNPJ: '+TFuncUtils.FormataCPFeCNPJ(Qry_Empresa.FieldByName('EMP_CGC').Value));
          Impressao.imp(05,30,'INSCRIÇÃO ESTADUAL: '+Qry_Empresa.FieldByName('EMP_INSCRICAOESTADUAL').Value);
          Impressao.imp(05,80,'DATA DE EMISSAO: '+FormatDateTime('dd/mm/yyyy',DTEmissao));
          //fim do Topo

          // Linhas
          Impressao.linhaH(01,01,Impressao.TamanhoQteColunas,1,false);
          Impressao.linhaH(06,01,Impressao.TamanhoQteColunas,3,false);
          Impressao.LinhaH(08,30,122,3,false);
          Impressao.LinhaH(10,30,122,3,false);
          Impressao.LinhaH(13,30,Impressao.TamanhoQteColunas,3,false);
          Impressao.LinhaH(20,30,Impressao.TamanhoQteColunas,3,false);
          Impressao.LinhaH(23,30,Impressao.TamanhoQteColunas,3,false);
          Impressao.LinhaH(26,30,Impressao.TamanhoQteColunas,3,false);
          Impressao.LinhaH(28,30,Impressao.TamanhoQteColunas,3,false);
          Impressao.linhaH(33,01,Impressao.TamanhoQteColunas,2,false);
          // fim das Linhas


          //Cantos
          Impressao.LinhaV(122,06,13,3,false);
          Impressao.LinhaV(28,09,30,0,false);
          Impressao.LinhaV(30,06,33,3,false);
          Impressao.LinhaV(Impressao.TamanhoQteColunas,01,33,2,false);
          Impressao.LinhaV(01,01,33,1,false);
          //fim de Cantos

          //Desconto de - Condicoes
          Impressao.imp(11,35,'Desconto de                Até');
          Impressao.imp(12,35,'Condições Especiais');

          //Dados do Cliente (Sacado)
          Impressao.imp(14,34,'NOME DO SACADO: '+Qry_Cliente.FieldByName('CLI_NOME').Value);
          if not (Qry_Cliente.FieldByName('CLI_CGC').Value = '') then
            Impressao.imp(19,44,'CNPJ: '+ copy(Qry_Cliente.FieldByName('CLI_CGC').Value,1,2)+'.'+copy(Qry_Cliente.FieldByName('CLI_CGC').Value,3,3)+'.'+copy(Qry_Cliente.FieldByName('CLI_CGC').Value,6,3)+'/'+copy(Qry_Cliente.FieldByName('CLI_CGC').Value,9,4)+'-'+copy(Qry_Cliente.FieldByName('CLI_CGC').Value,13,2))
          else
            Impressao.imp(19,44,' CPF: '+ copy(Qry_Cliente.FieldByName('CLI_CPF').Value,1,3)+'.'+copy(Qry_Cliente.FieldByName('CLI_CPF').Value,4,3)+'.'+copy(Qry_Cliente.FieldByName('CLI_CPF').Value,7,3)+'-'+copy(Qry_Cliente.FieldByName('CLI_CPF').Value,10,2));


          if EnderecoCobranca then
          Begin
              Impressao.imp(15,40,'ENDERECO: '+Qry_Cliente.FieldByName('CLI_ENDERECOCOBRANCA').Value);
              Impressao.imp(16,42,'BAIRRO: '+Qry_Cliente.FieldByName('CLI_BAIRROCOBRANCA').Value);
              Impressao.imp(16,102,'CEP: '+Qry_Cliente.FieldByName('CLI_CEPCOBRANCA').Value);
              Impressao.imp(17,42,'CIDADE: '+Qry_Cliente.FieldByName('CLI_CIDADECOBRANCA').Value);
              Impressao.imp(17,103,'UF: '+Qry_Cliente.FieldByName('CLI_ESTADOCOBRANCA').Value);
              Impressao.imp(18,33,'PRAÇA PAGAMENTO: '+Qry_Cliente.FieldByName('CLI_CIDADECOBRANCA').Value);
          End
          else
          Begin
              Impressao.imp(15,40,'ENDERECO: '+Qry_Cliente.FieldByName('CLI_ENDERECO').Value+', '+Qry_Cliente.FieldByName('CLI_NUMERO').Value);
              Impressao.imp(16,42,'BAIRRO: '+Qry_Cliente.FieldByName('CLI_BAIRRO').Value);
              Impressao.imp(16,102,'CEP: '+Qry_Cliente.FieldByName('CLI_CEP').Value);
              Impressao.imp(17,42,'CIDADE: '+Qry_Cliente.FieldByName('CLI_CIDADE').Value);
              Impressao.imp(17,103,'UF: '+Qry_Cliente.FieldByName('CLI_ESTADO').Value);
              Impressao.imp(18,33,'PRAÇA PAGAMENTO: '+Qry_Cliente.FieldByName('CLI_CIDADE').Value);
          End;


          Impressao.imp(19,91,'INSC. ESTADUAL: '+Qry_Cliente.FieldByName('CLI_INSCRICAO').Value);
          //fim dos Dados do Cliente (Sacado)

          //Criando cabecalho da Fatura
          Impressao.ImpF(7,05,'Assinatura do Emitente',[comp20]);
          Impressao.Imp(7,34,'FATURA');
          Impressao.LinhaV(49,06,10,3,false);
          Impressao.Imp(7,50,' FATURA/DUPL. VALOR R$');
          Impressao.LinhaV(89,06,10,3,false);
          Impressao.Imp(7,90,'  N. DE ORDEM');
          Impressao.LinhaV(107,06,10,3,false);
          Impressao.Imp(7,108,'  VENCIMENTO');
          Impressao.ImpF(7,125,'Para uso da Instituição Financeira',[comp20]);
          //fim do cabecalho da Fatura

          //Mensagem
          Impressao.Imp(24,35,'Reconheço(emos) a exatidão desta DUPLICATA DE VENDA MERCANTIL na importância acima que');
          Impressao.Imp(25,35,'pagarei a '+Qry_Empresa.FieldByName('EMP_NOME').Value+' ou à sua ordem na praça e vencimentos acima indicados');
          //Fim da Mensagem

        finally
            Qry_Empresa.Free;
            Qry_Cliente.Free;
        end;
      //
    end;
    {$ENDREGION}
    {$REGION 'ImpRodape'}
    procedure ImpRodape;
    begin
      Impressao.imp(31,45,'____/____/____');
      Impressao.imp(32,45,'Data do Aceite');
      Impressao.imp(31,105,'____________________________________');
      Impressao.imp(32,105,'        Assinatura do Sacado        ');
    end;
    {$ENDREGION}
    {$REGION 'ImpDuplicataUnica'}
    procedure ImpDuplicataUnica(CDS: TClientDataSet; VlrID:Integer; DTEmissao:TDateTime; VlrEntrada:Double=0; VlrDesconto:Double=0; VlrTotal:Double=0);
    var
      Lin, Col: Integer;
      Total: Double;
    begin
      ImpCabecalho(CDS.FieldByName('CLI_ID').Value, DTEmissao);

      Total := VlrTotal - VlrDesconto - VlrEntrada;

      Impressao.impval(9, 34, '00000#', VlrID,[]);
      Impressao.impval(9, 93, '00000#', VlrID,[]);
      Impressao.impval(9,61,'###,##0.00',Total,[negrito]);
      Impressao.Imp(21,35,'Valor por Extenso: '+ TFuncUtils.ValorExtenso(Total)+'.x.x.x.x.x.x.x');

      Lin := 26;
      Col := 32;

      while not CDS.Eof do
      begin
        if ((CDS.RecNo-1) mod 3) = 0 then
        begin
          Col := 35;
          Inc(Lin);
        end;

        Impressao.Imp(Lin,Col,'Vencimento: ' + DateToStr(CDS.FieldByName('DATAVENCIMENTO').Value)+' - Valor: '+formatfloat('#,##0.00',CDS.FieldByName('VALORARECEBER').Value));

        if CDS.RecNo = CDS.RecordCount then
        begin
          Impressao.imp(9,110,DateToStr(CDS.FieldByName('DATAVENCIMENTO').Value));
          Impressao.LinhaH(Lin+1,30,161,3,false);
        end;

        Col := Col + 40;
        CDS.Next;
      end;

      ImpRodape;
    end;
    {$ENDREGION}
    {$REGION 'ImpDuplicataVarias'}
    procedure ImpDuplicataVarias(CDS: TClientDataSet; DTEmissao:TDateTime);
    begin
      while not CDS.Eof do
      begin
        ImpCabecalho(CDS.FieldByName('CLI_ID').Value, DTEmissao);

        //Imprimindo os dados do cabecalho da Fatura
        Impressao.imp(9, 34, CDS.FieldByName('DOCUMENTO').Value);
        Impressao.imp(9, 90, CDS.FieldByName('DOCUMENTO').Value);
        Impressao.impval(9,61,'###,##0.00',CDS.FieldByName('VALORARECEBER').Value,[negrito]);
        Impressao.imp(9,110,DateToStr(CDS.FieldByName('DATAVENCIMENTO').Value));
        //FIM Imprimindo os dados do cabecalho da Fatura


        //Imprimindo o Valor Por extenso
        Impressao.Imp(21,35,'Valor por Extenso: '+TFuncUtils.ValorExtenso(CDS.FieldByName('VALORARECEBER').Value)+'.x.x.x.x.x.x.x');


        Impressao.Imp(27,35,'Vencimento: ' + datetostr(CDS.FieldByName('DATAVENCIMENTO').Value)+' - Valor: '+formatfloat('#,##0.00',CDS.FieldByName('VALORARECEBER').Value));

        ImpRodape;

        Impressao.Novapagina;
        CDS.Next;
      end;
    end;
    {$ENDREGION}
    //Final das procedures utilizadas na emissão da duplicata
var
   Qry_Duplicatas : TClientDataSet;
begin

result := False;

    Qry_Duplicatas := TClientDataSet.Create(nil);

    try
        if Modulo = 'S' then
           Qry_Duplicatas.Data := DMRet.GetData(Format(SQL_Duplicata, ['SAI_ID']), [VlrID]) //Nota fiscal de saida
        else if Modulo = 'V' then
           Qry_Duplicatas.Data := DMRet.GetData(Format(SQL_Duplicata, ['OS_ID']), [VlrID]) //Ordem de Serviço
        else if Modulo = 'R' then
           Qry_Duplicatas.Data := DMRet.GetData(Format(SQL_Duplicata, ['REC_ID']), [VlrID]) //Contas a Receber
        else
           Qry_Duplicatas.Data := DMRet.GetData(Format(SQL_Duplicata, ['VEN_ID']), [VlrID]);//Orçamento de Vendas
        Qry_Duplicatas.Open;

        if Qry_Duplicatas.IsEmpty then
        begin
           Application.MessageBox(pchar('Não há contas a receber para imprimir a(s) Duplicatas(s)!'),'ATENÇÃO!', MB_OK+MB_ICONINFORMATION);
        end
        else
        Begin
             try
                //Criando o componente rdprint
                Impressao := TRDprint.Create(Application);

                Impressao.FonteTamanhoPadrao     := s20cpp; // Fonte Comprimido em 20 cpp
                Impressao.TamanhoQteLinhas       := 33;
                Impressao.TamanhoQteColunas      := 160;
                Impressao.TamanhoQteLPP          := Seis;
                Impressao.TitulodoRelatorio      := 'Impressão de Duplicata';

                if TipImpMatricial then
                   Impressao.Impressora := Epson
                else
                   Impressao.Impressora := Grafico;

                Impressao.OpcoesPreview.Preview  := FPreview; //Se vai aparecer na tela ou não
                Impressao.Abrir;


                if CotaUnica then
                  ImpDuplicataUnica(Qry_Duplicatas, VlrID, DTEmissao, VlrEntrada, VlrDesconto, VlrTotal)
                else
                  ImpDuplicataVarias(Qry_Duplicatas, DTEmissao);


                  result := true;
             finally
                Impressao.Fechar;
                Impressao.Free;
             end;
           //
        end;
    finally
        Qry_Duplicatas.Free;
    end;
end;


end.
