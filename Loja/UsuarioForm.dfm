object fmUsuario: TfmUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de usu'#225'rios'
  ClientHeight = 298
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
    Width = 75
    Height = 13
    Caption = 'C'#243'digo usu'#225'rio:'
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
    Width = 29
    Height = 13
    Caption = 'Login:'
  end
  object Label4: TLabel
    Left = 191
    Top = 152
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 177
    Height = 251
    DataSource = dsUsuario
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
    Left = 270
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
    Width = 152
    Height = 21
    TabOrder = 6
  end
  object edLogin: TEdit
    Left = 191
    Top = 125
    Width = 152
    Height = 21
    TabOrder = 7
  end
  object edSenha: TEdit
    Left = 191
    Top = 171
    Width = 152
    Height = 21
    TabOrder = 8
  end
  object cbTipo: TCheckBox
    Left = 191
    Top = 208
    Width = 138
    Height = 17
    Caption = 'Usu'#225'rio administrador'
    TabOrder = 9
  end
  object cbAtivo: TCheckBox
    Left = 191
    Top = 231
    Width = 97
    Height = 17
    Caption = 'Ativo'
    TabOrder = 10
  end
  object dsUsuario: TDataSource
    DataSet = fdusuario
    OnDataChange = dsUsuarioDataChange
    Left = 48
    Top = 120
  end
  object fdusuario: TFDQuery
    SQL.Strings = (
      'Select * from usuario')
    Left = 112
    Top = 64
  end
end
