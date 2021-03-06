inherited FrmPesqVendas: TFrmPesqVendas
  Caption = 'Pesquisa de Vendas'
  ClientHeight = 403
  ClientWidth = 578
  ExplicitWidth = 584
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 14
  inherited DBGrid1: TDBGrid
    Width = 578
    Height = 296
    TitleFont.Color = clBlack
    TitleFont.Name = 'Verdana'
    Columns = <
      item
        Expanded = False
        FieldName = 'VEN_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Title.Caption = 'N'#186' Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEN_DATA'
        Title.Caption = 'Data'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEN_TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Title.Caption = 'Total Venda'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEN_OBSERVACAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Title.Caption = 'Observa'#231#227'o'
        Width = 273
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    Top = 296
    Width = 578
    Height = 107
    ExplicitTop = 296
    ExplicitWidth = 578
    ExplicitHeight = 107
    inherited lbl_Periodo: TLabel
      Left = 5
      Top = 69
      ExplicitLeft = 5
      ExplicitTop = 69
    end
    inherited lbl_a: TLabel
      Left = 189
      Top = 70
      ExplicitLeft = 189
      ExplicitTop = 70
    end
    inherited lbl_nro: TLabel
      Left = 6
      Top = 21
      Width = 65
      Caption = 'N'#186' Venda:'
      ExplicitLeft = 6
      ExplicitTop = 21
      ExplicitWidth = 65
    end
    inherited btn_Confirma: TBitBtn
      Left = 413
      Top = 41
      Width = 134
      Height = 48
      OnClick = btn_ConfirmaClick
      ExplicitLeft = 413
      ExplicitTop = 41
      ExplicitWidth = 134
      ExplicitHeight = 48
    end
    inherited dt_inicial: TDateTimePicker
      Left = 81
      Top = 65
      Width = 101
      ExplicitLeft = 81
      ExplicitTop = 65
      ExplicitWidth = 101
    end
    inherited dt_final: TDateTimePicker
      Left = 202
      Top = 65
      Width = 100
      ExplicitLeft = 202
      ExplicitTop = 65
      ExplicitWidth = 100
    end
    inherited chk_datas: TCheckBox
      Top = 67
      Width = 62
      ExplicitTop = 67
      ExplicitWidth = 62
    end
    inherited edt_nro: TEdit
      Left = 81
      Top = 17
      Width = 273
      ExplicitLeft = 81
      ExplicitTop = 17
      ExplicitWidth = 273
    end
    inherited chk_Num: TCheckBox
      Left = 360
      Top = 18
      Width = 64
      ExplicitLeft = 360
      ExplicitTop = 18
      ExplicitWidth = 64
    end
  end
  inherited DSP: TDataSetProvider
    Left = 408
    Top = 96
  end
  inherited CDS: TClientDataSet
    CommandText = 
      'SELECT VEN_ID, VEN_DATA, VEN_TOTAL, VEN_OBSERVACAO FROM VENDA WH' +
      'ERE VEN_DATA BETWEEN :DT_INI AND :DT_FIN AND CONVERT(VARCHAR(20)' +
      ', VEN_ID) LIKE :VEN_ID'
    Params = <
      item
        DataType = ftDateTime
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VEN_ID'
        ParamType = ptInput
      end>
    Left = 408
    Top = 144
    object CDSVEN_ID: TIntegerField
      FieldName = 'VEN_ID'
    end
    object CDSVEN_TOTAL: TFMTBCDField
      FieldName = 'VEN_TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
    object CDSVEN_OBSERVACAO: TStringField
      FieldName = 'VEN_OBSERVACAO'
      Size = 1000
    end
    object CDSVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
  end
  inherited DS: TDataSource
    Left = 408
    Top = 192
  end
  inherited QRY: TSQLQuery
    Params = <
      item
        DataType = ftDateTime
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VEN_ID'
        ParamType = ptInput
      end>
    Left = 408
    Top = 47
  end
end
