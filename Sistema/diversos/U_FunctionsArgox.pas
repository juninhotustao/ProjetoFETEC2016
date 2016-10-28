unit U_FunctionsArgox;

interface

type
  TFuncArgox = class
  private
    FDll: HMODULE;
  public
    {$REGION 'Metodos da DLL'}
    A_Set_Darkness: function(darkness: integer): integer; stdcall;
    A_CreatePrn: function(selection: integer; FileName: pchar): integer; stdcall;
    A_Print_Out: function(width, height, copies, amount: integer): integer; stdcall;
    A_Prn_Text: function(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall;
    A_Prn_Barcode: function(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall;
    A_Prn_Text_TrueType: function(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall;
    A_Get_Graphic: function(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall;
    A_Draw_Box: function(mode: char; x, y, width, height, top, side: integer): integer; stdcall;
    A_Draw_Line: function(mode: char; x, y, width, height: integer): integer; stdcall;
    A_CreateUSBPort: function(nPort: integer): integer; stdcall;
    A_Clear_Memory: procedure; stdcall;
    A_ClosePrn: procedure; stdcall;
    {$ENDREGION}
    constructor Create; overload;
    destructor Destroy; override;
  end;

implementation

uses Windows, SysUtils, U_FuncUtils;

{ TFuncArgox }

constructor TFuncArgox.Create;
begin
  FDll := LoadLibrary('WINPPLA.DLL');

  if FDll = 0 then
    raise Exception.Create('Não foi encontrado o arquivo "Winppla.dll" ou um de seus dependentes');
  //

  @A_Set_Darkness      := TFuncUtils.GetFunction(FDll, 'A_Set_Darkness');
  @A_CreatePrn         := TFuncUtils.GetFunction(FDll, 'A_CreatePrn');
  @A_Print_Out         := TFuncUtils.GetFunction(FDll, 'A_Print_Out');
  @A_Prn_Text          := TFuncUtils.GetFunction(FDll, 'A_Prn_Text');;
  @A_Prn_Barcode       := TFuncUtils.GetFunction(FDll, 'A_Prn_Barcode');
  @A_Prn_Text_TrueType := TFuncUtils.GetFunction(FDll, 'A_Prn_Text_TrueType');
  @A_Get_Graphic       := TFuncUtils.GetFunction(FDll, 'A_Get_Graphic');
  @A_Draw_Box          := TFuncUtils.GetFunction(FDll, 'A_Draw_Box');
  @A_Draw_Line         := TFuncUtils.GetFunction(FDll, 'A_Draw_Line');
  @A_Clear_Memory      := TFuncUtils.GetFunction(FDll, 'A_Clear_Memory');
  @A_ClosePrn          := TFuncUtils.GetFunction(FDll, 'A_ClosePrn');
  @A_CreateUSBPort     := TFuncUtils.GetFunction(FDll, 'A_CreateUSBPort');
end;

destructor TFuncArgox.Destroy;
begin
  FreeLibrary(FDll);
  inherited;
end;

end.
