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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
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
  Canvas.Rectangle(100, 100, 450, 450);
  Canvas.Line(100, 275, 450, 275);
  Canvas.Line(275, 100, 275, 450);

  xmin := StrToFloat(Edit1.Text);
  xmax := StrToFloat(Edit2.Text);
  dot := StrToInt(Edit3.Text);

  step := (abs(xmin) + abs(xmax)) / dot;
  x := xmin;
  ymin := sin(xmin);
  ymax := sin(xmax); //Посмотреть как найти максимальное значение функции
  for i := 1 to dot do
    begin
      y := sin(x);
      ix := Round((((x - xmin) * (450 - 100)) / (xmax - xmin)) + 100);
      jy := Round((((y - ymin) * (450 - 100)) /(ymin - ymax)) + 450);

      //Canvas.MoveTo(Canvas.Width div 2, Canvas.Height div 2);
      Canvas.Ellipse(ix, jy, ix + 5, jy + 5);

      x := x + step;
    end;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.PaintBox1Click(Sender: TObject);
begin

end;

end.



