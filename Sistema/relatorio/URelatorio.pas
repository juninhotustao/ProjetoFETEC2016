unit URelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, U_DMRet, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppBands, ppCache, ppDesignLayer, ppParameter, ppCtrls, ppPrnabl, Vcl.ComCtrls;

type
  Tfrm_Relatorio = class(TForm)
    pnl_Relatorio: TPanel;
    btnGerar: TButton;
    edtNome: TEdit;
    lblNome: TLabel;
    chkTodos: TCheckBox;
    DsAcumulado: TDataSource;
    DsDiscriminado: TDataSource;
    DTSAcumulado: TSQLDataSet;
    DSPAcumulado: TDataSetProvider;
    CDSAcumulado: TClientDataSet;
    SQLDiscriminado: TSQLDataSet;
    DSPDiscriminado: TDataSetProvider;
    CDSDiscriminado: TClientDataSet;
    DTSAcumuladoVEN_DATA: TSQLTimeStampField;
    DTSAcumuladoVEN_OBSERVACAO: TStringField;
    DTSAcumuladoITE_PRO_DESCRICAO: TStringField;
    DTSAcumuladoITE_QTDE: TFMTBCDField;
    CDSAcumuladoVEN_DATA: TSQLTimeStampField;
    CDSAcumuladoVEN_OBSERVACAO: TStringField;
    CDSAcumuladoITE_PRO_DESCRICAO: TStringField;
    CDSAcumuladoITE_QTDE: TFMTBCDField;
    SQLDiscriminadoITE_REFERENCIA: TStringField;
    SQLDiscriminadoITE_PRO_DESCRICAO: TStringField;
    SQLDiscriminadoQTDE: TFMTBCDField;
    SQLDiscriminadoQTDE_COPO: TFMTBCDField;
    CDSDiscriminadoITE_REFERENCIA: TStringField;
    CDSDiscriminadoITE_PRO_DESCRICAO: TStringField;
    CDSDiscriminadoQTDE: TFMTBCDField;
    CDSDiscriminadoQTDE_COPO: TFMTBCDField;
    repAcumulado: TppReport;
    pipAcumulado: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    ppLine3: TppLine;
    rgTipoRelatorio: TRadioGroup;
    dtInicial: TDateTimePicker;
    dtFin: TDateTimePicker;
    lbldtInicio: TLabel;
    lbldtFinal: TLabel;
    repDiscriminado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine4: TppLine;
    ppDetailBand2: TppDetailBand;
    ppLabel9: TppLabel;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppDBText7: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel11: TppLabel;
    ppDBText8: TppDBText;
    ppLine5: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel12: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine6: TppLine;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    pipDiscriminado: TppDBPipeline;
    SQLDiscriminadoVEN_DATA: TSQLTimeStampField;
    CDSDiscriminadoVEN_DATA: TSQLTimeStampField;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppDBCalc3: TppDBCalc;
    procedure chkTodosClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Relatorio: Tfrm_Relatorio;

implementation

{$R *.dfm}

procedure Tfrm_Relatorio.btnGerarClick(Sender: TObject);
begin
  case rgTipoRelatorio.ItemIndex of
    0:
    begin
      CDSAcumulado.Close;

      CDSAcumulado.Params[0].Value := dtInicial.DateTime;
      CDSAcumulado.Params[1].Value := dtFin.DateTime;
      CDSAcumulado.Open;

      if CDSAcumulado.IsEmpty then
      begin
        ShowMessage('Não existe dados no relatório.');
        exit;
      end;

      repAcumulado.Print;
    end;
    1:
    begin
      CDSDiscriminado.Close;

      CDSDiscriminado.Params[0].Value := dtInicial.DateTime;
      CDSDiscriminado.Params[1].Value := dtFin.DateTime;
      CDSDiscriminado.Open;

      if CDSDiscriminado.IsEmpty then
      begin
        ShowMessage('Não existe dados no relatório.');
        exit;
      end;

      repDiscriminado.Print;
    end;

  end;
end;

procedure Tfrm_Relatorio.chkTodosClick(Sender: TObject);
begin
  lblNome.Enabled := not chkTodos.Checked;
  edtNome.Enabled := not chkTodos.Checked;
end;

procedure Tfrm_Relatorio.FormShow(Sender: TObject);
begin
  dtInicial.DateTime  := Date-1;
  dtFin.DateTime      := Date+1;
end;

end.
