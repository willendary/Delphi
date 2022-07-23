unit UFabricantess;

interface

uses
  ConexaoLojaData;

Type
  TFabricante = Class
  private
    FLogradouro: String;
    FCNPJ: String;
    FNumero: Integer;
    FIDFabricante: Integer;
    FNome: String;
    FCidade: String;
    FEstado: String;
    FEmail: string;
    FTelefone: string;
    procedure SetCidade(const Value: String);
    procedure SetCNPJ(const Value: String);
    procedure SetEstado(const Value: String);
    procedure SetIDFabricante(const Value: Integer);
    procedure SetLogradouro(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetNumero(const Value: Integer);
    procedure SetEmail(const Value: string);
    procedure SetTelefone(const Value: string);
  public
    constructor Create;
    procedure Excluir;
    procedure Salvar;

  published
    Property IDFabricante: Integer read FIDFabricante write SetIDFabricante;
    Property Nome: String read FNome write SetNome;
    Property Logradouro: String read FLogradouro write SetLogradouro;
    Property Numero: Integer read FNumero write SetNumero;
    Property Cidade: String read FCidade write SetCidade;
    Property Estado: String read FEstado write SetEstado;
    Property CNPJ: String read FCNPJ write SetCNPJ;
    Property Telefone: string read FTelefone write SetTelefone;
    property Email: string read FEmail write SetEmail;

  End;

implementation

{ TCliente }

constructor TFabricante.Create;
begin
  FIDFabricante := -1;
end;

procedure TFabricante.Excluir;
begin
  if FIDFabricante > -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from FABRICANTE    ');
    dmConexaoLoja.fdAux.SQL.Add(' where idFABRICANTE = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDFabricante;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TFabricante.Salvar;
begin
  if FIDFabricante = -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('insert into FABRICANTE ( nome, logradouro, numero,  ');
    dmConexaoLoja.fdAux.SQL.Add(' cidade, estado, cnpj, telefone, email ) values (   ');
    dmConexaoLoja.fdAux.SQL.Add(' :nome, :logradouro, :numero, :cidade, :estado,     ');
    dmConexaoLoja.fdAux.SQL.Add('cnpj, :telefone, :email )                           ');

    dmConexaoLoja.fdAux.ParamByName('NOME').AsString := FNome;
    dmConexaoLoja.fdAux.ParamByName('LOGRADOURO').AsString := FLogradouro;
    dmConexaoLoja.fdAux.ParamByName('NUMERO').AsInteger := FNumero;
    dmConexaoLoja.fdAux.ParamByName('CIDADE').AsString := FCidade;
    dmConexaoLoja.fdAux.ParamByName('ESTADO').AsString := FEstado;
    dmConexaoLoja.fdAux.ParamByName('cnpj').AsString := FCNPJ;
    dmConexaoLoja.fdAux.ParamByName('telefone').AsString := FTelefone;
    dmConexaoLoja.fdAux.ParamByName('email').AsString := FEmail;

    dmConexaoLoja.fdAux.ExecSQL;
  end
  else
  begin
    // Caso contrário faz um update
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('update FABRICANTE set NOME = :nome, logradouro = :logradouro, ');
    dmConexaoLoja.fdAux.SQL.Add(' numero = :numero, cidade = :cidade, estado = :estado,         ');
    dmConexaoLoja.fdAux.SQL.Add(' cnpj = :cnpj, telefone = :telefone, email = :email           ');
    dmConexaoLoja.fdAux.SQL.Add(' where idFABRICANTE = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FIDFabricante;
    dmConexaoLoja.fdAux.ParamByName('NOME').AsString := FNome;
    dmConexaoLoja.fdAux.ParamByName('LOGRADOURO').AsString := FLogradouro;
    dmConexaoLoja.fdAux.ParamByName('NUMERO').AsInteger := FNumero;
    dmConexaoLoja.fdAux.ParamByName('CIDADE').AsString := FCidade;
    dmConexaoLoja.fdAux.ParamByName('ESTADO').AsString := FEstado;
    dmConexaoLoja.fdAux.ParamByName('cnpj').AsString := FCNPJ;
    dmConexaoLoja.fdAux.ParamByName('telefone').AsString := FTelefone;
    dmConexaoLoja.fdAux.ParamByName('email').AsString := FEmail;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TFabricante.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TFabricante.SetCNPJ(const Value: String);
begin
  FCNPJ := Value;
end;

procedure TFabricante.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TFabricante.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TFabricante.SetIDFabricante(const Value: Integer);
begin
  FIDFabricante := Value;
end;

procedure TFabricante.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TFabricante.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TFabricante.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TFabricante.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

end.
