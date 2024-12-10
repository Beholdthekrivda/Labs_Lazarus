unit Unit1;

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

procedure TForm1.Button1Click(Sender: TObject);
var
  i, dot: Integer;
  step, x, y, ymin: Real;
  xScale, yScale: Double;
  xmin, xmax: Real;
begin
  PaintBox1.Canvas.Clear;
  //PaintBox1.Canvas.Color := clWhite;

  xScale := 30;
  yScale := 30;

  //PaintBox1.Canvas.Pen.Color := clBlack;

  PaintBox1.Canvas.MoveTo(0, PaintBox1.Height div 2);
  PaintBox1.Canvas.LineTo(PaintBox1.Width, PaintBox1.Height div 2);
  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2, 0);
  PaintBox1.Canvas.LineTo(PaintBox1.Width div 2, PaintBox1.Height);

  xmin := StrToFloat(Edit2.Text);
  xmax := StrToFloat(Edit3.Text);
  dot := StrToInt(Edit1.Text);

  step := (abs(xMax) + abs(xMin)) / dot;
  ymin := sqrt(xMin);

  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2 + Round(xmin * xScale), PaintBox1.Height div 2 - Round(ymin * yScale));
  for i := 1 to dot do
  begin
    x := xmin + i * step;
    y := sqrt(x);

    PaintBox1.Canvas.LineTo(PaintBox1.Width div 2 + Round(x * xScale),  PaintBox1.Height div 2 - Round(y * yScale));
  end;
end;


end.

