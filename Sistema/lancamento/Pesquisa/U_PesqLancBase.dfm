object frm_PesqLancBase: Tfrm_PesqLancBase
  Left = 336
  Top = 86
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 430
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 643
    Height = 361
    Align = alClient
    DataSource = DS
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 361
    Width = 643
    Height = 69
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lbl_Periodo: TLabel
      Left = 11
      Top = 26
      Width = 73
      Height = 14
      Caption = 'Per'#237'odo de:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbl_a: TLabel
      Left = 195
      Top = 27
      Width = 8
      Height = 14
      Caption = #224
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbl_nro: TLabel
      Left = 364
      Top = 6
      Width = 16
      Height = 14
      Caption = 'N'#186
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object btn_Confirma: TBitBtn
      Left = 522
      Top = 14
      Width = 111
      Height = 38
      Caption = 'C&onfirma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 0
    end
    object dt_inicial: TDateTimePicker
      Left = 88
      Top = 22
      Width = 95
      Height = 22
      Date = 38250.000000000000000000
      Time = 38250.000000000000000000
      Color = 16056319
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dt_final: TDateTimePicker
      Left = 208
      Top = 22
      Width = 93
      Height = 22
      Date = 38250.000000000000000000
      Time = 38250.000000000000000000
      Color = 16056319
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object chk_datas: TCheckBox
      Left = 307
      Top = 24
      Width = 49
      Height = 17
      Caption = 'Todos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = chk_datasClick
    end
    object edt_nro: TEdit
      Left = 364
      Top = 22
      Width = 97
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object chk_Num: TCheckBox
      Left = 467
      Top = 24
      Width = 49
      Height = 17
      Caption = 'Todos'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 5
      OnClick = chk_NumClick
    end
  end
  object DSP: TDataSetProvider
    DataSet = QRY
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 288
    Top = 136
  end
  object CDS: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'DSP'
    Left = 288
    Top = 184
  end
  object DS: TDataSource
    DataSet = CDS
    Left = 288
    Top = 232
  end
  object QRY: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMRet.Con
    Left = 288
    Top = 87
  end
end
