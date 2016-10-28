unit U_Backup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ZipMstr, DB,  DBClient, GIFImg,
  IniFiles;

type
  Tfrm_Backup = class(TForm)
    Panel1: TPanel;
    pnl_status: TPanel;
    Zip: TZipMaster;
    ProgressBar1: TProgressBar;
    lbl_tamanho: TLabel;
    memo_log: TMemo;
    Image1: TImage;
    Monitora: TTimer;
    SaveDialogZip: TSaveDialog;
    procedure ZipProgress(Sender: TObject; details: TZMProgressDetails);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MonitoraTimer(Sender: TObject);
  private
    FPath: string;
    FCompleteMsg: boolean;
    bFechaTela : Boolean;
    procedure ExecutaRotinas;
    function MaquinaEstaLogada(DBName, ProgramName, HostName: string): Boolean;
    Function WinExecAndWait(const Path:  PChar; const Visibility:  Word; const Wait:  Boolean):  Boolean;
  public
    class procedure GerarBackup(const Path: string; const CompleteMsg: boolean = True);
  end;

var
  frm_Backup: Tfrm_Backup;

implementation

{$R *.dfm}

uses GifImage, U_DMRet, U_FuncUtils;

class procedure Tfrm_Backup.GerarBackup(const Path: string; const CompleteMsg: boolean = True);
begin
  with Tfrm_Backup.Create(nil) do
  try
    FPath := Path;
    FCompleteMsg := CompleteMsg;
    ShowModal;
  finally
    Free;
  end;
end;

function Tfrm_Backup.MaquinaEstaLogada(DBName, ProgramName,
  HostName: string): Boolean;
const
  {$REGION 'Comandos SQL 2000 e 2008'}
  SQL_VERSION =
    ' SELECT COUNT(*) WHERE @@VERSION LIKE ''Microsoft SQL Server  2000%''';

  SQL_V2000 =
    ' CREATE TABLE MAQ(' +
    '	  SPID INT,' +
    '   Status VARCHAR(265),' +
    '   LOGIN VARCHAR(265),' +
    '   HostName VARCHAR(265),' +
    '   BlkBy VARCHAR(265),' +
    '   DBName VARCHAR(265),' +
    '   Command VARCHAR(265),' +
    '   CPUTime INT,' +
    '   DiskIO INT,' +
    '   LastBatch VARCHAR(265),' +
    '   ProgramName VARCHAR(265),' +
    '   SPID_1 INT' +
    ' )' ;

    SQL_V2008 =
    ' CREATE TABLE MAQ(' +
    '	  SPID INT,' +
    '   Status VARCHAR(265),' +
    '   LOGIN VARCHAR(265),' +
    '   HostName VARCHAR(265),' +
    '   BlkBy VARCHAR(265),' +
    '   DBName VARCHAR(265),' +
    '   Command VARCHAR(265),' +
    '   CPUTime INT,' +
    '   DiskIO INT,' +
    '   LastBatch VARCHAR(265),' +
    '   ProgramName VARCHAR(265),' +
    '   SPID_1 INT,' +
    '   REQUESTID INT' +
    ' )';

  SQL_INS_MAQ =
    ' INSERT INTO MAQ EXEC SP_WHO2';

  SQL_MAQ =
    ' SELECT' +
    '	  COUNT(*)' +
    ' FROM' +
    '	  MAQ' +
    ' WHERE' +
    '	  DBName = :DBName and' +
    '	  ProgramName = :ProgramName and' +
    '	  HostName = :HostName';

  SQL_DROP_MAQ =
    ' DROP TABLE MAQ';

  {$ENDREGION}
begin
  Result := False;

  try
    //Cria tabela temporária de acordo com a versão do SQL Server
    if DMRet.OpenSQL(SQL_VERSION,[]) > 0 then
      DMRet.ExecuteSQL(SQL_V2000,[])
    else
      DMRet.ExecuteSQL(SQL_V2008,[]);

    //Insere o resultado de "SP_WHO2" na tabela criada
    DMRet.ExecuteSQL(SQL_INS_MAQ,[]);

    //Consulta na tabela temporaria
    Result := DMRet.OpenSQL(SQL_MAQ,[DBName, ProgramName, HostName]) > 0;
  finally
    //Drop na tabela temporária
    DMRet.ExecuteSQL(SQL_DROP_MAQ,[]);
  end;
end;

procedure Tfrm_Backup.MonitoraTimer(Sender: TObject);
begin
  if bFechaTela then Close;
end;

function Tfrm_Backup.WinExecAndWait(const Path: PChar; const Visibility: Word;
  const Wait: Boolean): Boolean;
var
  ProcessInformation:  TProcessInformation;
  StartupInfo:  TStartupInfo;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
  begin
    cb          := SizeOf(TStartupInfo);
    lpReserved  := NIL;
    lpDesktop   := NIL;
    lpTitle     := NIL;
    dwFlags     := STARTF_USESHOWWINDOW;
    wShowWindow := Visibility;
    cbReserved2 := 0;
    lpReserved2 := NIL
  end;

  result := CreateProcess(NIL,       {address of module name}
                          Path,      {address of command line}
                          NIL,       {address of process security attributes}
                          NIL,       {address of thread security attributes}
                          FALSE,     {new process inherits handle}
                          NORMAL_PRIORITY_CLASS,   {creation flags}
                          NIL,       {address of new environment block}
                          NIL,       {address of current directory name}
                          StartupInfo,
                          ProcessInformation);
  if Result then
  begin
    with ProcessInformation do
    begin
      if Wait then
      WaitForSingleObject(hProcess, INFINITE);
      CloseHandle(hThread);
      CloseHandle(hProcess)
    end;
   end;

end;

procedure Tfrm_Backup.ZipProgress(Sender: TObject;
  details: TZMProgressDetails);
var
  s: String;
begin
    case details.Order of
           NewFile: ProgressBar1.Position := 0;   // item percent
          NewExtra: ProgressBar1.Position := 0;
        EndOfBatch:
          begin
            ProgressBar1.Position := 0;
            lbl_tamanho.Caption := '';
          end;
        ProgressUpdate:
          begin
            ProgressBar1.Position := details.TotalPerCent;
            s := 'Total = ' + IntToStr(details.TotalSize)
              + ' Position = ' + IntToStr(details.TotalPosition)
              + ' Written = ' + IntToStr(details.BytesWritten);
            lbl_tamanho.Caption := 'Status em bytes - '+s;
          end;
        ExtraUpdate: ProgressBar1.Position := details.ItemPerCent;
      end;
end;



procedure Tfrm_Backup.ExecutaRotinas;
const
  SQL_PARAMS =
    ' select '+
    '   PAR_BACKUPDEVICE, PAR_BACKUPORIGEM, '+
    '   PAR_BACKUPORIGEM, PAR_BACKUPDESTINO, PAR_CAMINHOWZP '+
    ' from '+
    ' 	PARAMS ';

  SQL_DEVICE =
    'select COUNT(*) from master.dbo.sysdevices where name = :device';

  INS_DEVICE =
    'EXEC sp_addumpdevice ''disk'', ''%s'', ''%s''';

  SQL_ALT_MAQ_BKP =
    'UPDATE PARAMS SET PAR_MAQ_BKP = :PAR_MAQ_BKP';

  SQL_MAQ_BKP =
    'SELECT ISNULL(PAR_MAQ_BKP,'''') FROM PARAMS';
var
  erro : Boolean;
  iTamanho : integer;
  sSql, sDatabase, sDevice, sSysZip, sDirOrigem, sArquivo, sDest_Drive, sDest_Dir,
  sDest_Path, sDest_Name, sDest_Ext, sDest_Zip, sMsgLog,
  Msg, DBName, ProgramName, HostName: string;
  MaqBackup: Variant;
  ProcID: Cardinal;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + 'ComporDbCfg.ini') do
  try
    DBName := ReadString('SQLSERVER', 'Banco', 'Estoque');
  finally
    Free;
  end;

  ProgramName := ExtractFileName(Application.ExeName);
  MaqBackup   := DMRet.OpenSQL(SQL_MAQ_BKP,[]);
  HostName    := DMRet.OpenSQL('select HOST_NAME()',[]);

  //verfica se a maquina que vai iniciar o backup já está logada
  if (MaqBackup <> '') and MaquinaEstaLogada(DBName, ProgramName, MaqBackup) then
  begin
    bFechaTela := True;
    Screen.Cursor := crDefault;

    Msg :=
      'O backup não foi iniciado!' + #13#10 +
      ' Já está sendo executado em outra máquina!';

    MessageBox(handle,PChar(Msg),'ATENÇÃO!',MB_ICONEXCLAMATION + MB_OK);
    Exit;
  end;

  erro := False;

  memo_log.Lines.Add('Iniciando o Backup...');
  Sleep(500);
  update;

  try
    Screen.Cursor := crHourGlass;

    sDatabase := DMRet.Con.Params.Values['DataBase']; // GetDatabaseConect;

    {$REGION 'Lendo Informações no Banco de Dados'}
    with TClientDataSet.Create(Self) do
    try
      Data := DMRet.GetData(SQL_PARAMS,[]);
      //
      if not(IsEmpty) then
      begin
          sDevice     := Trim(FieldByName('PAR_BACKUPDEVICE').AsString);
          sDirOrigem  := Trim(FieldByName('PAR_BACKUPORIGEM').AsString);
          sArquivo    := sDirOrigem+'\'+sDevice+'.bak';
          sDest_Zip   := Trim(FieldByName('PAR_BACKUPDESTINO').AsString);
          sSysZip     := Trim(FieldByName('PAR_CAMINHOWZP').AsString);
      end;
    finally
       Free;
    end;
    {$ENDREGION}

//    if sDestBkp = 'S' then
//    begin
//      if not SaveDialogZip.Execute() then
//        Exit;
//
//      sDest_Zip := SaveDialogZip.FileName;
//    end;
    if FPath <> '' then
      sDest_Zip := FPath;

    memo_log.Lines.Add(' ');
    memo_log.Lines.Add('Consultados dados de configuração do backup');
    Sleep(500);
    update;

    //Validando se o Device foi configurado no Sql server
    if DMRet.OpenSQL(SQL_DEVICE,[sDevice]) = 0 then
    Begin
      sSql := Format(INS_DEVICE, [sDevice, sArquivo]);
      DMRet.ExecuteSQL(sSql,[]);
    End;

    memo_log.Lines.Add(' ');
    memo_log.Lines.Add('Executando as rotinas de backup do SQL SERVER');
    Sleep(500);
    update;

    //altera o nome da maquina que iniciou o backup
    DMRet.ExecuteSQL(SQL_ALT_MAQ_BKP,[HostName]);

    {$REGION 'Executando rotinas de backup no SQL server'}
    sSql := 'BACKUP DATABASE ['+sDatabase+'] TO ['+sDevice+'] WITH  INIT,  NOUNLOAD,  NOSKIP,  STATS = 1,  NOFORMAT';
    try
      DMRet.ExecuteSQL(sSql,[]);

      DMRet.ExecuteSQL('update PARAMS set PAR_BACKUP_DATA = GETDATE()', []);

      memo_log.Lines.Add(' ');
      memo_log.Lines.Add('Backup do SQL SERVER executado');
      Sleep(500);
      update;
    except
      on E: Exception do
      Begin
         erro := True;
         sMsgLog :=  'Não foi possível executar o backup no SQL Server '^m+
                     'Entre em contato com a DATACAMP e informe o erro!'^m+
                     ' '^m+
                     'Erro: '+E.Message;

         memo_log.Lines.Add(sMsgLog);

         MessageDlg(pchar(sMsgLog), mtError, [mbOk], 0);
         exit;
      End;
    end;
    {$ENDREGION}

    {$REGION 'Formatando o Destino do arquivo Compactado'}
    sDest_Drive := ExtractFileDrive(sDest_Zip);
    sDest_Dir   := ExtractFileDir(sDest_Zip);
    sDest_Path  := ExtractFilePath(sDest_Zip);
    sDest_Name  := ExtractFileName(sDest_Zip);
    sDest_Ext   := ExtractFileExt(sDest_Zip);

    if (sDest_Zip = '') or (sDest_Drive = '') then
       sDest_Zip := 'C:\Backup.zip'
    else
    Begin
         iTamanho := Length(sDest_Path);
         if (iTamanho = 2) and (copy(sDest_Path, iTamanho,1)= ':') then
             sDest_Path := sDest_Path + '\';

         if not(sDest_Dir = '') then
          if not DirectoryExists(sDest_Dir) then
            ForceDirectories(sDest_Dir);

         if (sDest_Ext = '') then
             sDest_Ext := '.zip';

         if (sDest_Name = '') then
             sDest_Name := 'Backup'+sDest_Ext;

          sDest_Zip := sDest_Path + sDest_Name;
    end;
    DMRet.ExecuteSQL('update params set PAR_BACKUPDESTINO = :org',[sDest_Zip]);
    {$ENDREGION}

    //Deletando arquivo zipado anteriormente, a fim de evitar erro
    //ao compactar o arquivo por diferentes programas
    if FileExists(sDest_Zip) then
      DeleteFile(sDest_Zip);

    iTamanho := Length(sArquivo);
    if (iTamanho >= 2) and not(copy(sArquivo, 1,2)= '\\') then
    Begin
      {$REGION 'Compactando Local pela Dll DelZip190.dll'}
      try
            memo_log.Lines.Add(' ');
            memo_log.Lines.Add('Compactando arquivo '+sArquivo);
            Sleep(500);
            update;

            zip.ZipFileName := sDest_Zip;
            zip.FSpecArgs.Clear;
            zip.FSpecArgs.Add(sArquivo);
            pnl_status.Visible := True;
            lbl_tamanho.Caption := '';
            zip.Add;

            if zip.SuccessCnt = 0 then
            begin
                MessageDlg('Não foi possível criar o arquivo compactado, '^m+
                           'Entre em contato com a DATACAMP', mtError, [mbOk], 0);

                erro := True;
            end;
        except
           on E: Exception do
           Begin
               erro := True;
               sMsgLog :=  'Ocrorreu um erro ao tentar compactar com a DelZip190.dll '^m+
                           'Entre em contato com a DATACAMP e informe o erro!'^m+
                           ' '^m+
                           'Erro: '+E.Message;

               memo_log.Lines.Add(sMsgLog);

               MessageDlg(pchar(sMsgLog), mtError, [mbOk], 0);
           End;
      end;
      {$ENDREGION}
    End
    else
    Begin
      {$REGION 'Compactando em Rede utilizando Winrar ou Winzip'}
      try

        WinExecandWait(Pchar(sSysZip+'\winrar\rar.exe a -ep ' +sDest_Zip+' '+sDirOrigem), SW_SHOWNORMAL, True);

         if WinExec(PAnsiChar(AnsiString(sSysZip+'\winzip\winzip32.exe -a '+sDest_Zip+' '+sDirOrigem)), SW_SHOW) < 32 then
          if WinExec(PAnsiChar(AnsiString(sSysZip+'\winrar\rar.exe a -ep ' +sDest_Zip+' '+sDirOrigem)), SW_SHOW) < 32 then
          begin
            MessageDlg('Não foi possível criar o arquivo compactado, '^m+
                       'verifique o caminho da intalação do Winzip/Winrar, '^m+
                       'ou entre em contato com o Administrador do sistema!', mtError, [mbOk], 0);

            erro := True;
          end;
       except
           on E: Exception do
           Begin
               erro := True;
               sMsgLog :=  'Ocrorreu um erro ao tentar compactar com Winzip/Winrar, '^m+
                           'Entre em contato com a DATACAMP e informe o erro!'^m+
                           ' '^m+
                           'Erro: '+E.Message;

               memo_log.Lines.Add(sMsgLog);

               MessageDlg(pchar(sMsgLog), mtError, [mbOk], 0);
           End;
      end;
      {$ENDREGION}
    End;

    memo_log.Lines.Add(' ');
    if NOT erro then
    Begin
      memo_log.Lines.Add('Arquivo compactado com sucesso');
      memo_log.Lines.Add(sDest_Zip);
    End
    else
    Begin
      memo_log.Lines.Add('Não foi possível criar o arquivo compactado, ');
      memo_log.Lines.Add('Entre em contato com a DATACAMP');
    End;
    Sleep(500);
    update;
    //
  finally
    bFechaTela := True;
    Screen.Cursor := crDefault;

    //limpa o nome da máquina que iniciou o backup
    DMRet.ExecuteSQL(SQL_ALT_MAQ_BKP,[NULL]);
  end;

  if erro then
    ShowMessage('Ocorreu um erro no processo de geração do backup, entre em contato com a DATACAMP.')
  else if FCompleteMsg then
    ShowMessage('Processo de Backup Terminado sem erros!');
  //
end;

procedure Tfrm_Backup.FormActivate(Sender: TObject);
begin
  //Executa rotinas de backup automático
  ExecutaRotinas;
end;

procedure Tfrm_Backup.FormCreate(Sender: TObject);
begin
  bFechaTela := False;
  TFuncUtils.DesabilitarGhostingDoWindows;
end;

end.
