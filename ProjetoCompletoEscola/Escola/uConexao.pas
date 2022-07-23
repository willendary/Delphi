unit uConexao;

interface

uses
  Forms, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, uConexaoClasse, IniFiles, FireDAC.Comp.DataSet;

type
  TdmConexao = class(TDataModule)
    Conexao: TFDConnection;
    qrAuxiliar: TFDQuery;
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    conexaoClass: TConexao;
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmConexao.ConexaoBeforeConnect(Sender: TObject);
begin
  conexaoClass := TConexao.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  conexaoClass.LeINI;
  conexaoClass.Conectar(Conexao);
end;

end.
