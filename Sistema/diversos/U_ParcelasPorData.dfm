object frm_ParcelasPorData: Tfrm_ParcelasPorData
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gera parcelas por data'
  ClientHeight = 158
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 124
    Width = 397
    Height = 34
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 122
    ExplicitWidth = 394
    object btnOk_Venc: TBitBtn
      Left = 160
      Top = 4
      Width = 75
      Height = 26
      Caption = 'OK'
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnOk_VencClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 124
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 394
    ExplicitHeight = 122
    object Label40: TLabel
      Left = 7
      Top = 2
      Width = 13
      Height = 13
      Caption = '1'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label41: TLabel
      Left = 107
      Top = 2
      Width = 13
      Height = 13
      Caption = '2'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label49: TLabel
      Left = 206
      Top = 2
      Width = 13
      Height = 13
      Caption = '3'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label50: TLabel
      Left = 304
      Top = 1
      Width = 13
      Height = 13
      Caption = '4'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label51: TLabel
      Left = 7
      Top = 40
      Width = 13
      Height = 13
      Caption = '5'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label52: TLabel
      Left = 107
      Top = 40
      Width = 13
      Height = 13
      Caption = '6'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label66: TLabel
      Left = 206
      Top = 40
      Width = 13
      Height = 13
      Caption = '7'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label67: TLabel
      Left = 304
      Top = 40
      Width = 13
      Height = 13
      Caption = '8'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label68: TLabel
      Left = 8
      Top = 79
      Width = 13
      Height = 13
      Caption = '9'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label105: TLabel
      Left = 107
      Top = 78
      Width = 20
      Height = 13
      Caption = '10'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label112: TLabel
      Left = 206
      Top = 78
      Width = 20
      Height = 13
      Caption = '11'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label114: TLabel
      Left = 304
      Top = 78
      Width = 20
      Height = 13
      Caption = '12'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dt1: TwwDBDateTimePicker
      Left = 7
      Top = 15
      Width = 80
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
    end
    object dt2: TwwDBDateTimePicker
      Left = 107
      Top = 15
      Width = 82
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
    end
    object dt3: TwwDBDateTimePicker
      Left = 206
      Top = 15
      Width = 82
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
    end
    object dt4: TwwDBDateTimePicker
      Left = 304
      Top = 15
      Width = 82
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
    end
    object dt5: TwwDBDateTimePicker
      Left = 7
      Top = 54
      Width = 80
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 4
    end
    object dt6: TwwDBDateTimePicker
      Left = 107
      Top = 54
      Width = 82
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 5
    end
    object dt7: TwwDBDateTimePicker
      Left = 206
      Top = 54
      Width = 82
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 6
    end
    object dt8: TwwDBDateTimePicker
      Left = 304
      Top = 54
      Width = 80
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 7
    end
    object dt9: TwwDBDateTimePicker
      Left = 7
      Top = 92
      Width = 80
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 8
    end
    object dt10: TwwDBDateTimePicker
      Left = 107
      Top = 92
      Width = 82
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 9
    end
    object dt11: TwwDBDateTimePicker
      Left = 206
      Top = 92
      Width = 82
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 10
    end
    object dt12: TwwDBDateTimePicker
      Left = 304
      Top = 92
      Width = 82
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Date = 42215.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 11
    end
  end
end
