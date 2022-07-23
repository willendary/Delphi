unit SelProdutoVendaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, ConexaoLojadata;

type
  TfmSelVendas = class(TForm)
    Label4: TLabel;
    DBGrid1: TDBGrid;
    edQuantidade: TEdit;
    Panel1: TPanel;
    imFotoProd: TImage;
    dsproduto: TDataSource;
    FDProduto: TFDQuery;
    btok: TButton;
    btCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure dsprodutoDataChange(Sender: TObject; Field: TField);
    procedure edQuantidadeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelVendas: TfmSelVendas;

implementation

{$R *.dfm}

procedure TfmSelVendas.dsprodutoDataChange(Sender: TObject; Field: TField);
var
  msFoto : TMemoryStream;
begin
  // limpa a imagem anterior do Timage
  imFotoProd.Picture := nil;
  //instanciamos um TMemoryStraeam
  msFoto := TMemoryStream.Create;
  edQuantidade.Text := '1';
  //Carregamos a imagem quey para o TmemoryStream
  TBlobField(FdProduto.FieldByName('imagem')).SaveToStream(msFoto);
  //seta a posição 0 do tmemory stream. Embora não seja recomendado podemos ter
  //mais de um arquivo carregado no TMemoryStream
  msFoto.Position := 0;
  //Do TmemoryStream pode-se carregadar a imagem para o TImage da tela
  imFotoProd.Picture.LoadFromStream(msFoto);

end;

procedure TfmSelVendas.edQuantidadeChange(Sender: TObject);
begin
  if StrToIntDef(edQuantidade.Text, -1) > FdProduto.FieldByName('QUANTIDADE').asInteger then
  begin
    Messagedlg('A quantidade de venda não pdoe ser maior que o estoque.', TMsgDlgType.mtError,[TMsgDlgBtn.mbOK],0);
    edQuantidade.Text := FdProduto.FieldByName('QUANTIDADE').AsString;
  end;
end;

procedure TfmSelVendas.FormShow(Sender: TObject);
begin
  FDProduto.Connection := dmConexaoLoja.Conexao;
  FDProduto.Open();
end;

end.
