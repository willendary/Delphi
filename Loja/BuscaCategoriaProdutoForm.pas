unit BuscaCategoriaProdutoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, ConexaoLojaData;

type
  TfmBuscaCategoriaProduto = class(TForm)
    DBGrid1: TDBGrid;
    fdCategoriaProduto: TFDQuery;
    dsCategoriaProduto: TDataSource;
    bCancelar: TButton;
    btOk: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscaCategoriaProduto: TfmBuscaCategoriaProduto;

implementation

{$R *.dfm}

procedure TfmBuscaCategoriaProduto.FormShow(Sender: TObject);
begin
fdCategoriaProduto.Connection := dmConexaoLoja.Conexao;
fdCategoriaProduto.open;
end;

end.
