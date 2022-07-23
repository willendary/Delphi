unit PedidoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ConexaoLojaData, buscaClienteForm, UPedidoClasse,
  UPedidoItensClasse;

type
  TfmPedido = class(TForm)
    fdPedido: TFDQuery;
    dsPedido: TDataSource;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    fdPedidoItens: TFDQuery;
    dsPedidoItens: TDataSource;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    btAdicionar: TButton;
    btRemover: TButton;
    edNumeroPedido: TEdit;
    Label1: TLabel;
    btSalvarPedido: TButton;
    dtDataPedido: TDateTimePicker;
    Label2: TLabel;
    edCliente: TEdit;
    edCodigoCliente: TEdit;
    edBuscaCliente: TButton;
    edVendedor: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edValor: TEdit;
    btIncluirPedido: TButton;
    btExcluir: TButton;
    procedure FormShow(Sender: TObject);
    procedure dsPedidoDataChange(Sender: TObject; Field: TField);
    procedure edBuscaClienteClick(Sender: TObject);
    procedure btIncluirPedidoClick(Sender: TObject);
    procedure btSalvarPedidoClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPedido: TfmPedido;

implementation

{$R *.dfm}

procedure TfmPedido.btAdicionarClick(Sender: TObject);
Var
  PedidoItens: TPedidoItens;
begin
  PedidoItens:= TPedidoItens.Create;
  PedidoItens.idPedidoItens := fdPedidoItens.FieldByName('idPedidoItens').AsInteger;
  PedidoItens.idPedido := fdPedido.FieldByName('idPedido').AsInteger;
  PedidoItens.idProduto := fdPedidoItens.FieldByName('idPedidoItens').AsInteger;
  PedidoItens.Quantidade := 1;
end;

procedure TfmPedido.btExcluirClick(Sender: TObject);
var
  Pedido: TPedido;
begin
  Pedido := TPedido.Create;
  try
    Pedido.idPedido := StrToInt(edNumeroPedido.Text);
    Pedido.Excluir;
    fdPedido.Refresh;
  finally

  end;
end;

procedure TfmPedido.btIncluirPedidoClick(Sender: TObject);
begin
  edNumeroPedido.Clear;
  edCliente.Clear;
  edCodigoCliente.Clear;
  edVendedor.Clear;
  edValor.Clear;
end;

procedure TfmPedido.btSalvarPedidoClick(Sender: TObject);
Var
  Pedido: TPedido;
begin
  Pedido := TPedido.Create;
  Pedido.idPedido := StrToIntDef(edNumeroPedido.Text, 1);
  Pedido.dataPedido := dtDataPedido.Date;
  Pedido.idCliente := StrToIntDef(edCliente.Text, 1);
  Pedido.idUsuario := dmConexaoLoja.Usuario.idUsuario;
  Pedido.Salvar;
  fdPedido.Refresh;
end;

procedure TfmPedido.dsPedidoDataChange(Sender: TObject; Field: TField);
begin
  edNumeroPedido.Text := fdPedido.FieldByName('idPedido').AsString;
  edCliente.Text := fdPedido.FieldByName('nome').AsString;
  edCodigoCliente.Text := fdPedido.FieldByName('idcliente').AsString;
  edVendedor.Text := dmConexaoLoja.Usuario.Nome;
  edValor.Text := fdPedido.FieldByName('total').AsString;
  fdPedidoItens.Close;
  fdPedidoItens.ParamByName('idPedido').AsString := edNumeroPedido.Text;
  fdPedidoItens.open;
end;

procedure TfmPedido.edBuscaClienteClick(Sender: TObject);
var
  BuscaClienteTela: TFmBuscaCliente;
begin
  BuscaClienteTela := TFmBuscaCliente.Create(nil);
  try
    if BuscaClienteTela.ShowModal = mrOk then
    begin
      edCodigoCliente.Text := BuscaClienteTela.fdCliente.FieldByName
        ('idCliente').AsString;
      edCliente.Text := BuscaClienteTela.fdCliente.FieldByName('Nome').AsString;
    end;
  finally
    FreeAndNil(BuscaClienteTela);
  end;
end;

procedure TfmPedido.FormShow(Sender: TObject);
begin
  fdPedido.Connection := dmConexaoLoja.Conexao;
  fdPedido.open;
  fdPedidoItens.Connection := dmConexaoLoja.Conexao;
  fdPedidoItens.open;
end;

end.
