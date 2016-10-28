/// <summary>
///   Unit com as implementações para impressão de relatórios e orçamentos
///   utilizando o RDPrint. - Alan Thales 24/10/2014
/// </summary>
unit U_ImpVenda;

interface

uses Classes, RDprint, Generics.Collections, Variants;

type
  TFonte = RDprint.TFonte;
  TTipoFonte = RDprint.TTipoFonte;
  TModelo = RDprint.TModelo;
  TSize = RDprint.TSize;

  TColuna = class
  strict private
    FMargem: integer;
    FFim: integer;
    FMascara: string;
    FValor: variant;
    FDuplo: boolean;
    FFonte: TFonte;
    FCor: integer;
  public
    property Margem: integer read FMargem write FMargem;
    property Fim: integer read FFim write FFim;
    property Mascara: string read FMascara write FMascara;
    property Valor: variant read FValor write FValor;
    property Duplo: boolean read FDuplo write FDuplo;
    property Fonte: TFonte read FFonte write FFonte;
    property Cor: integer read FCor write FCor;

    constructor Create(AMargem: integer; AMascara: string; AValor: variant;
      AFonte: TFonte; ACor: integer = 0); overload;
    constructor Create(AMargem: integer; AValor: variant; AFonte: TFonte;
      ACor: integer = 0); overload;
    constructor Create(AMargem: integer; AValor: variant;
      ACor: integer = 0); overload;
    constructor Create(AInicio: integer; AFim: integer; ADuplo: boolean;
      ACor: integer = 0); overload;
  end;

  TLinha = class
  strict private
    FImpSozinha: Boolean;
    FColunas: TList<TColuna>;
  public
    property ImpSozinha: Boolean read FImpSozinha write FImpSozinha;
    property Colunas: TList<TColuna> read FColunas write FColunas;
    function Add(AColuna: TColuna): integer;
    constructor Create; overload;
    constructor Create(AImpSozinha: Boolean); overload;
    destructor Destroy; override;
  end;

  TBloco = class
  strict protected
    FLinhas: TList<TLinha>;
    function GetCount: integer;
  public
    property Linhas: TList<TLinha> read FLinhas write FLinhas;
    property Count: integer read GetCount;

    function AddLinha(ALinha: TLinha): integer; overload;
    function AddLinha(AColunas: array of TColuna;
      AImpSozinha: boolean = True): integer; overload;

    constructor Create;
    destructor Destroy; override;
  end;

  TNumPaginas = class
  strict private
    FImprime: boolean;
    FLinha: integer;
    FMargem: integer;
  public
    property Imprime: boolean read FImprime write FImprime;
    property Linha: integer read FLinha write FLinha;
    property Margem: integer read FMargem write FMargem;
  end;

  TImpVenda = class abstract
  const
    TOTAL_LINHAS = 32;
  strict private
    FTotalPag: SmallInt;
    FPagAtual: SmallInt;
    FLinha: SmallInt;
    FRel: TRDprint;
    FNumPaginas: TNumPaginas;
    FCabecalho: TBloco;
    FCabecalhoPosterior: TBloco;
    FRodape: TBloco;
    FTituloItens: TLinha;
    FItens: TBloco;
    FSomatorioItens: TBloco;
    FLinhaFixa: TLinha;
    FImpUltItemNaUltPag: Boolean;
    FTotalLinhas: integer;
    FImpCopia: Boolean;

    function CalculaPagina: integer; overload;
    function UltimaLinha: boolean;
    function ProximaLinhaSozinha(ItemAtual: integer): boolean;
    procedure ImprimirCabecalho(ACabecalho: TBloco);
    procedure ImprimirRodape;
    procedure ImpF(Linha, Coluna: integer; texto: string; Fonte: TFonte; Cor: integer = 0);
    procedure ImpVal(Linha, Coluna: integer; mascara: string; Valor: extended; Fonte: TFonte; Cor: integer = 0);
    procedure LinhaH(Linha, Inicio, Fim, Conexao: integer; Duplo: boolean; Cor: integer = 0);
  protected
    function TemMaisPagina: boolean; virtual;
    function PreencheCabecalho: TBloco; virtual; abstract;
    function PreencheCabecalhoPosterior: TBloco; virtual;
    function PreencheRodape: TBloco; virtual; abstract;
    function PreencheTituloItens: TLinha; virtual; abstract;
    function PreencheItens: TBloco; virtual; abstract;
    function PreencheSomatorioItens: TBloco; virtual; abstract;
    function PreencheLinhaFixa: TLinha; virtual; abstract;

    function CountLinhasFixas: integer;
    function CalculaPagina(const QtdeItens: integer): integer; overload;
    function CalculaLinhas(const PagAtual, PagFinal: integer): integer;
    procedure Imprimir;
    procedure ImprimirLinha(ALinha: TLinha);
    procedure ImprimirTituloItens; virtual;
    procedure Fechar;
  public
    constructor Create; overload;
    constructor Create(ImpCopia: Boolean); overload;
    constructor Create(AImpressora: TModelo; AQtdeColunas: integer;
      AFontePadrao: TSize; APreview: boolean; ANomeImpressora: string;
      TamanhoQteLinhas: Integer); overload;
    destructor Destroy; override;

    property NumPaginas: TNumPaginas read FNumPaginas write FNumPaginas;
    property Cabecalho: TBloco read FCabecalho;
    property CabecalhoPosterior: TBloco read FCabecalhoPosterior;
    property Rodape: TBloco read FRodape;
    property TituloItens: TLinha read FTituloItens;
    property Itens: TBloco read FItens;
    property SomatorioItens: TBloco read FSomatorioItens;
    property LinhaFixa: TLinha read FLinhaFixa;
    property ImpUltItemNaUltPag: Boolean read FImpUltItemNaUltPag
      write FImpUltItemNaUltPag;

    class function LinhaFixaVedadaAutenticacao: TLinha;
  end;

  TConstants = class
  public
    const
      MASK_CNPJ  = '!99\.999\.999\/9999\-99;0;_';
      MASK_CPF   = '!999.999.999-99;0;_';
      MASK_TEL   = '(99)9999-9999;0;';
      MASK_PLACA = '!lll\-9999;0;_';
  end;

implementation

uses Math, SysUtils, StrUtils;

{ TRelDav }

function TImpVenda.CalculaPagina(const QtdeItens: integer): integer;
var
  Resultado, TotalItens: double;
  i: integer;
begin
  Result := 1;
  TotalItens := QtdeItens / 2;
  TotalItens := IfThen(Frac(TotalItens) > 0, Trunc(TotalItens)+1, Trunc(TotalItens));
  repeat
    i := Result;
    Resultado := (CountLinhasFixas * i + Cabecalho.Count + Rodape.Count + TotalItens) / TOTAL_LINHAS;
    Result    := IfThen(Frac(Resultado) > 0, Trunc(Resultado)+1, Trunc(Resultado));
  until i = Result;
end;

function TImpVenda.CountLinhasFixas: integer;
const
  LINHAS_FIXAS = 3;
begin
  Result := LINHAS_FIXAS;
  if FLinhaFixa.Colunas.Count > 0 then
    Inc(Result);
  //
end;

constructor TImpVenda.Create(AImpressora: TModelo; AQtdeColunas: integer;
  AFontePadrao: TSize; APreview: boolean; ANomeImpressora: string;
  TamanhoQteLinhas: Integer);
begin
  Create(False);
  FRel.SetPrinterbyName(ANomeImpressora);
  FRel.Impressora := AImpressora;
  FRel.TamanhoQteColunas := AQtdeColunas;
  FRel.FonteTamanhoPadrao := AFontePadrao;
  FRel.MostrarProgresso := True;
  FRel.OpcoesPreview.Preview := APreview;
  FRel.TamanhoQteLinhas := TamanhoQteLinhas;
end;

constructor TImpVenda.Create;
begin
  Create(False);
end;

constructor TImpVenda.Create(ImpCopia: Boolean);
begin
  FNumPaginas         := TNumPaginas.Create;
  FCabecalho          := TBloco.Create;
  FCabecalhoPosterior := TBloco.Create;
  FRodape             := TBloco.Create;
  FTituloItens        := TLinha.Create;
  FItens              := TBloco.Create;
  FSomatorioItens     := TBloco.Create;
  FLinhaFixa          := TLinha.Create;
  FRel                := TRDprint.Create(nil);
  FTotalLinhas        := TOTAL_LINHAS + 5;
  FImpCopia           := ImpCopia;

  FNumPaginas.Imprime := True;
  FNumPaginas.Linha   := 6;
  FNumPaginas.Margem  := 138;
  FImpUltItemNaUltPag := True;

  FRel.FonteTamanhoPadrao := S20cpp;
  FRel.Abrir;

//  FRel.PortaComunicacao       := 'LPT1';
  FRel.TamanhoQteLinhas       := IfThen(FImpCopia, (TOTAL_LINHAS + 1) * 2, TOTAL_LINHAS + 1);
  FRel.TamanhoQteColunas      := 160;
  FRel.TamanhoQteLPP          := Seis;
  FRel.TitulodoRelatorio      := 'DAV';
  FRel.Acentuacao             := SemAcento;
  FRel.OpcoesPreview.BotaoLer := Inativo;
  FRel.OpcoesPreview.Preview  := True;
end;

function TImpVenda.CalculaPagina: integer;
var
  Resultado: double;
  i: integer;
begin
  Result := 1;
  repeat
    i := Result;
    Resultado := (CabecalhoPosterior.Count * (i-1) + CountLinhasFixas * i + Cabecalho.Count + Rodape.Count + Itens.Count + SomatorioItens.Count) / TOTAL_LINHAS;
    Result    := IfThen(Frac(Resultado) > 0, Trunc(Resultado)+1, Trunc(Resultado));
  until i = Result;
end;

destructor TImpVenda.Destroy;
begin
  FNumPaginas.Free;
  FRodape.Free;
  FTituloItens.Free;
  FItens.Free;
  FSomatorioItens.Free;
  FLinhaFixa.Free;
  FRel.Free;

  //Verificando se as duas variáveis apontam para o mesmo objeto.
  //Se sim não destroi o objeto somente para nil
  if FCabecalho = FCabecalhoPosterior then
    FCabecalhoPosterior := nil
  else
    FreeAndNil(FCabecalhoPosterior);

  FreeAndNil(FCabecalho);
  inherited;
end;

procedure TImpVenda.Fechar;
begin
  if FRel.EstaAberto then
    FRel.Fechar;
end;

procedure TImpVenda.ImprimirLinha(ALinha: TLinha);
var
  i: smallint;
  Col: TColuna;
begin
  for i := 0 to ALinha.Colunas.Count - 1 do
  begin
    Col := ALinha.Colunas[i];
    if Col.Mascara <> '' then
      ImpVal(FLinha, Col.Margem, Col.Mascara, Col.Valor, Col.Fonte, Col.Cor)
    else if VarIsNull(Col.Valor) then
      LinhaH(FLinha, Col.Margem, Col.Fim, 0, Col.Duplo, Col.Cor)
    else
      ImpF(FLinha, Col.Margem, Col.Valor, Col.Fonte, Col.Cor);
    //
  end;
end;

procedure TImpVenda.ImprimirRodape;
var
  i: integer;
begin
  // Imprime se for a última página.
  if FPagAtual = FTotalPag then
    with Rodape do
    for i := Count downto 1 do
    begin
      FLinha := TOTAL_LINHAS - i;
      ImprimirLinha(Linhas[i-1]);
    end;

  FLinha := TOTAL_LINHAS;
  ImprimirLinha(LinhaFixa);
end;

procedure TImpVenda.ImprimirTituloItens;
begin
  if TituloItens.Colunas.Count = 0 then
    raise Exception.Create('Preencha TituloItens');
  //

  { Condição adicionada para resolver problema nas impressoras não fiscais.
    Será necessário refatorar o código para atender esta condição. }
  if FRel.TamanhoQteColunas > 48 then
    LinhaH(FLinha, 1, FRel.TamanhoQteColunas, 0, False)
  else
    ImpF(FLinha, 1, StringOfChar('-', FRel.TamanhoQteColunas), []);
  //

  Inc(FLinha);

  ImprimirLinha(TituloItens);
  Inc(FLinha);

  if FRel.TamanhoQteColunas > 48 then
    LinhaH(FLinha, 1, FRel.TamanhoQteColunas, 0, False)
  else
    ImpF(FLinha, 1, StringOfChar('-', FRel.TamanhoQteColunas), []);
  //

  Inc(FLinha);
end;

procedure TImpVenda.ImpVal(Linha, Coluna: integer; mascara: string;
  Valor: extended; Fonte: TFonte; Cor: integer);
begin
  FRel.ImpVal(Linha, Coluna, mascara, Valor, Fonte, Cor);

  if FImpCopia then
    FRel.ImpVal(Linha + FTotalLinhas, Coluna, mascara, Valor, Fonte, Cor);
end;

class function TImpVenda.LinhaFixaVedadaAutenticacao: TLinha;
begin
  Result := TLinha.Create;
  Result.Add(
    TColuna.Create(56, 'É vedada a autenticação deste documento', [comp17])
  );
end;

procedure TImpVenda.LinhaH(Linha, Inicio, Fim, Conexao: integer; Duplo: boolean;
  Cor: integer);
begin
  FRel.LinhaH(Linha, Inicio, Fim, Conexao, Duplo, Cor);

  if FImpCopia then
    FRel.LinhaH(Linha + FTotalLinhas, Inicio, Fim, Conexao, Duplo, Cor);
end;

function TImpVenda.PreencheCabecalhoPosterior: TBloco;
begin
  //Por padrão os cabeçalhos posteriores serão idênticos ao cabeçalho da primeira página
  Result := FCabecalho;
end;

function TImpVenda.ProximaLinhaSozinha(ItemAtual: integer): boolean;
var
  i, j: integer;
begin
  j := 0;

  Result := False;

  if Itens.Linhas[ItemAtual + 1].ImpSozinha then
    Exit;
  //

  for i := (ItemAtual + 1) to Itens.Count - 1 do
    if not Itens.Linhas[i].ImpSozinha then
      Inc(j)
    else
      Break;
  //
  Result :=
    (FLinha + j > TOTAL_LINHAS - 1) or (j + ItemAtual = Itens.Count - 1);
end;

function TImpVenda.TemMaisPagina: boolean;
begin
  Result := FPagAtual <> FTotalPag;
end;

function TImpVenda.UltimaLinha: boolean;
begin
  Result := FLinha = TOTAL_LINHAS;
end;

procedure TImpVenda.ImpF(Linha, Coluna: integer; texto: string; Fonte: TFonte;
  Cor: integer);
begin
  FRel.ImpF(Linha, Coluna, texto, Fonte, Cor);

  if FImpCopia then
    FRel.ImpF(Linha + FTotalLinhas, Coluna, texto, Fonte, Cor);
end;

procedure TImpVenda.Imprimir;
var
  i: smallint;
begin
  FCabecalho          := PreencheCabecalho;
  FCabecalhoPosterior := PreencheCabecalhoPosterior;
  FRodape             := PreencheRodape;
  FTituloItens        := PreencheTituloItens;
  FLinhaFixa          := PreencheLinhaFixa;
  // Deixar por último...
  FItens              := PreencheItens;
  FSomatorioItens     := PreencheSomatorioItens;

  FPagAtual := 0;
  FTotalPag := CalculaPagina;

  if not FRel.EstaAberto then FRel.Abrir;

  try
    // Cabeçalho
    ImprimirCabecalho(FCabecalho);

    // Título das colunas
    ImprimirTituloItens;

    // Itens
    with Itens do
    for i := 0 to Count - 1 do
    begin
      // Verifica se vai necessitar de outra página para imprimir
      if Linhas[i].ImpSozinha and TemMaisPagina and
        (UltimaLinha or (FImpUltItemNaUltPag and
        ((Count - 1 = i) or ProximaLinhaSozinha(i)))) then
      begin
        ImprimirRodape;
        FRel.Novapagina;
        ImprimirCabecalho(FCabecalhoPosterior);
        ImprimirTituloItens;
      end;

      ImprimirLinha(Linhas[i]);
      Inc(FLinha);
    end;

    //Se não imprimir o último item na última página e tem mais página, então
    //inicia uma nova página
    if not FImpUltItemNaUltPag and TemMaisPagina then
    begin
      ImprimirRodape;
      FRel.Novapagina;
      ImprimirCabecalho(FCabecalhoPosterior);
      ImprimirTituloItens;
    end;

    // Somatório dos Itens
    with SomatorioItens do
    for i := 0 to Count - 1 do
    begin
      ImprimirLinha(Linhas[i]);
      Inc(FLinha);
    end;

    ImprimirRodape;
  finally
    FRel.Novapagina;
  end;
end;

procedure TImpVenda.ImprimirCabecalho(ACabecalho: TBloco);
var
  i: SmallInt;
begin
  Inc(FPagAtual);
  FLinha := 1;

  // Montando o Cabeçalho do Relatório
  with ACabecalho do
    for i := 0 to Count - 1 do
    begin
      ImprimirLinha(Linhas[i]);
      Inc(FLinha);
    end;

  // Se tem mais de uma pagina, imprime a página atual
  if NumPaginas.Imprime and (FTotalPag > 1) then
    ImpF(NumPaginas.Linha, NumPaginas.Margem, Format('Pag.: %d/%d', [FPagAtual, FTotalPag]), [comp17]);
  //
end;

{ TColuna }

constructor TColuna.Create(AMargem: integer; AMascara: string; AValor: variant;
  AFonte: TFonte; ACor: integer);
begin
  FMargem  := AMargem;
  FMascara := AMascara;
  FValor   := AValor;
  FFonte   := AFonte;
  FCor     := ACor;
end;

constructor TColuna.Create(AMargem: integer; AValor: variant; AFonte: TFonte;
  ACor: integer);
begin
  Create(AMargem, '', AValor, AFonte, ACor);
end;

constructor TColuna.Create(AMargem: integer; AValor: variant; ACor: integer);
begin
  Create(AMargem, '', AValor, [], ACor);
end;

constructor TColuna.Create(AInicio, AFim: integer; ADuplo: boolean;
  ACor: integer);
begin
  FMargem  := AInicio;
  FMascara := '';
  FValor   := Null;
  FFonte   := [];
  FCor     := ACor;
  FFim     := AFim;
  FDuplo   := ADuplo;
end;

{ TLinha }

function TLinha.Add(AColuna: TColuna): integer;
begin
  Result := Colunas.Add(AColuna);
end;

constructor TLinha.Create;
begin
  Create(True);
end;

constructor TLinha.Create(AImpSozinha: Boolean);
begin
  FImpSozinha := AImpSozinha;
  FColunas := TList<TColuna>.Create;
end;

destructor TLinha.Destroy;
begin
  FColunas.Free;
  inherited;
end;

{ TBloco }

function TBloco.AddLinha(ALinha: TLinha): integer;
begin
  Result := Linhas.Add(ALinha);
end;

function TBloco.AddLinha(AColunas: array of TColuna;
  AImpSozinha: boolean = True): integer;
var
  ALinha: TLinha;
  i: integer;
begin
  ALinha := TLinha.Create(AImpSozinha);

  for i := 0 to Length(AColunas) - 1 do
    ALinha.Add(AColunas[i]);

  Result := Linhas.Add(ALinha);
end;

constructor TBloco.Create;
begin
  FLinhas := TList<TLinha>.Create;
end;

destructor TBloco.Destroy;
begin
  FLinhas.Free;
  inherited;
end;

function TBloco.GetCount: integer;
begin
  Result := FLinhas.Count;
end;

function TImpVenda.CalculaLinhas(const PagAtual, PagFinal: integer): integer;
begin
  Result := TOTAL_LINHAS - (CountLinhasFixas + Cabecalho.Count + (IfThen(PagAtual = PagFinal, Rodape.Count, 0)));
end;

end.

