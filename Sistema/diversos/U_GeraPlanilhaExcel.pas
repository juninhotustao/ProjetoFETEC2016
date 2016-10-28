unit U_GeraPlanilhaExcel;

interface

uses
  Windows, SysUtils, Forms, DB, ExcelXP, Graphics, Variants;

type
  TGeraPlanilhaExcel = class
    class procedure GeraXLS(QRY: TDataSet);
    class procedure GeraPedidoXLS(QRY: TDataSet);
    class procedure GeraPDA_XLS(QRY: TDataSet; SenhaExcel: string = '';
      PictureFullPath: string = '');
  end;

var
  Path, MaskFmt, FormFmt : String;
  Planilha : OleVariant;
  XLS      : TExcelApplication;

implementation

uses Math, OleServer, U_SystemEmpresa;

{ TGeraPlanilhaExcel }

class procedure TGeraPlanilhaExcel.GeraPDA_XLS(QRY: TDataSet;
  SenhaExcel: string = ''; PictureFullPath: string = '');
const
  SQL_PARAMS = 'select PAR_REL_PROD_DIR_PICTURE from PARAMS';
var
  ItemsRange: string;
  Lin, DepId: Integer;
  PictWidth, PictHeight, PictLeft: Currency;
begin
    if not QRY.Active then QRY.Open;

    if QRY.IsEmpty then
    begin
      Application.MessageBox('Não há Dados para opção selecionada.', 'ATENÇÃO!',
        MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

    // Instancia a Planilha.
  XLS := TExcelApplication.Create(nil);
  QRY.DisableControls;

  try
    XLS.AutoConnect := True;
    XLS.AutoQuit    := False;
    XLS.ConnectKind := ckNewInstance;

    XLS.Workbooks.Add(EmptyParam, 0);
    XLS.Visible[0] := True;

    // Utiliza pagina 1 e aba 1
    Planilha := XLS.Workbooks[1].Worksheets[1];

    //Tamanho do papel e Margem de impressão
    Planilha.PageSetup.PaperSize    := xlPaperLetter;
    Planilha.PageSetup.TopMargin    := XLS.Application.CentimetersToPoints(1.9, 0);
    Planilha.PageSetup.LeftMargin   := XLS.Application.CentimetersToPoints(0.6, 0);
    Planilha.PageSetup.BottomMargin := XLS.Application.CentimetersToPoints(1.9, 0);
    Planilha.PageSetup.RightMargin  := XLS.Application.CentimetersToPoints(0.6, 0);

    //configurações padrões para as colunas
    Planilha.Range['A:E'].Font.Name := 'Arial';
    Planilha.Range['A:E'].VerticalAlignment := Integer(xlVAlignCenter);
    Planilha.Range['A:E'].HorizontalAlignment := Integer(xlLeft);
    Planilha.Range['A:E'].Font.Size := 10;
    Planilha.Range['A:E'].RowHeight := 14;

    //Congelar Painéis
    Planilha.Application.ActiveWindow.SplitRow := 9;
    Planilha.Application.ActiveWindow.FreezePanes := True;

    Planilha.Columns[1].ColumnWidth := 7;
    Planilha.Columns[2].ColumnWidth := 73.14;
    Planilha.Columns[3].ColumnWidth := 14.43;
    Planilha.Columns[4].ColumnWidth := 6.86;
    Planilha.Columns[5].ColumnWidth := 15.43;

    Planilha.Range['A2:E8'].RowHeight       := 12;
    Planilha.Range['A2:E10'].Borders.Weight := 2;

    Planilha.Range['A2:A8'].Font.Name := 'Arial';
    Planilha.Range['A2:A8'].Font.Size := 9;
    Planilha.Range['A2:A8'].Font.Bold := True;
    Planilha.Range['A2:A8'].Font.color := clWhite;
    Planilha.Range['A2:A8'].Interior.color := clGreen;

    Planilha.Range['C2:C8'].Font.Name := 'Arial';
    Planilha.Range['C2:C8'].Font.Size := 9;
    Planilha.Range['C2:C8'].Font.Bold := True;
    Planilha.Range['C2:C8'].Font.color := clWhite;
    Planilha.Range['C2:C8'].Interior.color := clGreen;

    Planilha.Range['C2:C3'].Mergecells := True;
    Planilha.Range['C2:C3'].Font.Size  := 20;
    Planilha.Range['C2:C3'].HorizontalAlignment := Integer(xlCenter);
    Planilha.Range['C2:C3'].Value      := 'Pedido:';

    Planilha.Range['D2:E3'].Mergecells := True;
    Planilha.Range['D2:E3'].Font.Size := 28;
    Planilha.Range['D2:E3'].HorizontalAlignment := Integer(xlCenter);
    Planilha.Range['D2:E3'].Font.Bold := True;
    Planilha.Range['D2:E3'].Font.color := clRed;

    Planilha.Range['D4:E4'].Mergecells := True;
    Planilha.Range['D5:E5'].Mergecells := True;
    Planilha.Range['D6:E6'].Mergecells := True;
    Planilha.Range['D7:E7'].Mergecells := True;
    Planilha.Range['D8:E8'].Mergecells := True;

    Planilha.Range['B2:B8'].Font.Size := 9;
    Planilha.Range['D4:E8'].HorizontalAlignment := Integer(xlCenter);

    Planilha.Cells[2,1].Value          := 'Razão:';
    Planilha.Cells[3,1].Value          := 'Fantasia:';
    Planilha.Cells[4,1].Value          := 'CNPJ:';
    Planilha.Cells[5,1].Value          := 'I.E.:';
    Planilha.Cells[4,3].Value          := 'Data:';
    Planilha.Cells[6,1].Value          := 'Email:';
    Planilha.Cells[5,3].Value          := 'Estado/Cidade:';
    Planilha.Cells[7,1].Value          := 'Skype:';
    Planilha.Cells[6,3].Value          := 'Fone com DDD:';
    Planilha.Cells[7,3].Value          := 'Responsável:';
    Planilha.Cells[8,1].Value          := 'Obs.:';
    Planilha.Cells[8,3].Value          := 'Vendedor:';

    Planilha.Rows[9].RowHeight := 0;

    Planilha.Rows[10].HorizontalAlignment := Integer(xlCenter);
    Planilha.Rows[10].Interior.Color := clWhite; // Cor da Celula
    Planilha.Rows[10].Font.Color     := clGreen; // Cor da fonte
    Planilha.Rows[10].Font.Bold      := True;

    Planilha.Cells[10,2].HorizontalAlignment := Integer(xlLeft);

    Planilha.Cells[10,1].Value          := 'Cód';
    Planilha.Cells[10,2].Value          := 'Produto';
    Planilha.Cells[10,3].Value          := 'Valor';
    Planilha.Cells[10,4].Value          := 'Qtde';
    Planilha.Cells[10,5].Value          := 'Total';

    Planilha.Range['B2:B8'].Locked := False;
    Planilha.Range['D2:E8'].Locked := False;

    // Inicializa na segunda linha
    Lin   := 11;
    DepId := -1;

    // Repetição onde vai inserir os dados da tabela até que seja final de arquivo
    while not (QRY.Eof ) do
    begin
      if DepId <> QRY.Fields[0].AsInteger then
      begin
        ItemsRange := Format('A%d:E%0:d', [Lin]);
        Planilha.Range[ItemsRange].Mergecells          := True;
        Planilha.Range[ItemsRange].Borders.Weight      := 2;
        Planilha.Range[ItemsRange].Font.Size           := 11;
        Planilha.Range[ItemsRange].Font.Bold           := True;
        Planilha.Range[ItemsRange].VerticalAlignment   := Integer(xlVAlignBottom);
        Planilha.Range[ItemsRange].HorizontalAlignment := Integer(xlCenter);
        Planilha.Range[ItemsRange].Interior.Color      := clGreen; // Cor da Celula
        Planilha.Range[ItemsRange].Font.Color          := clWhite; // Cor da fonte
        Planilha.Range[ItemsRange].Value               := QRY.Fields[1].AsString;
        DepId := QRY.Fields[0].AsInteger;
        Inc(Lin);
      end;

      ItemsRange := Format('A%d:E%0:d', [Lin]);
      Planilha.Range[ItemsRange].Borders.Weight := 2;

      //Referência
      Planilha.Cells[Lin,1].NumberFormat := AnsiChar('@');
      Planilha.Cells[Lin,1].HorizontalAlignment := Integer(xlCenter);
      Planilha.Cells[Lin,1].Value := (QRY.Fields[2].AsString);

      //Descrição do Produto
      Planilha.Cells[Lin,2].Value := (QRY.Fields[3].AsString);

      //Valor Unitário do Produto
      Planilha.Cells[Lin,3].NumberFormat:= '_(R$ * #.##0,00_)';
      Planilha.Cells[Lin,3].Value := (QRY.Fields[4].AsFloat);

      //Qtde
      Planilha.Cells[Lin,4].NumberFormat:= 'Geral';
      Planilha.Cells[Lin,4].HorizontalAlignment := Integer(xlCenter);
      Planilha.Cells[Lin,4].Locked := False;

      //Valor Total do Produto
      Planilha.Cells[Lin,5].NumberFormat:= '_(R$ * #.##0,00_);_(R$ * (#.##0,00);_(R$ * "-"??_);_(@_)';
      Planilha.Cells[Lin,5].Formula := ('=C'+IntToStr(lin)+'*D'+IntToStr(lin));

      // Adiciona 1 a variável Lin e vai para o próximo registro da tabela
      Inc(Lin);
      QRY.Next;
    end;

    //Totalizador
    ItemsRange := Format('%d:%d', [Lin, Lin+1]);
    Planilha.Rows[ItemsRange].RowHeight      := 20;
    Planilha.Rows[ItemsRange].Interior.Color := clGreen; // Cor da Celula
    Planilha.Rows[ItemsRange].Font.Color     := clWhite; // Cor da fonte

    ItemsRange := Format('B%d:C%d', [Lin, Lin+1]);
    Planilha.Range[ItemsRange].Mergecells          := True;
    Planilha.Range[ItemsRange].HorizontalAlignment := Integer(xlRight);
    Planilha.Range[ItemsRange].Font.Bold           := True;
    Planilha.Range[ItemsRange].Value               := 'TOTAL DO PEDIDO';

    ItemsRange := Format('D%d:E%d', [Lin, Lin+1]);
    Planilha.Range[ItemsRange].Mergecells          := True;
    Planilha.Range[ItemsRange].HorizontalAlignment := Integer(xlRight);
    Planilha.Range[ItemsRange].Font.Bold           := True;
    Planilha.Range[ItemsRange].Font.size           := 17;
    Planilha.Range[ItemsRange].NumberFormat        := '"R$ "#.##0,00';
    Planilha.Range[ItemsRange].formula             := ('=SUM(E11:E'+IntToStr(lin-1));

    Planilha.Rows[Lin+2].Interior.Color   := clGreen;
    Planilha.Cells[Lin+2,5].FormulaHidden := True;
    Planilha.Cells[Lin+2,5].value         := AnsiChar(' ');
    Planilha.Rows[Lin+2].RowHeight        := 1;

    //Visualização por quebra de página
    XLS.Windows[1].View := xlPageBreakPreview;
    //Removendo quebra de página na vertical que é colocada automaticamente
    Planilha.VPageBreaks[1].DragOff(xlToRight, 1);
    //Dando um Zomm de 100%
    XLS.Windows[1].Zoom := 100;

    //Inserindo a imagem no cabeçalho
    if FileExists(PictureFullPath) then
      with TPicture.Create do
      try
        LoadFromFile(PictureFullPath);

        //Largura máxima que a imagem pode ter
        PictWidth := 843;
        if Width < 843 then
          PictWidth := Width;

        //Altura máxima que a imagem pode ter
        PictHeight := 541;
        if Height < 541 then
          PictHeight := Height;

        //Cálculo para tentar centralizar a imagem
        PictLeft := (421.5 - PictWidth / 2) * 3 / 4;

        //Transformado a largura da imagem de pixel em pontos
        PictWidth := PictWidth * 3 / 4;

        //Transformado a altura da imagem de pixel em pontos
        PictHeight := PictHeight * 3 / 4;

        //Somou +3 para a linha ficar maior que a imagem
        Planilha.Rows[1].RowHeight := PictHeight + 3;
        Planilha.Range['A1:E1'].Mergecells := True;
        Planilha.Shapes.AddPicture(PictureFullPath, 0, 1, PictLeft, 0, PictWidth, PictHeight);
      finally
        Free;
      end;

    Planilha.Protect(senhaExcel);
    //
  finally
    QRY.EnableControls;
    XLS.Free;
  end;
end;

{ Gera uma planilha do Excel de acordo com uma Query ou DataSet passado.
  O Componente devera estar com os campos configurados. Propriedades dos campos usadas:
  - Visible: se o campo vai ou não aparecer na planilha;
  - DisplayLabel: Título da coluna;
  - DisplayFormat: Formato da célula;
  - DisplayWidth: Largura da coluna;
  - Alignment: Alinhamento da célula. (Direita, Esquera ou ao Centro) }
class procedure TGeraPlanilhaExcel.GeraPedidoXLS(QRY: TDataSet);
var
  Lin, Col, i: Integer;
begin
  if not QRY.Active then QRY.Open;

  if QRY.IsEmpty then
  begin
    Application.MessageBox('Não há Dados para opção selecionada.', 'ATENÇÃO!',
      MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  // Instancia a Planilha.
  XLS := TExcelApplication.Create(nil);
  QRY.DisableControls;

  try
    XLS.AutoConnect := True;
    XLS.AutoQuit    := False;
    XLS.ConnectKind := ckNewInstance;

    XLS.Workbooks.Add(EmptyParam, 0);
    XLS.Visible[0] := True;


    // Utiliza pagina 1 e aba 1
    Planilha := XLS.Workbooks[1].Worksheets[1];

    // Caminho da aplicação.
    Path := ExtractFileDir(Application.ExeName);

    // Logotipo da Empresa.
    if FileExists(Path + 'logo.jpg') then
    begin
      Planilha.Rows[1].RowHeight := 66;
      Planilha.Shapes.AddPicture(Path + 'logo.jpg', 0, 1, 1, 1, 545, 65);//555
    end;

    // Configurando os parametros iniciais
    Lin := 1;
    Col := 2;

    // Repetição de cabeçalho o Delphi vai colocar o nome do campo em
    // cada coluna, se for ADOQuery pode dar um apelido para cada campo
    Planilha.Cells[Lin,Col].Font.Size :=16;
    Planilha.Cells[Lin,Col].Font.Bold := True;
    Planilha.Cells[Lin,Col].Value     := TEmpresa.NomeFantasia;

    // Passa para proxima Linha.
    Inc(Lin);

    Planilha.Cells[Lin,Col].Font.Name :='Verdana';
    Planilha.Cells[Lin,Col].Font.Size :=11;
    Planilha.Cells[Lin,Col].Font.Bold := True;
    Planilha.Cells[Lin,Col].Value     := TEmpresa.Endereco +', Nº '+ TEmpresa.Numero + ' - ' + TEmpresa.Bairro;



    // Passa para proxima Linha.
    Inc(Lin);

    Planilha.Cells[Lin,Col].Font.Name :='Verdana';
    Planilha.Cells[Lin,Col].Font.Size :=11;
    Planilha.Cells[Lin,Col].Font.Bold := True;
    Planilha.Cells[Lin,Col].Value     := TEmpresa.Cidade +' - '+  TEmpresa.UF + ' CEP ' + TEmpresa.Cep;

    // Passa para proxima Linha.
    Inc(Lin);

    Planilha.Cells[Lin,Col].Font.Name :='Verdana';
    Planilha.Cells[Lin,Col].Font.Size :=11;
    Planilha.Cells[Lin,Col].Font.Bold := True;
    Planilha.Cells[Lin,Col].Value     := 'TEL.: ' +  TEmpresa.Telefone;

    // Passa para proxima Linha.
    Inc(Lin);

    Planilha.Cells[Lin,Col].Font.Name  :='Verdana';
    Planilha.Cells[Lin,Col].Font.Size  :=11;
    Planilha.Cells[Lin,Col].Font.Bold  := True;
    Planilha.Cells[Lin,Col].Value      := 'e-mail: ' + LowerCase(TEmpresa.Email);

    // Passa para proxima Linha.
    Lin := (lin +2);
    Col := 1;

    Planilha.Cells[Lin,Col].Font.Size :=12;
    Planilha.Cells[Lin,Col].Font.Bold := True;
    Planilha.Cells[Lin,Col].Value     := 'Nº PEDIDO: ' +  IntToStr(QRY.FieldByName('PED_NUMERO').Value);

    // Passa para proxima Linha.
    Lin := (lin +2);

    // Configura os Titulos e Tamanhos das colunas.
    Col := 1;
    for i := 0 to QRY.FieldCount - 1 do
    begin
      if not QRY.Fields[i].Visible then Continue;

      Planilha.Cells[Lin,Col].Select;
      Planilha.Cells[Lin,Col].Font.Bold      := True;
      Planilha.Cells[Lin,Col].Value          := QRY.Fields[i].DisplayLabel;
      Planilha.Cells[Lin,Col].ColumnWidth    := IfThen(QRY.Fields[i].DisplayWidth > 255, 255, QRY.Fields[i].DisplayWidth);
      Planilha.Cells[Lin,Col].Borders.Weight := 3;
//      Planilha.Cells[Lin,Col].Borders.Weight := $FFFFEFD6; ** Erro no XE7

      Inc(Col);
    end;

    // Passa para proxima Linha.
    Inc(Lin);
    QRY.First;

    // Inicia a inserção dos Dados.
    // Configura os Formatos e alinhamentos de cada campo do DataSet.
    while not QRY.Eof do
    begin
      Col := 1;
      for i := 0 to QRY.FieldCount - 1 do
      begin
        // Verifica se o campo vai aparecer.
        if not QRY.Fields[i].Visible then Continue;

        Planilha.Cells[Lin,Col].Select;
        Planilha.Cells[Lin,Col].Borders.Weight := 2;

        case Ord(QRY.Fields[i].Alignment) of
          0: Planilha.Cells[Lin,Col].HorizontalAlignment := 2;  // Centro
          1: Planilha.Cells[Lin,Col].HorizontalAlignment := 4;  // Esquerda
          2: Planilha.Cells[Lin,Col].HorizontalAlignment := 3;  // Direita
        end;

        if (QRY.Fields[i] is TFMTBCDField) or (QRY.Fields[i] is TBCDField) or (QRY.Fields[i] is TFloatField) then
        begin
          MaskFmt := StringReplace(TNumericField(QRY.Fields[i]).DisplayFormat, '.', ',', [rfReplaceAll]);
          Planilha.Cells[Lin,Col].Value := QRY.Fields[i].AsFloat;
          Planilha.Cells[Lin,Col].NumberFormat := StringReplace(MaskFmt, ',', '.', []);
        end
        else if QRY.Fields[i] is TDateTimeField then
        begin
          Planilha.Cells[Lin,Col].Value := QRY.Fields[i].AsDateTime;
        end else
        begin
          Planilha.Cells[Lin,Col].NumberFormat := '@_)';
          Planilha.Cells[Lin,Col].Value        := QRY.Fields[i].AsString;
        end;

        Inc(Col);
      end;

      // Passa para Proxima Linha.
      Inc(Lin);
      QRY.Next;
    end;
  finally
    QRY.EnableControls;
    XLS.Free;
  end;
  //
end;

{ Gera uma planilha do Excel de acordo com uma Query ou DataSet passado.
  O Componente devera estar com os campos configurados. Propriedades dos campos usadas:
  - Visible: se o campo vai ou não aparecer na planilha;
  - DisplayLabel: Título da coluna;
  - DisplayFormat: Formato da célula;
  - DisplayWidth: Largura da coluna;
  - Alignment: Alinhamento da célula. (Direita, Esquera ou ao Centro) }
class procedure TGeraPlanilhaExcel.GeraXLS(QRY: TDataSet);
var
  Lin, Col, i: Integer;
begin
  if not QRY.Active then QRY.Open;

  if QRY.IsEmpty then
  begin
    Application.MessageBox('Não há Dados para opção selecionada.', 'ATENÇÃO!',
      MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  // Instancia a Planilha.
  XLS := TExcelApplication.Create(nil);
  QRY.DisableControls;

  try
    XLS.AutoConnect := True;
    XLS.AutoQuit    := False;
    XLS.ConnectKind := ckNewInstance;

    XLS.Workbooks.Add(EmptyParam, 0);
    XLS.Visible[0] := True;

    // Utiliza pagina 1 e aba 1
    Planilha := XLS.Workbooks[1].Worksheets[1];

    // Caminho da aplicação.
    Path := ExtractFileDir(Application.ExeName);

    // Logotipo da Empresa.
    if FileExists(Path + 'logo.jpg') then
    begin
      Planilha.Rows[1].RowHeight := 66;
      Planilha.Shapes.AddPicture(Path + 'logo.jpg', 0, 1, 1, 1, 545, 65);//555
    end;

    // Inicia na Segunda Linha.
    Lin := 2;

    // Configura os Titulos e Tamanhos das colunas.
    Col := 1;
    for i := 0 to QRY.FieldCount - 1 do
    begin
      if not QRY.Fields[i].Visible then Continue;

      Planilha.Cells[Lin,Col].Select;
      Planilha.Cells[Lin,Col].Font.Bold   := True;
      Planilha.Cells[Lin,Col].Value       := QRY.Fields[i].DisplayLabel;
      Planilha.Cells[Lin,Col].ColumnWidth := IfThen(QRY.Fields[i].DisplayWidth > 255, 255, QRY.Fields[i].DisplayWidth);

      Inc(Col);
    end;

    // Passa para proxima Linha.
    Inc(Lin);
    QRY.First;

    // Inicia a inserção dos Dados.
    // Configura os Formatos e alinhamentos de cada campo do DataSet.
    while not QRY.Eof do
    begin
      Col := 1;

      for i := 0 to QRY.FieldCount - 1 do
      begin
        // Verifica se o campo vai aparecer.
        if not QRY.Fields[i].Visible then Continue;

        Planilha.Cells[Lin,Col].Select;

        case Ord(QRY.Fields[i].Alignment) of
          0: Planilha.Cells[Lin,Col].HorizontalAlignment := 2; // Centro
          1: Planilha.Cells[Lin,Col].HorizontalAlignment := 4; // Esquerda
          2: Planilha.Cells[Lin,Col].HorizontalAlignment := 3; // Direita
        end;

        if (QRY.Fields[i] is TFMTBCDField) or (QRY.Fields[i] is TBCDField) or (QRY.Fields[i] is TFloatField) then
        begin
          MaskFmt := StringReplace(TNumericField(QRY.Fields[i]).DisplayFormat, '.', ',', [rfReplaceAll]);
          Planilha.Cells[Lin,Col].NumberFormat := StringReplace(MaskFmt, ',', '.', []);
          Planilha.Cells[Lin,Col].Value        := QRY.Fields[i].AsFloat;
        end
        else if QRY.Fields[i] is TDateTimeField then
        begin
          if not QRY.Fields[i].IsNull then
            Planilha.Cells[Lin,Col].Value := QRY.Fields[i].AsDateTime
          else
            Planilha.Cells[Lin,Col].Value := '';
        end else
        begin
          Planilha.Cells[Lin,Col].NumberFormat := '@_)';
          Planilha.Cells[Lin,Col].Value        := QRY.Fields[i].AsString;
        end;

        Inc(Col);
      end;

      // Passa para Proxima Linha.
      Inc(Lin);
      QRY.Next;
    end;
  finally
    QRY.EnableControls;
    XLS.Free;
  end;
end;

end.
