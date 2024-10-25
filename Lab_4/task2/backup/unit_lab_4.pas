unit unit_lab_4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

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
var xmin, xmax: real;
    dot: integer;
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

end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.



