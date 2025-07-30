unit uRecepcionista;

interface

uses uTrabalhador, System.SysUtils, FMX.Dialogs, System.Math;

  type TRecepcionista = class(TTrabalhador)
  private
    procedure DarBomDia(aTrabalhador:TTrabalhador);
    procedure AtenderTelefonema;
    procedure AgendarReunioes;
    procedure ControlarAcesso;
  public
    procedure ExecutarFuncao; override;
  end;

implementation

{ TRecepcionista }

procedure TRecepcionista.AgendarReunioes;
begin
  ShowMessage('A recepcionista '+Self.Nome+' está agendando reuniões');
end;

procedure TRecepcionista.AtenderTelefonema;
begin
  ShowMessage('A recepcionista '+Self.Nome+' está atendendo telefonemas');
end;

procedure TRecepcionista.ControlarAcesso;
var permiteAcesso:Boolean;
begin
  permiteAcesso:=(Random(1).ToBoolean);
  if permiteAcesso then begin
    ShowMessage('A recepcionista '+Self.Nome+' permitiu a entrada de um trabalhador');
  end else begin
    ShowMessage('A recepcionista '+Self.Nome+' NÃO permitiu a entrada de um trabalhador');
  end;
end;

procedure TRecepcionista.DarBomDia(aTrabalhador: TTrabalhador);
var temEntrega:Boolean;
begin
  if aTrabalhador<>nil then begin
    ShowMessage('Bom dia '+aTrabalhador.getNome+', seja bem vindo!');
    temEntrega:=RandomRange(0,1).ToBoolean;
    if temEntrega then begin
      ShowMessage(aTrabalhador.getNome+', chegou uma entrega para você.');
    end;
  end;
end;

procedure TRecepcionista.ExecutarFuncao;
begin
  Self.IniciarExpediente;
  self.ControlarAcesso;
  Self.AtenderTelefonema;
  Self.AgendarReunioes;
  Self.EncerrarExpediente;
end;

end.
