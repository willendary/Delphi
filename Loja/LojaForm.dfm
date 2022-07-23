object fmLoja: TfmLoja
  Left = 0
  Top = 0
  Caption = 'Loja'
  ClientHeight = 101
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btUsuario: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Usu'#225'rio'
    TabOrder = 0
    OnClick = btUsuarioClick
  end
  object btCliente: TButton
    Left = 120
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Clientes'
    TabOrder = 1
    OnClick = btClienteClick
  end
  object btFabricante: TButton
    Left = 216
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Fabricante'
    TabOrder = 2
    OnClick = btFabricanteClick
  end
  object btCategoria: TButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Categoria'
    TabOrder = 3
    OnClick = btCategoriaClick
  end
  object btProduto: TButton
    Left = 120
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Produtos'
    TabOrder = 4
    OnClick = btProdutoClick
  end
  object btPedido: TButton
    Left = 216
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Pedido'
    TabOrder = 5
    OnClick = btPedidoClick
  end
end
