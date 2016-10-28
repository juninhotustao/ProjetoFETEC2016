unit U_SystemTurno;

interface

type
  TTurno = class
  private
    class function GetData: TDateTime; static;
  public
    class property Data: TDateTime read GetData;
  end;

implementation

uses U_DmRet;

{ TTurno }

class function TTurno.GetData: TDateTime;
begin
  Result := DMRet.OpenSQL('SELECT TOP 1 TUR_DATA FROM TURNO', []);
end;

end.
