unit U_ParcelasPorData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, wwdbdatetimepicker;

type
  Tfrm_ParcelasPorData = class(TForm)
    Panel1: TPanel;
    btnOk_Venc: TBitBtn;
    Panel2: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label105: TLabel;
    Label112: TLabel;
    Label114: TLabel;
    dt12: TwwDBDateTimePicker;
    dt11: TwwDBDateTimePicker;
    dt10: TwwDBDateTimePicker;
    dt9: TwwDBDateTimePicker;
    dt8: TwwDBDateTimePicker;
    dt7: TwwDBDateTimePicker;
    dt6: TwwDBDateTimePicker;
    dt1: TwwDBDateTimePicker;
    dt2: TwwDBDateTimePicker;
    dt3: TwwDBDateTimePicker;
    dt5: TwwDBDateTimePicker;
    dt4: TwwDBDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure btnOk_VencClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FParcelasPorData: TStringList;
    FDtBase: TDateTime;
  public
    class function GetParcelasPorData(ADtBase: TDateTime;
      AParcelasDias: TStringList = nil): TStringList;
  end;

var
  frm_ParcelasPorData: Tfrm_ParcelasPorData;

implementation

{$R *.dfm}

procedure Tfrm_ParcelasPorData.btnOk_VencClick(Sender: TObject);
var
  i: Integer;
  DTP: TwwDBDateTimePicker;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TwwDBDateTimePicker then
    begin
      DTP := TwwDBDateTimePicker(Components[i]);

      //Preenchendo a lista com as datas informadas pelo usuário
      if DTP.Date <> FDtBase then
        FParcelasPorData.Add(FloatToStr(DTP.Date - FDtBase));
    end;
end;

procedure Tfrm_ParcelasPorData.FormCreate(Sender: TObject);
begin
  FParcelasPorData := TStringList.Create;
end;

procedure Tfrm_ParcelasPorData.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: Perform(WM_NEXTDLGCTL, 0, 0);
    VK_ESCAPE: Close;
  end;
end;

class function Tfrm_ParcelasPorData.GetParcelasPorData(ADtBase: TDateTime;
  AParcelasDias: TStringList = nil): TStringList;
var
  i: Integer;
begin
  with Tfrm_ParcelasPorData.Create(nil) do
  try
    //Preenchendo os campos de data com o valor da data base
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TwwDBDateTimePicker then
        TwwDBDateTimePicker(Components[i]).Date := ADtBase;

    //Prenchendo os campos de data com as parcelas digitas pelo usuário
    if Assigned(AParcelasDias) then
      for i := 0 to AParcelasDias.Count - 1 do
        TwwDBDateTimePicker(FindComponent('dt'+IntToStr(i+1))).Date := ADtBase +
          StrToInt(AParcelasDias[i]);
    //
    FDtBase := ADtBase;
    ShowModal
  finally
    Result := FParcelasPorData;
    Free;
  end;
end;

end.
