unit uFormConfiguracaoBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uConexaoClasse, uConexao;

type
  TfmConfiguracaoBanco = class(TForm)
    label1: TLabel;
    edUsuario: TEdit;
    Label2: TLabel;
    edSenha: TEdit;
    btExibirSenha: TButton;
    Label3: TLabel;
    edArquivo: TEdit;
    btArquivo: TButton;
    OpenDialog: TOpenDialog;
    btSalvar: TButton;
    btCancelar: TButton;
    procedure btArquivoClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExibirSenhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConfiguracaoBanco: TfmConfiguracaoBanco;

implementation

{$R *.dfm}

procedure TfmConfiguracaoBanco.btArquivoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    edArquivo.Text := OpenDialog.FileName;
  end;
end;

procedure TfmConfiguracaoBanco.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConfiguracaoBanco.btExibirSenhaClick(Sender: TObject);
begin
  if btExibirSenha.Caption = '0' then
  begin
    btExibirSenha.Caption := '-';
    edSenha.PasswordChar := #0;
  end
  else
  begin
    btExibirSenha.Caption := '0';
    edSenha.PasswordChar := '*';
  end;
end;

procedure TfmConfiguracaoBanco.btSalvarClick(Sender: TObject);
var
  Conexao: TConexao;
begin
  Conexao := TConexao.Create(ExtractFilePath(Application.ExeName) +
    'Config.ini');
  try
    Conexao.GravaINI(edUsuario.Text, edSenha.Text, '', edArquivo.Text);
  finally
    FreeAndNil(Conexao);
  end;
  Close;
end;

procedure TfmConfiguracaoBanco.FormCreate(Sender: TObject);
begin
  dmConexao.Conexao.Params.UserName := '';
  dmConexao.Conexao.Params.Password := '';
end;

end.
