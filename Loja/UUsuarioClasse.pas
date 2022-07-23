unit UUsuarioClasse;

interface

uses
  sysUtils, ConexaoLojaData;

type

  TUsuarioDados = class
  private
    FAtivo: string;
    FidUsuario: Integer;
    Fsenha: string;
    FLogin: string;
    FNome: string;
    Ftipo: string;
    procedure SetAtivo(const Value: string);
    procedure SetidUsuario(const Value: Integer);
    procedure SetLogin(const Value: string);
    procedure SetNome(const Value: string);
    procedure Setsenha(const Value: string);
    procedure Settipo(const Value: string);
  public
    constructor Create;
    procedure Excluir;
    procedure Salvar;
  published

    property idUsuario: Integer read FidUsuario write SetidUsuario;
    property Nome: string read FNome write SetNome;
    property Login: string read FLogin write SetLogin;
    property senha: string read Fsenha write Setsenha;
    property tipo: string read Ftipo write Settipo;
    property Ativo: string read FAtivo write SetAtivo;
  end;

implementation

{ TUsuario }

constructor TUsuarioDados.Create;
begin
  FidUsuario := -1;
end;

procedure TUsuarioDados.Excluir;
begin
  if FidUsuario > -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('delete from usuario    ');
    dmConexaoLoja.fdAux.SQL.Add(' where idUsuario = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FidUsuario;
    dmConexaoLoja.fdAux.ExecSQL;
  end;
end;

procedure TUsuarioDados.Salvar;
begin
  // se o id do usuário é -1 então isgnifica que
  // deve ser um insert
  if FidUsuario = -1 then
  begin
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('insert into usuario ( NOME, LOGIN, SENHA,      ');
    dmConexaoLoja.fdAux.SQL.Add(' TIPO, ATIVO ) values ( :NOME, :LOGIN, :SENHA, ');
    dmConexaoLoja.fdAux.SQL.Add(' :TIPO, :ATIVO)                                ');

    dmConexaoLoja.fdAux.ParamByName('NOME').AsString := FNome;
    dmConexaoLoja.fdAux.ParamByName('LOGIN').AsString := FLogin;
    dmConexaoLoja.fdAux.ParamByName('SENHA').AsString := Fsenha;
    dmConexaoLoja.fdAux.ParamByName('TIPO').AsString := Ftipo;
    dmConexaoLoja.fdAux.ParamByName('ATIVO').AsString := FAtivo;
    dmConexaoLoja.fdAux.ExecSQL;
  end
  else
  begin
    // Caso contrário faz um update
    dmConexaoLoja.fdAux.Close;
    dmConexaoLoja.fdAux.SQL.Clear;
    dmConexaoLoja.fdAux.SQL.Add('update usuario set NOME = :nome, LOGIN = :Login, ');
    dmConexaoLoja.fdAux.SQL.Add(' senha = :senha, tipo = :tipo, ATIVO = :ativo    ');
    dmConexaoLoja.fdAux.SQL.Add(' where idUsuario = :id ');
    dmConexaoLoja.fdAux.ParamByName('id').AsInteger := FidUsuario;
    dmConexaoLoja.fdAux.ParamByName('NOME').AsString := FNome;
    dmConexaoLoja.fdAux.ParamByName('LOGIN').AsString := FLogin;
    dmConexaoLoja.fdAux.ParamByName('SENHA').AsString := Fsenha;
    dmConexaoLoja.fdAux.ParamByName('TIPO').AsString := Ftipo;
    dmConexaoLoja.fdAux.ParamByName('ATIVO').AsString := FAtivo;
    dmConexaoLoja.fdAux.ExecSQL;

  end;
end;

procedure TUsuarioDados.SetAtivo(const Value: string);
begin
  FAtivo := Value;
end;

procedure TUsuarioDados.SetidUsuario(const Value: Integer);
begin
  FidUsuario := Value;
end;

procedure TUsuarioDados.SetLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TUsuarioDados.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TUsuarioDados.Setsenha(const Value: string);
begin
  Fsenha := Value;
end;

procedure TUsuarioDados.Settipo(const Value: string);
begin
  Ftipo := Value;
end;

end.
