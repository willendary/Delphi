object fmSelVendas: TfmSelVendas
  Left = 0
  Top = 0
  Caption = 'Sele'#231#227'o de Produtos - Vendas'
  ClientHeight = 227
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label4: TLabel
    Left = 201
    Top = 170
    Width = 65
    Height = 15
    Caption = 'Quantidade:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 177
    Height = 211
    DataSource = dsproduto
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edQuantidade: TEdit
    Left = 272
    Top = 167
    Width = 81
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnChange = edQuantidadeChange
  end
  object Panel1: TPanel
    Left = 191
    Top = 8
    Width = 162
    Height = 153
    BorderWidth = 8
    Caption = 'Imagem'
    TabOrder = 2
    object imFotoProd: TImage
      Left = 9
      Top = 9
      Width = 144
      Height = 135
      Align = alClient
      Stretch = True
      ExplicitLeft = -37
      ExplicitTop = 7
      ExplicitWidth = 128
      ExplicitHeight = 153
    end
  end
  object btok: TButton
    Left = 191
    Top = 194
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 3
  end
  object btCancelar: TButton
    Left = 278
    Top = 194
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
  object dsproduto: TDataSource
    DataSet = FDProduto
    OnDataChange = dsprodutoDataChange
    Left = 48
    Top = 120
  end
  object FDProduto: TFDQuery
    Connection = dmConexaoLoja.Conexao
    SQL.Strings = (
      'select P.*,'
      '       (select NOME'
      '        from FABRICANTE'
      
        '        where IDFABRICANTE = P.IDFABRICANTE) DESCRICAOFABRICANTE' +
        ','
      '        (select DESCRICAO'
      '        from PRODUTO_CATEGORIA'
      '        where IDcATEGORIA = P.idcategoria) DESCRICAOCATEGORIA'
      'from PRODUTO P  ')
    Left = 112
    Top = 64
  end
end
