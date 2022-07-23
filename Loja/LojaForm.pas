unit LojaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LoginForm, ConexaoLojaData,
  UsuarioForm, Vcl.StdCtrls, TelaConfigForm, ClienteForm, FabricanteForm,
  CategoriaForm, ProdutoForm, PedidoForm;

type
  TfmLoja = class(TForm)
    btUsuario: TButton;
    btCliente: TButton;
    btFabricante: TButton;
    btCategoria: TButton;
    btProduto: TButton;
    btPedido: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btUsuarioClick(Sender: TObject);
    procedure btClienteClick(Sender: TObject);
    procedure btFabricanteClick(Sender: TObject);
    procedure btCategoriaClick(Sender: TObject);
    procedure btProdutoClick(Sender: TObject);
    procedure btPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLoja: TfmLoja;

implementation

{$R *.dfm}

procedure TfmLoja.btCategoriaClick(Sender: TObject);
var
  cat: TfmCategoria;
begin
  cat := TfmCategoria.Create(nil);
  try
    cat.ShowModal;
  finally
    FreeAndNil(cat);
  end;
end;

procedure TfmLoja.btClienteClick(Sender: TObject);
var
  cli: TfmCliente;
begin
  cli := TfmCliente.Create(nil);
  try
    cli.ShowModal;

  finally
    FreeAndNil(cli);
  end;
end;

procedure TfmLoja.btFabricanteClick(Sender: TObject);
var
  fab: TfmFabricante;
begin
  fab := TfmFabricante.Create(nil);
  try
    fab.ShowModal;
  finally
    FreeAndNil(fab);
  end;

end;

procedure TfmLoja.btPedidoClick(Sender: TObject);
Var
  PedidoTela: TfmPedido;
begin
  PedidoTela := TfmPedido.Create(nil);
  try
    PedidoTela.ShowModal;
  finally
    FreeAndNil(PedidoTela);
  end;
end;

procedure TfmLoja.btProdutoClick(Sender: TObject);
var
  ProdutoTela: TfmProduto;
begin
  ProdutoTela := TfmProduto.Create(nil);
  try
    ProdutoTela.ShowModal;
  finally
    FreeAndNil(ProdutoTela);
  end;
end;

procedure TfmLoja.btUsuarioClick(Sender: TObject);
var
  UsuarioTela: TfmUsuario;
begin
  // instância o objeto da tela de cadastro do usuário
  UsuarioTela := TfmUsuario.Create(nil);
  try
    // exibe a tela de usuário
    UsuarioTela.ShowModal;
  finally
    FreeAndNil(UsuarioTela);
  end;

end;

procedure TfmLoja.FormCreate(Sender: TObject);
var
  telalogin: TfmLogin;
  TelaConfig: TfmTelaConfig;
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Config.ini') then
  begin
    ShowMessage('É necessário configurar a conexão com o banco de dados');
    TelaConfig := TfmTelaConfig.Create(nil);
    try
      TelaConfig.ShowModal;

    finally
      FreeAndNil(TelaConfig);
    end;

  end;

  if not FileExists(ExtractFilePath(Application.ExeName) + 'Config.ini') then
  begin
    ShowMessage('Arquivo de configuração do banco de dados "' +
      ExtractFilePath(Application.ExeName) + 'Config.ini' +
      '" não foi localizado');
    Application.Terminate;
    exit;
  end;
  // instancia a tela de login
  telalogin := TfmLogin.Create(nil);
  try
    // exibe a tela de login
    telalogin.ShowModal;
  finally
    FreeAndNil(telalogin);
  end;

  // se o tipo do usuario que logou for administrador vai habilitar o botão
  btUsuario.Enabled := dmConexaoLoja.Usuario.Tipo = 'A';
  // se o tipo do usuario que logou for administrador vai exibir o botão
  // btUsuario.Visible := dmConexaoLoja.Usuario.Tipo = 'A';

  // os dados do usuário logado são salvos pela tela de login dentro de uma
  // variavel declarada dentro do datamodule

end;

procedure TfmLoja.FormShow(Sender: TObject);
begin

  // se após o formCreate o idUsuario ainda for -1 é sinal que o usuário
  // não se logou. Logo a aplicação deve ser encerrada
  if dmConexaoLoja.Usuario.idUsuario = -1 then
  begin
    // comando para encerrar a aplicação
    Application.Terminate;
    // CLose;
  end;
end;

end.
