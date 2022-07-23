unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ConexaoLojaData;

type
  TfmLogin = class(TForm)
    edSenha: TEdit;
    edUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btOk: TButton;
    btCancelar: TButton;
    procedure btOkClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;

implementation

{$R *.dfm}

procedure TfmLogin.btCancelarClick(Sender: TObject);
begin
  //Fecha a tela
  Close;
end;

procedure TfmLogin.btOkClick(Sender: TObject);
begin
  //Busca na tabela um login e senha que seja iggul ao que o usuário
  //informou
  dmConexaoLoja.fdAux.Close;
  dmConexaoLoja.fdAux.SQL.Clear;
  dmConexaoLoja.fdAux.SQL.add('Select * from usuario ');
  dmConexaoLoja.fdAux.SQL.add('  where login = :login');
  dmConexaoLoja.fdAux.SQL.add('    and senha = :senha');
  dmConexaoLoja.fdAux.ParamByName('login').AsString := edUsuario.Text;
  dmConexaoLoja.fdAux.ParamByName('senha').AsString := edSenha.Text;
  dmConexaoLoja.fdAux.Open;

  // se o select retornou registros, ou seja, encontrou o login e senha
  //na base de dados
  if not dmConexaoLoja.fdAux.IsEmpty then
  begin
    // testa se o usuário esta ativo
    if dmConexaoLoja.fdAux.FieldByName('ATIVO').AsString = 'T' then
    begin
      // se encontrou o usuário e o mesmo está ativo então alimenta a
      //variavel declarada no datamodule com os dados do usuário
      dmConexaoLoja.Usuario.idUsuario := dmConexaoLoja.fdAux.FieldByName('idusuario').AsInteger;
      dmConexaoLoja.Usuario.Login := dmConexaoLoja.fdAux.FieldByName('login').AsString;
      dmConexaoLoja.Usuario.Nome := dmConexaoLoja.fdAux.FieldByName('Nome').AsString;
      dmConexaoLoja.Usuario.Tipo := dmConexaoLoja.fdAux.FieldByName('tipo').AsString;

      //fecha a tela
      Close;
    end
    else
    begin
      // se o usuário não estiver ativo
      MessageDlg('O usuário esta desativado.',mtInformation,[mbOK],0);
    end;
  end
  else
  begin
    //se o select retornou vazio, ou seja, não entrou o login e senha
    MessageDlg('Usuario ou senha inválida.',mtError,[mbOK],0);
  end;

end;

end.
