unit uTrabalhador;

interface

  Type TTrabalhador = class(TObject)
  protected
    Trabalhando:Boolean;
    Nome:String;
    Cargo:String;
    HorarioEntrada:Double;
    HorarioSaida:Double;
    Salario:Currency;
    procedure EncerrarExpediente;
    procedure IniciarExpediente;
  public
    function getNome:String;
    procedure setNome(aNome:String);
    function getCargo:String;
    procedure setCargo(aCargo:String);
    constructor Create(aNome:String);
    procedure ExecutarFuncao; virtual;
  end;

implementation

{ TTrabalhador }

constructor TTrabalhador.Create(aNome: String);
begin
  Self.Nome:=aNome;
end;

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

function TTrabalhador.getNome: String;
begin
  Result:=Self.Nome;
end;

procedure TTrabalhador.IniciarExpediente;
begin
  Self.Trabalhando:=True;
end;

procedure TTrabalhador.setCargo(aCargo: String);
begin
  Self.Cargo:=aCargo;
end;

procedure TTrabalhador.setNome(aNome: String);
begin
  Self.Nome:=aNome;
end;

end.
