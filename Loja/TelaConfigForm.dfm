object fmTelaConfig: TfmTelaConfig
  Left = 0
  Top = 0
  Caption = 'fmTelaConfig'
  ClientHeight = 241
  ClientWidth = 238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object label1: TLabel
    Left = 16
    Top = 13
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label2: TLabel
    Left = 16
    Top = 77
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label3: TLabel
    Left = 16
    Top = 141
    Width = 50
    Height = 13
    Caption = 'Database:'
  end
  object edUsuario: TEdit
    Left = 16
    Top = 32
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object edSenha: TEdit
    Left = 16
    Top = 96
    Width = 181
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object edArquivo: TEdit
    Left = 16
    Top = 160
    Width = 169
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object btSalvar: TButton
    Left = 16
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btSalvarClick
  end
  object btCancelar: TButton
    Left = 150
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btCancelarClick
  end
  object btArquivo: TButton
    Left = 191
    Top = 158
    Width = 34
    Height = 25
    Caption = '...'
    TabOrder = 5
    OnClick = btArquivoClick
  end
  object btExibirSenha: TButton
    Left = 204
    Top = 94
    Width = 21
    Height = 25
    Caption = '0'
    TabOrder = 6
    OnClick = btExibirSenhaClick
  end
  object OpenDialog: TOpenDialog
    Left = 104
    Top = 112
  end
end
