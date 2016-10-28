inherited frm_EncerraPedidoBase: Tfrm_EncerraPedidoBase
  Caption = 'Encerra Ordem de Servi'#231'o'
  ClientHeight = 323
  ExplicitHeight = 351
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 264
    ExplicitTop = 264
  end
  inherited Panel3: TPanel
    Height = 264
    ExplicitHeight = 264
    inherited lbl_SubTotal: TDBText
      DataField = 'TOTAL_PEDIDO'
    end
    inherited lblDesconto: TLabel
      Top = 77
      ExplicitTop = 77
    end
    inherited Label3: TLabel
      Top = 216
      ExplicitTop = 216
    end
    inherited DBText2: TDBText
      Top = 216
      DataField = 'TOTAL_LIQDO'
      ExplicitTop = 216
    end
    inherited Label4: TLabel
      Top = 116
      ExplicitTop = 116
    end
    inherited lblDescPerc: TLabel
      Top = 116
      ExplicitTop = 116
    end
    object lblEntrada: TLabel [7]
      Left = 64
      Top = 155
      Width = 114
      Height = 33
      Alignment = taRightJustify
      Caption = 'Entrada '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    inherited edt_Desconto: TDBEdit
      Top = 74
      DataField = 'VEN_DESCONTO'
      ExplicitTop = 74
    end
    inherited rgTipoDesc: TRadioGroup
      Top = 68
      ExplicitTop = 68
    end
    object edtEntrada: TDBEdit
      Left = 184
      Top = 152
      Width = 147
      Height = 41
      DataField = 'VEN_ENTRADA'
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object DS_TipoPagto: TDataSource
    Left = 112
    Top = 51
  end
  object DS_Cliente: TDataSource
    Left = 16
    Top = 102
  end
  object DS_TipoPedido: TDataSource
    Left = 79
    Top = 102
  end
end
