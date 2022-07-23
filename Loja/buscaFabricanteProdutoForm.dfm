object buscaFabricanteProduto: TbuscaFabricanteProduto
  Left = 0
  Top = 0
  Caption = 'Fabricante'
  ClientHeight = 324
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = -4
    Width = 316
    Height = 275
    DataSource = dsFabricanteProduto
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btOk: TButton
    Left = 0
    Top = 277
    Width = 73
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object bCancelar: TButton
    Left = 79
    Top = 277
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object dsFabricanteProduto: TDataSource
    DataSet = fdFabricanteProduto
    Left = 40
    Top = 72
  end
  object fdFabricanteProduto: TFDQuery
    FetchOptions.AssignedValues = [evItems]
    SQL.Strings = (
      'select * from fabricante')
    Left = 152
    Top = 72
  end
end
