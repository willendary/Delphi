unit buscaFabricanteProdutoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,ConexaoLojaData;

type
  TbuscaFabricanteProduto = class(TForm)
    DBGrid1: TDBGrid;
    dsFabricanteProduto: TDataSource;
    fdFabricanteProduto: TFDQuery;
    btOk: TButton;
    bCancelar: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  buscaFabricanteProduto: TbuscaFabricanteProduto;

implementation

{$R *.dfm}

procedure TbuscaFabricanteProduto.FormShow(Sender: TObject);
begin
fdFabricanteProduto.Connection := dmConexaoLoja.Conexao;
fdFabricanteProduto.open;
end;

end.
