unit VendasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, ConexaoLojadata, Vcl.ExtCtrls, Vcl.Mask, PEsquisaForm,
  SelProdutoVendaForm, UVendas;

type
  TfmVendas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    edId: TEdit;
    btSalvar: TButton;
    btIncluir: TButton;
    btExcluir: TButton;
    btFechar: TButton;
    edNomeCliente: TEdit;
    edQuantidade: TEdit;
    edIdProduto: TEdit;
    eddescProduto: TEdit;
    dsVendas: TDataSource;
    fdVendas: TFDQuery;
    Label8: TLabel;
    dtdataVenda: TDateTimePicker;
    edIdCliente: TEdit;
    btSelCliente: TButton;
    edIdVendedor: TEdit;
    edNomeVendedor: TEdit;
    btSelVendedor: TButton;
    Label4: TLabel;
    Label9: TLabel;
    meTot: TMaskEdit;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    pnlBotesVendas: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    btIncluirProduto: TButton;
    btExcluirProduto: TButton;
    dsvendasProduto: TDataSource;
    fdvendasProduto: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure dsVendasDataChange(Sender: TObject; Field: TField);
    procedure dsvendasProdutoDataChange(Sender: TObject; Field: TField);
    procedure btSelClienteClick(Sender: TObject);
    procedure btSelVendedorClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btIncluirProdutoClick(Sender: TObject);
    procedure btExcluirProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmVendas: TfmVendas;

implementation

{$R *.dfm}

procedure TfmVendas.btExcluirClick(Sender: TObject);
var
  vendas : TVendas;
begin
  Vendas := TVendas.Create;
  try
    if edId.Text <> '' then
    begin
      if messagedlg('Deseja excluir essa venda permanentemente?',TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrYes then
      begin
        Vendas.Excluir;
        fdVendas.Refresh;
      end;
    end;

  finally
    FreeAndNil(vendas);
  end;
end;

procedure TfmVendas.btExcluirProdutoClick(Sender: TObject);
var
  vendas : TVendas;
begin
  Vendas := TVendas.Create;
  try
    if messagedlg('Deseja excluir esse produto permanentemente da venda?',TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrYes then
    begin
      Vendas.ExcluirProduto(fdvendasProduto.FieldByName('IDPEDIDOITENS').AsInteger);
      fdVendas.Refresh;
    end;
  finally
    FreeAndNil(vendas);
  end;

end;

procedure TfmVendas.btIncluirClick(Sender: TObject);
begin
  edId.Clear;
  edIdCliente.Clear;
  edIdVendedor.Clear;
  dtdataVenda.DateTime := Now;
  edNomeCliente.Clear;
  edNomeVendedor.Clear;
end;

procedure TfmVendas.btIncluirProdutoClick(Sender: TObject);
var
  fmSelProd : TfmSelVendas;
  Vendas : TVendas;
begin
  fmSelProd := TfmSelVendas.Create(nil);
  try
    if fmSelProd.ShowModal = mrOk then
    begin
      Vendas := TVendas.Create;
      try
        Vendas.IncluirProduto(fmSelProd.FDProduto.FieldByName('idProduto').AsInteger,
                              StrToint(fmSelProd.edQuantidade.Text));
        fdVendas.Refresh;
      finally
        FreeAndNil(Vendas);
      end;
    end;

  finally
    FreeAndNil(fmSelProd);
  end;

end;

procedure TfmVendas.btSalvarClick(Sender: TObject);
var
  vendas : TVendas;
begin
  Vendas := TVendas.Create;
  try
    Vendas.IDPEDIDO := StrToIntDef(edId.Text, -1);
    Vendas.DATA := dtdataVenda.DateTime;
    vendas.IDCLIENTE := StrToInt(edIdCliente.Text);
    Vendas.IDUSUARIO := StrToInt(edIdVendedor.Text);
    Vendas.Salvar;
    fdVendas.Refresh;
  finally
    FreeAndnil(Vendas);
  end;

end;

procedure TfmVendas.btSelClienteClick(Sender: TObject);
var
  fmPesq : TfmPesquisa;
begin
  fmPesq := TfmPesquisa.Create(Nil);
  try
    fmPesq.Caption := 'Selecção de Clientes';
    fmPesq.fdPesquisa.SQL.Clear;
    fmPesq.fdPesquisa.SQL.Add('Select * from cliente');
    if fmPesq.ShowModal = mrOk then
    begin
      edIdCliente.Text := fmPesq.fdPesquisa.FieldByName('idCliente').AsString;
      edNomeCliente.Text := fmPesq.fdPesquisa.FieldByName('nome').AsString;
    end;
  finally
    FreeAndNil(fmPesq);
  end;
end;

procedure TfmVendas.btSelVendedorClick(Sender: TObject);
var
  fmPesq : TfmPesquisa;
begin
  fmPesq := TfmPesquisa.Create(Nil);
  try
    fmPesq.Caption := 'Selecção de vendedor';
    fmPesq.fdPesquisa.SQL.Clear;
    fmPesq.fdPesquisa.SQL.Add('Select * from usuario');
    if fmPesq.ShowModal = mrOk then
    begin
      edIdVendedor.Text := fmPesq.fdPesquisa.FieldByName('idUsuario').AsString;
      edNomeVendedor.Text := fmPesq.fdPesquisa.FieldByName('nome').AsString;
    end;
  finally
    FreeAndNil(fmPesq);
  end;

end;

procedure TfmVendas.dsVendasDataChange(Sender: TObject; Field: TField);
begin
  edId.Text := fdVendas.FieldByName('IDPEDIDO').AsString;
  dtdataVenda.DateTime := fdVendas.FieldByName('data').AsDatetime;
  meTot.Text :=  fdVendas.FieldByName('VALTOTAL').AsString;
  edIdCliente.Text := fdVendas.FieldByName('IDCLIENTE').AsString;
  edIdVendedor.Text := fdVendas.FieldByName('IDUSuario').AsString;
  edNomeCliente.Text :=  fdVendas.FieldByName('nomecliente').AsString;
  edNomeVendedor.Text :=  fdVendas.FieldByName('nomeusuario').AsString;

  fdvendasProduto.Close;
  fdvendasProduto.SQL.Clear;
  fdvendasProduto.SQL.Add('select pi.*,                                      ');
  fdvendasProduto.SQL.Add('       (select DESCRICAO                          ');
  fdvendasProduto.SQL.Add('        from PRODUTO                              ');
  fdvendasProduto.SQL.Add('        where IDPRODUTO = pi.IDPRODUTO) DESCPROD  ');
  fdvendasProduto.SQL.Add('from PEDIDO_ITENS pi                              ');
  fdvendasProduto.SQL.Add('where pi.IDPEDIDO = :id                           ');
  fdvendasProduto.ParamByName('id').AsInteger := fdVendas.FieldByName('IDPEDIDO').AsInteger;
  fdvendasProduto.Open();
end;

procedure TfmVendas.dsvendasProdutoDataChange(Sender: TObject; Field: TField);
begin
  edIdProduto.Text := fdvendasProduto.FieldByName('idProduto').AsString;
  eddescProduto.Text := fdvendasProduto.FieldByName('DESCPROD').AsString;
  edQuantidade.Text := fdvendasProduto.FieldByName('quantidade').AsString;
end;

procedure TfmVendas.FormShow(Sender: TObject);
begin
  fdVendas.Connection := dmConexaoLoja.Conexao;
  fdVendas.Open();
end;

end.
