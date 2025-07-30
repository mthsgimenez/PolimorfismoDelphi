unit uTrabalhador;

interface

  Type TTrabalhador = class(TObject)
  protected
    Trabalhando:Boolean;
    Nome:String;
    Cargo:String;
    HorarioEntrada:TTime;
    HorarioSaida:TTime;
    Salario:Currency;
    procedure EncerrarExpediente;
    procedure IniciarExpediente;
  public
    function getNome:String;
    procedure setNome(aNome:String);
    function getCargo:String;
    procedure setCargo(aCargo:String);
    function getHorarioEntrada: TTime;
    procedure setHorarioEntrada(aHorarioEntrada: TTime);
    function getSalario: Currency;
    procedure setSalario(aSalario: Currency);
    procedure ExecutarFuncao; virtual;
  end;

implementation

uses SysUtils;

{ TTrabalhador }

procedure TTrabalhador.EncerrarExpediente;
begin
  Self.Trabalhando:=False;
end;

procedure TTrabalhador.ExecutarFuncao;
begin
  Self.IniciarExpediente;
end;

function TTrabalhador.getCargo: String;
begin
  Result:=Self.Cargo;
end;

function TTrabalhador.getHorarioEntrada: TTime;
begin
  Result := Self.HorarioEntrada;
end;

function TTrabalhador.getNome: String;
begin
  Result:=Self.Nome;
end;

function TTrabalhador.getSalario: Currency;
begin
  Result := Self.Salario;
end;

procedure TTrabalhador.IniciarExpediente;
begin
  Self.Trabalhando:=True;
end;

procedure TTrabalhador.setCargo(aCargo: String);
begin
  if (aCargo <> 'Programador')
  and (aCargo <> 'Recepcionista')
  and (aCargo <> 'Aprendiz')
  and (aCargo <> 'Jaguara')
  then begin
    raise Exception.Create('Cargo inválido');
  end;

  Self.Cargo:=aCargo;
end;

procedure TTrabalhador.setHorarioEntrada(aHorarioEntrada: TTime);
begin
  Self.HorarioEntrada := aHorarioEntrada;
end;

procedure TTrabalhador.setNome(aNome: String);
begin
  if Trim(aNome).Length < 3 then begin
    raise Exception.Create('Nome muito pequeno. Mínimo de 3 letras.');
  end;

  Self.Nome:=aNome;
end;

procedure TTrabalhador.setSalario(aSalario: Currency);
begin
  if aSalario < 600 then begin
    raise Exception.Create('O salário não pode ser menor que R$ 600,00.');
  end;

  Self.Salario := aSalario;
end;

end.
