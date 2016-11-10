program FETEC2016;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  U_CadastroBase in 'Sistema\cadastro\U_CadastroBase.pas' {Frm_CadastroBase},
  U_ConsultaBase in 'Sistema\cadastro\U_ConsultaBase.pas' {Frm_ConsultaBase},
  U_DMRet in 'Sistema\devartDAL\U_DMRet.pas' {DMRet: TDataModule},
  U_Utils in 'Sistema\diversos\U_Utils.pas',
  U_FuncUtils in 'Sistema\biblioteca\U_FuncUtils.pas',
  U_Calculos in 'Sistema\diversos\U_Calculos.pas',
  U_GeraPlanilhaExcel in 'Sistema\diversos\U_GeraPlanilhaExcel.pas',
  U_SystemEmpresa in 'Sistema\systemContext\U_SystemEmpresa.pas',
  U_Percentual in 'Sistema\diversos\U_Percentual.pas' {frm_Percentual},
  U_LancBase in 'Sistema\lancamento\U_LancBase.pas' {frm_LancBase},
  U_LancItemBase in 'Sistema\lancamento\U_LancItemBase.pas' {frm_LancItemBase},
  Vcl.Themes,
  Vcl.Styles,
  U_PesqLancBase in 'Sistema\lancamento\Pesquisa\U_PesqLancBase.pas' {frm_PesqLancBase},
  U_PesqProduto in 'Sistema\pesquisa\Cadastros\Produto\U_PesqProduto.pas',
  U_PesqBase in 'Sistema\pesquisa\U_PesqBase.pas' {frm_PesqBase},
  UVendas in 'Sistema\lancamento\UVendas.pas' {frmVendas},
  ULancItemVendas in 'Sistema\lancamento\ULancItemVendas.pas' {frmLancItemVendas},
  UConProduto in 'Sistema\UConProduto.pas' {frmConProduto},
  UCadProduto in 'Sistema\UCadProduto.pas' {frmCadProduto},
  UPesqVendas in 'Sistema\lancamento\Pesquisa\UPesqVendas.pas' {FrmPesqVendas},
  UAtualizar in 'Sistema\biblioteca\UAtualizar.pas',
  URelatorio in 'Sistema\relatorio\URelatorio.pas' {frm_Relatorio};

{$R *.res}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Slate Classico');
  Application.Title := 'FETEC - 2016 CEMES';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMRet, DMRet);
  Application.CreateForm(TFrmPesqVendas, FrmPesqVendas);
  Application.CreateForm(Tfrm_Relatorio, frm_Relatorio);
  Application.Run;
end.
