unit UPedidoItensClasse;

interface

Uses sysutils, DB, Dialogs, ConexaoLojaData;

type
  TPedidoItens = Class
  private
    FidProduto: Integer;
    FQuantidade: Real;
    FidPedido: Integer;
    FidPedidoItens: Integer;
    procedure SetidPedido(const Value: Integer);
    procedure SetidPedidoItens(const Value: Integer);
    procedure SetidProduto(const Value: Integer);
    procedure SetQuantidade(const Value: Real);
  Public
    Constructor Create;
    Procedure Salvar;
    Procedure Excluir(AIdPedidoItens: Integer); OverLoad;
    procedure Excluir; Overload;
  published
    Property idPedidoItens: Integer read FidPedidoItens write SetidPedidoItens;
    Property idPedido: Integer read FidPedido write SetidPedido;
    Property idProduto: Integer read FidProduto write SetidProduto;
    Property Quantidade: Real read FQuantidade write SetQuantidade;
  End;

implementation

{ TPedidoItens }

constructor TPedidoItens.Create;
begin
  FidPedidoItens := -1;
end;

procedure TPedidoItens.Excluir(AIdPedidoItens: Integer);
begin
  try
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from pedido_itens  ');
    dmConexaoLoja.fdAux.SQL.Add('where idPedidoItens = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := AIdPedidoItens;
    dmConexaoLoja.fdAux.ExecSQL;
    ShowMessage('Registro Excluído com Sucesso!');
  Except
    on E: Exception do
      ShowMessage('Impossível Excluir registro.');
  end;
end;

procedure TPedidoItens.Excluir;
begin
  Excluir(FidPedidoItens);
end;

procedure TPedidoItens.Salvar;
begin
  if FidPedido = -1 then
  begin
    try
      dmConexaoLoja.fdAux.Close;
      dmConexaoLoja.fdAux.SQL.Clear;
      dmConexaoLoja.fdAux.SQL.Add
        ('INSERT INTO PEDIDO_ITENS (IDPEDIDO, IDPRODUTO, QUANTIDADE)');
      dmConexaoLoja.fdAux.SQL.Add
        ('VALUES (:idpedido, :idproduto, :quantidade)');
      dmConexaoLoja.fdAux.ParamByName('idpedido').AsInteger := FidPedido;
      dmConexaoLoja.fdAux.ParamByName('idproduto').AsInteger := FidProduto;
      dmConexaoLoja.fdAux.ParamByName('quantidade').AsFloat := FQuantidade;
      dmConexaoLoja.fdAux.ExecSQL;
    except
      on E: Exception do
        ShowMessage
          ('Impossível Incluir o Registro. Verifique se TODAS as informações foram preenchidas!');
    end;
  end
  else
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('update pedido_itens');
    dmConexaoLoja.fdAux.SQL.Add('set iPedido = :idPedido,');
    dmConexaoLoja.fdAux.SQL.Add('idProduto = :idProduto,');
    dmConexaoLoja.fdAux.SQL.Add('quantidade = :idQuantidade');
    dmConexaoLoja.fdAux.SQL.Add('where idPedidoItens = :idPedidoItens');
    dmConexaoLoja.fdAux.ParamByName('idpedido').AsInteger := FidPedido;
    dmConexaoLoja.fdAux.ParamByName('idproduto').AsInteger := FidProduto;
    dmConexaoLoja.fdAux.ParamByName('quantidade').AsFloat := FQuantidade;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TPedidoItens.SetidPedido(const Value: Integer);
begin
  FidPedido := Value;
end;

procedure TPedidoItens.SetidPedidoItens(const Value: Integer);
begin
  FidPedidoItens := Value;
end;

procedure TPedidoItens.SetidProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

procedure TPedidoItens.SetQuantidade(const Value: Real);
begin
  FQuantidade := Value;
end;

end.
