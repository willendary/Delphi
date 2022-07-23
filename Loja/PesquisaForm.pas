unit PesquisaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ConexaoLojaData, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfmPesquisa = class(TForm)
    DBGrid1: TDBGrid;
    btok: TButton;
    btCancelar: TButton;
    fdPesquisa: TFDQuery;
    dsPesquisa: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPesquisa: TfmPesquisa;

implementation

{$R *.dfm}

procedure TfmPesquisa.FormShow(Sender: TObject);
begin
  //Atribui a conexão para garantir o bom funcionamento da query
  fdPesquisa.Connection := dmConexaoLoja.Conexao;
  //Abre a query
  fdPesquisa.Open();
end;

end.
