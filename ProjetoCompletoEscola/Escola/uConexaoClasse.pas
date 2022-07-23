unit uConexaoClasse;

Interface

uses
  IniFiles, SysUtils, Forms, FireDAC.Comp.Client, Dialogs;

const
  Secao = 'Conexao';

type
  TConexao = class
  private
    FPath: string;
    FServidor: string;
    FPorta: integer;
    FDatabase: string;
    FSenha: string;
    FUsuario: string;
    FDriver: string;

  public
    constructor Create(Path: string);
    procedure LeINI(); virtual;
    procedure GravaINI(Usuario, Senha, Servidor, Banco: string); virtual;
    procedure Conectar(var Conexao: TFDConnection);

    property Path: string read FPath write FPath;
    property Servidor: string read FServidor write FServidor;
    property Porta: integer read FPorta write FPorta;
    property Database: string read FDatabase write FDatabase;
    property Senha: string read FSenha write FSenha;
    property Usuario: string read FUsuario write FUsuario;
    property Driver: string read FDriver write FDriver;

  end;

implementation

// L� o arquivo INI e carrega os par�metros no componente TFDConnection
procedure TConexao.Conectar(var Conexao: TFDConnection);
begin
  LeINI();

  try
    // Passa os par�metros para o objeto Conex�o
    Conexao.Connected := false;
    Conexao.LoginPrompt := false;
    // Conexao.Params.Clear;
    Conexao.Params.Add('user_name=' + Usuario);
    Conexao.Params.Add('password=' + Senha);
    Conexao.Params.Add('Database=' + Database);
  Except
    on E: Exception do
      ShowMessage('Erro ao carregar par�metros de conex�o!'#13#10 + E.Message);
  end;
end;

// M�todo construtor recebe o caminho do INI e nome da Se��o para Leitura
constructor TConexao.Create(Path: string);
begin
  Self.Path := Path;
end;

// Grava os par�metros recebidos no arquivo INI
procedure TConexao.GravaINI(Usuario, Senha, Servidor, Banco: string);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(Path);
  try
    ArqIni.WriteString(Secao, 'Usuario', Usuario);
    ArqIni.WriteString(Secao, 'Senha', Senha);
    ArqIni.WriteString(Secao, 'Database', Banco);
  finally
    ArqIni.Free;
  end;
end;

// L� os par�metros do arquivo INI e atribui para os atributos
procedure TConexao.LeINI();
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(Path);
  try
    Database := ArqIni.ReadString(Secao, 'Database', '');
    Senha := ArqIni.ReadString(Secao, 'Senha', '');
    Usuario := ArqIni.ReadString(Secao, 'Usuario', '');

  finally
    ArqIni.Free;
  end;
end;

end.
