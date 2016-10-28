unit U_ArquivoSiteSOVIL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, DB;

type
  Tfrm_ArquivoSiteSOVIL = class(TForm)
    dlgOpen: TOpenDialog;
    Panel2: TPanel;
    pnlCorpo: TPanel;
    btn_exporta: TBitBtn;
    lbl_Mensagem: TLabel;
    lbl_Atencao: TLabel;
    SaveDialog1: TSaveDialog;
    rg_FiltroDescricao: TRadioGroup;
    pnl_aguarde: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_exportaClick(Sender: TObject);
  private
    function FormataFabricante(Campos: TFields): String;
    function FormataCategoria(Campos: TFields): String;
    function FormataProduto(Campos: TFields): String;
  public
    { Public declarations }
  end;

var
  frm_ArquivoSiteSOVIL: Tfrm_ArquivoSiteSOVIL;

implementation

uses U_DMRet, DBClient, StrUtils;

{$R *.dfm}

procedure Tfrm_ArquivoSiteSOVIL.btn_exportaClick(Sender: TObject);
{$REGION 'SQLs'}
const
   SQL_FABRICANTE =
     'select MRC_ID, MRC_DESCRICAO from marca order by MRC_DESCRICAO';

   SQL_CATEGORIA =
     'SELECT DEP_ID, DEP_DESCRICAO FROM DEPARTAMENTO order by DEP_DESCRICAO';

   SQL_PRODUTO =
     ' SELECT '+
     '   PRO_ID, PRO_REFERENCIA, %0:s as DESCRICAO, DEP_ID, MRC_ID, '+
     '   CASE WHEN PRO_ATIVO = ''A'' THEN ''1'' '+
     '     ELSE ''0'' END AS PUBLICADO '+
     ' FROM '+
     '   PRODUTO '+
     ' ORDER BY '+
     '   %0:s ';
{$ENDREGION}
var
  Linha, sSql : String;
  Arquivo: TStringList;
begin
   if not SaveDialog1.Execute then Exit;

   Arquivo := TStringList.Create;
   try
      btn_exporta.Enabled := False;
      pnl_aguarde.Visible := True;
      Update;

      // REGISTRO DE FABRICANTE
      with TClientDataSet.Create(nil) do
      try
          Data := DMRet.GetData(SQL_FABRICANTE, []);

          while not Eof do
          begin
              Application.ProcessMessages;
              Linha := FormataFabricante(Fields);
              Arquivo.Add(Linha);
              Next;
          end;
      finally
        Free;
      end;

      // REGISTRO DE CATEGORIA
      with TClientDataSet.Create(nil) do
      try
          Data := DMRet.GetData(SQL_CATEGORIA, []);

          while not Eof do
          begin
              Application.ProcessMessages;
              Linha := FormataCategoria(Fields);
              Arquivo.Add(Linha);
              Next;
          end;
      finally
        Free;
      end;


      // REGISTRO DE PRODUTO
      with TClientDataSet.Create(nil) do
      try
          if rg_FiltroDescricao.ItemIndex = 0 then
            sSql := Format(SQL_PRODUTO,['PRO_RESUMIDO'])
          else
            sSql := Format(SQL_PRODUTO,['PRO_DESCRICAO']);
          //
          Data := DMRet.GetData(sSql, []);
          //
          while not Eof do
          begin
              Application.ProcessMessages;
              Linha := FormataProduto(Fields);
              Arquivo.Add(Linha);
              Next;
          end;
      finally
        Free;
      end;

    // Salva o arquivo.
    try
      Arquivo.SaveToFile(SaveDialog1.FileName);
      Application.MessageBox('Arquivo gerado com sucesso!', 'AVISO!', MB_ICONINFORMATION);
    except
      MessageDlg('Falha ao salvar arquivo: '#13#10 + SaveDialog1.FileName, mtError, [mbOK], 0);
      Exit;
    end;
  finally
    Arquivo.Free;

    Update;
    btn_exporta.Enabled := True;
    pnl_aguarde.Visible := False;
    Update;
  end;

  close;
  //
end;

function Tfrm_ArquivoSiteSOVIL.FormataCategoria(Campos: TFields): String;
var
  Retorno: String;
begin
  Retorno := '';

  try
    Retorno := '2;1;'+
               Campos.FieldByName('DEP_ID').AsString + ';' +
               Campos.FieldByName('DEP_DESCRICAO').AsString + ';';
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbOk], 0);
  end;

  Result := Retorno;
end;

function Tfrm_ArquivoSiteSOVIL.FormataFabricante(Campos: TFields): String;
var
  Retorno: String;
begin
  Retorno := '';

  try
    Retorno := '1;1;'+
               Campos.FieldByName('MRC_ID').AsString + ';' +
               Campos.FieldByName('MRC_DESCRICAO').AsString + ';'+
               {VAI VAZIO POR NÃO TER A INFORMAÇÃO "SITE"} ';';
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbOk], 0);
  end;

  Result := Retorno;
end;

function Tfrm_ArquivoSiteSOVIL.FormataProduto(Campos: TFields): String;
var
  Retorno: String;
begin
  Retorno := '';

  try
    Retorno := '3;'+
               Campos.FieldByName('PUBLICADO').AsString + ';' +
               Campos.FieldByName('PRO_ID').AsString + ';' +
               Campos.FieldByName('PRO_REFERENCIA').AsString + ';'+
               Campos.FieldByName('DESCRICAO').AsString + ';'+
               Campos.FieldByName('DESCRICAO').AsString + ';'+
               Campos.FieldByName('DEP_ID').AsString + ';'+
               Campos.FieldByName('MRC_ID').AsString + ';';
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbOk], 0);
  end;

  Result := Retorno;
end;

procedure Tfrm_ArquivoSiteSOVIL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

end.
