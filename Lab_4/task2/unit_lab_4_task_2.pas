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
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var y, x, step, xmin, xmax, ymin, ymax: real;
    dot, ix, jy, i: integer;
begin
  xmin := StrToFloat(Edit1.Text);
  xmax := StrToFloat(Edit2.Text);
  dot := StrToInt(Edit3.Text);

  if (xmin < (-0.86)) or (xmax > 1) or (dot <= 0) then
    begin
      ShowMessage('Неправильный ввод');
      exit;
    end;

  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2, 0);
  PaintBox1.Canvas.LineTo(PaintBox1.Width div 2, PaintBox1.Height);
  PaintBox1.Canvas.MoveTo(0, PaintBox1.Height div 2);
  PaintBox1.Canvas.LineTo(PaintBox1.Width, PaintBox1.Height div 2);

  step := (abs(xmax) + abs(xmin)) / dot;
  x := xmin;
  ymin := ln(1 + xmin);
  ymax := ln(1 + xmax);
  for i := 1 to dot do
    begin
      y := ln(1 + x);
      ix := Trunc(((x - xmin) * (PaintBox1.Width - 0)) / (xmax - xmin));
      jy := Trunc(((y - ymin) * (PaintBox1.Height - 0)) / (ymin - ymax));

      PaintBox1.Canvas.MoveTo(ix, jy);

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

end.



