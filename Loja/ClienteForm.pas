unit ClienteForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ConexaoLojaData, Vcl.ComCtrls, uClientes;

type
  TfmCliente = class(TForm)
    DBGrid1: TDBGrid;
    edId: TEdit;
    btSalvar: TButton;
    btIncluir: TButton;
    btExcluir: TButton;
    btFechar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edNome: TEdit;
    lbLogin: TLabel;
    edEndereco: TEdit;
    Label4: TLabel;
    edNumero: TEdit;
    dsCliente: TDataSource;
    fdCLiente: TFDQuery;
    edCidade: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    edEstado: TEdit;
    edDocumento: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    dtDataNasc: TDateTimePicker;
    procedure dsClienteDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCliente: TfmCliente;

implementation

{$R *.dfm}


procedure TfmCliente.btExcluirClick(Sender: TObject);
var
  cliente : TCliente;
begin
  Cliente := TCliente.Create;
  try
    Cliente.IDCliente := fdCLiente.FieldByName('idCliente').AsInteger;
    Cliente.Excluir;

  finally
    FreeAndNil(cliente);
  end;

end;

procedure TfmCliente.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCliente.btIncluirClick(Sender: TObject);
begin
  edId.Clear;
  edNome.Clear;
  edEndereco.Clear;
  edNumero.Clear;
  edCidade.Clear;
  edEstado.Clear;
  edDocumento.Clear;
  dtDataNasc.DateTime := now;
end;



procedure TfmCliente.btSalvarClick(Sender: TObject);
var
  Cliente : tCliente;
begin
  Cliente := tCliente.Create;
  try

    Cliente.IDCliente := StrToIntDef(edId.Text,-1);
    cliente.Nome := edNome.Text;
    cliente.Logradouro := edEndereco.Text;
    Cliente.Numero := StrToInt(edNumero.Text);
    Cliente.Cidade := edCidade.Text;
    Cliente.Estado := edEstado.Text;
    Cliente.CPFCNPJ := edDocumento.Text;
    cliente.DataNasc := dtDataNasc.DateTime;

    Cliente.Salvar;

  finally
    FreeandNil(Cliente);
  end;

end;

procedure TfmCliente.dsClienteDataChange(Sender: TObject; Field: TField);
begin
  edId.Text := fdCLiente.FieldByName('idCliente').AsString;
  edNome.Text := fdCLiente.FieldByName('nome').AsString;
  edEndereco.Text := fdCLiente.FieldByName('logradouro').AsString;
  edNumero.Text := fdCLiente.FieldByName('numero').AsString;
  edCidade.Text := fdCLiente.FieldByName('cidade').AsString;
  edEstado.Text := fdCLiente.FieldByName('estado').AsString;
  edDocumento.Text := fdCLiente.FieldByName('cpfcnpj').AsString;
  dtDataNasc.DateTime := fdCLiente.FieldByName('datanasc').AsDatetime;
end;

procedure TfmCliente.FormShow(Sender: TObject);
begin
  fdCLiente.Connection := dmConexaoLoja.Conexao;
  fdCLiente.Open();
end;

end.
