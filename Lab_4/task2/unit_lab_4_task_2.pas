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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    //procedure FormCreate(Sender: TObject);
    //procedure PaintBox1Click(Sender: TObject);
    //procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var xmin, xmax, step, y, x, ymin, ymax: real;
    dot, i, ix, jy: integer;
begin
  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2, 0);
  PaintBox1.Canvas.LineTo(PaintBox1.Width div 2, PaintBox1.Height);
  PaintBox1.Canvas.MoveTo(0, PaintBox1.Height div 2);
  PaintBox1.Canvas.LineTo(PaintBox1.Width, PaintBox1.Height div 2);

  xmin := StrToFloat(Edit1.Text);
  xmax := StrToFloat(Edit2.Text);
  dot := StrToInt(Edit3.Text);

  step := (abs(xmin) + abs(xmax)) / dot;
  x := xmin;
  ymin := sin(xmin);
  ymax := sin(xmax); //Посмотреть как найти максимальное значение функции
  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2, PaintBox1.Height div 2);
  for i := 1 to dot do
    begin
      y := sin(x);
      ix := Trunc((((x - xmin) * (PaintBox1.Width)) / (xmax - xmin)) + 112);
      jy := Trunc((((y - xmin) * (PaintBox1.Height)) /(xmin - xmax)) + 343);

      //Canvas.MoveTo(Canvas.Width div 2, Canvas.Height div 2);
      Canvas.Ellipse(ix, jy, ix + 5, jy + 5);

      x := x + step;
    end;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

end.



