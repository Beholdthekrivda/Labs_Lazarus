unit unit_lab_4_task_2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

function XI(x, xmax, xmin: real): integer;
begin
  XI :=  Round(((x - xmin) * 650) / (xmax - xmin));
end;

function YJ(y, ymax, ymin: real): integer;
begin
  YJ := Round(((((y - ymin) * 650) / (ymin - ymax)) + 650));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, dot, ix, jy, zx, zy: Integer;
  step, x, y, ymin, ymax, xmin, xmax: Real;
begin
  Canvas.Brush.Color := clDefault;
  Canvas.FillRect(0, 0, 1000, 1000);

  xmin := StrToFloat(Edit2.Text);
  xmax := StrToFloat(Edit3.Text);
  dot := StrToInt(ComboBox1.Text);

  ymin := -1; //cos(Pi)
  ymax := 1; //cos(0)

  zx := XI(0, xmax, xmin);
  zy := YJ(0, ymax, ymin);

  PaintBox1.Canvas.Line(0, zy, PaintBox1.Width, zy); //рисуем ось Ox
  PaintBox1.Canvas.Line(zx, 0, zx, PaintBox1.Height); //рисуем ось Oy

  if xmin >= xmax then
    begin
      ShowMessage('Неправильный ввод');
      exit;
    end;

  step := (abs(xmax) + abs(xmin)) / dot;

  PaintBox1.Canvas.Brush.Color := clBlack; // Цвет отрезков
  for i := Round(xmin) to Round(xmax) do
  begin
    ix := XI(i, xmax, xmin);
    PaintBox1.Canvas.Line(ix, zy - 10, ix, zy + 10); // Отрезок длиной 10 пикселей
  end;

  // Рисуем единичные отрезки на оси Oy
  for i := Round(ymin - 1) to Round(ymax + 1) do
  begin
    jy := YJ(i, ymax, ymin);
    PaintBox1.Canvas.Line(zx - 10, Trunc(jy / 2), zx + 10, Trunc(jy / 2)); // Отрезок длиной 10 пикселей
  end;

  x := xmin;
  Canvas.Brush.Color := clBlue;
  for i := 1 to dot do
    begin
      y := cos(x);

      ix := XI(x, xmax, xmin);
      jy := YJ(y, ymax, ymin);

      PaintBox1.Canvas.Ellipse(ix - 2, jy - 2, ix + 2, jy + 2);

      x := x + step;
    end;
end;


end.

