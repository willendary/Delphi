unit ProdutoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  buscaCategoriaProdutoForm,
  Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ExtDlgs, ConexaoLojaData, UprodutoClasse, buscaFabricanteProdutoForm;

type
  TfmProduto = class(TForm)
    DBGrid1: TDBGrid;
    btSalvar: TButton;
    btIncluir: TButton;
    btExcluir: TButton;
    dsProduto: TDataSource;
    fdProduto: TFDQuery;
    Label1: TLabel;
    edId: TEdit;
    Label2: TLabel;
    edDescricao: TEdit;
    lbLogin: TLabel;
    edValor: TEdit;
    edQuantidade: TEdit;
    Label4: TLabel;
    edFabricante: TEdit;
    edCategoria: TEdit;
    Label5: TLabel;
    Label3: TLabel;
    btBuscaCategoria: TButton;
    btBuscaFabricante: TButton;
    imgProduto: TImage;
    btLocalizarFoto: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    edIdCategoria: TEdit;
    edIdFabricante: TEdit;
    Fechar: TButton;
    procedure btLocalizarFotoClick(Sender: TObject);
    procedure dsProdutoDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btBuscaCategoriaClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btBuscaFabricanteClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure FecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProduto: TfmProduto;

implementation

{$R *.dfm}

procedure TfmProduto.btBuscaCategoriaClick(Sender: TObject);
var
  telaBuscaCategoriaProduto: TfmBuscaCategoriaProduto;
begin
  telaBuscaCategoriaProduto := TfmBuscaCategoriaProduto.Create(nil);
  try
    if telaBuscaCategoriaProduto.ShowModal = mrOk then
    begin
      edCategoria.Text := telaBuscaCategoriaProduto.fdCategoriaProduto.FieldByName('descricao').AsString;
      edIdCategoria.Text := telaBuscaCategoriaProduto.fdCategoriaProduto.FieldByName('idCategoria').AsString;
    end;
  finally
    FreeAndNil(telaBuscaCategoriaProduto);
  end;
end;

procedure TfmProduto.btBuscaFabricanteClick(Sender: TObject);
var
  TelaBuscaFabricanteProduto: TbuscaFabricanteProduto;
begin
  TelaBuscaFabricanteProduto := TbuscaFabricanteProduto.Create(nil);
  try
    if TelaBuscaFabricanteProduto.ShowModal = mrOk then
    begin
      edFabricante.Text := TelaBuscaFabricanteProduto.fdFabricanteProduto.FieldByName('nome').AsString;
      edIdFabricante.Text := TelaBuscaFabricanteProduto.fdFabricanteProduto.FieldByName('idFabricante').AsString;
    end;
  finally
    FreeAndNil(TelaBuscaFabricanteProduto);
  end;
end;

procedure TfmProduto.btExcluirClick(Sender: TObject);
Var
  Produto: TProduto;
begin
  Produto := TProduto.Create;
  try
    Produto.IdProduto := StrToInt(edId.Text);
    Produto.Excluir;
    fdProduto.Refresh;
  finally

  end;
end;

procedure TfmProduto.btIncluirClick(Sender: TObject);
begin
  edId.Clear;
  edDescricao.Clear;
  edValor.Clear;
  edQuantidade.Clear;
  edFabricante.Clear;
  edIdFabricante.Clear;
  edCategoria.Clear;
  edIdCategoria.Clear;
end;

procedure TfmProduto.btLocalizarFotoClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    imgProduto.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TfmProduto.btSalvarClick(Sender: TObject);
Var
  Produto: TProduto;
begin
  Produto := TProduto.Create;
  try
    Produto.IdProduto := StrToIntDef(edId.Text, -1);
    Produto.Descricao := edDescricao.Text;
    Produto.Valor := StrToFloatDef(edValor.Text, -1);
    Produto.Quantidade := StrToFloatDef(edQuantidade.Text, -1);
    Produto.IdFabricante := StrToIntDef(edIdFabricante.Text, -1);
    Produto.IdCategoria := StrToIntDef(edIdCategoria.Text, -1);
    imgProduto.Picture.SaveToStream(Produto.ImagemProduto);
    Produto.Salvar;
    fdProduto.Refresh;
  finally
    FreeAndNil(Produto);
  end;
end;

procedure TfmProduto.dsProdutoDataChange(Sender: TObject; Field: TField);
var
  ImagemProduto: TMemoryStream;
begin
  imgProduto.Picture := nil;
  ImagemProduto := TMemoryStream.Create;
  edId.Text := fdProduto.FieldByName('idProduto').AsString;
  edDescricao.Text := fdProduto.FieldByName('descricao').AsString;
  edValor.Text := fdProduto.FieldByName('valor').AsString;
  edQuantidade.Text := fdProduto.FieldByName('quantidade').AsString;
  edFabricante.Text := fdProduto.FieldByName('nomeFabricante').AsString;
  edCategoria.Text := fdProduto.FieldByName('descricaoProdutoCategoria').AsString;
  edIdCategoria.Text := fdProduto.FieldByName('idCategoria').AsString;
  edIdFabricante.Text := fdProduto.FieldByName('idFabricante').AsString;
  TBlobField(fdProduto.FieldByName('IMAGEM')).SaveToStream(ImagemProduto);
  ImagemProduto.Position := 0;
  imgProduto.Picture.LoadFromStream(ImagemProduto);
end;

procedure TfmProduto.FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProduto.FormShow(Sender: TObject);
begin
  fdProduto.Connection := dmConexaoLoja.Conexao;
  fdProduto.Open();
end;

end.
