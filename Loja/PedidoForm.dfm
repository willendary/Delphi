object fmPedido: TfmPedido
  Left = 0
  Top = 0
  Caption = 'Pedido'
  ClientHeight = 509
  ClientWidth = 630
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
    Left = 8
    Top = 8
    Width = 76
    Height = 13
    Caption = 'Numero Pedido:'
  end
  object Label2: TLabel
    Left = 197
    Top = 8
    Width = 62
    Height = 13
    Caption = 'Data Pedido:'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 50
    Height = 13
    Caption = 'Vendedor:'
  end
  object Label4: TLabel
    Left = 235
    Top = 48
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 85
    Width = 310
    Height = 337
    Caption = 'Venda'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 3
      Top = 35
      Width = 292
      Height = 297
      DataSource = dsPedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object GroupBox2: TGroupBox
    Left = 324
    Top = 85
    Width = 298
    Height = 337
    Caption = 'Produtos'
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 3
      Top = 36
      Width = 292
      Height = 296
      DataSource = dsPedidoItens
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object btAdicionar: TButton
    Left = 327
    Top = 423
    Width = 106
    Height = 25
    Caption = '+ Adicionar Produto'
    TabOrder = 2
    OnClick = btAdicionarClick
  end
  object btRemover: TButton
    Left = 439
    Top = 423
    Width = 106
    Height = 25
    Caption = 'X Remover'
    TabOrder = 3
  end
  object edNumeroPedido: TEdit
    Left = 90
    Top = 5
    Width = 89
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object btSalvarPedido: TButton
    Left = 8
    Top = 423
    Width = 76
    Height = 25
    Caption = 'Salvar Pedido'
    TabOrder = 5
    OnClick = btSalvarPedidoClick
  end
  object dtDataPedido: TDateTimePicker
    Left = 265
    Top = 4
    Width = 105
    Height = 21
    Date = 44716.000000000000000000
    Time = 0.397534166666446300
    TabOrder = 6
  end
  object edCliente: TEdit
    Left = 416
    Top = 5
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object edCodigoCliente: TEdit
    Left = 385
    Top = 5
    Width = 25
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object edBuscaCliente: TButton
    Left = 543
    Top = 5
    Width = 26
    Height = 21
    Caption = '...'
    TabOrder = 9
    OnClick = edBuscaClienteClick
  end
  object edVendedor: TEdit
    Left = 60
    Top = 45
    Width = 169
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object edValor: TEdit
    Left = 265
    Top = 45
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object btIncluirPedido: TButton
    Left = 112
    Top = 423
    Width = 81
    Height = 25
    Caption = 'Incluir'
    TabOrder = 12
    OnClick = btIncluirPedidoClick
  end
  object btExcluir: TButton
    Left = 232
    Top = 423
    Width = 71
    Height = 25
    Caption = 'Excluir'
    TabOrder = 13
    OnClick = btExcluirClick
  end
  object fdPedido: TFDQuery
    FetchOptions.AssignedValues = [evItems]
    SQL.Strings = (
      'select P.*, C.NOME,'
      '       (select sum(VALOR * PEI.quantidade)'
      '        from PRODUTO PRO'
      '        left join PEDIDO_ITENS PEI on PEI.IDPEDIDO = P.IDPEDIDO'
      '        where PRO.IDPRODUTO = PEI.IDPRODUTO) as TOTAL'
      'from PEDIDO P'
      'left join CLIENTE C on C.IDCLIENTE = P.IDCLIENTE')
    Left = 168
    Top = 168
  end
  object dsPedido: TDataSource
    DataSet = fdPedido
    OnDataChange = dsPedidoDataChange
    Left = 96
    Top = 168
  end
  object fdPedidoItens: TFDQuery
    FetchOptions.AssignedValues = [evItems]
    SQL.Strings = (
      'select * from pedido_itens'
      'where idPedido = :idPedido')
    Left = 408
    Top = 141
    ParamData = <
      item
        Name = 'IDPEDIDO'
        ParamType = ptInput
      end>
  end
  object dsPedidoItens: TDataSource
    DataSet = fdPedidoItens
    Left = 528
    Top = 141
  end
end
