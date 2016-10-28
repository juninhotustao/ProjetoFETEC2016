object frm_ACBrChaveAcesso: Tfrm_ACBrChaveAcesso
  Left = 545
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Chave de Acesso'
  ClientHeight = 173
  ClientWidth = 462
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 462
    Height = 173
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 152
      Top = 24
      Width = 149
      Height = 24
      Caption = 'Chave de Acesso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 184
      Top = 123
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object edt_chave: TEdit
      Left = 18
      Top = 68
      Width = 421
      Height = 25
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
end
