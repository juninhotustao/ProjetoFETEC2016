object frm_LimpezaPeriodica: Tfrm_LimpezaPeriodica
  Left = 341
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Limpeza Peri'#243'dica de Tabelas'
  ClientHeight = 389
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object gb_periodo: TGroupBox
    Left = 0
    Top = 307
    Width = 581
    Height = 82
    Align = alBottom
    TabOrder = 0
    object lbl_periodo: TLabel
      Left = 210
      Top = 19
      Width = 68
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Per'#237'odo Final :'
      ParentBiDiMode = False
    end
    object dt_final: TDateTimePicker
      Left = 285
      Top = 15
      Width = 82
      Height = 21
      Hint = 'Limpar os dados onde a data '#233' menor que a selecionada.'
      Date = 39234.000000000000000000
      Time = 39234.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btn_confirma: TBitBtn
      Left = 182
      Top = 46
      Width = 83
      Height = 28
      Caption = 'C&onfirma'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E3DFE0FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE3DFE0FFFFFF84B584107310187318187318187318187B1818
        7B18107B10107B10087B08087B08007B000073007BB57BFFFFFFFFFFFF108410
        218C21299429319431319431299429299C29219C2118A51818A51810A51008A5
        08009400006B00FFFFFFFFFFFF188C18299429399C39399C39399C3939A5394A
        A54A4AA54A4AA54A4AA54A29A52910A510009C00007B00FFFFFFFFFFFF219421
        399C3942A54242A54242A5429CCE9C4AA54A4AA54A4AA54A4AA54A39A53918A5
        1808A508087B08FFFFFFFFFFFF299429429C424AA54A52A5529CCE9CFFFFFF9C
        CE9C4AA54A4AA54A4AA54A39A53921A52110A510088408FFFFFFFFFFFF319C31
        4AA54A52A5529CCE9CFFFFFF9CCE9CFFFFFF9CCE9C4AA54A4AA54A39A53921A5
        2118A518108410FFFFFFFFFFFF429C4252A5529CCE9CFFFFFF9CCE9C4AA54A4A
        A54AFFFFFF9CCE9C42A54231A53121A521219C21188418FFFFFFFFFFFF42A542
        52AD5252A5529CCE9C4AA54A4AA54A4AA54A4AA54AFFFFFF9CCE9C299C29219C
        21219C21217B21FFFFFFFFFFFF52A5525AAD5A5AAD5A52AD524AA54A4AA54A4A
        A54A429C42429C42FFFFFF9CCE9C299429299429217B21FFFFFFFFFFFF52A552
        6BB56B6BB56B5AAD5A52AD5252A5524AA54A429C42429C42399C39FFFFFF9CCE
        9C299429217B21FFFFFFFFFFFF5AAD5A7BBD7B73BD7363AD635AAD5A5AAD5A52
        AD524AA54A429C42399C39319C31FFFFFF319431217B21FFFFFFFFFFFF6BB56B
        8CC68C7BBD7B6BB56B63B56363AD6363AD635AAD5A4AA54A42A54242A542399C
        39319431217B21FFFFFFFFFFFF73BD739CCE9C8CC68C7BBD7B73BD736BB56B63
        B56363AD635AAD5A52AD524AA54A42A542319431187318FFFFFFFFFFFFB5DEB5
        73BD7363B5635AAD5A52A55252A5524AA54A4AA54A42A542429C42399C393194
        31218C218CBD8CFFFFFFE3DFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DFE0}
      TabOrder = 1
      OnClick = btn_confirmaClick
    end
    object btn_cancela: TBitBtn
      Left = 312
      Top = 46
      Width = 83
      Height = 28
      Caption = '&Cancela'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E3DFE0FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE3DFE0FFFFFF52ADFF185294185A9C185A9C185A9C185AA518
        5AA5185A9C185A9C18529418529418528C184A844AADFFFFFFFFFFFFFF185AA5
        186BBD1873CE1873CE1873CE1873CE1873CE1873CE1873CE1873CE186BC6186B
        BD185AA5104A7BFFFFFFFFFFFF1863AD1873CE187BDE187BDE187BE71884E718
        8CF7188CF7188CF7188CF7187BDE186BC61863AD18528CFFFFFFFFFFFF186BC6
        187BDE1884EFFFFFFF84C6FF188CF7188CF7188CF7188CF784C6FFFFFFFF1873
        CE186BBD185294FFFFFFFFFFFF1873CE1884E7188CF7188CFFFFFFFF84C6FF18
        8CF7188CF784C6FFFFFFFF1884E71873D6186BC6185A9CFFFFFFFFFFFF187BDE
        188CF7188CFF188CF7188CF7FFFFFF84C6FF84C6FFFFFFFF188CF71884E71873
        D61873CE185AA5FFFFFFFFFFFF1884E7188CFF188CF7188CF7188CF7188CF7FF
        FFFF84C6FF188CF71884EF187BDE1873CE1873CE1863ADFFFFFFFFFFFF1884EF
        188CFF188CFF188CF7188CF784C6FFFFFFFFFFFFFF84C6FF1884E71873D61873
        CE1873CE1863ADFFFFFFFFFFFF188CFF2194FF2194FF188CFF84C6FFFFFFFF18
        84F71884EFFFFFFF84C6FF1873CE1873CE1873CE1863ADFFFFFFFFFFFF188CFF
        39A5FF39A5FF84C6FFFFFFFF188CFF188CFF1884EF1884E7FFFFFF84C6FF1873
        CE1873CE1863ADFFFFFFFFFFFF2194FF52ADFF4AADFFFFFFFF2194FF2194FF18
        94FF188CF71884EF1884E7FFFFFF1873CE1873CE1863ADFFFFFFFFFFFF39A5FF
        6BBDFF52ADFF39A5FF319CFF299CFF299CFF2194FF188CFF1884F71884EF187B
        DE1873CE1863ADFFFFFFFFFFFF4AADFF84C6FF6BBDFF52ADFF4AADFF39A5FF31
        9CFF299CFF2194FF1894FF188CF71884EF1873CE185A9CFFFFFFFFFFFFADDEFF
        4AADFF319CFF2194FF188CFF188CFF188CF7188CF71884EF1884E7187BDE1873
        CE186BBD63B5FFFFFFFFE3DFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DFE0}
      TabOrder = 2
      OnClick = btn_cancelaClick
    end
  end
  object rg_tabelas: TGroupBox
    Left = 0
    Top = 0
    Width = 581
    Height = 307
    Align = alClient
    TabOrder = 1
    object chk_OrcVenda: TCheckBox
      Left = 18
      Top = 15
      Width = 122
      Height = 17
      Hint = 'Per'#237'odo de Venda'
      Caption = 'PDA'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object chk_MovEstLoja: TCheckBox
      Left = 18
      Top = 57
      Width = 122
      Height = 17
      Hint = 'Per'#237'odo de Lan'#231'amento'
      Caption = 'Movimento Estoque'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object chk_EntMerc: TCheckBox
      Left = 18
      Top = 102
      Width = 139
      Height = 17
      Hint = 'Per'#237'odo de Entrada'
      Caption = 'Entrada Mercadorias'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object chk_SaiMerc: TCheckBox
      Left = 192
      Top = 15
      Width = 183
      Height = 17
      Hint = 'Per'#237'odo de Emiss'#227'o'
      Caption = 'NF-e - Nota Fiscal Eletronica'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object chk_SaiServ: TCheckBox
      Left = 192
      Top = 57
      Width = 183
      Height = 17
      Hint = 'Per'#237'odo de Emiss'#227'o'
      Caption = 'Sa'#237'da de Nota Fiscal Servi'#231'os'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object chk_PedCompra: TCheckBox
      Left = 192
      Top = 146
      Width = 114
      Height = 17
      Hint = 'Per'#237'odo de Emiss'#227'o'
      Caption = 'Pedido de Compra'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object chk_Reducoes: TCheckBox
      Left = 192
      Top = 195
      Width = 114
      Height = 17
      Hint = 'Per'#237'odo de Emiss'#227'o'
      Caption = 'Redu'#231#245'es'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object chk_SerieD: TCheckBox
      Left = 401
      Top = 15
      Width = 114
      Height = 17
      Hint = 'Per'#237'odo de Emiss'#227'o'
      Caption = 'Notas S'#233'rie D'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object chk_Frete: TCheckBox
      Left = 18
      Top = 146
      Width = 151
      Height = 17
      Hint = 'Per'#237'odo de Emiss'#227'o'
      Caption = 'Conhecimento de Frete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object chk_Cupons: TCheckBox
      Left = 401
      Top = 102
      Width = 174
      Height = 17
      Hint = 'Per'#237'odo de Lan'#231'amento'
      Caption = 'Lan'#231'amento de Cupons'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object chk_Receber: TCheckBox
      Left = 401
      Top = 146
      Width = 114
      Height = 17
      Hint = 
        'Per'#237'odo de Lan'#231'amento'#13'Obs.: Ser'#227'o exclu'#237'dos somente os Contas a ' +
        'Receber quitados'
      Caption = 'Contas a Receber'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = chk_ReceberClick
    end
    object chk_Pagar: TCheckBox
      Left = 401
      Top = 195
      Width = 114
      Height = 17
      Hint = 
        'Per'#237'odo de Lan'#231'amento'#13'Obs.: Ser'#227'o exclu'#237'dos somente os Contas a ' +
        'Pagar quitados'
      Caption = 'Contas a Pagar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = chk_PagarClick
    end
    object chk_CaixaBanco: TCheckBox
      Left = 401
      Top = 57
      Width = 114
      Height = 17
      Hint = 'Per'#237'odo de Lan'#231'amento'
      Caption = 'Caixa/Banco'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object chk_todos: TCheckBox
      Left = 262
      Top = 270
      Width = 52
      Height = 17
      Caption = 'Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = chk_todosClick
    end
    object chk_VerificaLog: TCheckBox
      Left = 18
      Top = 238
      Width = 149
      Height = 17
      Caption = 'Verifica Log'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
    end
    object chk_EmissaoCheque: TCheckBox
      Left = 192
      Top = 102
      Width = 149
      Height = 17
      Hint = 'Per'#237'odo de Emiss'#227'o'
      Caption = 'Emiss'#227'o de Cheque'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object chk_Credito: TCheckBox
      Left = 18
      Top = 195
      Width = 114
      Height = 17
      Hint = 'Per'#237'odo de Lan'#231'amento'
      Caption = 'Cr'#233'dito'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object chk_LimpaReceberAbert: TCheckBox
      Left = 416
      Top = 167
      Width = 146
      Height = 17
      Hint = 
        'Aten'#231#227'o!'#13'Marque para limpar todos os contas a receber, inclusive' +
        ' os "em aberto"'
      Caption = 'Limpa contas"em aberto"?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      Visible = False
    end
    object chk_LimpaPagarAbert: TCheckBox
      Left = 416
      Top = 216
      Width = 146
      Height = 17
      Hint = 
        'Aten'#231#227'o!'#13'Marque para limpar todos os contas a pagar, inclusive o' +
        's "em aberto"'
      Caption = 'Limpa contas"em aberto"?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      Visible = False
    end
    object chk_CTe: TCheckBox
      Left = 192
      Top = 238
      Width = 193
      Height = 17
      Caption = 'CT-e - Conhecimento de Transporte'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
    end
    object pnl_Aguarde: TPanel
      Left = 604
      Top = 31
      Width = 427
      Height = 132
      Align = alCustom
      Caption = 'Aguarde...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -48
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
      Visible = False
    end
  end
end
