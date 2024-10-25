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
var y, x, step, xmin, xmax, ymin, ymax: real;
    dot, ix, jy, i, z: integer;
begin
  xmin := StrToFloat(Edit1.Text);
  xmax := StrToFloat(Edit2.Text);
  dot := StrToInt(Edit3.Text);
  z := 5;

  //if (xmin < (-0.86)) or (xmax > 1) or (dot <= 0) then
  //  begin
  //    ShowMessage('Неправильный ввод');
  //    exit;
  //  end;

  PaintBox1.Canvas.Clear;

  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2, 0);
  PaintBox1.Canvas.LineTo(PaintBox1.Width div 2, PaintBox1.Height);
  PaintBox1.Canvas.MoveTo(0, PaintBox1.Height div 2);
  PaintBox1.Canvas.LineTo(PaintBox1.Width, PaintBox1.Height div 2);

  step := (abs(xmax) + abs(xmin)) / dot;
  x := xmin;
  ymin := ln(1 + xmin);
  ymax := ln(1 + xmax);

  PaintBox1.Canvas.MoveTo(PaintBox1.Width, PaintBox1.Height);
  Canvas.Brush.Color := clBlack;
  for i := 1 to dot do
    begin
      //Canvas.FillRect(0, 500, 700, 700);
      y := ln(1 + x);
      x := x + step;

      ix := Trunc((((x - xmin) * (PaintBox1.Width)) / (xmax - xmin)) + 112);
      jy := Trunc((((y - ymin) * (PaintBox1.Height)) / (ymin - ymax)) + PaintBox1.Height);
      //canvas.rectangle(112,112,PaintBox1.Width+112,PaintBox1.Height+112);

      PaintBox1.Canvas.Ellipse(ix + z - 112 div 2, jy + z - 112 div 2, ix - 112 div 2, jy - 112 div 2);

      //x := x + step;
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



