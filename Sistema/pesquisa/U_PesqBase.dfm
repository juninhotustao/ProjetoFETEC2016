object frm_PesqBase: Tfrm_PesqBase
  Left = 624
  Top = 162
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frm_PesqBase'
  ClientHeight = 415
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 687
    Height = 415
    Align = alClient
    BevelOuter = bvNone
    Color = cl3DLight
    TabOrder = 0
    object Grid: TDBGrid
      Left = 0
      Top = 0
      Width = 687
      Height = 343
      Align = alClient
      Color = 16056319
      DataSource = DS
      FixedColor = cl3DLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = GridDrawColumnCell
      OnDblClick = GridDblClick
      OnKeyPress = GridKeyPress
    end
    object Panel2: TPanel
      Left = 0
      Top = 343
      Width = 687
      Height = 72
      Align = alBottom
      Color = cl3DLight
      TabOrder = 1
      DesignSize = (
        687
        72)
      object lblBusca: TLabel
        Left = 169
        Top = 34
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_pesq: TEdit
        Left = 216
        Top = 31
        Width = 337
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edt_pesqKeyDown
        OnKeyPress = edt_pesqKeyPress
      end
      object rgTipoBusca: TRadioGroup
        Left = 10
        Top = 19
        Width = 139
        Height = 39
        TabOrder = 1
        Visible = False
        OnClick = rgTipoBuscaClick
      end
      object btn_confirma: TBitBtn
        Left = 565
        Top = 22
        Width = 113
        Height = 33
        Anchors = [akRight, akBottom]
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F0030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFB8B8B77D7D7DCCCC
          CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFBEBDBC64606565635F555555CDCDCDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFA7B1CA5888E6767FA87A766D565657CDCDCDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFDDECFF
          66C5FF4B99F5787EA57C7870535353CBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFD2EBFF68C5FF4A97
          F4767CA37B776E5F5F5FF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFD1EBFF66C4FF4B97F6737DA673
          716DCECFCFA8AAAD8B8B8F87878A8C8E90D2D3D3FFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFD2EBFF6CC7FF6E98E8757374747272A0937F
          BCB598C6C5B0B1A18D5E5C578F8F90FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF1F9FFDDE4EB9B8984E8BD9EFFF6CBFFFFD4FFFFD3FFFF
          DBE0DBCD5E5F62949494F9F9F9FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF1E9E4F5C5A0FFEBBFFFF6CBFFFFD1FFFFEBFFFFFCFFFFFFD6CBC052
          5151E2E2E2FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFE6C8BEFD
          E7B9FFE4B6FFF6C5FFFFD1FFFFEDFFFFFFFFFFF2F9F8CD767676DCDCDDFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFCEC9FFE3BAFFD59CFFEDC3
          FFFFD2FFFFD0FFFFD9FFFFD8FFFFCE9C907BD7D8DCFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFFFFE2C9C1FFEABAFFDEA8FFDFAEFFF4C4FFFED0FFFF
          CFFFFECFFEFDCBAA8C77D8DCDFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFFFFD3D0CAEEE1BBFFFCE5FFE8C4FFDEACFFE4B6FFEAC4FFF7CCE6C8A2B6
          AEABFBFCFCFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F2F5CE
          C2B2F7F3F1FFFFE5FFEDC0FFE5B4FFECBFF7DCB9BEA89BE7E7E9FFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4BAB4B3D2CDB6
          F3E4B6F8E6B6DBCCAABBA297E5EAECFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F2F2D1D0D1D3CCC5D6CEC5DFDD
          DCEEF2F4FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
        ParentFont = False
        TabOrder = 2
        OnClick = btn_confirmaClick
      end
    end
  end
  object DTS: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 274
    Top = 66
  end
  object DS: TDataSource
    DataSet = CDS
    Left = 378
    Top = 234
  end
  object QRY: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMRet.Con
    Left = 376
    Top = 64
  end
  object DSP: TDataSetProvider
    DataSet = QRY
    Options = [poReadOnly, poAllowCommandText, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 376
    Top = 120
  end
  object CDS: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'DSP'
    Left = 376
    Top = 176
  end
end
