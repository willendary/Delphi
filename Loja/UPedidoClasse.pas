unit UPedidoClasse;

interface

Uses sysutils, DB, Dialogs, ConexaoLojaData;

Type
  TPedido = Class
  private
    FdataPedido: TDateTime;
    FidUsuario: Integer;
    FidPedido: Integer;
    FidCliente: Integer;
    procedure SetdataPedido(const Value: TDateTime);
    procedure SetidCliente(const Value: Integer);
    procedure SetidPedido(const Value: Integer);
    procedure SetidUsuario(const Value: Integer);
  Public
    Constructor Create;
    Procedure Salvar;
    Procedure Excluir(AIdPedido: Integer); OverLoad;
    procedure Excluir; Overload;
  published
    Property idPedido: Integer read FidPedido write SetidPedido;
    Property dataPedido: TDateTime read FdataPedido write SetdataPedido;
    Property idCliente: Integer read FidCliente write SetidCliente;
    Property idUsuario: Integer read FidUsuario write SetidUsuario;
  End;

implementation

{ TPedido }

constructor TPedido.Create;
begin
  FidPedido := -1;
end;

procedure TPedido.Excluir(AIdPedido: Integer);
begin
  try
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from pedido  ');
    dmConexaoLoja.fdAux.SQL.Add('where idPedido = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := AIdPedido;
    dmConexaoLoja.fdAux.ExecSQL;
    ShowMessage('Registro Excluído com Sucesso!');
  Except
    on E: Exception do
      ShowMessage('Impossível Excluir registro.');
  end;
end;

procedure TPedido.Excluir;
begin
  Excluir(FidPedido);
end;

procedure TPedido.Salvar;
begin
  if FidPedido = -1 then
  begin
    try
      dmConexaoLoja.fdAux.Close;
      dmConexaoLoja.fdAux.SQL.Clear;
      dmConexaoLoja.fdAux.SQL.Add
        ('INSERT INTO PEDIDO (DATA, IDCLIENTE, IDUSUARIO)');
      dmConexaoLoja.fdAux.SQL.Add('VALUES (:data, :idcliente, :idusuario)');
      dmConexaoLoja.fdAux.ParamByName('data').AsDateTime := FdataPedido;
      dmConexaoLoja.fdAux.ParamByName('idcliente').AsInteger := FidCliente;
      dmConexaoLoja.fdAux.ParamByName('idUsuario').AsInteger := FidUsuario;
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
    dmConexaoLoja.fdAux.SQL.Add('update pedido');
    dmConexaoLoja.fdAux.SQL.Add('set data = :data,');
    dmConexaoLoja.fdAux.SQL.Add('idCliente = :idcliente,');
    dmConexaoLoja.fdAux.SQL.Add('idUsuario = :idUsuario');
    dmConexaoLoja.fdAux.SQL.Add('where idPedido = :idPedido');
    dmConexaoLoja.fdAux.ParamByName('idPedido').AsInteger := FidPedido;
    dmConexaoLoja.fdAux.ParamByName('data').AsDateTime := FdataPedido;
    dmConexaoLoja.fdAux.ParamByName('idCliente').AsInteger := FidCliente;
    dmConexaoLoja.fdAux.ParamByName('idUsuario').AsInteger := FidUsuario;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TPedido.SetdataPedido(const Value: TDateTime);
begin
  FdataPedido := Value;
end;

procedure TPedido.SetidCliente(const Value: Integer);
begin
  FidCliente := Value;
end;

procedure TPedido.SetidPedido(const Value: Integer);
begin
  FidPedido := Value;
end;

procedure TPedido.SetidUsuario(const Value: Integer);
begin
  FidUsuario := Value;
end;

end.
