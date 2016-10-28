unit U_Notificador;

interface

type
  /// <summary>
  ///   Interface para enviar notificações
  ///   Autor: Rodrigo
  /// </summary>
  INotificador = interface
    procedure Notify(const AObj: TObject);
  end;

  TObjNotifier = class
   private
      FTexto  : string;
      FProgresVisible: Boolean;
      FProgresMin: Integer;
      FProgresMax: Integer;
      FProgresRecNo: Integer;
      procedure SetTexto(const Value: String);
      procedure SetProgresVisible(const Value: Boolean);
      procedure SetProgresMin(const Value: Integer);
      procedure SetProgresMax(const Value: Integer);
      procedure SetProgresRecNo(const Value: Integer);
   public
      property Texto: String read FTexto write SetTexto;
      property ProgresVisible: Boolean read FProgresVisible write SetProgresVisible;
      property ProgresMin: Integer read FProgresMin write SetProgresMin;
      property ProgresMax: Integer read FProgresMax write SetProgresMax;
      property ProgresRecNo: Integer read FProgresRecNo write SetProgresRecNo;
   end;

implementation

{ TObjNotifier }

procedure TObjNotifier.SetProgresMax(const Value: Integer);
begin
  FProgresMax := Value;
end;

procedure TObjNotifier.SetProgresMin(const Value: Integer);
begin
  FProgresMin := Value;
end;

procedure TObjNotifier.SetProgresRecNo(const Value: Integer);
begin
  FProgresRecNo := Value;
end;

procedure TObjNotifier.SetProgresVisible(const Value: Boolean);
begin
  FProgresVisible := Value;
end;

procedure TObjNotifier.SetTexto(const Value: String);
begin
   FTexto  := Value;
end;

end.
