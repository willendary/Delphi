unit UApi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, JSON;

type
  TForm1 = class(TForm)
    edURLAPI: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btExecutarComando: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    btTraduzir: TButton;
    memoConselho: TMemo;
    memoTraducao: TMemo;
    procedure btExecutarComandoClick(Sender: TObject);
    procedure btTraduzirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btExecutarComandoClick(Sender: TObject);
var
ArquivoJson : TJSONObject;
begin
RESTClient1.BaseURL := edURLAPI.Text;
RESTRequest1.Execute;
memoConselho.Lines.Text := RESTResponse1.Content;
ArquivoJson := TJSONObject.ParseJSONValue(memoConselho.Lines.text) as TJsonObject;
memoConselho.Lines.Text := ArquivoJson.FindValue('slip').FindValue('advice').value;
end;

procedure TForm1.btTraduzirClick(Sender: TObject);
var
ArquivoJsonTraducao : TJSONObject;
begin
try
RESTClient1.BaseURL := 'https://api.funtranslations.com/translate/yoda.json?text=' + memoConselho.Lines.Text;
RESTRequest1.Execute;
memoTraducao.lines.text := RESTResponse1.Content;
ArquivoJsonTraducao := TJSONObject.ParseJSONValue(memoTraducao.lines.text) as TJsonObject;
memoTraducao.Lines.Text := ArquivoJsonTraducao.FindValue('contents').FindValue('translate').value;
except
ShowMessage('Não foi possível traduzir. Tente mais tarde!');
end;
end;

end.
