unit ConexaoLojaData;

interface

uses
  Forms, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, UConexaoClasse;

type
// Records são tipos de dados criados pelo programador,
// conceito similar ao de classes, porém records contém apenas atributos.

// estrutura do tipo record para armazenar temporariamente os dados
// do usuário logado
 TUsuario = Record
   idUsuario : Integer;
   Login: String;
   Nome: String;
   Tipo: String;
 End;


  TdmConexaoLoja = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdAux: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    conexaoClass : TConexao;
  public
    { Public declarations }

    // declaração da varivel para armazenar so dados do usuário
    Usuario : TUsuario;
  end;

var
  dmConexaoLoja: TdmConexaoLoja;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexaoLoja.ConexaoBeforeConnect(Sender: TObject);
begin
  conexaoClass := TConexao.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  conexaoClass.LeINI;
  conexaoClass.Conectar(Conexao);
end;

procedure TdmConexaoLoja.DataModuleCreate(Sender: TObject);
begin
  // Inicializando de forma "zerada" os atributos do record
  Usuario.idUsuario := -1;
  Usuario.Login := '';
  Usuario.Nome := '';
  Usuario.Tipo := '';
end;

end.
