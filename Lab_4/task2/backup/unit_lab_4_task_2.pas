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

function XI(x, xmax, xmin, width: real): integer;
begin
  XI :=  Round(((x - xmin) * (Width)) / (xmax - xmin));
end;

function YJ(y, ymax, ymin, Height: real): integer;
begin
  YJ := Round(((((y - ymin) * (Height)) / (ymin - ymax)) + Height));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, dot, ix, jy: Integer;
  step, x, y, ymin, ymax, xmin, xmax: Real;
begin
  PaintBox1.Canvas.Clear;
  PaintBox1.Canvas.Brush.Color := clForm;
  Canvas.Brush.Color := clDefault;
  Canvas.FillRect(0, 0, 1000, 1000);

  PaintBox1.Canvas.MoveTo(0, PaintBox1.Height div 2); //перемещение в середину
  PaintBox1.Canvas.LineTo(PaintBox1.Width, PaintBox1.Height div 2); //рисуем ось Ox
  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2, 0); //перемещение в середину
  PaintBox1.Canvas.LineTo(PaintBox1.Width div 2, PaintBox1.Height); //рисуем ось Oy

  xmin := StrToFloat(Edit2.Text);
  xmax := StrToFloat(Edit3.Text);
  dot := StrToInt(ComboBox1.Text);

  if xmin >= xmax then
    begin
      ShowMessage('Неправильный ввод');
      exit;
    end;

  step := (abs(xmax) + abs(xmin)) / dot;
  ymin := cos(Pi);
  ymax := cos(0);

  x := xmin;
  Canvas.Brush.Color := clRed;
  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2 + Round(xmin), PaintBox1.Height div 2 - Round(ymin));
  for i := 1 to dot do
    begin
      y := cos(x);

      ix := XI(x, xmax, xmin, PaintBox1.Width);
      jy := YJ(y, ymax, ymin, PaintBox1.Height);

      Canvas.Ellipse(ix - 3, jy - 3, ix + 3, jy + 3);
      x := x + step;
    end;

end;


end.

