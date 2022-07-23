object fmVendas: TfmVendas
  Left = 0
  Top = 0
  BorderWidth = 8
  Caption = 'fmVendas'
  ClientHeight = 403
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 209
    Top = 0
    Width = 366
    Height = 374
    Align = alClient
    Caption = 'Vendas'
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 17
      Width = 362
      Height = 175
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label9: TLabel
        Left = 262
        Top = 0
        Width = 63
        Height = 15
        Caption = 'Total venda:'
      end
      object Label8: TLabel
        Left = 102
        Top = 0
        Width = 62
        Height = 15
        Caption = 'Data venda:'
      end
      object Label4: TLabel
        Left = 4
        Top = 100
        Width = 53
        Height = 15
        Caption = 'Vendedor:'
      end
      object Label2: TLabel
        Left = 4
        Top = 50
        Width = 40
        Height = 15
        Caption = 'Cliente:'
      end
      object Label1: TLabel
        Left = 4
        Top = 3
        Width = 77
        Height = 15
        Caption = 'C'#243'digo venda:'
      end
      object btSelCliente: TButton
        Left = 328
        Top = 69
        Width = 29
        Height = 25
        Caption = '...'
        TabOrder = 0
        OnClick = btSelClienteClick
      end
      object pnlBotesVendas: TPanel
        Left = 0
        Top = 134
        Width = 362
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object btExcluir: TButton
          Left = 164
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 0
          OnClick = btExcluirClick
        end
        object btSalvar: TButton
          Left = 4
          Top = 16
          Width = 73
          Height = 25
          Caption = 'Salvar'
          TabOrder = 1
          OnClick = btSalvarClick
        end
        object btIncluir: TButton
          Left = 83
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Incluir'
          TabOrder = 2
          OnClick = btIncluirClick
        end
      end
      object btSelVendedor: TButton
        Left = 328
        Top = 120
        Width = 29
        Height = 25
        Caption = '...'
        TabOrder = 2
        OnClick = btSelVendedorClick
      end
      object dtdataVenda: TDateTimePicker
        Left = 102
        Top = 21
        Width = 138
        Height = 23
        Date = 44720.000000000000000000
        Time = 0.946662465277768200
        TabOrder = 3
      end
      object edId: TEdit
        Left = 4
        Top = 21
        Width = 77
        Height = 23
        Enabled = False
        TabOrder = 4
      end
      object edIdCliente: TEdit
        Left = 4
        Top = 71
        Width = 52
        Height = 23
        Enabled = False
        NumbersOnly = True
        TabOrder = 5
      end
      object edIdVendedor: TEdit
        Left = 4
        Top = 121
        Width = 52
        Height = 23
        Enabled = False
        NumbersOnly = True
        TabOrder = 6
      end
      object edNomeCliente: TEdit
        Left = 62
        Top = 121
        Width = 260
        Height = 23
        Enabled = False
        TabOrder = 7
      end
      object edNomeVendedor: TEdit
        Left = 62
        Top = 71
        Width = 260
        Height = 23
        Enabled = False
        TabOrder = 8
      end
      object meTot: TMaskEdit
        Left = 262
        Top = 21
        Width = 95
        Height = 23
        Enabled = False
        EditMask = 'R$ 999,99;0;0'
        MaxLength = 9
        TabOrder = 9
        Text = ''
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 192
      Width = 362
      Height = 180
      Align = alBottom
      Caption = 'Produtos - Venda'
      TabOrder = 1
      object Label3: TLabel
        Left = 175
        Top = 26
        Width = 46
        Height = 15
        Caption = 'Produto:'
      end
      object Label5: TLabel
        Left = 175
        Top = 76
        Width = 65
        Height = 15
        Caption = 'Quantidade:'
      end
      object Panel4: TPanel
        Left = 2
        Top = 17
        Width = 175
        Height = 161
        Align = alLeft
        BevelOuter = bvNone
        BorderWidth = 8
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 8
          Top = 8
          Width = 159
          Height = 145
          Align = alClient
          DataSource = dsvendasProduto
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
      object edIdProduto: TEdit
        Left = 175
        Top = 47
        Width = 50
        Height = 23
        Enabled = False
        TabOrder = 1
      end
      object eddescProduto: TEdit
        Left = 231
        Top = 47
        Width = 127
        Height = 23
        Enabled = False
        TabOrder = 2
      end
      object edQuantidade: TEdit
        Left = 175
        Top = 97
        Width = 90
        Height = 23
        TabOrder = 3
      end
      object btIncluirProduto: TButton
        Left = 179
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Incluir'
        TabOrder = 4
        OnClick = btIncluirProdutoClick
      end
      object btExcluirProduto: TButton
        Left = 268
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 5
        OnClick = btExcluirProdutoClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 374
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 8
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 193
      Height = 358
      Align = alClient
      DataSource = dsVendas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 374
    Width = 575
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btFechar: TButton
      Left = 500
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
    end
  end
  object dsVendas: TDataSource
    DataSet = fdVendas
    OnDataChange = dsVendasDataChange
    Left = 48
    Top = 120
  end
  object fdVendas: TFDQuery
    SQL.Strings = (
      'select P.*,'
      '       (select NOME'
      '        from CLIENTE'
      '        where IDCLIENTE = P.IDCLIENTE) NOMECLIENTE,'
      '       (select NOME'
      '        from USUARIO'
      '        where IDUSUARIO = P.IDUSUARIO) NOMEUSUARIO,'
      '       (select sum(PR.VALOR * pi.QUANTIDADE)'
      '        from PEDIDO_ITENS pi'
      '        inner join PRODUTO PR on (PR.IDPRODUTO = pi.IDPRODUTO)'
      '        where pi.IDPEDIDO = P.IDPEDIDO) VALTOTAL'
      'from PEDIDO P  ')
    Left = 112
    Top = 64
  end
  object dsvendasProduto: TDataSource
    DataSet = fdvendasProduto
    OnDataChange = dsvendasProdutoDataChange
    Left = 240
    Top = 296
  end
  object fdvendasProduto: TFDQuery
    Connection = dmConexaoLoja.Conexao
    SQL.Strings = (
      'Select * from pedido')
    Left = 304
    Top = 240
  end
end
