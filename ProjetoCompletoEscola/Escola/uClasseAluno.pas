unit uClasseAluno;

interface

uses
  SysUtils, Classes, uConexao, DB, Dialogs, Winapi.Windows, Winapi.Messages, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms;

type
  TAluno = class
  private
    FNota2: real;
    FDataNascimento: TDate;
    FNota3: real;
    FNota1: real;
    FNome: String;
    FMatricula: Integer;
    FConceito: char;
    procedure SetDataNascimento(const Value: TDate);
    procedure SetMatricula(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetNota1(const Value: real);
    procedure SetNota2(const Value: real);
    procedure SetNota3(const Value: real);
    procedure SetConceito(const Value: char);
  Public
    Constructor Create;
    Procedure Salvar;
    Procedure Excluir;
    Function DefineConceito(ANota1, ANota2, ANota3: real): String;
    Function ValidaNota(ANota: real): Boolean;
    Function calculaIdade(DataNascimento: TDateTime): Integer;
  published
    Property Matricula: Integer read FMatricula write SetMatricula;
    Property Nome: String read FNome write SetNome;
    Property DataNascimento: TDate read FDataNascimento write SetDataNascimento;
    Property Nota1: real read FNota1 write SetNota1;
    Property Nota2: real read FNota2 write SetNota2;
    Property Nota3: real read FNota3 write SetNota3;
    Property Conceito: char read FConceito write SetConceito;
  end;

implementation

{ TAluno }

function TAluno.calculaIdade(DataNascimento: TDateTime): Integer;
var
  idade: Integer;
begin
  idade := StrToInt(Formatdatetime('yyyy', Date)) - StrToInt(Formatdatetime('yyyy', DataNascimento));
  Result := idade;
end;

constructor TAluno.Create;
begin
  FMatricula := -1;
end;

function TAluno.DefineConceito(ANota1, ANota2, ANota3: real): String;
Var
  Media: real;
begin
  Media := (ANota1 + ANota2 + ANota3) / 3;
  if Media < 7 then
  begin
    Result := 'I';
  end
  Else
    if ((Media >= 7) and (Media < 8)) then
    begin
      Result := 'S';
    end
    Else
      if (Media >= 8) and (Media < 9) then
      begin
        Result := 'B';
      end
      else
      begin
        Result := 'MB';
      end;
end;

procedure TAluno.Excluir;
begin
  Try
    If MessageDlg('Voc� tem certeza que deseja excluir o registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      dmConexao.qrAuxiliar.Close;
      dmConexao.qrAuxiliar.SQL.Clear;
      dmConexao.qrAuxiliar.SQL.Add('delete from alunos    ');
      dmConexao.qrAuxiliar.SQL.Add(' where matricula = :matricula ');
      dmConexao.qrAuxiliar.ParamByName('matricula').AsInteger := FMatricula;
      dmConexao.qrAuxiliar.ExecSQL;
    End;
  Except
    ShowMessage('Imposs�vel excluir!')
  End;
end;

procedure TAluno.Salvar;
begin
  if calculaIdade(FDataNascimento) < 10 then
  begin
    ShowMessage('O aluno n�o pode ter menos de 10 anos de idade');
  end
  else
  begin
    if FMatricula = -1 then
    begin
      dmConexao.qrAuxiliar.Close;
      dmConexao.qrAuxiliar.SQL.Clear;
      dmConexao.qrAuxiliar.SQL.Add(' insert into alunos (NOME, DATANASCIMENTO,                  ');
      dmConexao.qrAuxiliar.SQL.Add(' NOTA1, NOTA2, NOTA3, CONCEITO) values ( ');
      dmConexao.qrAuxiliar.SQL.Add(' :NOME, :DATANASCIMENTO, :NOTA1, :NOTA2, :NOTA3, :CONCEITO) ');

      dmConexao.qrAuxiliar.ParamByName('NOME').AsString := FNome;
      dmConexao.qrAuxiliar.ParamByName('DATANASCIMENTO').AsDate := FDataNascimento;
      dmConexao.qrAuxiliar.ParamByName('NOTA1').AsFloat := FNota1;
      dmConexao.qrAuxiliar.ParamByName('NOTA2').AsFloat := FNota2;
      dmConexao.qrAuxiliar.ParamByName('NOTA3').AsFloat := FNota3;
      dmConexao.qrAuxiliar.ParamByName('CONCEITO').AsString := DefineConceito(FNota1, FNota2, FNota3);
      dmConexao.qrAuxiliar.ExecSQL;
    end
    else
    begin
      // Caso contr�rio faz um update
      dmConexao.qrAuxiliar.Close;
      dmConexao.qrAuxiliar.SQL.Clear;
      dmConexao.qrAuxiliar.SQL.Add(' update alunos set nome = :NOME, DATANASCIMENTO = :DATANASCIMENTO, ');
      dmConexao.qrAuxiliar.SQL.Add(' NOTA1 = :NOTA1, NOTA2 = :NOTA2, NOTA3 = :NOTA3,      ');
      dmConexao.qrAuxiliar.SQL.Add(' CONCEITO = :CONCEITO                 ');
      dmConexao.qrAuxiliar.SQL.Add(' where matricula = :matricula ');
      dmConexao.qrAuxiliar.ParamByName('MATRICULA').AsInteger := FMatricula;
      dmConexao.qrAuxiliar.ParamByName('NOME').AsString := FNome;
      dmConexao.qrAuxiliar.ParamByName('DATANASCIMENTO').AsDate := FDataNascimento;
      dmConexao.qrAuxiliar.ParamByName('NOTA1').AsFloat := FNota1;
      dmConexao.qrAuxiliar.ParamByName('NOTA2').AsFloat := FNota2;
      dmConexao.qrAuxiliar.ParamByName('NOTA3').AsFloat := FNota3;
      dmConexao.qrAuxiliar.ParamByName('CONCEITO').AsString := DefineConceito(FNota1, FNota2, FNota3);
      dmConexao.qrAuxiliar.ExecSQL;
    end;
  end;
end;

procedure TAluno.SetConceito(const Value: char);
begin
  FConceito := Value;
end;

procedure TAluno.SetDataNascimento(const Value: TDate);
begin
  FDataNascimento := Value;
end;

procedure TAluno.SetMatricula(const Value: Integer);
begin
  FMatricula := Value;
end;

procedure TAluno.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TAluno.SetNota1(const Value: real);
begin
  FNota1 := Value;
end;

procedure TAluno.SetNota2(const Value: real);
begin
  FNota2 := Value;
end;

procedure TAluno.SetNota3(const Value: real);
begin
  FNota3 := Value;
end;

function TAluno.ValidaNota(ANota: real): Boolean;
begin
  Result := true;
  if (ANota < 0) or (ANota > 10) then
  begin
    ShowMessage('Digite uma nota de 0 a 10');
    Result := False;
  end;

end;

end.
