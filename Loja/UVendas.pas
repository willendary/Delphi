unit UVendas;

interface
uses
  ConexaoLojaData;
type
TVendas = Class
  private
    FIDUSUARIO: Integer;
    FIDPEDIDO: Integer;
    FIDCLIENTE: Integer;
    FDATA: TDateTime;
    procedure SetDATA(const Value: TDateTime);
    procedure SetIDCLIENTE(const Value: Integer);
    procedure SetIDPEDIDO(const Value: Integer);
    procedure SetIDUSUARIO(const Value: Integer);
  public
    Procedure IncluirProduto(AidProduto, Aqtd:Integer);
    Procedure ExcluirProduto(AIDPEDIDOITENS: Integer);
    Procedure Salvar;
    Procedure Excluir;
    Constructor Create;
  published

  Property IDPEDIDO: Integer read FIDPEDIDO write SetIDPEDIDO;
  Property  DATA: TDateTime read FDATA write SetDATA;
  Property  IDCLIENTE: Integer read FIDCLIENTE write SetIDCLIENTE;
  Property  IDUSUARIO: Integer read FIDUSUARIO write SetIDUSUARIO;
End;

implementation

{ TVendas }

constructor TVendas.Create;
begin
  FIDPEDIDO := -1;
end;

procedure TVendas.Excluir;
begin
  if FIDPEDIDO > -1  then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from pedido_itens where idpedido = :id');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDPEDIDO;
    dmConexaoLoja.fdAux.ExecSQL;

    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from pedido where idpedido = :id');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDPEDIDO;
    dmConexaoLoja.fdAux.ExecSQL;
  end;

end;

procedure TVendas.ExcluirProduto(AIDPEDIDOITENS: Integer);
begin
  dmConexaoLoja.fdAux.Close;
  dmConexaoLoja.fdAux.SQL.Clear;
  dmConexaoLoja.fdAux.SQL.Add('delete from pedido_itens where IDPEDIDOITENS = :id');
  dmConexaoLoja.fdAux.ParamByName('id').AsInteger := AIDPEDIDOITENS;
  dmConexaoLoja.fdAux.ExecSQL;

end;

procedure TVendas.IncluirProduto(AidProduto, Aqtd: Integer);
begin
  if FIDPEDIDO > -1  then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('INSERT INTO PEDIDO_ITENS (IDPEDIDO, IDPRODUTO, ');
    dmConexaoLoja.fdAux.SQL.Add(' QUANTIDADE) VALUES (:IDPEDIDO, :IDPRODUTO, :QUANTIDADE)');
    dmConexaoLoja.fdAux.ParamByName('IDPEDIDO').AsInteger := FIDPEDIDO;
    dmConexaoLoja.fdAux.ParamByName('IDPRODUTO').AsInteger := AidProduto;
    dmConexaoLoja.fdAux.ParamByName('QUANTIDADE').AsInteger := Aqtd;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TVendas.Salvar;
begin
   if FIDPEDIDO > -1  then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('INSERT INTO PEDIDO (DATA, IDCLIENTE, IDUSUARIO) ');
    dmConexaoLoja.fdAux.SQL.Add(' VALUES (:DATA, :IDCLIENTE, :IDUSUARIO)');
    dmConexaoLoja.fdAux.ParamByName('data').AsDateTime := FDATA;
    dmConexaoLoja.fdAux.ParamByName('IDCLIENTE').AsInteger := FIDCLIENTE;
    dmConexaoLoja.fdAux.ParamByName('IDUSUARIO').AsInteger := FIDUSUARIO;
    dmConexaoLoja.fdAux.ExecSQL;
  end
  else
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('update PEDIDO set DATA = :DATA , IDCLIENTE = :IDCLIENTE,  ');
    dmConexaoLoja.fdAux.SQL.Add(' IDUSUARIO= :IDUSUARIO                                    ');
    dmConexaoLoja.fdAux.SQL.Add(' where idPedido = :id                                     ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDPEDIDO;
    dmConexaoLoja.fdAux.ParamByName('data').AsDateTime := FDATA;
    dmConexaoLoja.fdAux.ParamByName('IDCLIENTE').AsInteger := FIDCLIENTE;
    dmConexaoLoja.fdAux.ParamByName('IDUSUARIO').AsInteger := FIDUSUARIO;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TVendas.SetDATA(const Value: TDateTime);
begin
  FDATA := Value;
end;

procedure TVendas.SetIDCLIENTE(const Value: Integer);
begin
  FIDCLIENTE := Value;
end;

procedure TVendas.SetIDPEDIDO(const Value: Integer);
begin
  FIDPEDIDO := Value;
end;

procedure TVendas.SetIDUSUARIO(const Value: Integer);
begin
  FIDUSUARIO := Value;
end;

end.
