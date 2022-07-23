object fmPesquisa: TfmPesquisa
  Left = 0
  Top = 0
  Caption = 'Selecionar Posicao'
  ClientHeight = 303
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 275
    Height = 257
    Align = alTop
    DataSource = dsPesquisa
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btok: TButton
    Left = 8
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object btCancelar: TButton
    Left = 152
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object fdPesquisa: TFDQuery
    SQL.Strings = (
      'Select * from posicao')
    Left = 128
    Top = 120
  end
  object dsPesquisa: TDataSource
    DataSet = fdPesquisa
    Left = 200
    Top = 112
  end
end
