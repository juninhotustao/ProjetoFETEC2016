unit U_FuncUtils;

interface

uses
  SysUtils, Windows, DB, DBCtrls, Classes, Forms, SHELLAPI, Tlhelp32, Controls;

type
  TFloatParts = record
    Int: Int64;
    Frac: Extended;
  end;

  TCtrlTypes = (ctPageControl, ctTPanel, ctLabel, ctTDBText);
  TCtrlTypesSet = set of TCtrlTypes;

  TFuncUtils = class
  public
    class procedure CriaForm(FrmClasse: TFormClass; var Frm); overload;
    class procedure CriaForm(const AModuleName, AClassName: string); overload;
    class procedure CriaFormModal(Frm: TFormClass);
    class procedure DeleteDir(hHandle: THandle; Const sPath: String);
    class procedure DeleteArquivos(diretorio: string);
    class procedure VerificaDbEditNegativo(Field: TField);
    class procedure Split(const Delimitador: Char; Texto: String; Retorno: TStrings); overload;
    class procedure limpa_campos(form: TForm);
    class procedure CloseComponents(form: TForm);
    class procedure DesabilitarGhostingDoWindows;
    class procedure FocusControl(const AForm: TForm; const AField: TField);
    class procedure ChangeMaskPhone(AEdits: array of TDBEdit); overload;

    class function Split(const Delimitador: Char; const Texto: string) : TStrings; overload;
    class function KillTask(ExeFileName: string): Integer; static;
    class function PrgRodando(Executavel: WideString): Boolean; static;
    class function GetFileDate(AFile: String): TDateTime;
    class function CGC_Valido(sValue: string): Boolean; static;
    class function CPF_Valido(sValue: string): Boolean; static;
    class function EAN_Valido(sVlr: string): Boolean; static;
    class function DiretorioVazio(diretorio: string): Boolean;
    class function IsNumeric(Valor: string): Boolean;
    class function RetiraCaracteres(str: string): string;
    class function RetiraCaracteresAcentuacao(str: string): string;
    class function RetiraCaracteresCPF_CGC(str: string): string;
    class function RetiraCaracEspeciaisXml(str: string): string;
    class function FormataCPFeCNPJ(fDoc: String): String;
    class function ValidaCPFeCNPJ(sValue: String): Boolean;
    class function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;

    class function TextoAlinha(Alinha: Char; tamTexto : integer; Texto : String;
                               TextoPrePos : string = '' ; Caracter : Char = ' '): String;

  const
    meses: array [0 .. 11] of PChar = ('Janeiro', 'Fevereiro', 'Mar�o',
      'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro',
      'Novembro', 'Dezembro');

    class function DiasPorMes(Ayear, AMonth: Integer): Integer;
    class function ValorExtenso(Valor: Double): String;
    class function NumeroExtenso(N: LongWord): String;
    class function dataextenso(data: Tdate): string;
    class function MesExtenso(Mes: Word): string;
    class function RemoveExt(pStrValue: string): string;
    class function PasswordInputBox(const ACaption, APrompt: string): string; overload;
    class function PasswordInputBox(const ACaption, APrompt, APrompt2: string) : string; overload;
    class function PasswordInputBox(const ACaption, APrompt: string; const AColor, ACoeficWidth: Integer): string; overload;
    class function Truncar(AValor: Double; ACasas: shortint): Double;
    class function Arredondar(Valor: Extended): Int64; overload;
    class function Arredondar(AValor: Double; ACasas: shortint): Double; overload;
    class function Crypto(NumParaCriptografar: string): string;
    class function DeCrypto(NumCriptografado: string): string;
    class function Replicate(pString: String; xWidth: Integer): String;
    class function PadL(InStr: string; TotalLen: Integer): string;
    class function PadR(InStr: string; TotalLen: Integer): string;
    class function Formatar(Texto: string; TamanhoDesejado: Integer;
      AcrescentarADireita: Boolean = true; CaracterAcrescentar: Char = ' ')
      : string;
    class function AgruparTXT(ArquivoSimples, ArquivoAgrupado: String;
      MantenArqSimples: Boolean): Boolean;
    class function NumericToSting(Valor: Extended; CasasDecimais: Integer)
      : AnsiString;
    class function ConvertStringForExtended(Valor: string;
      QtdeCadasDecimais: Integer): Extended;
    class function IfThen(AValue: Boolean; const ATrue: variant;
      const AFalse: variant): variant;
    class function GeraMD5(AFile: String): String;
    class function InsereCuringa(const Texto: string; const Tamanho: Integer;
      const Caracter: Char = '?'): string;
    class function CalculaBaseCalcIcmsSubst
      (vlrItem, ipi, reducaoSubst, mva: Extended;
      VlrRateioOutras: array of Extended): Extended;
    class function CalculaVlrIcmsSubst(BaseCalcIcmsSubst, aliqDest,
      VlrIcms: Extended): Extended;
    class function ValidNumericField(ANumericField: TNumericField): Boolean;
    class function GetFunction(const Module: HMODULE; const FuncName: PAnsiChar)
      : Pointer;
    class function ValidRequiredFields(ADataset: TDataSet): Boolean;
    class function GetNivelPlanodeContas(strCodigo: String): Integer;
    class function MaskedInputBox(const ACaption, APrompt, ADefault: string)
      : string;
    class function StrToEnumerado(var ok: Boolean; const s: string;
      const AString: array of string; const AEnumerados: array of variant)
      : variant;
    class function GetFirstDayOfADate(ADate: TDateTime): TDateTime;
    class function ValidarChaveNFe(const ChaveNFe: string): Boolean;
    class function GetSituacaoNota(Flag: String): String;
    class function GetSituacaoCTE(Flag: String): String;
    class function GetSituacaoNFE(Flag: String): String;
    class function RightPad(s: string; Ch: Char; Len: Integer): string;

    class procedure DisablePanelControls(const AControl: TControl; const ABool: Boolean;
      AIgnoreCtrls: TCtrlTypesSet = [ctPageControl, ctTPanel, ctLabel, ctTDBText]);
    class function RecalculaQtde(VlrUnit, VlrTotal: Double): Double;
    class function FileInUse(const AFileName: string): Boolean;
    class function ArrayJoin(const AArray: array of integer;
      const ADelimitador: string): string;
    class function StrSetInString(const AString: string;
      const AStrSet: array of string): Boolean;
    class function SliceValue(const AValue: Extended): TFloatParts;
    class function GetPhoneMask: string; overload;
    class function GetPhoneMask(APhone: string): string; overload;
  end;

implementation

uses
  Dialogs, Variants, StdCtrls, Types, Graphics, Math, Mask, ComCtrls, ExtCtrls,
  TypInfo, IdHashMessageDigest;

const
  ChavedeCriptografia = '@#$%*#@#$%*#@$$@#$%*@#$%*#@#$%*#@$$@#$%*';

  { TFuncUtils }

class function TFuncUtils.AgruparTXT(ArquivoSimples, ArquivoAgrupado: String;
  MantenArqSimples: Boolean): Boolean;
var
  sArquivo1, sArquivo2: TStringList;
Begin
  Result := False;

  // Verifica se o Arquivo temporario ja existe
  if FileExists(ArquivoAgrupado) then
  begin
    // Verifica se o Arquivo da Mestre existe
    if FileExists(ArquivoSimples) then
    Begin
      sArquivo1 := TStringList.Create;
      sArquivo2 := TStringList.Create;
      sArquivo1.LoadFromFile(ArquivoAgrupado);
      sArquivo2.LoadFromFile(ArquivoSimples);
      DeleteFile(PChar(ArquivoAgrupado));
      DeleteFile(PChar(ArquivoSimples));
      sArquivo1.AddStrings(sArquivo2);
      sArquivo1.SaveToFile(ArquivoAgrupado);

      if MantenArqSimples then
        sArquivo2.SaveToFile(ArquivoSimples);

      sArquivo1.Free;
      sArquivo2.Free;

      Result := true;
    end;
  end
end;

class function TFuncUtils.ArrayJoin(const AArray: array of integer;
  const ADelimitador: string): string;
var
  i: Integer;
  s: string;
begin
  s := '';

  for i := 0 to High(AArray) do
    if i = High(AArray) then
      s := s + IntToStr(AArray[i])
    else
      s := s + IntToStr(AArray[i]) + ADelimitador;
  //

  Result := s;
end;

class function TFuncUtils.Arredondar(AValor: Double; ACasas: shortint): Double;
var
  RoundMode: TFPURoundingMode;
begin
  RoundMode := GetRoundMode;
  SetRoundMode(rmUp);
  { "rmNearest" => Arredonda para o valor mais pr�ximo e � o modo default.
    "rmDown" => Arredonda para baixo.
    "rmUp" => Arredonda para cima.
    "rmTruncate" => Trunca o valor. }

  try
    Result := SimpleRoundTo(AValor, -ACasas);
  finally
    SetRoundMode(RoundMode);
  end;
end;

class function TFuncUtils.Arredondar(Valor: Extended): Int64;
var
  RoundMode: TFPURoundingMode;
begin
  RoundMode := GetRoundMode;
  SetRoundMode(rmUp);

  try
    Result := Round(Valor);
  finally
    SetRoundMode(RoundMode);
  end;
end;

class function TFuncUtils.CalculaBaseCalcIcmsSubst
  (vlrItem, ipi, reducaoSubst, mva: Extended;
  VlrRateioOutras: array of Extended): Extended;
var
  i: Integer;
  VlrTotal, TotalRateioOutras, BaseCalcSubst: Extended;
begin
  // Verifica se tem mva, se nao tiver a Base de Calc. de Subst. recebe zero
  if mva = 0 then
  begin
    Result := 0;
    Exit;
  end;

  // Calculando os valores nos campos Frete, Seguro e Outras Despesas
  TotalRateioOutras := 0;
  for i := Low(VlrRateioOutras) to High(VlrRateioOutras) do
    TotalRateioOutras := TotalRateioOutras + VlrRateioOutras[i];

  // Valor Total em que a Substiui��o ser� calculada
  VlrTotal := vlrItem + ipi + TotalRateioOutras;

  // Calculo da Substitui��o
  BaseCalcSubst := Arredondar(VlrTotal + (VlrTotal * mva / 100), 2);

  // se tiver redu��o da Base de Calc Icms Susbt
  if reducaoSubst > 0 then
    Result := Arredondar(BaseCalcSubst - (BaseCalcSubst * reducaoSubst / 100),
      2)
  else // se nao tiver redu��o
    Result := BaseCalcSubst;
end;

class function TFuncUtils.CalculaVlrIcmsSubst
  (BaseCalcIcmsSubst, aliqDest, VlrIcms: Extended): Extended;
var
  VlrImcsSust: Extended;
begin
  // calculo para achar o icms Substitui��o
  VlrImcsSust := Arredondar(BaseCalcIcmsSubst * aliqDest / 100, 2);

  // diminui o imcs substitui��o do icms proprio para achar o valor correto do imcs de substitui��o
  Result := VlrImcsSust - VlrIcms;
end;

class function TFuncUtils.CGC_Valido(sValue: string): Boolean;
var
  N: array [1 .. 14] of Integer;
  dgt1, dgt2: Integer;
  soma1, soma2: Integer;
begin
  sValue := RetiraCaracteresCPF_CGC(sValue);
  if Length(trim(sValue)) <> 14 then
  begin
    CGC_Valido := False;
    Exit;
  end;

  N[1] := StrToInt(sValue[1]);
  N[2] := StrToInt(sValue[2]);
  N[3] := StrToInt(sValue[3]);
  N[4] := StrToInt(sValue[4]);
  N[5] := StrToInt(sValue[5]);
  N[6] := StrToInt(sValue[6]);
  N[7] := StrToInt(sValue[7]);
  N[8] := StrToInt(sValue[8]);
  N[9] := StrToInt(sValue[9]);
  N[10] := StrToInt(sValue[10]);
  N[11] := StrToInt(sValue[11]);
  N[12] := StrToInt(sValue[12]);
  N[13] := StrToInt(sValue[13]);
  N[14] := StrToInt(sValue[14]);

  soma1 := (N[1] * 5) + (N[2] * 4) + (N[3] * 3) + (N[4] * 2) + (N[5] * 9) +
    (N[6] * 8) + (N[7] * 7) + (N[8] * 6) + (N[9] * 5) + (N[10] * 4) +
    (N[11] * 3) + (N[12] * 2);

  dgt1 := 11 - (soma1 mod 11);
  if (dgt1 = 10) or (dgt1 = 11) then
    dgt1 := 0;

  soma2 := (N[1] * 6) + (N[2] * 5) + (N[3] * 4) + (N[4] * 3) + (N[5] * 2) +
    (N[6] * 9) + (N[7] * 8) + (N[8] * 7) + (N[9] * 6) + (N[10] * 5) +
    (N[11] * 4) + (N[12] * 3) + (dgt1 * 2);

  dgt2 := 11 - (soma2 mod 11);
  if (dgt2 = 10) or (dgt2 = 11) then
    dgt2 := 0;

  if (dgt1 <> N[13]) or (dgt2 <> N[14]) then
    CGC_Valido := False
  else
    CGC_Valido := true;
end;

class procedure TFuncUtils.ChangeMaskPhone(AEdits: array of TDBEdit);
var
  i: Integer;
begin
  for i := 0 to Length(AEdits) - 1 do
    if Length(AEdits[i].Field.AsString) > 10 then
      AEdits[i].Field.EditMask := '(99)99999-9999;0'
    else
      AEdits[i].Field.EditMask := '(99)9999-9999;0'
end;

class procedure TFuncUtils.CloseComponents(form: TForm);
var
  i: Integer;
begin
  // Finaliza a conex�o de todos os compoentes do Form passado como parametro
  for i := 0 to form.ComponentCount - 1 do
  Begin
    try
      if (form.Components[i] is TDataSet) then (form.Components[i] as TDataSet)
        .Close;
    except
    end;
  end;
end;

class function TFuncUtils.ConvertStringForExtended(Valor: string;
  QtdeCadasDecimais: Integer): Extended;
var
  VlrTMP: String;
  VlrTempFormatado: Extended;
  iconta: Integer;
Begin

  VlrTMP := Valor;
  VlrTMP := StringReplace(VlrTMP, ',', '', [rfReplaceAll]);
  VlrTMP := StringReplace(VlrTMP, '.', '', [rfReplaceAll]);

  for iconta := (18 - Length(VlrTMP)) downto 1 do
    VlrTMP := '0' + VlrTMP;

  if QtdeCadasDecimais = 2 then
    VlrTMP := copy(VlrTMP, 1, 16) + '.' + copy(VlrTMP, 17, 2)
  else
    VlrTMP := copy(VlrTMP, 1, 15) + '.' + copy(VlrTMP, 16, 3);

  VlrTempFormatado := StrToCurr(StringReplace(VlrTMP, '.', ',', [rfReplaceAll])
    );

  Result := VlrTempFormatado;
end;

class function TFuncUtils.EAN_Valido(sVlr: string): Boolean;
var
  xSoma, xPeso: Integer;
  xInteiro, xResto: Integer;
  sEan: String;
  Contador, Digito: Integer;
begin
  Result := False;
  xSoma := 0;
  xPeso := 3;

  sEan := trim(sVlr);
  if not(Length(sEan) in [8, 12, 13, 14]) then
    Exit;

  for Contador := (Length(sEan) - 1) downto 1 do
  begin
    xSoma := xSoma + (StrToInt(sEan[Contador]) * xPeso);

    if (xPeso = 1) then
      xPeso := 3
    else
      xPeso := 1;
  end;

  xInteiro := (xSoma div 10);
  xResto := (xSoma mod 10);
  if xResto > 0 then
    inc(xInteiro);

  Digito := (xInteiro * 10) - xSoma;

  if (StrToInt(sEan[Length(sEan)]) = Digito) then
    Result := true;
end;

class function TFuncUtils.CPF_Valido(sValue: string): Boolean;
var
  i: Integer;
  Want: Char;
  Wvalid: Boolean;
  Wdigit1, Wdigit2: Integer;
begin
  Wvalid := False;
  Wdigit1 := 0;
  Wdigit2 := 0;

  sValue := RetiraCaracteresCPF_CGC(sValue);
  if Length(trim(sValue)) <> 11 then
  Begin
    Result := False;
    Exit;
  end;

  Want := sValue[1]; // variavel para testar se o cpf � repetido como 111.111.111-11

  // testar se o cpf � repetido como 111.111.111-11
  for i := 1 to Length(sValue) do
  begin
    if sValue[i] <> Want then
    begin
      Wvalid := true; // se o cpf possui um digito diferente ele passou no primeiro teste
      break
    end;
  end;

  // se o cpf � composto por numeros repetido retorna falso
  if not Wvalid then
  begin
    Result := False;
    Exit;
  end;

  // executa o calculo para o primeiro verificador
  for i := 1 to 9 do
  begin
    Wdigit1 := Wdigit1 + (StrToInt(sValue[10 - i]) * (i + 1));
  end;

  Wdigit1 := ((11 - (Wdigit1 mod 11)) mod 11) mod 10;
  { formula do primeiro verificador
    soma=1�*2+2�*3+3�*4.. at� 9�*10
    digito1 = 11 - soma mod 11
    se digito > 10 digito1 =0 }

  // verifica se o 1� digito confere
  if IntToStr(Wdigit1) <> sValue[10] then
  begin
    Result := False;
    Exit;
  end;

  for i := 1 to 10 do
  begin
    Wdigit2 := Wdigit2 + (StrToInt(sValue[11 - i]) * (i + 1));
  end;

  Wdigit2 := ((11 - (Wdigit2 mod 11)) mod 11) mod 10;
  { formula do segundo verificador
    soma=1�*2+2�*3+3�*4.. at� 10�*11
    digito1 = 11 - soma mod 11
    se digito > 10 digito1 =0 }

  // confere o 2� digito verificador
  if IntToStr(Wdigit2) <> sValue[11] then
  begin
    Result := False;
    Exit;
  end;

  // se chegar at� aqui o cpf � valido
  Result := true;
end;

class procedure TFuncUtils.CriaForm(FrmClasse: TFormClass; var Frm);
begin
  if TForm(Frm) = nil then
    TForm(Frm) := FrmClasse.Create(Application)
  else
    TForm(Frm).WindowState := wsMinimized;
  //
  TForm(Frm).WindowState := wsNormal;
end;

class procedure TFuncUtils.CriaForm(const AModuleName, AClassName: string);
var
  AModule: HMODULE;
  AClass: TPersistentClass;
begin
  AModule := LoadPackage(AModuleName);

  if AModule = 0 then
    raise Exception.CreateFmt('O M�dulo "%s" n�o foi encontrado!',
      [AModuleName]);
  //

  try
    AClass := GetClass(AClassName);

    if not Assigned(AClass) then
    begin
      ShowMessageFmt('A classe "%s" n�o est� registrada.', [AClassName]);
      Exit;
    end;

    with TComponentClass(AClass).Create(nil) as TForm do
      try
        ShowModal;
      finally
        Free;
      end;
  finally
    UnRegisterModuleClasses(AModule);
    UnloadPackage(AModule);
  end;
end;

class procedure TFuncUtils.CriaFormModal(Frm: TFormClass);
begin
  with Frm.Create(Application) do
    try
      FormStyle := fsNormal;
      Visible := False;
      ShowModal;
    finally
      Free;
    end;
end;

class function TFuncUtils.Crypto(NumParaCriptografar: string): string;
var
  i, ContCripto: Integer;
  minor_string, code, key: string;
begin
  ContCripto := Length(NumParaCriptografar);

  // Buscando a Chave mais adequata para criptografar
  key := copy(ChavedeCriptografia, 1, ContCripto);

  if Length(NumParaCriptografar) >= Length(key) then
  begin
    minor_string := key;
    code := NumParaCriptografar;
  end
  else
  begin
    minor_string := NumParaCriptografar;
    code := key;
  end;

  for i := 1 to Length(minor_string) do
    code[i] := chr(Ord(code[i]) xor Ord(minor_string[i]));

  Result := code;
end;

class function TFuncUtils.dataextenso(data: Tdate): string;
var
  diasemana: array [1 .. 7] of String;
  meses: array [1 .. 12] of String;
  dia, Mes, ano: Word;
begin
  diasemana[1] := 'Domingo';
  diasemana[2] := 'Segunda-feira';
  diasemana[3] := 'Ter�a-feira';
  diasemana[4] := 'Quarta-feira';
  diasemana[5] := 'Quinta-feira';
  diasemana[6] := 'Sexta-feira';
  diasemana[7] := 'S�bado';

  meses[1] := 'Janeiro';
  meses[2] := 'Fevereiro';
  meses[3] := 'Mar�o';
  meses[4] := 'Abril';
  meses[5] := 'Maio';
  meses[6] := 'Junho';
  meses[7] := 'Julho';
  meses[8] := 'Agosto';
  meses[9] := 'Setembro';
  meses[10] := 'Outubro';
  meses[11] := 'Novembro';
  meses[12] := 'Dezembro';

  DecodeDate(data, ano, Mes, dia);
  Result := IntToStr(dia) + ' de ' + meses[Mes] + ' de ' + IntToStr(ano);
end;

class function TFuncUtils.DeCrypto(NumCriptografado: string): string;
var
  i, ContCripto: Integer;
  minor_string, code, key: string;
begin

  ContCripto := Length(NumCriptografado);

  // Buscando a Chave que foi criptografado para poder descriptografar
  key := copy(ChavedeCriptografia, 1, ContCripto);

  if Length(NumCriptografado) >= Length(key) then
  begin
    minor_string := key;
    code := NumCriptografado;
  end
  else
  begin
    minor_string := NumCriptografado;
    code := key;
  end;

  for i := 1 to Length(minor_string) do
    code[i] := chr(Ord(minor_string[i]) xor Ord(code[i]));

  Result := code;
end;

class procedure TFuncUtils.DeleteDir(hHandle: THandle; const sPath: String);
var
  OpStruc: TSHFileOpStruct;
  FromBuffer, ToBuffer: Array [0 .. 128] of Char;
begin
  // Apaga Pasta, Sub-Pastas e Arquivos;
  // Para o seu perfeito funcionamento Adicione na Uses a classe SHELLAPI
  fillChar(OpStruc, Sizeof(OpStruc), 0);
  fillChar(FromBuffer, Sizeof(FromBuffer), 0);
  fillChar(ToBuffer, Sizeof(ToBuffer), 0);
  StrPCopy(FromBuffer, sPath);
  With OpStruc Do
  Begin
    Wnd := hHandle;
    wFunc := FO_DELETE;
    pFrom := @FromBuffer;
    pTo := @ToBuffer;
    fFlags := FOF_NOCONFIRMATION;
    fAnyOperationsAborted := False;
    hNameMappings := nil;
  End;
  ShFileOperation(OpStruc);
end;

class procedure TFuncUtils.DesabilitarGhostingDoWindows;
var
  User32: HMODULE;
  DisableProcessWindowsGhosting: TProcedure;
begin
  User32 := GetModuleHandle('USER32');

  if User32 <> 0 then
  begin
    DisableProcessWindowsGhosting := GetProcAddress(User32,
      'DisableProcessWindowsGhosting');

    if Assigned(DisableProcessWindowsGhosting) then
      DisableProcessWindowsGhosting;
  end;
end;

class procedure TFuncUtils.DeleteArquivos(diretorio: string);
var
  SR: TSearchRec;
  i: Integer;
begin
  i := FindFirst(diretorio + '\*.*', faAnyFile, SR);
  while i = 0 do
  begin
    if (SR.Attr and faDirectory) <> faDirectory then
      DeleteFile(PChar(diretorio + '\' + SR.Name));

    i := FindNext(SR);
  end;
end;

class function TFuncUtils.DiasPorMes(Ayear, AMonth: Integer): Integer;
const
  DaysInMonth: array [1 .. 12] of Integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

  // Verifica se o ano � Bi-Sexto
  function AnoBiSexto(Ayear: Integer): Boolean;
  begin
    Result := (Ayear mod 4 = 0) and ((Ayear mod 100 <> 0) or (Ayear mod 400 = 0)
      );
  end;

begin
  Result := DaysInMonth[AMonth];

  if (AMonth = 2) and AnoBiSexto(Ayear) then
    inc(Result);
end;

class function TFuncUtils.DiretorioVazio(diretorio: string): Boolean;
var
  search_rec: TSearchRec;
  i: Integer;
begin
  // Valida se o Diret�rio testado esta vazio ou se contem
  // algum Arquivo, Pasta, Imagem etc...
  // Adcione na USES as classes "SysUtils e Windows"
  Result := False;
  FindFirst(IncludeTrailingPathDelimiter(diretorio) + '*', faAnyFile,
    search_rec);

  for i := 1 to 2 do
    if (search_rec.Name = '.') or (search_rec.Name = '..') then
      Result := FindNext(search_rec) <> 0;

  SysUtils.FindClose(search_rec);
end;

class procedure TFuncUtils.DisablePanelControls(const AControl: TControl;
  const ABool: Boolean; AIgnoreCtrls: TCtrlTypesSet);
var
  i: Integer;
  AEnumName: string;
  ACtrlType: TCtrlTypes;
begin
  if not Assigned(AControl) then Exit;

  if AControl is TWinControl then
    for i := 0 to TWinControl(AControl).ControlCount - 1 do
      DisablePanelControls(TWinControl(AControl).Controls[i], ABool, AIgnoreCtrls);
  //

  AEnumName := 'ct' + Copy(AControl.ClassName, 2, Length(AControl.ClassName));
  ACtrlType := TCtrlTypes(GetEnumValue(TypeInfo(TCtrlTypes), AEnumName));

  if ACtrlType in AIgnoreCtrls then
    AControl.Enabled := True
  else
    AControl.Enabled := ABool;
  //
end;

class function TFuncUtils.FileInUse(const AFileName: string): Boolean;
var
  StreamArquivo: TStream;
begin
  Result := False;

  if not FileExists(AFileName) then Exit;

  try
    StreamArquivo := TFileStream.Create(AFileName, fmShareExclusive and fmOpenRead);
    StreamArquivo.Free;
  except
    Result := true;
  end;
end;

class procedure TFuncUtils.FocusControl(const AForm: TForm;
  const AField: TField);
var
  Controls: TStringList;
  PageControl, TabSheet: TComponent;
  i, j: Integer;
begin
  Controls := TStringList.Create;

  try
    if Trim(AField.Origin) <> '' then
    begin
      TFuncUtils.Split('>', AField.Origin, Controls);

      for i := 0 to Controls.Count div 2 - 1 do
      begin
        j := i * 2;
        PageControl := AForm.FindComponent(Controls[j]);
        TabSheet := AForm.FindComponent(Controls[j + 1]);

        if not Assigned(PageControl) then
          raise Exception.CreateFmt('O controle "%s" n�o foi encontrado',
            [Controls[j]]);

        if not Assigned(TabSheet) then
          raise Exception.CreateFmt('O controle "%s" n�o foi encontrado',
            [Controls[j + 1]]);

        TPageControl(PageControl).ActivePage := TabSheet as TTabSheet;
      end;
    end;

    AField.FocusControl;
  finally
    Controls.Free;
  end;
end;

class function TFuncUtils.FormataCPFeCNPJ(fDoc: String): String;
Var
  vTam, xx: Integer;
  vDoc: String;
begin
  vTam := Length(fDoc);
  For xx := 1 To vTam Do
    If (copy(fDoc, xx, 1) <> '.') And (copy(fDoc, xx, 1) <> '-') And
      (copy(fDoc, xx, 1) <> '/') Then
      vDoc := vDoc + copy(fDoc, xx, 1);
  fDoc := vDoc;
  vTam := Length(fDoc);
  vDoc := '';
  vDoc := '';
  For xx := 1 To vTam Do
  begin
    vDoc := vDoc + copy(fDoc, xx, 1);
    If vTam = 11 Then
    begin
      If (xx in [3, 6]) Then
        vDoc := vDoc + '.';
      If xx = 9 Then
        vDoc := vDoc + '-';
    end;
    If vTam = 14 Then
    begin
      If (xx in [2, 5]) Then
        vDoc := vDoc + '.';
      If xx = 8 Then
        vDoc := vDoc + '/';
      If xx = 12 Then
        vDoc := vDoc + '-';
    end;
  end;
  Result := vDoc;
end;

class function TFuncUtils.Formatar(Texto: string; TamanhoDesejado: Integer;
  AcrescentarADireita: Boolean; CaracterAcrescentar: Char): string;
var
  QuantidadeAcrescentar, TamanhoTexto, PosicaoInicial, i: Integer;
begin
  case CaracterAcrescentar of
    '0' .. '9', 'a' .. 'z', 'A' .. 'Z':
      ; { N�o faz nada }
  else
    CaracterAcrescentar := ' ';
  end;

  Texto := trim(AnsiUpperCase(Texto));
  TamanhoTexto := Length(Texto);
  for i := 1 to (TamanhoTexto) do
  begin
    if Pos(Texto[i],
      ' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!?@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
    begin
      case Texto[i] of
        '�', '�', '�', '�', '�':
          Texto[i] := 'A';
        '�', '�', '�', '�':
          Texto[i] := 'E';
        '�', '�', '�', '�':
          Texto[i] := 'I';
        '�', '�', '�', '�', '�':
          Texto[i] := 'O';
        '�', '�', '�', '�':
          Texto[i] := 'U';
        '�':
          Texto[i] := 'C';
        '�':
          Texto[i] := 'N';
      else
        Texto[i] := ' ';
      end;
    end;
  end;

  QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
  if QuantidadeAcrescentar < 0 then
    QuantidadeAcrescentar := 0;
  if CaracterAcrescentar = '' then
    CaracterAcrescentar := ' ';
  if TamanhoTexto >= TamanhoDesejado then
    PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
  else
    PosicaoInicial := 1;

  if AcrescentarADireita then
    Texto := copy(Texto, 1, TamanhoDesejado) + StringOfChar
      (CaracterAcrescentar, QuantidadeAcrescentar)
  else
    Texto := StringOfChar(CaracterAcrescentar, QuantidadeAcrescentar) + copy
      (Texto, PosicaoInicial, TamanhoDesejado);

  Result := AnsiUpperCase(Texto);
end;

class function TFuncUtils.GeraMD5(AFile: String): String;
var
  xMD5: TIdHashMessageDigest5;
  xArquivo: TFileStream;
begin
  xMD5 := TIdHashMessageDigest5.Create;
  xArquivo := TFileStream.Create(AFile, fmOpenRead OR fmShareDenyWrite);
  try
    Result := xMD5.HashStreamAsHex(xArquivo);
  finally
    xArquivo.Free;
    xMD5.Free;
  end;
end;

class function TFuncUtils.GetFileDate(AFile: String): TDateTime;
var
  FHandle: Integer;
begin
  FHandle := FileOpen(AFile, 0);
  try
    Result := FileDateToDateTime(FileGetDate(FHandle));
  finally
    FileClose(FHandle);
  end;
end;

class function TFuncUtils.GetFirstDayOfADate(ADate: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(ADate, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

class function TFuncUtils.GetFunction(const Module: HMODULE;
  const FuncName: PAnsiChar): Pointer;
begin
  Result := GetProcAddress(Module, FuncName);

  if not Assigned(Result) then
    raise Exception.CreateFmt('A fun��o remota ("%s") n�o foi encontrada.',
      [FuncName]);
  //
end;

class function TFuncUtils.GetPhoneMask(APhone: string): string;
begin
  case Length(APhone) of
   8: Result := '9999-9999;0';     //Ex: 38325664 = 3832-5664
   9: Result := '99999-9999;0';    //Ex: 938325664 = 93832-5664
  10: Result := '(99)9999-9999;0'; //Ex: 3538325664 = +(35)3832-5664
  11: Result := '(99)99999-9999;0';//Ex: 35938325664 = +(35)93832-5664
  else
    Result := '(99)9999-9999;0';  //Fixa o padr�o 10
  end;
  //
  {Se precisar utilziar esta formata��o em campos texto por exmeplo TXT
  e so importar a classe "MaskUtils" e utilizar a fun��o "FormatMaskText"
  EX:  sString := FormatMaskText(TFuncUtils.GetPhoneMask('3538325664'), '3538325664'); }
  //
end;

class function TFuncUtils.GetNivelPlanodeContas(strCodigo: String): Integer;
begin
  Result := 0;
  if Length(strCodigo) = 1 then
    Result := 1
  else if Length(strCodigo) = 2 then
    Result := 2
  else if Length(strCodigo) in [3, 4] then
    Result := 3
  else if Length(strCodigo) in [5, 6] then
    Result := 4
  else if Length(strCodigo) > 6 then
    Result := 5;
end;

class function TFuncUtils.GetPhoneMask: string;
begin
  Result := '(99)999999999;0';
end;

class function TFuncUtils.GetSituacaoNota(Flag: String): String;
var
  Text: String;
begin
  Text := 'ERROR!!!';
  //
  case Flag[1] of
    'F': Text := 'FINALIZADA';
    'P': Text := 'PENDENTE';
    'C': Text := 'CANCELADA';
    'D': Text := 'DEVOLVIDA';
    'I': Text := 'INUTILIZADA';
    'G': Text := 'NFe DENEGADA';
  end;
  //
  Result := Text;
end;

class function TFuncUtils.GetSituacaoCTE(Flag: String): String;
var
  Text: String;
begin
  Text := 'ERROR!!!';
  //
  case Flag[1] of
    'P': Text := 'PENDENTE';
    'F': Text := 'AUTORIZADO';
    'C': Text := 'CANCELADO';
    'I': Text := 'INUTILIZADO';
    'S': Text := 'FSDA';
    'E': Text := 'EPEC';
    'X': Text := 'EM PROCESSAMENTO';
  end;
  //
  Result := Text;
end;

class function TFuncUtils.GetSituacaoNFE(Flag: String): String;
var
  Text: String;
begin
  Text := 'ERROR!!!';
  //
  case Flag[1] of
    'A': Text := 'AUTORIZADO';
    'B': Text := 'EPEC';
    'C': Text := 'CANCELADO';
    'D': Text := 'DPEC';
    'E': Text := 'EXPORTADO';
    'G': Text := 'DENEGADA';
    'I': Text := 'INUTILIZADA';
    'N': Text := 'PENDENTE';
    'P': Text := 'EM PROCESSAMENTO';
    'R': Text := 'NFe REJEITADA';
    'T': Text := 'CONTING�NCIA';
  end;
  //
  Result := Text;
end;

class function TFuncUtils.ifs(Expressao: Boolean;
  CasoVerdadeiro, CasoFalso: String): String;
begin
  if Expressao then
    Result := CasoVerdadeiro
  else
    Result := CasoFalso;
end;

class function TFuncUtils.IfThen(AValue: Boolean; const ATrue, AFalse: variant)
  : variant;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
  //
end;

class function TFuncUtils.InsereCuringa(const Texto: string;
  const Tamanho: Integer; const Caracter: Char = '?'): string;
var
  ACount: Integer;
  AText: string;
begin
  ACount := Tamanho - Length(trim(Texto));

  if ACount < 0 then
    ACount := 0;

  AText := copy(trim(Texto), 1, Tamanho);
  AText := StringReplace(AText, ' ', Caracter, [rfReplaceAll]);

  Result := AText + StringOfChar(Caracter, ACount);
end;

class function TFuncUtils.IsNumeric(Valor: string): Boolean;
var
  i: Integer;
begin
  Result := true;

  for i := 1 to Length(Valor) do
    if not(Valor[i] in ['0' .. '9']) then
    begin
      Result := False;
      Exit;
    end;
end;

class function TFuncUtils.KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase
          (ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase
          (ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0)
              , FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

class procedure TFuncUtils.limpa_campos(form: TForm);
var
  i: Integer;
begin
  for i := 0 to form.ComponentCount - 1 do
    if form.Components[i] is TEdit then
    begin
      TEdit(form.Components[i]).SelectAll;
      TEdit(form.Components[i]).Clear;
      TEdit(form.Components[i]).Update;
      TEdit(form.Components[i]).Refresh;
    end;
end;

class function TFuncUtils.MaskedInputBox
  (const ACaption, APrompt, ADefault: string): string;
var
  form: TForm;
  Prompt: TLabel;
  MaskEdit: TMaskEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  i: Integer;
  Buffer: array [0 .. 51] of Char;
begin
  Result := '';
  form := TForm.Create(Application);
  with form do
    try
      Canvas.Font := Font;
      for i := 0 to 25 do
        Buffer[i] := chr(i + Ord('A'));
      for i := 0 to 25 do
        Buffer[i + 26] := chr(i + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
      DialogUnits.X := DialogUnits.X div 52;
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(form);

      with Prompt do
      begin
        Parent := form;
        AutoSize := true;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
        WordWrap := true;
      end;

      MaskEdit := TMaskEdit.Create(form);

      with MaskEdit do
      begin
        Parent := form;
        Left := Prompt.Left;
        Top := MulDiv(25, DialogUnits.Y, 8);
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 10;
        EditMask := '00/00/0000';
        Text := ADefault;
        SelectAll;
      end;

      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);

      with TButton.Create(form) do
      begin
        Parent := form;
        Caption := 'OK';
        ModalResult := mrOk;
        Default := true;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;

      if ShowModal = mrOk then
      begin
        Value := MaskEdit.Text;
        Result := Value;
      end;

    finally
      form.Free;
    end;
end;

class function TFuncUtils.MesExtenso(Mes: Word): string;
const
  meses: array [0 .. 11] of PChar = ('Janeiro', 'Fevereiro', 'Mar�o', 'Abril',
    'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro',
    'Dezembro');
begin
  Result := meses[Mes - 1];
end;

class function TFuncUtils.NumericToSting(Valor: Extended;
  CasasDecimais: Integer): AnsiString;
var
  VlrTMP: AnsiString;
Begin
  if CasasDecimais = 2 then
    VlrTMP := FormatFloat('#########0.00', Valor)
  else
    VlrTMP := FormatFloat('#########0.000', Valor);

  VlrTMP := StringReplace(VlrTMP, '.', '', [rfReplaceAll]);
  VlrTMP := StringReplace(VlrTMP, ',', '', [rfReplaceAll]);

  Result := VlrTMP;
end;

class function TFuncUtils.NumeroExtenso(N: LongWord): String;
const
  Unidades: array [1 .. 19] of String =
    ('um', 'dois', 'tr�s', 'quatro', 'cinco', 'seis', 'sete', 'oito', 'nove',
    'dez', 'onze', 'doze', 'treze', 'quatorze', 'quinze', 'dezesseis',
    'dezessete', 'dezoito', 'dezenove');

  Dezenas: array [1 .. 9] of String = ('dez', 'vinte', 'trinta', 'quarenta',
    'cinq�enta', 'sessenta', 'setenta', 'oitenta', 'noventa');

  Centenas: array [1 .. 9] of String = ('cem', 'duzentos', 'trezentos',
    'quatrocentos', 'quinhentos', 'seiscentos', 'setecentos', 'oitocentos',
    'novecentos');
begin
  case N of
    1 .. 19:
      Result := Unidades[N];

    20, 30, 40, 50, 60, 70, 80, 90:
      Result := Dezenas[N div 10] + ' ';

    21 .. 29, 31 .. 39, 41 .. 49, 51 .. 59, 61 .. 69, 71 .. 79, 81 .. 89,
      91 .. 99:
      Result := Dezenas[N div 10] + ' e ' + NumeroExtenso(N mod 10);

    100, 200, 300, 400, 500, 600, 700, 800, 900:
      Result := Centenas[N div 100] + ' ';

    101 .. 199:
      Result := ' cento e ' + NumeroExtenso(N mod 100);

    201 .. 299, 301 .. 399, 401 .. 499, 501 .. 599, 601 .. 699, 701 .. 799,
      801 .. 899, 901 .. 999:
      Result := Centenas[N div 100] + ' e ' + NumeroExtenso(N mod 100);

    1000 .. 999999:
      Result := NumeroExtenso(N div 1000) + ' mil ' + NumeroExtenso(N mod 1000);

    1000000 .. 1999999:
      Result := NumeroExtenso(N div 1000000) + ' milh�o ' + NumeroExtenso
        (N mod 1000000);

    2000000 .. 999999999:
      Result := NumeroExtenso(N div 1000000) + ' milh�es ' + NumeroExtenso
        (N mod 1000000);

    1000000000 .. 1999999999:
      Result := NumeroExtenso(N div 1000000000) + ' bilh�o ' + NumeroExtenso
        (N mod 1000000000);

    2000000000 .. 4294967295:
      Result := NumeroExtenso(N div 1000000000) + ' bilh�es ' + NumeroExtenso
        (N mod 1000000000);

  end;
end;

class function TFuncUtils.PadL(InStr: string; TotalLen: Integer): string;
var
  j: Integer;
  aux: string;
begin
  Result := InStr;
  if (Length(Result) <= TotalLen) then
    while Length(Result) < TotalLen do
      Result := ' ' + Result
    else
    begin
      for j := 1 to TotalLen do
        aux := copy(InStr, Length(InStr) - TotalLen, TotalLen + 1);
      Result := aux;
    end;
end;

class function TFuncUtils.PadR(InStr: string; TotalLen: Integer): string;
var
  j: Integer;
  aux: string;
begin
  Result := InStr;
  if (Length(Result) <= TotalLen) then
    while Length(Result) < TotalLen do
      Result := Result + ' '
    else
    begin
      for j := 1 to TotalLen - 1 do
        aux := copy(InStr, 1, TotalLen);
      Result := aux;
    end;
end;

class function TFuncUtils.PasswordInputBox(const ACaption, APrompt: string)
  : string;
begin
  Result := TFuncUtils.PasswordInputBox(ACaption, APrompt, $00F5D9C9, 180);
end;

class function TFuncUtils.PasswordInputBox(const ACaption, APrompt: string;
  const AColor, ACoeficWidth: Integer): string;
var
  form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  i: Integer;
  Buffer: array [0 .. 51] of Char;
begin
  Result := '';
  form := TForm.Create(Application);
  with form do
    try
      Canvas.Font := Font;
      for i := 0 to 25 do
        Buffer[i] := chr(i + Ord('A'));
      for i := 0 to 25 do
        Buffer[i + 26] := chr(i + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
      DialogUnits.X := DialogUnits.X div 52;
      BorderStyle := bsDialog;
      Caption := ACaption;
      Color := AColor;
      ClientWidth := MulDiv(ACoeficWidth, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(form);
      with Prompt do
      begin
        Parent := form;
        AutoSize := true;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Font.Style := [fsBold];
        Font.Size := 10;
        Caption := APrompt;
      end;
      Edit := TEdit.Create(form);
      with Edit do
      begin
        Parent := form;
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(ACoeficWidth - 16, DialogUnits.X, 4);
        MaxLength := 255;
        PasswordChar := '*';
        SelectAll;
      end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);

      // Bot�o OK
      with TButton.Create(form) do
      begin
        Parent := form;
        Caption := 'OK';
        Font.Style := [fsBold];
        ModalResult := mrOk;
        Default := true;
        SetBounds(Trunc(form.ClientWidth / 2) - 75, ButtonTop, ButtonWidth,
          ButtonHeight);
      end;

      // Bot�o Cancelar
      with TButton.Create(form) do
      begin
        Parent := form;
        Caption := 'Cancel';
        Font.Style := [fsBold];
        ModalResult := mrCancel;
        Cancel := true;
        SetBounds(Trunc(form.ClientWidth / 2) + 13, ButtonTop, ButtonWidth,
          ButtonHeight);
      end;

      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        Result := Value;
      end
      else
      begin
        Value := 'ERROR!!!';
        Result := Value;
      end

      finally
        form.Free;
      end;
    end;

class function TFuncUtils.PrgRodando(Executavel: WideString): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase
          (Executavel)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase
          (Executavel))) then
    begin
      Result := true;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

class function TFuncUtils.PasswordInputBox
  (const ACaption, APrompt, APrompt2: string): string;
var
  form: TForm;
  Prompt, Prompt2: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  i: Integer;
  Buffer: array [0 .. 51] of Char;
begin
  Result := '';
  form := TForm.Create(Application);
  with form do
    try
      Canvas.Font := Font;
      for i := 0 to 25 do
        Buffer[i] := chr(i + Ord('A'));
      for i := 0 to 25 do
        Buffer[i + 26] := chr(i + Ord('a'));
      // GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));

      DialogUnits.X := 450;
      DialogUnits.Y := 15;

      DialogUnits.X := DialogUnits.X div 52;
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(190, DialogUnits.X, 4);
      ClientHeight := MulDiv(74, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(form);
      with Prompt do
      begin
        Parent := form;
        AutoSize := true;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(2, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      Prompt2 := TLabel.Create(form);
      with Prompt2 do
      begin
        Parent := form;
        AutoSize := true;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(19, DialogUnits.Y, 8);
        Caption := APrompt2;
      end;
      Edit := TEdit.Create(form);
      with Edit do
      begin
        Parent := form;
        Left := Prompt.Left;
        Top := MulDiv(30, DialogUnits.Y, 8);
        Width := MulDiv(170, DialogUnits.X, 4);
        MaxLength := 255;
        PasswordChar := '*';
        SelectAll;
      end;
      ButtonTop := MulDiv(52, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(form) do
      begin
        Parent := form;
        Caption := 'OK';
        ModalResult := mrOk;
        Default := true;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(form) do
      begin
        Parent := form;
        Caption := 'Cancel';
        ModalResult := mrCancel;
        Cancel := true;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        Result := Value;
      end;
    finally
      form.Free;
    end;
end;

class function TFuncUtils.RecalculaQtde(VlrUnit, VlrTotal: Double): Double;
var
  totalCalculado, QtdeVendida: Double;
begin
  QtdeVendida := TFuncUtils.Truncar(VlrTotal / VlrUnit, 3);
  totalCalculado := TFuncUtils.Truncar((QtdeVendida * VlrUnit), 2);

  // Fun��o para acertar erros de variavel
  VlrTotal := RoundTo(VlrTotal, -2);
  totalCalculado := RoundTo(totalCalculado, -2);
  if (VlrTotal <> totalCalculado) then
  begin
    QtdeVendida := QtdeVendida + 0.001;
    totalCalculado := TFuncUtils.Truncar(VlrUnit * QtdeVendida, 2);

    // Fun��o para acertar erros de variavel
    VlrTotal := RoundTo(VlrTotal, -2);
    totalCalculado := RoundTo(totalCalculado, -2);
    if (VlrTotal <> totalCalculado) then
    Begin
      QtdeVendida := TFuncUtils.Truncar(VlrTotal / VlrUnit, 3);
      VlrTotal := TFuncUtils.Truncar(VlrUnit * QtdeVendida, 2);
    end;
  end;

  Result := QtdeVendida;
end;

class function TFuncUtils.RemoveExt(pStrValue: string): string;
var
  i: Integer;
begin
  i := Pos('.', pStrValue);
  if i <> 0 then
    Result := copy(pStrValue, 1, i - 1)
  else
    Result := pStrValue;
end;

class function TFuncUtils.Replicate(pString: String; xWidth: Integer): String;
Var
  nCount: Integer;
  pStr: String;
begin
  pStr := '';
  For nCount := 1 To xWidth Do
    pStr := pStr + pString;
  Result := pStr;
end;

class function TFuncUtils.RetiraCaracEspeciaisXml(str: string): string;
const
  mySet: array[0..4] of Char = ('<', '>', '&', '"', #39);
var
  c: Char;
begin
  Result := str;
  for c in mySet do
    Result := StringReplace(Result, c, '', [rfReplaceAll, rfIgnoreCase])
end;

class function TFuncUtils.RetiraCaracteres(str: string): string;
var
  j: Integer;
begin
  for j := 1 to Length(str) do
  begin
    if (str[j] = '�') then
      str[j] := 'c'
    else if (str[j] = '�') then
      str[j] := 'C'
    else if (str[j] = '�') then
      str[j] := 'a'
    else if (str[j] = '�') then
      str[j] := 'A'
    else if (str[j] = '�') then
      str[j] := 'e'
    else if (str[j] = '�') then
      str[j] := 'E'
    else if (str[j] = '�') then
      str[j] := 'i'
    else if (str[j] = '�') then
      str[j] := 'I'
    else if (str[j] = '�') then
      str[j] := 'o'
    else if (str[j] = '�') then
      str[j] := 'O'
    else if (str[j] = '�') then
      str[j] := 'u'
    else if (str[j] = '�') then
      str[j] := 'U'
    else if (str[j] = '�') then
      str[j] := 'A'
    else if (str[j] = '�') then
      str[j] := 'a'
    else if (str[j] = '�') then
      str[j] := 'a'
    else if (str[j] = '�') then
      str[j] := 'E'
    else if (str[j] = '�') then
      str[j] := 'e'
    else if (str[j] = '�') then
      str[j] := 'O'
    else if (str[j] = '�') then
      str[j] := 'o'
    else if (str[j] = '�') then
      str[j] := 'U'
    else if (str[j] = '�') then
      str[j] := 'u'
    else if (str[j] = '�') then
      str[j] := 'O'
    else if (str[j] = '�') then
      str[j] := 'o'
  end;

  // Retira Caracteres N�o utilizaveis
  for j := 1 to Length(str) do
    if str[j] in ['/', '\', '-', ',', '.', '"', '&'] then
      str := copy(str, 1, (j - 1)) + copy(str, (j + 1), (Length(str) - j));

  // for j:=1 to Length(str) do
  // begin
  // if(str[j] = '/')then
  // str := copy(str,1,(j - 1)) + copy(str,(j + 1),(Length(str) - j));
  // end;
  //
  // for j:=1 to Length(str) do
  // begin
  // if(str[j] = '\')then
  // str := copy(str,1,(j - 1)) + copy(str,(j + 1),(Length(str) - j));
  // end;
  //
  // for j:=1 to Length(str) do
  // begin
  // if(str[j] = '-')then
  // str := copy(str,1,(j - 1)) + copy(str,(j + 1),(Length(str) - j));
  // end;
  //
  // for j:=1 to Length(str) do
  // begin
  // if(str[j] = ',')then
  // str := copy(str,1,(j - 1)) + copy(str,(j + 1),(Length(str) - j));
  // end;
  //
  // for j:=1 to Length(str) do
  // begin
  // if(str[j] = '.')then
  // str := copy(str,1,(j - 1)) + copy(str,(j + 1),(Length(str) - j));
  // end;
  //
  // for j:=1 to Length(str) do
  // begin
  // if(str[j] = '"')then
  // str := copy(str,1,(j - 1)) + copy(str,(j + 1),(Length(str) - j));
  // end;

  Result := trim(str);
end;

class function TFuncUtils.RetiraCaracteresAcentuacao(str: string): string;
var
  j: Integer;
begin
  for j := 1 to Length(str) do
  begin
    if (str[j] = '�') then
      str[j] := 'c'
    else if (str[j] = '�') then
      str[j] := 'C'
    else if (str[j] = '�') then
      str[j] := 'a'
    else if (str[j] = '�') then
      str[j] := 'A'
    else if (str[j] = '�') then
      str[j] := 'e'
    else if (str[j] = '�') then
      str[j] := 'E'
    else if (str[j] = '�') then
      str[j] := 'i'
    else if (str[j] = '�') then
      str[j] := 'I'
    else if (str[j] = '�') then
      str[j] := 'o'
    else if (str[j] = '�') then
      str[j] := 'O'
    else if (str[j] = '�') then
      str[j] := 'u'
    else if (str[j] = '�') then
      str[j] := 'U'
    else if (str[j] = '�') then
      str[j] := 'A'
    else if (str[j] = '�') then
      str[j] := 'a'
    else if (str[j] = '�') then
      str[j] := 'a'
    else if (str[j] = '�') then
      str[j] := 'E'
    else if (str[j] = '�') then
      str[j] := 'e'
    else if (str[j] = '�') then
      str[j] := 'O'
    else if (str[j] = '�') then
      str[j] := 'o'
    else if (str[j] = '�') then
      str[j] := 'U'
    else if (str[j] = '�') then
      str[j] := 'u'
    else if (str[j] = '�') then
      str[j] := 'O'
    else if (str[j] = '�') then
      str[j] := 'o';
  end;

  Result := str;
end;

class function TFuncUtils.RetiraCaracteresCPF_CGC(str: string): string;
var
  X: Integer;
  sAux: String;
Begin
  sAux := '';
  for X := 1 to Length(str) do
    if str[X] in ['0' .. '9'] then
      sAux := sAux + str[X];

  Result := sAux;
end;

class function TFuncUtils.RightPad(s: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result := s;
  RestLen := Len - Length(s);
  if RestLen <= 0 then
    Exit;
  Result := StringOfChar(Ch, RestLen) + s;
end;

class procedure TFuncUtils.Split(const Delimitador: Char; Texto: String;
  Retorno: TStrings);
begin
  Assert(Assigned(Retorno));
  Retorno.Clear;
  Retorno.StrictDelimiter := true;
  Retorno.Delimiter := Delimitador;
  Retorno.DelimitedText := Texto;
end;

class function TFuncUtils.SliceValue(const AValue: Extended): TFloatParts;
var
  strings: TStrings;
begin
  strings := Self.Split(FormatSettings.DecimalSeparator, Format('%.8f', [AValue]));
  try
    Result.Int := StrToInt64(strings[0]);
    Result.Frac := StrToFloat('0' +FormatSettings.DecimalSeparator + strings[1]);
  finally
    strings.Free;
  end;
end;

class function TFuncUtils.Split(const Delimitador: Char; const Texto: string)
  : TStrings;
begin
  Result := TStringList.Create;
  Self.Split(Delimitador, Texto, Result);
end;

class function TFuncUtils.StrSetInString(const AString: string;
  const AStrSet: array of string): Boolean;
var
  str: string;
begin
  Result := False;

  for str in AStrSet do
    if str = AString then
    begin
      Result := true;
      break;
    end;
end;

class function TFuncUtils.StrToEnumerado(var ok: Boolean; const s: string;
  const AString: array of string; const AEnumerados: array of variant)
  : variant;
var
  i: Integer;
begin
  Result := -1;
  for i := Low(AString) to High(AString) do
    if AnsiSameText(s, AString[i]) then
      Result := AEnumerados[i];
  ok := Result <> -1;
  if not ok then
    Result := AEnumerados[0];
end;

class function TFuncUtils.TextoAlinha(Alinha: Char; tamTexto: integer; Texto,
  TextoPrePos: string; Caracter: Char): String;
var
I, Tamanho : integer;
    function Espaco(Qtde: integer; Caracter : Char = ' ') : String;
    var
      iConta : integer;
    begin
         Result := '';
         For iConta := 1 To Qtde Do
           Result := Result + Caracter;
    end;
begin
    try
      Tamanho := TamTexto;
      case Alinha of
      'D':Begin
               if (Length(TextoPrePos) + Length(Texto)) >= tamTexto then
                 texto := copy(Texto,1,TamTexto);
               TamTexto := (TamTexto - Length(TextoPrePos) - Length(Texto));
               Result   := TextoPrePos + Espaco(TamTexto, Caracter) + Texto;
          end;
      'C':Begin
              if Length(Texto) >= TamTexto then
                texto := copy(Texto,1,TamTexto);
              TamTexto := Trunc((TamTexto - Length(Texto)) /2);
              Result   := Espaco(TamTexto, Caracter) + Texto + Espaco(TamTexto, Caracter);
          end;
      'E':Begin
              if Length(Texto) >= TamTexto then
                texto := copy(Texto,1,TamTexto);
              TamTexto := (TamTexto - Length(Texto) - Length(TextoPrePos));
              Result   := Texto + Espaco(TamTexto, Caracter) + TextoPrePos;
          end;
      end;

    if (Tamanho - Length(Result)) >= 0 then
      Result := Result + Espaco(Tamanho - Length(Result));

    except
        case Alinha of
          'D' : raise Exception.Create('N�o foi possivel alinhar a direita o texto para impress�o.');
          'C' : raise Exception.Create('N�o foi possivel centralizar o texto para impress�o.');
          'E' : raise Exception.Create('N�o foi possivel alinhar a esquerda o texto para impress�o.');
        end;
    end;
end;

class function TFuncUtils.Truncar(AValor: Double; ACasas: shortint): Double;
var
  i: Integer;
  a, vlr: Double;
  oldNum, newNum: string;
begin
  a := 1;

  case ACasas of
    1:
      a := 10;
  else
    for i := 1 to ACasas do
      a := a * 10;
  end;

  oldNum := FloatToStr(AValor * a);

  for i := 1 to Length(oldNum) do
    if oldNum[i] = FormatSettings.DecimalSeparator then
      break
    else
      newNum := newNum + oldNum[i];

  vlr := StrToInt64(newNum) / a;

  Result := vlr;
end;

class function TFuncUtils.ValidaCPFeCNPJ(sValue: String): Boolean;
begin
  Result := true;

  if not(trim(sValue) = '') then
  Begin
    sValue := RetiraCaracteresCPF_CGC(sValue);

    if Length(sValue) = 11 then
      Result := TFuncUtils.CPF_Valido(sValue)
    else if Length(sValue) = 14 then
      Result := TFuncUtils.CGC_Valido(sValue)
    else
      Result := False;

    if not(Result) then
      Application.MessageBox(
        'O CPF/CNPJ informado n�o e v�lido!!! Favor informar o CPF/CNPJ correto para prosseguir. ', 'ATEN��O!', MB_ICONINFORMATION);
  End;
  //
end;

class function TFuncUtils.ValidarChaveNFe(const ChaveNFe: string): Boolean;
const
  PESO: Array [0 .. 43] of Integer = (4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8,
    7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8,
    7, 6, 5, 4, 3, 2, 0);
var
  Retorno: Boolean;
  aChave: Array [0 .. 43] of Char;
  Soma: Integer;
  Verif: Integer;
  i: Integer;
begin
  Retorno := False;
  try
    try
      if not Length(ChaveNFe) = 44 then
        raise Exception.Create('');

      StrPCopy(aChave, StringReplace(ChaveNFe, ' ', '', [rfReplaceAll]));
      Soma := 0;
      for i := Low(aChave) to High(aChave) do
        Soma := Soma + (StrToInt(aChave[i]) * PESO[i]);

      if Soma = 0 then
        raise Exception.Create('');

      Soma := Soma - (11 * (Trunc(Soma / 11)));
      if (Soma = 0) or (Soma = 1) then
        Verif := 0
      else
        Verif := 11 - Soma;

      Retorno := Verif = StrToInt(aChave[43]);
    except
      Retorno := False;
    end;
  finally
    Result := Retorno;
  end;
end;

class function TFuncUtils.ValidNumericField(ANumericField: TNumericField)
  : Boolean;
begin
  Result := true;
  //
  if ANumericField.Value > 0 then
    Exit;
  //
  Application.MessageBox(PChar('O campo "' + ANumericField.DisplayLabel +
        '" n�o pode estar vazio, igual a zero ou com valor negativo.'),
    'ATEN��O!', MB_ICONINFORMATION);
  //
  Result := False;
end;

class function TFuncUtils.ValidRequiredFields(ADataset: TDataSet): Boolean;
var
  i: Integer;
begin
  Result := true;
  //
  for i := 0 to (ADataset.FieldCount - 1) do
    if ADataset.Fields[i].Required then
    begin
      if ((ADataset.Fields[i].IsNull) or (trim(ADataset.Fields[i].Value) = '')
        ) then
      begin
        Application.MessageBox
          (PChar('O campo "' + ADataset.Fields[i].DisplayLabel +
              '" n�o pode ficar vazio.'), 'AVISO', MB_ICONINFORMATION);
        ADataset.Fields[i].FocusControl;
        Result := False;
        Exit;
      end
      else if (ADataset.Fields[i].DataType = ftFMTBcd) and
        (ADataset.Fields[i].Value <= 0) then
      begin
        Application.MessageBox
          (PChar('O campo "' + ADataset.Fields[i].DisplayLabel +
              '" n�o pode ficar zerado ou negativo.'), 'AVISO',
          MB_ICONINFORMATION);
        ADataset.Fields[i].FocusControl;
        Result := False;
        Exit;
      end;
    end
    else if (ADataset.Fields[i].DataType = ftFMTBcd) and
      (ADataset.Fields[i].Value < 0) then
    begin
      Application.MessageBox
        (PChar('O campo "' + ADataset.Fields[i].DisplayLabel +
            '" n�o pode ficar negativo.'), 'AVISO', MB_ICONINFORMATION);
      ADataset.Fields[i].FocusControl;
      Result := False;
      Exit;
    end;
end;

class function TFuncUtils.ValorExtenso(Valor: Double): String;
const
  unidade: array [1 .. 19] of string = ('um', 'dois', 'tr�s', 'quatro',
    'cinco', 'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze', 'treze',
    'quatorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito', 'dezenove');
  centena: array [1 .. 9] of string = ('cento', 'duzentos', 'trezentos',
    'quatrocentos', 'quinhentos', 'seiscentos', 'setecentos', 'oitocentos',
    'novecentos');
  dezena: array [2 .. 9] of string = ('vinte', 'trinta', 'quarenta',
    'cinquenta', 'sessenta', 'setenta', 'oitenta', 'noventa');
  qualificaS: array [0 .. 4] of string = ('', 'mil', 'milh�o', 'bilh�o',
    'trilh�o');
  qualificaP: array [0 .. 4] of string = ('', 'mil', 'milh�es', 'bilh�es',
    'trilh�es');
var
  inteiro: Int64;
  resto: Extended;
  dVlrTMP : Double;
  vlrS, s, sAux, vlrP, centavos: string;
  N, unid, dez, cent, tam, i: Integer;
  umReal, tem: Boolean;
begin
  dVlrTMP := Valor;
  if (Valor = 0) then
  begin
    ValorExtenso := 'zero';
    Exit;
  end
  else if Valor < 0 then
      dVlrTMP := (Valor * -1);

  with Self.SliceValue(dVlrTMP) do
  begin
    inteiro := Int; // parte inteira do valor
    resto := Frac; // parte fracion�ria do valor
  end;

  vlrS := IntToStr(inteiro);

  if (Length(vlrS) > 15) then
  begin
    ValorExtenso := 'Erro: valor superior a 999 trilh�es.';
    Exit;
  end;

  s := '';
  centavos := IntToStr(Round(resto * 100));

  // definindo o extenso da parte inteira do valor
  i := 0;
  umReal := False;
  tem := False;
  while (vlrS <> '0') do
  begin
    tam := Length(vlrS);
    // retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
    // 1a. parte = 789 (centena)
    // 2a. parte = 456 (mil)
    // 3a. parte = 123 (milh�es)
    if (tam > 3) then
    begin
      vlrP := copy(vlrS, tam - 2, tam);
      vlrS := copy(vlrS, 1, tam - 3);
    end
    else
    begin // �ltima parte do valor
      vlrP := vlrS;
      vlrS := '0';
    end;
    if (vlrP <> '000') then
    begin
      sAux := '';
      if (vlrP = '100') then
        sAux := 'cem'
      else
      begin
        N := StrToInt(vlrP); // para n = 371, tem-se:
        cent := N div 100; // cent = 3 (centena trezentos)
        dez := (N mod 100) div 10; // dez  = 7 (dezena setenta)
        unid := (N mod 100) mod 10; // unid = 1 (unidade um)
        if (cent <> 0) then
          sAux := centena[cent];
        if ((dez <> 0) or (unid <> 0)) then
        begin
          if ((N mod 100) <= 19) then
          begin
            if (Length(sAux) <> 0) then
              sAux := sAux + ' e ' + unidade[N mod 100]
            else
              sAux := unidade[N mod 100];
          end
          else
          begin
            if (Length(sAux) <> 0) then
              sAux := sAux + ' e ' + dezena[dez]
            else
              sAux := dezena[dez];
            if (unid <> 0) then
              if (Length(sAux) <> 0) then
                sAux := sAux + ' e ' + unidade[unid]
              else
                sAux := unidade[unid];
          end;
        end;
      end;
      if ((vlrP = '1') or (vlrP = '001')) then
      begin
        if (i = 0) // 1a. parte do valor (um real)
          then
          umReal := true
        else
          sAux := sAux + ' ' + qualificaS[i];
      end
      else if (i <> 0) then
        sAux := sAux + ' ' + qualificaP[i];
      if (Length(s) <> 0) then
        s := sAux + ', ' + s
      else
        s := sAux;
    end;
    if (((i = 0) or (i = 1)) and (Length(s) <> 0)) then
      tem := true; // tem centena ou mil no valor
    i := i + 1; // pr�ximo qualificador: 1- mil, 2- milh�o, 3- bilh�o, ...
  end;

  if (Length(s) <> 0) then
  begin
    if (umReal) then
      s := s + ' real'
    else if (tem) then
      s := s + ' reais'
    else
      s := s + ' de reais';
  end;
  // definindo o extenso dos centavos do valor
  if (centavos <> '0') // valor com centavos
    then
  begin
    if (Length(s) <> 0) // se n�o � valor somente com centavos
      then
      s := s + ' e ';
    if (centavos = '1') then
      s := s + 'um centavo'
    else
    begin
      N := StrToInt(centavos);
      if (N <= 19) then
        s := s + unidade[N]
      else
      begin // para n = 37, tem-se:
        unid := N mod 10; // unid = 37 % 10 = 7 (unidade sete)
        dez := N div 10; // dez  = 37 / 10 = 3 (dezena trinta)
        s := s + dezena[dez];
        if (unid <> 0) then
          s := s + ' e ' + unidade[unid];
      end;
      s := s + ' centavos';
    end;
  end;
  ValorExtenso := s;
end;

class procedure TFuncUtils.VerificaDbEditNegativo(Field: TField);
begin
  if (Field is TBCDField) or (Field is TIntegerField) or
    (Field is TNumericField) then
    if Field.Value < 0 then
    begin
      Application.MessageBox(PChar('O campo "' + Field.DisplayLabel +
            '" n�o pode ficar negativo. Insira um valor positivo!'),
        'ATEN��O!', MB_OK + MB_ICONINFORMATION);
      Field.FocusControl;
      Abort;
    end;
end;

end.
