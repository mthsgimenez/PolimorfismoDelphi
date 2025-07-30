unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uTrabalhador, uJaguara, uAprendiz, uProgramador,
  uRecepcionista, System.Generics.Collections;

type
  TForm2 = class(TForm)
    PnlTrabalhadores: TPanel;
    btnAdcTrabalhador: TButton;
    btnComecarTrabalhos: TButton;
    pnlAdcTrabalhador: TPanel;
    Button3: TButton;
    cbCargos: TComboBox;
    edNome: TEdit;
    lbNome: TLabel;
    ScrollBox1: TScrollBox;
    procedure btnComecarTrabalhosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnAdcTrabalhadorClick(Sender: TObject);
  private
    { Private declarations }
    wListaTrabalhadores:TObjectList<TTrabalhador>;
    procedure AdicionarTrabalhadorNaLista;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.AdicionarTrabalhadorNaLista;
var trabalhador:TTrabalhador;
    nome:String;
begin
//  Programador [0]
//  Recepcionista [1]
//  Aprendiz [2]
//  Jaguara [3]

  nome:=edNome.Text;
  if cbCargos.ItemIndex=0 then begin
   trabalhador:=TProgramador.Create(nome);
  end else if cbCargos.ItemIndex=1 then begin
    trabalhador:=TRecepcionista.Create(nome);
  end else if cbCargos.ItemIndex=2 then begin
    trabalhador:=TAprendiz.Create(nome);
  end else begin
    trabalhador:=TJaguara.Create(nome);
  end;

  wListaTrabalhadores.Add(trabalhador);
end;

procedure TForm2.btnAdcTrabalhadorClick(Sender: TObject);
begin
  pnlAdcTrabalhador.Visible:=True;
  cbCargos.SetFocus;
end;

procedure TForm2.btnComecarTrabalhosClick(Sender: TObject);
begin
  //
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  cbCargos.ItemIndex:=-1;
  edNome.Clear;
  pnlAdcTrabalhador.Visible:=False;
  AdicionarTrabalhadorNaLista;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  wListaTrabalhadores:=TObjectList<TTrabalhador>.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  wListaTrabalhadores.Free;
end;

end.
