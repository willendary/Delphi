unit UClientes;

interface

uses
  ConexaoLojaData;

Type
  TCliente = Class
  private
    FLogradouro: String;
    FDataNasc: TDateTime;
    FCPFCNPJ: String;
    FNumero: Integer;
    FIDCliente: Integer;
    FNome: String;
    FCidade: String;
    FEstado: String;
    procedure SetCidade(const Value: String);
    procedure SetCPFCNPJ(const Value: String);
    procedure SetDataNasc(const Value: TDateTime);
    procedure SetEstado(const Value: String);
    procedure SetIDCliente(const Value: Integer);
    procedure SetLogradouro(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetNumero(const Value: Integer);
  public
    constructor Create;
    procedure Excluir;
    procedure Salvar;

  published
    Property IDCliente: Integer read FIDCliente write SetIDCliente;
    Property Nome: String read FNome write SetNome;
    Property Logradouro: String read FLogradouro write SetLogradouro;
    Property Numero: Integer read FNumero write SetNumero;
    Property Cidade: String read FCidade write SetCidade;
    Property Estado: String read FEstado write SetEstado;
    Property CPFCNPJ: String read FCPFCNPJ write SetCPFCNPJ;
    Property DataNasc: TDateTime read FDataNasc write SetDataNasc;
  End;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  FIDCliente := -1;
end;

procedure TCliente.Excluir;
begin
  if FIDCliente > -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from cliente    ');
    dmConexaoLoja.fdAux.SQL.Add(' where idcliente = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDCliente;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TCliente.Salvar;
begin
  if FIDCliente = -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('insert into cliente ( nome, logradouro, numero, ');
    dmConexaoLoja.fdAux.SQL.Add(' cidade, estado, cpfcnpj, datanasc ) values (   ');
    dmConexaoLoja.fdAux.SQL.Add(' :nome, :logradouro, :numero, :cidade, :estado, ');
    dmConexaoLoja.fdAux.SQL.Add(' cpfcnpj, :datanasc )                           ');

    dmConexaoLoja.fdAux.ParamByName('NOME').AsString := FNome;
    dmConexaoLoja.fdAux.ParamByName('LOGRADOURO').AsString := FLogradouro;
    dmConexaoLoja.fdAux.ParamByName('NUMERO').AsInteger := FNumero;
    dmConexaoLoja.fdAux.ParamByName('CIDADE').AsString := FCidade;
    dmConexaoLoja.fdAux.ParamByName('ESTADO').AsString := FEstado;
    dmConexaoLoja.fdAux.ParamByName('cpfcnpj').AsString := FCPFCNPJ;
    dmConexaoLoja.fdAux.ParamByName('datanasc').AsDateTime := FDataNasc;

    dmConexaoLoja.fdAux.ExecSQL;
  end
  else
  begin
    // Caso contrário faz um update
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add(' update cliente set NOME = :nome, logradouro = :logradouro, ');
    dmConexaoLoja.fdAux.SQL.Add(' numero = :numero, cidade = :cidade, estado = :estado,      ');
    dmConexaoLoja.fdAux.SQL.Add(' cpfcnpj = :cpfcnpj, datanasc = :datanasc                  ');
    dmConexaoLoja.fdAux.SQL.Add(' where idCliente = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDCliente;
    dmConexaoLoja.fdAux.ParamByName('NOME').AsString := FNome;
    dmConexaoLoja.fdAux.ParamByName('LOGRADOURO').AsString := FLogradouro;
    dmConexaoLoja.fdAux.ParamByName('NUMERO').AsInteger := FNumero;
    dmConexaoLoja.fdAux.ParamByName('CIDADE').AsString := FCidade;
    dmConexaoLoja.fdAux.ParamByName('ESTADO').AsString := FEstado;
    dmConexaoLoja.fdAux.ParamByName('cpfcnpj').AsString := FCPFCNPJ;
    dmConexaoLoja.fdAux.ParamByName('datanasc').AsDateTime := FDataNasc;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TCliente.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TCliente.SetCPFCNPJ(const Value: String);
begin
  FCPFCNPJ := Value;
end;

procedure TCliente.SetDataNasc(const Value: TDateTime);
begin
  FDataNasc := Value;
end;

procedure TCliente.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TCliente.SetIDCliente(const Value: Integer);
begin
  FIDCliente := Value;
end;

procedure TCliente.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCliente.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

end.
