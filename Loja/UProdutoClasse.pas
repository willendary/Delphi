unit UProdutoClasse;

interface

uses DB, sysutils, classes, ConexaoLojaData, dialogs;

type
  TProduto = class
  private
    FIdFabricante: Integer;
    FValor: real;
    FDescricao: string;
    FIdProduto: Integer;
    FImagemProduto: TMemoryStream;
    FQuantidade: real;
    FIdCategoria: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetIdCategoria(const Value: Integer);
    procedure SetIdFabricante(const Value: Integer);
    procedure SetIdProduto(const Value: Integer);
    procedure SetImagemProduto(const Value: TMemoryStream);
    procedure SetQuantidade(const Value: real);
    procedure SetValor(const Value: real);
  public
    Constructor Create;
    Procedure Salvar;
    Procedure Excluir(AIdProduto: Integer); OverLoad;
    procedure Excluir; Overload;
  published
    property IdProduto: Integer read FIdProduto write SetIdProduto;
    property Descricao: string read FDescricao write SetDescricao;
    property Valor: real read FValor write SetValor;
    property Quantidade: real read FQuantidade write SetQuantidade;
    property ImagemProduto: TMemoryStream read FImagemProduto write SetImagemProduto;
    property IdFabricante: Integer read FIdFabricante write SetIdFabricante;
    property IdCategoria: Integer read FIdCategoria write SetIdCategoria;

    // idProduto, descricao, valor, quantidade, imagem, idfabricante, idcategoria
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  FIdProduto := -1;
  // o TMemoryStream é um objeto. Logo deve ser instanciado
  FImagemProduto := TMemoryStream.Create;
end;

procedure TProduto.Excluir(AIdProduto: Integer);
begin
  try
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from produto  ');
    dmConexaoLoja.fdAux.SQL.Add('where idproduto = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := AIdProduto;
    dmConexaoLoja.fdAux.ExecSQL;
    ShowMessage('Registro Excluído com Sucesso!');
  Except
    on E: Exception do
      ShowMessage('Impossível Excluir registro.');
  end;
end;

procedure TProduto.Excluir;
begin
  Excluir(FIdProduto);
end;

procedure TProduto.Salvar;
begin
  if FIdProduto = -1 then
  begin
    try
      dmConexaoLoja.fdAux.Close;
      dmConexaoLoja.fdAux.SQL.Clear;
      dmConexaoLoja.fdAux.SQL.Add('INSERT INTO PRODUTO (DESCRICAO, VALOR, QUANTIDADE, IMAGEM, IDFABRICANTE, IDCATEGORIA)');
      dmConexaoLoja.fdAux.SQL.Add('VALUES (:descricao, :valor, :quantidade, :imagem, :idFabricante, :IdCategoria)');
      dmConexaoLoja.fdAux.ParamByName('descricao').AsString := FDescricao;
      dmConexaoLoja.fdAux.ParamByName('valor').AsFloat := FValor;
      dmConexaoLoja.fdAux.ParamByName('quantidade').AsFloat := FQuantidade;
      dmConexaoLoja.fdAux.ParamByName('imagem').LoadFromStream(FImagemProduto, ftBlob);
      dmConexaoLoja.fdAux.ParamByName('idFabricante').AsInteger := FIdFabricante;
      dmConexaoLoja.fdAux.ParamByName('idCategoria').AsInteger := FIdCategoria;
      dmConexaoLoja.fdAux.ExecSQL;
    except
      on E: Exception do
        ShowMessage('Impossível Incluir o Registro. Verifique se TODAS as informações foram preenchidas!');
    end;
  end
  else
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('update produto');
    dmConexaoLoja.fdAux.SQL.Add('set descricao = :descricao,');
    dmConexaoLoja.fdAux.SQL.Add('valor = :valor,');
    dmConexaoLoja.fdAux.SQL.Add('quantidade = :quantidade,');
    dmConexaoLoja.fdAux.SQL.Add('idfabricante = :idfabricante,');
    dmConexaoLoja.fdAux.SQL.Add('imagem = :imagem,');
    dmConexaoLoja.fdAux.SQL.Add('idCategoria = :idcategoria');
    dmConexaoLoja.fdAux.SQL.Add('where idproduto = :idProduto');
    dmConexaoLoja.fdAux.ParamByName('idProduto').AsInteger := FIdProduto;
    dmConexaoLoja.fdAux.ParamByName('descricao').AsString := FDescricao;
    dmConexaoLoja.fdAux.ParamByName('valor').AsFloat := FValor;
    dmConexaoLoja.fdAux.ParamByName('quantidade').AsFloat := FQuantidade;
    dmConexaoLoja.fdAux.ParamByName('imagem').LoadFromStream(FImagemProduto, ftBlob);
    dmConexaoLoja.fdAux.ParamByName('idFabricante').AsInteger := FIdFabricante;
    dmConexaoLoja.fdAux.ParamByName('idcategoria').AsInteger := FIdCategoria;
    dmConexaoLoja.fdAux.ExecSQL;
  end;

  //
  // UPDATE PRODUTO
  // SET DESCRICAO = 'Fogão',
  // VALOR = 980,
  // QUANTIDADE = 20,
  // IDFABRICANTE = 5,
  // IDCATEGORIA = 1
  // WHERE (IDPRODUTO = 3);

end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetIdCategoria(const Value: Integer);
begin
  FIdCategoria := Value;
end;

procedure TProduto.SetIdFabricante(const Value: Integer);
begin
  FIdFabricante := Value;
end;

procedure TProduto.SetIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TProduto.SetImagemProduto(const Value: TMemoryStream);
begin
  FImagemProduto := Value;
end;

procedure TProduto.SetQuantidade(const Value: real);
begin
  FQuantidade := Value;
end;

procedure TProduto.SetValor(const Value: real);
begin
  FValor := Value;
end;

end.
