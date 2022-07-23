unit CategoriaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ConexaoLojaData, uCategoria;

type
  TfmCategoria = class(TForm)
    DBGrid1: TDBGrid;
    edId: TEdit;
    btSalvar: TButton;
    btIncluir: TButton;
    btExcluir: TButton;
    btFechar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edDescricao: TEdit;
    dsCategoria: TDataSource;
    fdCategoria: TFDQuery;
    procedure dsCategoriaDataChange(Sender: TObject; Field: TField);
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
  fmCategoria: TfmCategoria;

implementation

{$R *.dfm}

procedure TfmCategoria.btExcluirClick(Sender: TObject);
var
  cat: TCategoria;
begin
  cat := TCategoria.Create;
  try
    cat.IDCategoria := fdCategoria.FieldByName('idCategoria').AsInteger;
    cat.Excluir;
  finally
    FreeAndNil(cat);
  end;
end;

procedure TfmCategoria.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCategoria.btIncluirClick(Sender: TObject);
begin
  edId.Clear;
  edDescricao.Clear;
end;

procedure TfmCategoria.btSalvarClick(Sender: TObject);
var
  cat: TCategoria;
begin
  cat := TCategoria.Create;
  try
    cat.IDCategoria := StrToIntDef(edId.Text, -1);
    cat.Descricao := edDescricao.Text;
    cat.Salvar;
    fdCategoria.Refresh;
  finally
    FreeAndNil(cat);
  end;

end;

procedure TfmCategoria.dsCategoriaDataChange(Sender: TObject; Field: TField);
begin
  edId.Text := fdCategoria.FieldByName('idcategoria').AsString;
  edDescricao.Text := fdCategoria.FieldByName('descricao').AsString;

end;

procedure TfmCategoria.FormShow(Sender: TObject);
begin
  fdCategoria.Connection := dmConexaoLoja.Conexao;
  fdCategoria.Open();
end;

end.
