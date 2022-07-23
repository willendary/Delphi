unit UProdutos;

interface
 uses
   SysUtils, Classes, ConexaoLojaData, DB;
type

TProduto = Class
  private
    FIdFabricante: Integer;
    FValor: Real;
    FDescricao: String;
    FIDProduto: Integer;
    FImagem: TMemoryStream;
    FQuantidade: Integer;
    FIdcategoria: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetIdcategoria(const Value: Integer);
    procedure SetIdFabricante(const Value: Integer);
    procedure SetIDProduto(const Value: Integer);
    procedure SetImagem(const Value: TMemoryStream);
    procedure SetQuantidade(const Value: Integer);
    procedure SetValor(const Value: Real);
  public
    Constructor Create;
    Procedure Excluir;
    Procedure Salvar;
  published
  Property IDProduto:Integer read FIDProduto write SetIDProduto;
  Property Descricao: String read FDescricao write SetDescricao;
  Property Valor: Real read FValor write SetValor;
  property Quantidade: Integer read FQuantidade write SetQuantidade;
  Property IdFabricante: Integer read FIdFabricante write SetIdFabricante;
  Property Idcategoria: Integer read FIdcategoria write SetIdcategoria;
  Property Imagem: TMemoryStream read FImagem write SetImagem;
End;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  FIdProduto := -1;
  FImagem := TMemoryStream.Create;
end;

procedure TProduto.Excluir;
begin
 if FIDProduto > -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from produto    ');
    dmConexaoLoja.fdAux.SQL.Add(' where idproduto = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FidProduto;
    dmConexaoLoja.fdAux.ExecSQL;
  end;

end;

procedure TProduto.Salvar;
begin
  if FIDProduto = -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('insert into produto ( DESCRICAO, VALOR,                   ');
    dmConexaoLoja.fdAux.SQL.Add(' QUANTIDADE, IMAGEM, IDFABRICANTE, IDCATEGORIA ) values ( ');
    dmConexaoLoja.fdAux.SQL.Add(' :DESCRICAO, :VALOR, :QUANTIDADE, :IMAGEM, :IDFABRICANTE, ');
    dmConexaoLoja.fdAux.SQL.Add(' :IDCATEGORIA )                           ');

    dmConexaoLoja.fdAux.ParamByName('DESCRICAO').AsString := FDescricao;
    dmConexaoLoja.fdAux.ParamByName('VALOR').AsFloat := FValor;
    dmConexaoLoja.fdAux.ParamByName('QUANTIDADE').AsInteger := FQuantidade;
        //Para atribuirmos um campo blob ao parametro (no nosso caso uma imagem) é
    // necessario carregarmos o mesmo no parambyname como no exemplo abaixo
    dmConexaoLoja.fdAux.ParamByName('IMAGEM').LoadFromStream(FImagem, ftBlob);
    dmConexaoLoja.fdAux.ParamByName('IDFABRICANTE').AsInteger := Fidfabricante;
    dmConexaoLoja.fdAux.ParamByName('IDCATEGORIA').Asinteger := FIdCategoria;

    dmConexaoLoja.fdAux.ExecSQL;
  end
  else
  begin
    // Caso contrário faz um update
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('update produto set DESCRICAO = :DESCRICAO, VALOR = :VALOR, ');
    dmConexaoLoja.fdAux.SQL.Add(' QUANTIDADE = :QUANTIDADE, IMAGEM = :IMAGEM, IDFABRICANTE = :IDFABRICANTE,      ');
    dmConexaoLoja.fdAux.SQL.Add(' IDCATEGORIA = :IDCATEGORIA                 ');
    dmConexaoLoja.fdAux.SQL.Add(' where idProduto = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIdProduto;
    dmConexaoLoja.fdAux.ParamByName('DESCRICAO').AsString := FDescricao;
    dmConexaoLoja.fdAux.ParamByName('VALOR').AsFloat := FValor;
    dmConexaoLoja.fdAux.ParamByName('QUANTIDADE').AsInteger := FQuantidade;
        //Para atribuirmos um campo blob ao parametro (no nosso caso uma imagem) é
    // necessario carregarmos o mesmo no parambyname como no exemplo abaixo
    dmConexaoLoja.fdAux.ParamByName('IMAGEM').LoadFromStream(FImagem, ftBlob);
    dmConexaoLoja.fdAux.ParamByName('IDFABRICANTE').AsInteger := Fidfabricante;
    dmConexaoLoja.fdAux.ParamByName('IDCATEGORIA').Asinteger := FIdCategoria;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetIdcategoria(const Value: Integer);
begin
  FIdcategoria := Value;
end;

procedure TProduto.SetIdFabricante(const Value: Integer);
begin
  FIdFabricante := Value;
end;

procedure TProduto.SetIDProduto(const Value: Integer);
begin
  FIDProduto := Value;
end;

procedure TProduto.SetImagem(const Value: TMemoryStream);
begin
  FImagem := Value;
end;

procedure TProduto.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TProduto.SetValor(const Value: Real);
begin
  FValor := Value;
end;

end.
