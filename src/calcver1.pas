unit CalcVer1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, ExpressionParser;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnAbrePar: TButton;
    btnFechaPar: TButton;
    btnNum7: TButton;
    btnResultado: TButton;
    btnNum0: TButton;
    btnClear: TButton;
    btnMultiplica: TButton;
    btnSubtrai: TButton;
    btnSoma: TButton;
    btnDivide: TButton;
    btnPonto: TButton;
    btnNum8: TButton;
    btnNum9: TButton;
    btnNum5: TButton;
    btnNum4: TButton;
    btnNum6: TButton;
    btnNum2: TButton;
    btnNum1: TButton;
    btnNum3: TButton;
    edtRes: TEdit;
    lblEquacao: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MnItemCalcVer2: TMenuItem;
    procedure btnClearClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure btnPontoClick(Sender: TObject);
    procedure btnOperadorClick(Sender: TObject);
    procedure btnResultadoClick(Sender: TObject);
    procedure edtResChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MnItemCalcVer2Click(Sender: TObject);
  private
    (*num1, num2, numRes: double;
    operador: String;*)
    fechaPar, fimOper, numFlutuante: Boolean;

  public

  end;

var
  Form1: TForm1;

implementation
uses calcver2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  btnClearClick(Sender);
end;

procedure TForm1.btnClick(Sender: TObject);
begin

  if fimOper then btnClearClick(Sender);

  if not numRes.IsNan then btnClearClick(Sender);
  if TButton(Sender).Caption = '(' then fechaPar := false;
  if TButton(Sender).Caption = ')' then fechaPar := true;

  edtRes.Text := edtRes.Text + TButton(Sender).Caption;
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  edtRes.Text := '';
  lblEquacao.Caption:='';
  numRes:= numRes.NaN;
  fechaPar:= true;
  fimOper:= false;
  numFlutuante:= false;
end;

procedure TForm1.btnPontoClick(Sender: TObject);
begin
  if not(numFlutuante) then

  begin
    if edtRes.Text = '' then
  begin
    edtRes.Text := '0' + TButton(Sender).Caption;
  end else
  begin
    btnClick(Sender);
  end;
  numFlutuante:= true;

  end;

end;

procedure TForm1.btnOperadorClick(Sender: TObject);
begin
  if not (edtRes.Text = '') then
  begin

  if (fimOper) then
  begin
    lblEquacao.Caption:= edtRes.Text + ' ' + TButton(Sender).Caption + ' ';
    edtRes.Text:= '';
    fimOper:= false;
  end else
  begin;
    lblEquacao.Caption:= lblEquacao.Caption + ' ' + edtRes.Text + ' ' + TButton(Sender).Caption + ' ';
    edtRes.Text := '';
  end;

  end;

end;

procedure TForm1.btnResultadoClick(Sender: TObject);
var
  parsedRes: real;
begin
  if not (edtRes.Text = '') then
  begin

  lblEquacao.Caption:= lblEquacao.Caption + edtRes.text;

  if not(fechaPar) then
  begin
  lblEquacao.Caption := lblEquacao.Caption + ')';
  end;
  parsedRes := ExpressionParser.Parse(lblEquacao.Caption);
  edtRes.Text:= Double.ToString(parsedRes);
  fimOper:= true;
  end;

end;

procedure TForm1.edtResChange(Sender: TObject);
begin

end;

procedure TForm1.MnItemCalcVer2Click(Sender: TObject);
begin
    Form2.Show;
end;

end.

