object fmProduto: TfmProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 326
  ClientWidth = 617
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
    Left = 256
    Top = 8
    Width = 78
    Height = 13
    Caption = 'C'#243'digo produto:'
  end
  object Label2: TLabel
    Left = 256
    Top = 56
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object lbLogin: TLabel
    Left = 256
    Top = 104
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Label4: TLabel
    Left = 341
    Top = 106
    Width = 60
    Height = 13
    Caption = 'Quantidade:'
  end
  object Label5: TLabel
    Left = 415
    Top = 10
    Width = 51
    Height = 13
    Caption = 'Categoria:'
  end
  object Label3: TLabel
    Left = 414
    Top = 106
    Width = 55
    Height = 13
    Caption = 'Fabricante:'
  end
  object imgProduto: TImage
    Left = 256
    Top = 160
    Width = 185
    Height = 145
    Stretch = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 8
    Width = 241
    Height = 275
    DataSource = dsProduto
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btSalvar: TButton
    Left = 0
    Top = 293
    Width = 73
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = btSalvarClick
  end
  object btIncluir: TButton
    Left = 79
    Top = 293
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 9
    OnClick = btIncluirClick
  end
  object btExcluir: TButton
    Left = 160
    Top = 293
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 10
    OnClick = btExcluirClick
  end
  object edId: TEdit
    Left = 256
    Top = 29
    Width = 152
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edDescricao: TEdit
    Left = 256
    Top = 77
    Width = 354
    Height = 21
    TabOrder = 2
  end
  object edValor: TEdit
    Left = 256
    Top = 125
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object edQuantidade: TEdit
    Left = 341
    Top = 125
    Width = 67
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object edFabricante: TEdit
    Left = 414
    Top = 125
    Width = 146
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object edCategoria: TEdit
    Left = 414
    Top = 29
    Width = 146
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object btBuscaCategoria: TButton
    Left = 586
    Top = 27
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 11
    OnClick = btBuscaCategoriaClick
  end
  object btBuscaFabricante: TButton
    Left = 586
    Top = 123
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 12
    OnClick = btBuscaFabricanteClick
  end
  object btLocalizarFoto: TButton
    Left = 447
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Foto'
    TabOrder = 6
    OnClick = btLocalizarFotoClick
  end
  object edIdCategoria: TEdit
    Left = 561
    Top = 29
    Width = 25
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object edIdFabricante: TEdit
    Left = 561
    Top = 125
    Width = 25
    Height = 21
    Enabled = False
    TabOrder = 14
  end
  object Fechar: TButton
    Left = 536
    Top = 293
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 15
    OnClick = FecharClick
  end
  object dsProduto: TDataSource
    DataSet = fdProduto
    OnDataChange = dsProdutoDataChange
    Left = 48
    Top = 120
  end
  object fdProduto: TFDQuery
    FetchOptions.AssignedValues = [evItems]
    SQL.Strings = (
      
        'select p.*, pc.descricao as descricaoProdutoCategoria, pc.idCate' +
        'goria ,f.nome as nomeFabricante, f.idFabricante from produto p'
      'left join produto_categoria pc on pc.idcategoria = p.idcategoria'
      'left join fabricante f on f.idfabricante = p.idFabricante')
    Left = 112
    Top = 64
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 520
    Top = 192
  end
end
