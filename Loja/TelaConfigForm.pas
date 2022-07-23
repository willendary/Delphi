unit TelaConfigForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,uConexaoClasse;

type
  TfmTelaConfig = class(TForm)
    edUsuario: TEdit;
    edSenha: TEdit;
    edArquivo: TEdit;
    btSalvar: TButton;
    btCancelar: TButton;
    btArquivo: TButton;
    label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btExibirSenha: TButton;
    OpenDialog: TOpenDialog;
    procedure btExibirSenhaClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTelaConfig: TfmTelaConfig;

implementation

{$R *.dfm}

procedure TfmTelaConfig.btArquivoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    edArquivo.Text := OpenDialog.FileName;
  end;
end;

procedure TfmTelaConfig.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTelaConfig.btExibirSenhaClick(Sender: TObject);
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

procedure TfmTelaConfig.btSalvarClick(Sender: TObject);
var
  Conexao : TConexao;
begin
  conexao := TConexao.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    Conexao.GravaINI(edUsuario.Text, edSenha.Text,'',edArquivo.Text);
  finally
    FreeAndNil(conexao);
  end;
  Close;

end;

end.
