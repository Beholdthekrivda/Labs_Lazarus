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

  if xmin >= xmax then
    begin
      ShowMessage('Неправильный ввод');
      exit;
    end;

  ymin := 2 * xmin + 3;
  ymax := 2 * xmax + 3;

  //эти две переменные указывают на то где должно быть начало координат
  //относительно введеных данных
  zx := XI(0, xmax, xmin);
  zy := YJ(0, ymax, ymin);

  PaintBox1.Canvas.Line(0, zy, PaintBox1.Width, zy); //рисуем ось Ox
  PaintBox1.Canvas.Line(zx, 0, zx, PaintBox1.Height); //рисуем ось Oy

  // Рисуем единичные отрезки на оси Ox
  for i := Round(xmin) to Round(xmax) do
  begin
    ix := XI(i, xmax, xmin);
    PaintBox1.Canvas.Line(ix, zy - 5, ix, zy + 5); // рисуем вертикальные отрезки
  end;

  // Рисуем единичные отрезки на оси Oy
  for i := Round(ymin) to Round(ymax) do
  begin
    jy := YJ(i, ymax, ymin);
    PaintBox1.Canvas.Line(zx - 5, jy, zx + 5, jy); // рисуем горизонтальные отрезки
  end;

  step := (abs(xmax) + abs(xmin)) / dot;

  x := xmin;
  PaintBox1.Canvas.Brush.Color := clBlue;
  for i := 1 to dot do
    begin
      y := 2 * x + 3;

      ix := XI(x, xmax, xmin);
      jy := YJ(y, ymax, ymin);

      PaintBox1.Canvas.Ellipse(ix - 3, jy - 3, ix + 3, jy + 3);

      x := x + step;
    end;
end;


end.

