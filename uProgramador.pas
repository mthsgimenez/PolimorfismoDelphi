unit uProgramador;

interface

uses uTrabalhador, System.SysUtils, FMX.Dialogs, System.Math;

  type TProgramador = class(TTrabalhador)
  private
    procedure CorrigirFalhas;
    procedure ImplementarFeatures;
    procedure DarSuporte;
  public
    procedure ExecutarFuncao; override;
  end;

implementation

{ TProgramador }

procedure TProgramador.CorrigirFalhas;
var i,numeroFalha,QuantidadeFalhas:Integer;
begin
  QuantidadeFalhas:=Random(5);
  for i:=1 to QuantidadeFalhas do begin
    numeroFalha:=Random(99999);
    ShowMessage('O Programador '+Self.Nome+' está corrigindo a falha FA'+numeroFalha.ToString);
  end;
end;

procedure TProgramador.DarSuporte;
begin
  ShowMessage('O Programador '+Self.Nome+' está prestando suporte ao cliente');
end;

procedure TProgramador.ImplementarFeatures;
var i,numeroIM,QuantidadeImplementacoes:Integer;
begin
  QuantidadeImplementacoes:=Random(5);
  for i:=1 to QuantidadeImplementacoes do begin
    numeroIM:=Random(99999);
    ShowMessage('O Programador '+Self.Nome+' está implementando o protocolo IM'+numeroIM.ToString);
  end;
end;

procedure TProgramador.ExecutarFuncao;
begin
  Self.IniciarExpediente;
  Self.CorrigirFalhas;
  Self.DarSuporte;
  Self.ImplementarFeatures;
  Self.EncerrarExpediente;
end;

end.
