unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uTrabalhador, uJaguara, uAprendiz, uProgramador,
  uRecepcionista, System.Generics.Collections;

type
  TFormTrabalhadores = class(TForm)
    PnlTrabalhadores: TPanel;
    btnAdcTrabalhador: TButton;
    btnComecarTrabalhos: TButton;
    pnlAdcTrabalhador: TPanel;
    bConfirmar: TButton;
    cbCargos: TComboBox;
    edNome: TEdit;
    lbNome: TLabel;
    ScrollBoxTrabalhadores: TScrollBox;
    lbCargo: TLabel;
    procedure btnComecarTrabalhosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bConfirmarClick(Sender: TObject);
    procedure btnAdcTrabalhadorClick(Sender: TObject);
  private
    { Private declarations }
    wListaTrabalhadores:TObjectList<TTrabalhador>;
    procedure AdicionarTrabalhadorNaLista;
    procedure AdicionarTrabalhadorNaTela(aTrabalhador:TTrabalhador);
  public
    { Public declarations }
  end;

var
  FormTrabalhadores: TFormTrabalhadores;

implementation

{$R *.dfm}

procedure TFormTrabalhadores.AdicionarTrabalhadorNaLista;
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
  trabalhador.setCargo(cbCargos.Text);
  wListaTrabalhadores.Add(trabalhador);
  AdicionarTrabalhadorNaTela(trabalhador);
end;

procedure TFormTrabalhadores.btnAdcTrabalhadorClick(Sender: TObject);
begin
  pnlAdcTrabalhador.Visible:=True;
  cbCargos.SetFocus;
end;

procedure TFormTrabalhadores.btnComecarTrabalhosClick(Sender: TObject);
var trabalhador:TTrabalhador;
    i:integer;
begin
  if wListaTrabalhadores.Count>0 then begin
    for i:=wListaTrabalhadores.Count-1 downto 0 do begin
      trabalhador:=wListaTrabalhadores[i];
      trabalhador.ExecutarFuncao;
    end;
  end else begin
    ShowMessage('Nenhum trabalhador cadastrado');
  end;
end;

procedure TFormTrabalhadores.AdicionarTrabalhadorNaTela(aTrabalhador:TTrabalhador);
var PainelUsuario:TPanel;
    lbNomeUsuario:TLabel;
    lbCargoUsuario:TLabel;
    lbEspacamento:TLabel;
begin
  //Painel Novo
  PainelUsuario:=TPanel.Create(ScrollBoxTrabalhadores);
  PainelUsuario.Align:=alLeft;
  PainelUsuario.Width:=180;
  PainelUsuario.Height:=ScrollBoxTrabalhadores.Height;
  PainelUsuario.Color:=clGrayText;
  PainelUsuario.Parent:=ScrollBoxTrabalhadores;
  PainelUsuario.Padding.Left:=10;
  PainelUsuario.Padding.Bottom:=10;
  PainelUsuario.Padding.Top:=10;
  PainelUsuario.Padding.Right:=10;

  //Adicionando Nome
  lbNomeUsuario:=TLabel.Create(PainelUsuario);
  lbNomeUsuario.Align:=alTop;
  lbNomeUsuario.Alignment:=taCenter;
  lbNomeUsuario.Font.Size:=10;
  lbNomeUsuario.Parent:=PainelUsuario;
  lbNomeUsuario.Caption:=aTrabalhador.getNome;

  //Adicionando Espacamento
  lbEspacamento:=TLabel.Create(PainelUsuario);
  lbEspacamento.Align:=alTop;
  lbEspacamento.Font.Size:=18;
  lbEspacamento.Parent:=PainelUsuario;

   //Adicionando Cargo
  lbCargoUsuario:=TLabel.Create(PainelUsuario);
  lbCargoUsuario.Align:=alTop;
  lbCargoUsuario.Alignment:=taCenter;
  lbCargoUsuario.Font.Size:=18;
  lbCargoUsuario.Parent:=PainelUsuario;
  lbCargoUsuario.Caption:=aTrabalhador.getCargo;
end;

procedure TFormTrabalhadores.bConfirmarClick(Sender: TObject);
begin
  AdicionarTrabalhadorNaLista;
  edNome.Clear;
  cbCargos.ItemIndex:=-1;
  pnlAdcTrabalhador.Visible:=False;
end;

procedure TFormTrabalhadores.FormCreate(Sender: TObject);
begin
  wListaTrabalhadores:=TObjectList<TTrabalhador>.Create;
end;

procedure TFormTrabalhadores.FormDestroy(Sender: TObject);
begin
  wListaTrabalhadores.Free;
end;

end.
