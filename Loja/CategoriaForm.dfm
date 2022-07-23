object fmCategoria: TfmCategoria
  Left = 0
  Top = 0
  Caption = 'Categoria Produtos'
  ClientHeight = 146
  ClientWidth = 353
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
  object Label1: TLabel
    Left = 191
    Top = 8
    Width = 85
    Height = 13
    Caption = 'C'#243'digo categoria:'
  end
  object Label2: TLabel
    Left = 191
    Top = 56
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 177
    Height = 97
    DataSource = dsCategoria
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edId: TEdit
    Left = 193
    Top = 29
    Width = 152
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object btSalvar: TButton
    Left = 8
    Top = 111
    Width = 73
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btSalvarClick
  end
  object btIncluir: TButton
    Left = 95
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = btIncluirClick
  end
  object btExcluir: TButton
    Left = 183
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = btExcluirClick
  end
  object btFechar: TButton
    Left = 270
    Top = 111
    Width = 75
    Height = 27
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = btFecharClick
  end
  object edDescricao: TEdit
    Left = 191
    Top = 77
    Width = 152
    Height = 21
    TabOrder = 6
  end
  object dsCategoria: TDataSource
    DataSet = fdCategoria
    OnDataChange = dsCategoriaDataChange
    Left = 24
    Top = 56
  end
  object fdCategoria: TFDQuery
    SQL.Strings = (
      'Select * from PRODUTO_CATEGORIA')
    Left = 112
    Top = 56
  end
end
