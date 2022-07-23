program Escola;

uses
  Vcl.Forms,
  UFormAluno in 'UFormAluno.pas' {fmAluno},
  uClasseAluno in 'uClasseAluno.pas',
  uConexao in 'uConexao.pas' {dmConexao: TDataModule},
  uFormConfiguracaoBanco in 'uFormConfiguracaoBanco.pas' {fmConfiguracaoBanco},
  uConexaoClasse in 'uConexaoClasse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfmAluno, fmAluno);
  Application.Run;
end.
