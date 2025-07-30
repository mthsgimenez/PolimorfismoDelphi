unit uAprendiz;

interface

uses uTrabalhador, System.SysUtils, FMX.Dialogs, System.Math;

  type TAprendiz = class(TTrabalhador)
  private
    PrestandoAtencaoNaExplicacao:Boolean;
    ConhecimentoAbsorvido:Boolean;
    procedure PrestarAtencaoNaExplicacao;
    procedure RealizarAsPraticas;
    procedure ConstruirSistema;
  public
    procedure ExecutarFuncao; override;
  end;

implementation

{ TAprendiz }

procedure TAprendiz.ExecutarFuncao;
begin
  Self.IniciarExpediente;
  Self.PrestarAtencaoNaExplicacao;
  Self.RealizarAsPraticas;
  Self.ConstruirSistema;
  Self.EncerrarExpediente;
end;

procedure TAprendiz.PrestarAtencaoNaExplicacao;
begin
  PrestandoAtencaoNaExplicacao:=True;
  ShowMessage('O(a) aprendiz '+Self.Nome+' está prestando atenção na explicação');
end;

procedure TAprendiz.RealizarAsPraticas;
begin
  PrestandoAtencaoNaExplicacao:=False;
  ShowMessage('O(a) aprendiz '+Self.Nome+' está praticando');
  ConhecimentoAbsorvido:=RandomRange(0,1).ToBoolean;
end;

procedure TAprendiz.ConstruirSistema;
begin
  if ConhecimentoAbsorvido then begin
    ShowMessage('O(a) aprendiz '+Self.Nome+' está construindo um sistema');
  end else begin
    ShowMessage('O(a) aprendiz '+Self.Nome+' está revisando o conteúdo e aprendendo por conta própria para construir um sistema');
  end;
end;

end.
