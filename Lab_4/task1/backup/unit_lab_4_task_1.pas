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
  //Brush.Color := clForm;
  //Canvas.FillRect(0,0, Width, Height);

  Canvas.Pen.Color := clGreen; //цвет окантовки круга
  Canvas.Pen.Width := 3; //ширина окантовки
  Canvas.Brush.Color := clRed; //цвет заливки внутри круга
  Canvas.EllipseC(75, 75, 25, 25); //рисование круга по координатам

  Canvas.Pen.Color := clRed; //цвет окантовки прямоугольника
  Canvas.Brush.Color := clBlue; //цвет внутри прямоугольника
  Canvas.Pen.Width := 5;
  Canvas.Brush.Style := bsCross; //стиль рисования сеточкой
  Canvas.Rectangle(110, 50, 210, 100); //рисование прямоугольника по координатам

  Canvas.Pen.Color := clBlack; //цвет линии
  Canvas.Pen.Width := 10; //ширина линии
  Canvas.Line(10, 10, 360, 10); //рисование линии по координатам

  Canvas.Brush.Color := clForm; //установление цвета формы
  Canvas.Font.Color := clBlue; //цвет текста
  Canvas.Font.Name := 'Courier'; //выбор шрифта
  Canvas.Font.Size := 30; //размер шрифта
  Canvas.Font.Style := [fsBold]; //делает шрифт жирным
  Canvas.TextOut(60, 150, 'Рисунок'); //рисует текст по координатам
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

end.

