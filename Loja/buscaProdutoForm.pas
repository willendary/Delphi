unit buscaProdutoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfmBuscaProduto = class(TForm)
    DBGrid2: TDBGrid;
    dsCliente: TDataSource;
    fdCliente: TFDQuery;
    btSelecionar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscaProduto: TfmBuscaProduto;

implementation

{$R *.dfm}

end.
