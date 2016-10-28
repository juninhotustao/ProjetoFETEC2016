object frm_CodFabricantePadrao: Tfrm_CodFabricantePadrao
  Left = 430
  Top = 205
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista todos os Codigos de Fabricantes do Produto'
  ClientHeight = 146
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 146
    Align = alClient
    TabOrder = 0
    object Label48: TLabel
      Left = 12
      Top = 13
      Width = 11
      Height = 13
      Caption = '1'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label49: TLabel
      Left = 12
      Top = 38
      Width = 11
      Height = 13
      Caption = '2'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label50: TLabel
      Left = 12
      Top = 61
      Width = 11
      Height = 13
      Caption = '3'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label51: TLabel
      Left = 12
      Top = 85
      Width = 11
      Height = 13
      Caption = '4'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label52: TLabel
      Left = 12
      Top = 109
      Width = 11
      Height = 13
      Caption = '5'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label57: TLabel
      Left = 189
      Top = 109
      Width = 17
      Height = 13
      Caption = '10'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label56: TLabel
      Left = 195
      Top = 85
      Width = 11
      Height = 13
      Caption = '9'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label55: TLabel
      Left = 195
      Top = 61
      Width = 11
      Height = 13
      Caption = '8'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label54: TLabel
      Left = 195
      Top = 37
      Width = 11
      Height = 13
      Caption = '7'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label53: TLabel
      Left = 195
      Top = 13
      Width = 11
      Height = 13
      Caption = '6'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edt_codfab1: TDBEdit
      Left = 26
      Top = 14
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB1'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edt_codfab2: TDBEdit
      Left = 26
      Top = 37
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB2'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edt_codfab3: TDBEdit
      Left = 26
      Top = 60
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB3'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edt_codfab4: TDBEdit
      Left = 26
      Top = 84
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB4'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edt_codfab5: TDBEdit
      Left = 26
      Top = 108
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB5'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edt_codfab10: TDBEdit
      Left = 212
      Top = 107
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB10'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object edt_codfab9: TDBEdit
      Left = 210
      Top = 84
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB9'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edt_codfab8: TDBEdit
      Left = 210
      Top = 60
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB8'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edt_codfab7: TDBEdit
      Left = 210
      Top = 36
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB7'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edt_codfab6: TDBEdit
      Left = 210
      Top = 12
      Width = 130
      Height = 17
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16056319
      DataField = 'PRO_CODFAB6'
      DataSource = DS
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object qry_CodFabricante: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PRO_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      'PRO_CODFAB1,'
      'PRO_CODFAB2,'
      'PRO_CODFAB3,'
      'PRO_CODFAB4,'
      'PRO_CODFAB5,'
      'PRO_CODFAB6,'
      'PRO_CODFAB7,'
      'PRO_CODFAB8,'
      'PRO_CODFAB9,'
      'PRO_CODFAB10 '
      'FROM PRODUTO'
      'WHERE '
      '(PRO_ID = :PRO_ID)')
    Left = 256
    Top = 16
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = QRY
    Left = 160
    Top = 65
  end
  object QRY: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PRO_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      #9'PRO_CODFAB1, PRO_CODFAB2, PRO_CODFAB3, PRO_CODFAB4,'
      #9'PRO_CODFAB5, PRO_CODFAB6, PRO_CODFAB7, PRO_CODFAB8,'
      #9'PRO_CODFAB9, PRO_CODFAB10'
      'FROM'
      #9'PRODUTO'
      'WHERE'
      #9'PRO_ID = :PRO_ID')
    SQLConnection = DMRet.Con
    Left = 160
    Top = 16
  end
end
