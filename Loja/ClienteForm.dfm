object fmCliente: TfmCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 298
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 191
    Top = 8
    Width = 71
    Height = 13
    Caption = 'C'#243'digo cliente:'
  end
  object Label2: TLabel
    Left = 191
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lbLogin: TLabel
    Left = 191
    Top = 104
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object Label4: TLabel
    Left = 478
    Top = 106
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object Label3: TLabel
    Left = 191
    Top = 152
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object Label5: TLabel
    Left = 478
    Top = 154
    Width = 37
    Height = 13
    Caption = 'Estado:'
  end
  object Label6: TLabel
    Left = 191
    Top = 201
    Width = 58
    Height = 13
    Caption = 'Documento:'
  end
  object Label7: TLabel
    Left = 391
    Top = 201
    Width = 80
    Height = 13
    Caption = 'Data nascimento'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 177
    Height = 251
    DataSource = dsCliente
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
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
    Left = 8
    Top = 265
    Width = 73
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btSalvarClick
  end
  object btIncluir: TButton
    Left = 95
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = btIncluirClick
  end
  object btExcluir: TButton
    Left = 183
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = btExcluirClick
  end
  object btFechar: TButton
    Left = 469
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = btFecharClick
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
    Top = 127
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
  object dsCliente: TDataSource
    DataSet = fdCLiente
    OnDataChange = dsClienteDataChange
    Left = 48
    Top = 120
  end
  object fdCLiente: TFDQuery
    SQL.Strings = (
      'Select * from cliente')
    Left = 112
    Top = 64
  end
end
