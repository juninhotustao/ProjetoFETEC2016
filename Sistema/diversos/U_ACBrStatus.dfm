object frm_ACBrStatus: Tfrm_ACBrStatus
  Left = 424
  Top = 193
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frm_ACBrStatus'
  ClientHeight = 58
  ClientWidth = 481
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 58
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clBlack
    TabOrder = 0
    object lbl1: TLabel
      Left = 2
      Top = 2
      Width = 477
      Height = 23
      Align = alTop
      AutoSize = False
      Caption = 'Status da Transmiss'#227'o'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lblStatus: TLabel
      Left = 2
      Top = 25
      Width = 477
      Height = 31
      Align = alClient
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 5
      ExplicitHeight = 19
    end
  end
end
