inherited frm_PesqDocumentos: Tfrm_PesqDocumentos
  Caption = 'Consulta de Documento'
  ClientHeight = 348
  ClientWidth = 688
  ExplicitWidth = 694
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel4: TPanel
    Width = 688
    Height = 348
    ExplicitWidth = 688
    ExplicitHeight = 348
    inherited Grid: TDBGrid
      Width = 688
      Height = 291
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMDOC'
          Title.Caption = 'Documento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Caption = 'Data Doc.'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIFOR'
          Title.Caption = 'Cliente/Fornecedor'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL'
          Title.Caption = 'Total Doc.'
          Width = 100
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 291
      Width = 688
      Height = 57
      ExplicitTop = 291
      ExplicitWidth = 688
      ExplicitHeight = 57
      inherited lblBusca: TLabel
        Left = 352
        Top = 24
        Width = 88
        Caption = 'N'#186' do Documento:'
        ExplicitLeft = 352
        ExplicitTop = 24
        ExplicitWidth = 88
      end
      inherited edt_pesq: TEdit
        Left = 447
        Top = 23
        Width = 109
        ExplicitLeft = 447
        ExplicitTop = 23
        ExplicitWidth = 109
      end
      inherited rgTipoBusca: TRadioGroup
        Left = 8
        Top = 9
        ExplicitLeft = 8
        ExplicitTop = 9
      end
      inherited btn_confirma: TBitBtn
        Left = 575
        Top = 13
        ExplicitLeft = 575
        ExplicitTop = 13
      end
    end
  end
  inherited DTS: TADODataSet
    Left = 482
    Top = 58
  end
  inherited DS: TDataSource
    Left = 570
    Top = 195
  end
  inherited QRY: TSQLQuery
    Params = <
      item
        DataType = ftString
        Name = 'NUMNOTA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      
        #9'ENT_ID as DOC_ID, ENT_NUMNOTA as NUMDOC, ENT_DT_ENTRADA'#9'as DATA' +
        ','
      #9'FOR_NOME as CLIFOR, ENT_TOTAL_NOTA as VLR_TOTAL, F.FOR_ID'
      'from'
      #9'ENTRADA N'
      'left join'
      #9'FORNECEDORES F on F.FOR_ID = N.FOR_ID'
      'where'
      #9'convert(varchar(10), ENT_NUMNOTA) LIKE :NUMNO')
    Left = 568
    Top = 55
  end
  inherited DSP: TDataSetProvider
    Left = 568
    Top = 101
  end
  inherited CDS: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'NUMNOTA'
        ParamType = ptInput
      end>
    Left = 568
    Top = 148
  end
end
