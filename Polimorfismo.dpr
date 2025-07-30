program Polimorfismo;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FormTrabalhadores},
  uAprendiz in 'uAprendiz.pas',
  uJaguara in 'uJaguara.pas',
  uProgramador in 'uProgramador.pas',
  uRecepcionista in 'uRecepcionista.pas',
  uTrabalhador in 'uTrabalhador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTrabalhadores, FormTrabalhadores);
  Application.Run;
end.
