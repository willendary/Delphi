object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 357
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 39
    Height = 13
    Caption = 'URL API'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 44
    Height = 13
    Caption = 'Conselho'
  end
  object Label3: TLabel
    Left = 8
    Top = 171
    Width = 92
    Height = 13
    Caption = 'Conselho traduzido'
  end
  object edURLAPI: TEdit
    Left = 8
    Top = 32
    Width = 201
    Height = 21
    TabOrder = 0
    Text = 'https://api.adviceslip.com/advice'
  end
  object btExecutarComando: TButton
    Left = 215
    Top = 30
    Width = 98
    Height = 25
    Caption = 'Executar comando'
    TabOrder = 1
    OnClick = btExecutarComandoClick
  end
  object btTraduzir: TButton
    Left = 319
    Top = 76
    Width = 98
    Height = 25
    Caption = 'Traduzir'
    TabOrder = 2
    OnClick = btTraduzirClick
  end
  object memoConselho: TMemo
    Left = 8
    Top = 76
    Width = 305
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object memoTraducao: TMemo
    Left = 8
    Top = 196
    Width = 305
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 4
  end
  object RESTClient1: TRESTClient
    Params = <>
    Left = 336
    Top = 168
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 376
    Top = 168
  end
  object RESTResponse1: TRESTResponse
    Left = 424
    Top = 168
  end
end
