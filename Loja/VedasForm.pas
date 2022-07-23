unit VedasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, ConexaoLojadata;

type
  TfmVendas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lbLogin: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    edId: TEdit;
    btSalvar: TButton;
    btIncluir: TButton;
    btExcluir: TButton;
    btFechar: TButton;
    edNome: TEdit;
    edEndereco: TEdit;
    edNumero: TEdit;
    edCidade: TEdit;
    edEstado: TEdit;
    edDocumento: TEdit;
    dtDataNasc: TDateTimePicker;
    dsVendas: TDataSource;
    fdVendas: TFDQuery;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmVendas: TfmVendas;

implementation

{$R *.dfm}

procedure TfmVendas.FormShow(Sender: TObject);
begin
  fdVendas.Connection := dmConexaoLoja.Conexao;
  fdVendas.Open();
end;

end.
