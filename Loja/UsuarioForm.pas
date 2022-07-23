unit UsuarioForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  UUsuarioClasse, ConexaoLojaData;

type
  TfmUsuario = class(TForm)
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
    edLogin: TEdit;
    Label4: TLabel;
    edSenha: TEdit;
    cbTipo: TCheckBox;
    cbAtivo: TCheckBox;
    dsUsuario: TDataSource;
    fdusuario: TFDQuery;
    procedure dsUsuarioDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUsuario: TfmUsuario;

implementation

{$R *.dfm}

procedure TfmUsuario.btExcluirClick(Sender: TObject);
var
  usuario: TUsuarioDados;
begin
  if MessageDlg('Deseja excluir permanentemente esse usuário?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    usuario := TUsuarioDados.Create;
    try
      usuario.idUsuario := fdusuario.FieldByName('idusuario').AsInteger;
      usuario.Excluir;
    finally
      FreeAndNil(usuario);
    end;
  end;

  fdusuario.Refresh;

end;

procedure TfmUsuario.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUsuario.btIncluirClick(Sender: TObject);
begin
  edId.Clear;
  edNome.Clear;
  edLogin.Clear;
  edSenha.Clear;
  cbTipo.Checked := False;
  cbAtivo.Checked := True;
end;

procedure TfmUsuario.btSalvarClick(Sender: TObject);
var
  usuario: TUsuarioDados;
begin
  usuario := TUsuarioDados.Create;
  try
    usuario.idUsuario := StrToIntDef(edId.Text, -1);
    usuario.Nome := edNome.Text;
    usuario.Login := edLogin.Text;
    usuario.senha := edSenha.Text;
    if cbTipo.Checked then
      usuario.tipo := 'A'
    else
      usuario.tipo := 'V';

    if cbAtivo.Checked then
      usuario.Ativo := 'T'
    else
      usuario.Ativo := 'F';

    usuario.Salvar;

  finally
    FreeAndNil(usuario);
  end;

  fdusuario.Refresh;
end;

procedure TfmUsuario.dsUsuarioDataChange(Sender: TObject; Field: TField);
begin
  edId.Text := fdusuario.FieldByName('idUsuario').AsString;
  edNome.Text := fdusuario.FieldByName('nome').AsString;
  edLogin.Text := fdusuario.FieldByName('login').AsString;
  edSenha.Text := fdusuario.FieldByName('senha').AsString;
  cbTipo.Checked := fdusuario.FieldByName('tipo').AsString = 'A';
  cbAtivo.Checked := fdusuario.FieldByName('ativo').AsString = 'T';
end;

procedure TfmUsuario.FormShow(Sender: TObject);
begin
  fdusuario.Connection := dmConexaoLoja.Conexao;
  fdusuario.Open();
end;

end.
