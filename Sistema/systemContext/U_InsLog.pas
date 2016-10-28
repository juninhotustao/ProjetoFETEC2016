unit U_InsLog;

interface

type
  TInsLog = class
  private
   //
  public
     class procedure GeraLog(Acao:char; Modulo,Texto:String);
  end;

implementation

uses SysUtils, DBClient, U_DmRet, DB, U_SystemUsuario;

{ TInsLog }

class procedure TInsLog.GeraLog(Acao: char; Modulo,Texto: String);
const
   SQL = ' insert into user_log '+
         ' (LOG_USER,LOG_DATE,LOG_HORA,LOG_ACAO,LOG_SISTEMA,LOG_TEXTO)'+
         ' values '+
         ' (:LOG_USER,:LOG_DATE,:LOG_HORA,:LOG_ACAO,:LOG_SISTEMA,:LOG_TEXTO)';
begin
     DMRet.ExecuteSQL(SQL,[TUsuario.Nome, Date, Time, Acao, Modulo, copy(Texto,1,4999)]);
end;

end.
