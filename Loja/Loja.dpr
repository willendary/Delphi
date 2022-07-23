program Loja;

uses
  Vcl.Forms,
  LojaForm in 'LojaForm.pas' {fmLoja},
  ConexaoLojaData in 'ConexaoLojaData.pas' {dmConexaoLoja: TDataModule},
  LoginForm in 'LoginForm.pas' {fmLogin},
  CategoriaForm in 'CategoriaForm.pas' {fmCategoria},
  TelaConfigForm in 'TelaConfigForm.pas' {fmTelaConfig},
  uConexaoClasse in 'uConexaoClasse.pas',
  UUsuarioClasse in 'UUsuarioClasse.pas',
  FabricanteForm in 'FabricanteForm.pas' {fmFabricante},
  UsuarioForm in 'UsuarioForm.pas' {fmUsuario},
  ClienteForm in 'ClienteForm.pas' {fmCliente},
  UClientes in 'UClientes.pas',
  uCategoria in 'uCategoria.pas',
  UFabricantess in 'UFabricantess.pas',
  ProdutoForm in 'ProdutoForm.pas' {fmProduto},
  BuscaCategoriaProdutoForm in 'BuscaCategoriaProdutoForm.pas' {fmBuscaCategoriaProduto},
  buscaFabricanteProdutoForm in 'buscaFabricanteProdutoForm.pas' {buscaFabricanteProduto},
  UProdutoClasse in 'UProdutoClasse.pas',
  PedidoForm in 'PedidoForm.pas' {fmPedido},
  buscaClienteForm in 'buscaClienteForm.pas' {fmBuscaCliente},
  UPedidoItensClasse in 'UPedidoItensClasse.pas',
  UPedidoClasse in 'UPedidoClasse.pas',
  buscaProdutoForm in 'buscaProdutoForm.pas' {fmBuscaProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexaoLoja, dmConexaoLoja);
  Application.CreateForm(TfmLoja, fmLoja);
  Application.CreateForm(TfmProduto, fmProduto);
  Application.CreateForm(TfmBuscaCategoriaProduto, fmBuscaCategoriaProduto);
  Application.CreateForm(TbuscaFabricanteProduto, buscaFabricanteProduto);
  Application.CreateForm(TfmPedido, fmPedido);
  Application.CreateForm(TfmBuscaCliente, fmBuscaCliente);
  Application.CreateForm(TfmBuscaProduto, fmBuscaProduto);
  Application.Run;
end.
