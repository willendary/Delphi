unit buscaClienteForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  conexaoLojaData, Vcl.StdCtrls;

type
  TfmBuscaCliente = class(TForm)
    dsCliente: TDataSource;
    fdCliente: TFDQuery;
    DBGrid2: TDBGrid;
    btSelecionar: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscaCliente: TfmBuscaCliente;

implementation

{$R *.dfm}

procedure TfmBuscaCliente.FormShow(Sender: TObject);
begin
  fdCliente.Connection := dmConexaoLoja.Conexao;
  fdCliente.Open();
end;

end.
