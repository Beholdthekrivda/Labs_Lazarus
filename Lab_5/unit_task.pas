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
    procedure Button5Click(Sender: TObject);
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
  head := nil;

  for i := 1 to n do
    begin
      new(newNode);
      newNode^.data := Random(1999) - 1000;
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

procedure SortList(var head: PNode);
var current, next, sorted: PNode;
  prev: PNode;
begin
  current := head^.next; // Начинаем с второго узла
  head^.next := nil; // Первый узел считается отсортированным

  while current <> nil do
  begin
    next := current^.next; // Сохраняем ссылку на следующий узел
    sorted := head; // Указатель на начало отсортированного участка
    // Ищем место для вставки, пока не дойдем до конца отсортированного участка
    // или не встретим узел с данными, большими, чем данные current
    while (sorted <> nil) and (current^.data > sorted^.data) do
    begin
      prev := sorted;
      sorted := sorted^.next;
    end;

    // Вставляем current перед sorted
    current^.next := sorted;
    if sorted = head then
      head := current
    else
      prev^.next := current;

    current := next; // Переходим к следующему узлу
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

procedure TForm1.Button5Click(Sender: TObject);
var temp: PNode;
   i: integer;
begin
  head := nil;
  CreateList(StrToInt(Edit1.Text));
  SortList(head);
  ListBox2.Items.Clear;
  temp := head;
  i := 0;
  while temp <> nil do
    begin
      listBox2.Items.Add(IntToStr(temp^.data));
      temp := temp^.next;
      i := i + 1;
      if i = 40 then
        break;
    end;
end;



end.

