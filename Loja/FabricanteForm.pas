unit FabricanteForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ConexaoLojaData, Vcl.ComCtrls, UFabricantess;

type
  TfmFabricante = class(TForm)
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
    dsfabricante: TDataSource;
    fdFabricante: TFDQuery;
    edCidade: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    edEstado: TEdit;
    edDocumento: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edTelefone: TEdit;
    edEmail: TEdit;
    Label8: TLabel;
    procedure dsfabricanteDataChange(Sender: TObject; Field: TField);
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
  fmFabricante: TfmFabricante;

implementation

{$R *.dfm}


procedure TfmFabricante.btExcluirClick(Sender: TObject);
var
  Fab : TFabricante;
begin
  Fab := TFabricante.Create;
  try
    Fab.IDFabricante := fdFabricante.FieldByName('idFabricante').AsInteger;
    Fab.Excluir;
    fdFabricante.Refresh;
  finally
    FreeAndNil(Fab);
  end;
end;

procedure TfmFabricante.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFabricante.btIncluirClick(Sender: TObject);
begin
  edId.Clear;
  edNome.Clear;
  edEndereco.Clear;
  edNumero.Clear;
  edCidade.Clear;
  edEstado.Clear;
  edDocumento.Clear;
  edTelefone.Clear;
  edEmail.Clear;
end;



procedure TfmFabricante.btSalvarClick(Sender: TObject);
var
  Fab : TFabricante;
begin
  Fab := TFabricante.Create;
  try
    Fab.IDFabricante := StrToIntDef(edId.Text,-1);
    Fab.Nome := edNome.Text;
    Fab.Logradouro := edEndereco.Text;
    Fab.Numero := StrToInt(edNumero.Text);
    Fab.Cidade := edCidade.Text;
    Fab.Estado := edEstado.Text;
    Fab.CNPJ := edDocumento.Text;
    Fab.Telefone := edTelefone.Text;
    Fab.Email := edEmail.Text;

    Fab.Salvar;

  finally
    FreeandNil(Fab);
  end;

end;

procedure TfmFabricante.dsfabricanteDataChange(Sender: TObject; Field: TField);
begin
  edId.Text := fdFabricante.FieldByName('idFabricante').AsString;
  edNome.Text := fdFabricante.FieldByName('nome').AsString;
  edEndereco.Text := fdFabricante.FieldByName('logradouro').AsString;
  edNumero.Text := fdFabricante.FieldByName('numero').AsString;
  edCidade.Text := fdFabricante.FieldByName('cidade').AsString;
  edEstado.Text := fdFabricante.FieldByName('estado').AsString;
  edDocumento.Text := fdFabricante.FieldByName('cnpj').AsString;
  edTelefone.Text := fdFabricante.FieldByName('telefone').AsString;
  edEmail.Text := fdFabricante.FieldByName('email').AsString;

end;

procedure TfmFabricante.FormShow(Sender: TObject);
begin
  fdFabricante.Connection := dmConexaoLoja.Conexao;
  fdFabricante.Open();
end;

end.
