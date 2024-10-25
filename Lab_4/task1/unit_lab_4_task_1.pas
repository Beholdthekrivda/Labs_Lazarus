unit unit_lab_4_task_1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  Brush.Color:=clForm;
  Canvas.FillRect(0,0, Width, Height);

  Canvas.Pen.Color:=clGreen;
  Canvas.Pen.Width:=3;
  Canvas.Brush.Color:=clRed;
  Canvas.EllipseC(75,75,25,25);

  Canvas.Pen.Color:=clRed;
  Canvas.Brush.Color:=clGreen;
  Canvas.Brush.Style:=bsCross;
  Canvas.Rectangle(110, 50, 210, 100);

  Canvas.Pen.Color:=clBlack;
  Canvas.Pen.Width:=10;
  Canvas.Line(10, 120, 360, 120);

  Canvas.Brush.Color:=clForm;
  Canvas.Font.Color:=clBlue;
  Canvas.Font.Name:='Courier';
  Canvas.Font.Size:=30;
  Canvas.Font.Style:=[fsBold];
  Canvas.TextOut(60, 150, 'Рисунок');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

end.

