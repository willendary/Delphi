object fmLogin: TfmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 188
  ClientWidth = 217
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
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label2: TLabel
    Left = 8
    Top = 77
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object edSenha: TEdit
    Left = 8
    Top = 96
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object edUsuario: TEdit
    Left = 8
    Top = 40
    Width = 201
    Height = 21
    TabOrder = 1
  end
  object btOk: TButton
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = btOkClick
  end
  object btCancelar: TButton
    Left = 120
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btCancelarClick
  end
end
