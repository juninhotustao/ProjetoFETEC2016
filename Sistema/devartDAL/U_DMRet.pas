unit U_DMRet;

interface

uses
  SysUtils, Classes, WideStrings, DB, FMTBcd, SqlExpr, DBXDevartSQLServer;

type
  TDMRet = class(TDataModule)
    QryAux: TSQLQuery;
    Con: TSQLConnection;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConBeforeConnect(Sender: TObject);
  private
//    procedure SetParams(const Values: array of Variant; var DataSet: TDataSet);
  public
    function GetData(ASQL: string; Parameters: array of Variant): OleVariant;
    function OpenSQL(ASQL: string; Parameters: array of Variant): Variant;
    procedure ExecuteSQL(ASQL: string; Parameters: array of Variant);
  end;

var
  DMRet: TDMRet;

implementation

uses Variants, Provider, DBClient, Vcl.Forms, ActiveX;

{$R *.dfm}

procedure TDMRet.ConBeforeConnect(Sender: TObject);
var
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + 'dbxconnections.ini';
  Con.Connected := False;
  Con.LoadParamsFromIniFile(Path);
  Con.Params.Values['User_Name'] := 'sa';
  Con.Params.Values['Password']  := 'aram98';
end;

procedure TDMRet.DataModuleDestroy(Sender: TObject);
begin
  Con.CloseDataSets;
  Con.Close;
end;

procedure TDMRet.ExecuteSQL(ASQL: string; Parameters: array of Variant);
var
  QRY: TSQLQuery;
  i: integer;
begin
  QRY := TSQLQuery.Create(Self);

  try
    QRY.SQLConnection := Con;
    QRY.GetMetadata   := False;
    QRY.SQL.Text      := ASQL;

    for i := 0 to High(Parameters) do
      if VarIsNull(Parameters[i]) or VarIsClear(Parameters[i]) then
      begin
        QRY.Params[i].AsString := '';
        QRY.Params[i].Clear;
      end else
        QRY.Params[i].Value := Parameters[i];
      //

    try
      QRY.ExecSQL();
    except
      on E: Exception do
        raise Exception.Create(E.Message + #13#10 + ASQL);
    end;
  finally
    QRY.Free;
  end;

end;

function TDMRet.GetData(ASQL: string; Parameters: array of Variant): OleVariant;
var
  QRY: TSQLQuery;
  DSP: TDataSetProvider;
  CDS: TClientDataSet;
  i: integer;
begin
  QRY := TSQLQuery.Create(Self);
  DSP := TDataSetProvider.Create(Self);
  CDS := TClientDataSet.Create(Self);

  try
    QRY.SQLConnection := Con;
    QRY.GetMetadata   := False;
    DSP.Options       := [poAllowCommandText, poRetainServerOrder];
    DSP.Name          := '_DSP';
    DSP.DataSet       := QRY;
    CDS.ProviderName  := '_DSP';
    CDS.CommandText   := ASQL;

    for i := 0 to High(Parameters) do
      if VarIsNull(Parameters[i]) or VarIsClear(Parameters[i]) then
      begin
        CDS.Params[i].AsString := '';
        CDS.Params[i].Clear;
      end else
        CDS.Params[i].Value := Parameters[i];
      //

    try
      CDS.Open;
      Result := CDS.Data;
      CDS.Close;
    except
      on E: Exception do raise Exception.Create(E.Message + #13#10 + ASQL);
    end;
  finally
    DSP.Name := '';
    CDS.Free;
    DSP.Free;
    QRY.Free;
  end;

end;

function TDMRet.OpenSQL(ASQL: string; Parameters: array of Variant): Variant;
var
  QRY: TSQLQuery;
  i: integer;
begin
  Result := Null;

  QRY := TSQLQuery.Create(nil);

  try
    QRY.SQLConnection := Con;
    QRY.GetMetadata   := False;
    QRY.SQL.Text      := ASQL;

    for i := 0 to High(Parameters) do
      if VarIsNull(Parameters[i]) or VarIsClear(Parameters[i]) then
      begin
        QRY.Params[i].AsString := '';
        QRY.Params[i].Clear;
      end else
        QRY.Params[i].Value := Parameters[i];
      //

    try
      QRY.Open;
      if not QRY.IsEmpty then Result := QRY.Fields[0].Value;
      QRY.Close;
    except
      on E: Exception do
        raise Exception.Create(E.Message + #13#10 + ASQL);
    end;
  finally
    QRY.Free;
  end;

end;

initialization
  if not Assigned(DMRet) then
    DMRet := TDMRet.Create(nil);

end.

