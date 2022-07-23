object fmBuscaProduto: TfmBuscaProduto
  Left = 0
  Top = 0
  Caption = 'Buscar Produto'
  ClientHeight = 264
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid2: TDBGrid
    Left = 6
    Top = 8
    Width = 542
    Height = 217
    DataSource = dsCliente
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btSelecionar: TButton
    Left = 6
    Top = 231
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    ModalResult = 1
    TabOrder = 1
  end
  object dsCliente: TDataSource
    DataSet = fdCliente
    Left = 112
    Top = 72
  end
  object fdCliente: TFDQuery
    FetchOptions.AssignedValues = [evItems]
    SQL.Strings = (
      'select * from cliente')
    Left = 184
    Top = 80
  end
end
