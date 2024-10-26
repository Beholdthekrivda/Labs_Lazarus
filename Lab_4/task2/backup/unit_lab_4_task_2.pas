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
  PaintBox1.Canvas.Clear; //очистка paintbox
  PaintBox1.Canvas.Brush.Color := clForm;

  //задаем масштаб
  xScale := 30;
  yScale := 30;

  //рисуем оси Ox и Oy
  PaintBox1.Canvas.MoveTo(0, PaintBox1.Height div 2); //перемещение в середину
  PaintBox1.Canvas.LineTo(PaintBox1.Width, PaintBox1.Height div 2); //рисуем ось Ox
  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2, 0); //перемещение в середину
  PaintBox1.Canvas.LineTo(PaintBox1.Width div 2, PaintBox1.Height); //рисуем ось Oy

  xmin := StrToFloat(Edit2.Text);
  xmax := StrToFloat(Edit3.Text);
  dot := StrToInt(ComboBox1.Text);

  //if (xmin <= -1) or (dot <= 0) then
  //  begin
  //    ShowMessage('Неправильный ввод');
  //    exit;
  //  end;

  step := (abs(xmax) + abs(xmin)) / dot;
  ymin := 2 * xmin + 3;

  //перемещение в точку с начальными координатами xmin и ymin откуда будет строиться график
  PaintBox1.Canvas.MoveTo(PaintBox1.Width div 2 + Round(xmin * xScale), PaintBox1.Height div 2 - Round(ymin * yScale));
  for i := 0 to dot do
    begin
      x := xmin + i * step;
      y := 2 * x + 3;

      //доп слагаемые нужны чтобы разместить точку относительно центра
      PaintBox1.Canvas.LineTo(PaintBox1.Width div 2 + Round(x * xScale),  PaintBox1.Height div 2 - Round(y * yScale));
    end;
end;


end.

