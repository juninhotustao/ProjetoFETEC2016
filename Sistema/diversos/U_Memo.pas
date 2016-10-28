unit U_Memo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_Memo = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    class function GetMemoText(AFormCaption: TCaption; AMemoText: string;
      AMaxLegth: Integer = 0; AMemoFontName: TFontName = 'Consolas'): string;
  end;

var
  frm_Memo: Tfrm_Memo;

implementation

{$R *.dfm}

{ Tfrm_Memo }

class function Tfrm_Memo.GetMemoText(AFormCaption: TCaption; AMemoText: string;
  AMaxLegth: Integer = 0; AMemoFontName: TFontName = 'Consolas'): string;
begin
  with Tfrm_Memo.Create(nil) do
  try
    Memo.MaxLength := AMaxLegth;
    Memo.Font.Name := AMemoFontName;
    Memo.Text      := AMemoText;
    Memo.SelStart  := Length(AMemoText);
    Caption        := AFormCaption;

    ShowModal;

    Result := Memo.Text;
  finally
    Free;
  end;
end;

end.
