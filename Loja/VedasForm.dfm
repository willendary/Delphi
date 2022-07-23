object fmVendas: TfmVendas
  Left = 0
  Top = 0
  Caption = 'fmVendas'
  ClientHeight = 359
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 191
    Top = 8
    Width = 80
    Height = 15
    Caption = 'C'#243'digo cliente:'
  end
  object Label2: TLabel
    Left = 191
    Top = 56
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object lbLogin: TLabel
    Left = 191
    Top = 104
    Width = 52
    Height = 15
    Caption = 'Endere'#231'o:'
  end
  object Label4: TLabel
    Left = 478
    Top = 106
    Width = 47
    Height = 15
    Caption = 'N'#250'mero:'
  end
  object Label3: TLabel
    Left = 191
    Top = 152
    Width = 40
    Height = 15
    Caption = 'Cidade:'
  end
  object Label5: TLabel
    Left = 478
    Top = 154
    Width = 38
    Height = 15
    Caption = 'Estado:'
  end
  object Label6: TLabel
    Left = 191
    Top = 201
    Width = 66
    Height = 15
    Caption = 'Documento:'
  end
  object Label7: TLabel
    Left = 391
    Top = 201
    Width = 89
    Height = 15
    Caption = 'Data nascimento'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 177
    Height = 337
    DataSource = dsVendas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edId: TEdit
    Left = 191
    Top = 29
    Width = 152
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object btSalvar: TButton
    Left = 208
    Top = 265
    Width = 73
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
  end
  object btIncluir: TButton
    Left = 295
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
  end
  object btExcluir: TButton
    Left = 383
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
  end
  object btFechar: TButton
    Left = 469
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
  end
  object edNome: TEdit
    Left = 191
    Top = 77
    Width = 354
    Height = 21
    TabOrder = 6
  end
  object edEndereco: TEdit
    Left = 191
    Top = 125
    Width = 281
    Height = 21
    TabOrder = 7
  end
  object edNumero: TEdit
    Left = 478
    Top = 125
    Width = 67
    Height = 21
    NumbersOnly = True
    TabOrder = 8
  end
  object edCidade: TEdit
    Left = 191
    Top = 173
    Width = 281
    Height = 21
    TabOrder = 9
  end
  object edEstado: TEdit
    Left = 477
    Top = 173
    Width = 67
    Height = 21
    TabOrder = 10
  end
  object edDocumento: TEdit
    Left = 191
    Top = 220
    Width = 194
    Height = 21
    TabOrder = 11
  end
  object dtDataNasc: TDateTimePicker
    Left = 391
    Top = 220
    Width = 153
    Height = 21
    Date = 44701.000000000000000000
    Time = 0.961594872693240200
    TabOrder = 12
  end
  object dsVendas: TDataSource
    DataSet = fdVendas
    Left = 48
    Top = 120
  end
  object fdVendas: TFDQuery
    SQL.Strings = (
      'Select * from pedido')
    Left = 112
    Top = 64
  end
end
