unit UCategoriaProdutoClasse;

interface

uses
  sysUtils, ConexaoLojaData;

type
TCategoriaProdutoDados = Class
  private
    FdescricaoCategoriaProduto: string;
    FidCategoriaProduto: integer;
    procedure SetdescricaoCategoriaProduto(const Value: string);
    procedure SetidCategoriaProduto(const Value: integer);
  published
property idCategoriaProduto: integer read FidCategoriaProduto write SetidCategoriaProduto;
property descricaoCategoriaProduto: string read FdescricaoCategoriaProduto write SetdescricaoCategoriaProduto;
end;
implementation

{ TCategoriaProdutoDados }

procedure TCategoriaProdutoDados.SetdescricaoCategoriaProduto(const Value: string);
begin
  FdescricaoCategoriaProduto := Value;
end;

procedure TCategoriaProdutoDados.SetidCategoriaProduto(const Value: integer);
begin
  FidCategoriaProduto := Value;
end;

end.
