object fmBuscaCategoriaProduto: TfmBuscaCategoriaProduto
  Left = 0
  Top = 0
  Caption = 'Categoria do Produto'
  ClientHeight = 305
  ClientWidth = 317
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
    Top = -7
    Width = 316
    Height = 275
    DataSource = dsCategoriaProduto
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object bCancelar: TButton
    Left = 85
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object btOk: TButton
    Left = 6
    Top = 272
    Width = 73
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
  object fdCategoriaProduto: TFDQuery
    FetchOptions.AssignedValues = [evItems]
    SQL.Strings = (
      'select * from produto_categoria')
    Left = 136
    Top = 72
  end
  object dsCategoriaProduto: TDataSource
    DataSet = fdCategoriaProduto
    Left = 40
    Top = 72
  end
end
