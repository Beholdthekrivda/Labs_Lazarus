unit unit_task;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    OpenDialog1: TOpenDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

type
  PNode = ^Node;

  Node = record
  data: integer;
  next: PNode;
  end;

var
  Form1: TForm1;
  head: PNode;

implementation

{$R *.lfm}

{ TForm1 }

procedure CreateList(n: integer);
var
  temp, newNode: PNode;
  i: integer;
begin
  randomize;
  for i := 1 to n do
    begin
      New(newNode);
      newNode^.data := Random(2000) - 1000;
      newNode^.next := nil;

      if head = nil then
        head := newNode
      else
        begin
          temp := head;
          while temp^.next <> nil do
            temp := temp^.next;
          temp^.next := newNode;
        end;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button4Click(Sender: TObject);
var temp: PNode;
    i: integer;
begin
  head := nil;
  CreateList(StrToInt(Edit1.Text));
  ListBox1.Items.Clear;
  temp := head;
  i := 0;
  while temp <> nil do
    begin
      listBox1.Items.Add(IntToStr(temp^.data));
      temp := temp^.next;
      i := i + 1;
      if i = 40 then
        break;
    end;
end;



end.

