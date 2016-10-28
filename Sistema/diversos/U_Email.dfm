object frm_Email: Tfrm_Email
  Left = 435
  Top = 267
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Aguarde...  Enviando Email'
  ClientHeight = 174
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 464
    Height = 150
    Align = alClient
    Enabled = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 150
    Width = 464
    Height = 24
    Align = alBottom
    TabOrder = 1
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 1
      Width = 462
      Height = 22
      Align = alClient
      Max = 11
      Step = 1
      TabOrder = 0
    end
  end
  object ACBrMail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    OnMailProcess = ACBrMailMailProcess
    Left = 208
    Top = 72
  end
end
