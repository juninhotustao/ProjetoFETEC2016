unit U_ExportaArquivo;

interface

uses
  Windows, SysUtils, Graphics, StdCtrls, Forms, Controls, Dialogs, DB, ADODB,
  Messages, Variants, DBCtrls, Classes, DBClient, ppParameter, ppBands,
  ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe;

type
  TExportaArquivo = class
    class procedure SaveToFile(QRY:TADOQuery; Tabela: string); overload;
    class procedure SaveToFile(QRY:TADOQuery; Tabela: string; out Caminho: string); overload;
    class procedure SaveToPDF(RelExport: TppReport; var sPath: string);
  end;

implementation

uses U_DMRet, U_FuncUtils;

{ TExportaArquivo }

/// <summary>
///   padronizando a Geração dos arquivos - Rodrigo Lima
/// </summary>
class procedure TExportaArquivo.SaveToFile(QRY:TADOQuery; Tabela: string);
var
  path: string;
begin
  SaveToFile(QRY, Tabela, path);
end;

class procedure TExportaArquivo.SaveToFile(QRY:TADOQuery; Tabela: string; out Caminho: string);
const
  SQL_PARAMS = 'select PAR_ARQ_EXP_CAMINHO from PARAMS';
var
  path: string;
  serverPath: variant;
begin
  serverPath := DMRet.OpenSQL(SQL_PARAMS, []);

  if not VarIsNull(serverPath) and (Trim(serverPath) <> '') then
  Begin
      path := serverPath;

      if not DirectoryExists(path) then
       raise Exception.CreateFmt('Não foi encontrado o caminho: %s '+#13#10#13#10+
                                 'A operação será abortada até a criação do caminho acima!', [path]);
  End
  else
  begin
      path := ExtractFileDir(Application.ExeName) + '\Exportação';

      //Se a Pasta não existir ela será criada Automaticamente
      if not DirectoryExists(path) then CreateDir(path);
  end;

  Caminho := path;
  path    := path+'\'+Tabela+'.adtg';

  QRY.SaveToFile(path, pfADTG);
end;

class procedure TExportaArquivo.SaveToPDF(RelExport: TppReport;
  var sPath: string);
var
   sFileExt, sFileName, sFilePath, OldDeviceType : string;

   OldAllowPrintToArchive, OldAllowPrintToFile, OldSaveAsTemplate,
   OldSavePrinterSetup, OldShowPrintDialog : Boolean;
begin

    if trim(sPath) = '' then
    Begin
        with TSaveDialog.Create(nil) do
        try
          // Give the dialog a title
          Title := 'Exportando para PDF';

          //Se a Pasta não existir ela será criada Automaticamente
          sFilePath := GetCurrentDir + '\PDF';
          if not DirectoryExists(sFilePath) then
            ForceDirectories(sFilePath);

          // Set up the starting directory to be the current one
          InitialDir := sFilePath;

          // Allow only .txt and .doc file types to be saved
          Filter := 'Exportar para PDF|*.pdf';

          // Set the default extension
          DefaultExt := 'pdf';

          // Select text files as the starting filter type
          FilterIndex := 1;

           if Execute then
             sPath := FileName;
        finally
          Free;
        end;
    End;

    if trim(sPath) = '' then
      raise Exception.Create('É Obrigatório informar um local para salvar o PDF!');

    sFilePath := ExtractFilePath(sPath);
    sFileExt  := ExtractFileExt(sPath);
    sFileName := ExtractFileName(sPath);

    if (Trim(sFileExt) = '') or not(Trim(sFileExt) = '.pdf') then
      sPath := StringReplace(sPath, sFileExt, '.pdf', [rfReplaceAll]);

    //Se a Pasta não existir ela será criada Automaticamente
    if not DirectoryExists(sFilePath) then
        ForceDirectories(sFilePath);

    with RelExport do
    try
        OldAllowPrintToArchive := AllowPrintToArchive;
        OldAllowPrintToFile    := AllowPrintToFile;
        OldDeviceType          := DeviceType;
        OldSaveAsTemplate      := SaveAsTemplate;
        OldSavePrinterSetup    := SavePrinterSetup;
        OldShowPrintDialog     := ShowPrintDialog;

        AllowPrintToArchive := True;
        AllowPrintToFile    := True;
        DeviceType          := 'PDF';
        ArchiveFileName     := sPath;
        TextFileName        := sPath;
        SaveAsTemplate      := True;
        SavePrinterSetup    := True;
        ShowPrintDialog     := False;
        Print;
    finally
        AllowPrintToArchive := OldAllowPrintToArchive;
        AllowPrintToFile    := OldAllowPrintToFile;
        DeviceType          := OldDeviceType;
        SaveAsTemplate      := OldSaveAsTemplate;
        SavePrinterSetup    := OldSavePrinterSetup;
        ShowPrintDialog     := OldShowPrintDialog;
    end;
end;

end.
