unit uCategoria;

interface

uses
  ConexaoLojaData;

type
  TCategoria = class
  private
    FDescricao: string;
    FIDCategoria: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetIDCategoria(const Value: Integer);
  public
    constructor Create;
    procedure Excluir;
    procedure Salvar;
  published

    property IDCategoria: Integer read FIDCategoria write SetIDCategoria;
    property Descricao: string read FDescricao write SetDescricao;
  end;

implementation

{ TCategoria }

constructor TCategoria.Create;
begin
  FIDCategoria := -1;
end;

procedure TCategoria.Excluir;
begin
  if FIDCategoria > -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from PRODUTO_CATEGORIA    ');
    dmConexaoLoja.fdAux.SQL.Add(' where IDCATEGORIA = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDCategoria;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TCategoria.Salvar;
begin
  if FIDCategoria = -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('insert into PRODUTO_CATEGORIA ( descricao )     ');
    dmConexaoLoja.fdAux.SQL.Add('  values ( :descricao)                          ');

    dmConexaoLoja.fdAux.ParamByName('descricao').AsString := FDescricao;

    dmConexaoLoja.fdAux.ExecSQL;
  end
  else
  begin
    // Caso contrário faz um update
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('update PRODUTO_CATEGORIA set descricao = :descricao  ');
    dmConexaoLoja.fdAux.SQL.Add(' where IDCATEGORIA = :id                             ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDCategoria;
    dmConexaoLoja.fdAux.ParamByName('descricao').AsString := FDescricao;

    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TCategoria.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCategoria.SetIDCategoria(const Value: Integer);
begin
  FIDCategoria := Value;
end;

end.
