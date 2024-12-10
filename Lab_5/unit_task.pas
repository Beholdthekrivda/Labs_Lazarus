unit unit_task;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Windows;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    OpenDialog1: TOpenDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    //procedure Button6Click(Sender: TObject);
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
  head, nonsortedlisthead, sortedlisthead, p1: PNode;
  path: string;
  k_nonsortlist, k_sortinsertionlist, k_mergelist: boolean;

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
      newNode^.data := Random(1999) - 999;
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
var
  temp, p1, p2, NewNode1: PNode;
begin
  temp := head; // Инициализация временного указателя на голову неотсортированного списка
  sortedlisthead := nil; // Инициализация головы отсортированного списка

  while temp <> nil do
  begin
    p1 := sortedlisthead; // Указатель для поиска места вставки в отсортированном списке
    p2 := nil; // Указатель на предыдущий элемент в отсортированном списке

    // Цикл для поиска правильного места для вставки текущего элемента
    while (p1 <> nil) and (p1^.data < temp^.data) do
    begin
      p2 := p1; // Сохраняем текущий элемент как предыдущий
      p1 := p1^.next; // Переходим к следующему элементу в отсортированном списке
    end;

    New(NewNode1); // Выделяем память для нового узла
    NewNode1^.data := temp^.data; // Копируем данные из текущего узла исходного списка в новый узел

    // Если p2 равен nil, значит, мы вставляем элемент в начало отсортированного списка
    if p2 = nil then
    begin
      NewNode1^.next := sortedlisthead; // Новый узел указывает на текущую голову отсортированного списка
      sortedlisthead := NewNode1; // Обновляем голову отсортированного списка
    end
    else
    begin
      // Вставляем новый узел между p2 и p1
      NewNode1^.next := p2^.next; // Новый узел указывает на следующий элемент после p2
      p2^.next := NewNode1; // p2 указывает на новый узел
    end;

    temp := temp^.next; // Переходим к следующему элементу в исходном списке
  end;
end;

//procedure SortMergeList1(var p1, p2, p3: PNode);
//var p4: PNode;
//begin
//  if p1^.data <= p2^.data then
//    begin
//      p3 := p1;
//      p4 := p1;
//      p1 := p1^.next;
//    end
//  else
//    begin
//      p3 := p2;
//      p4 := p2;
//      p2 := p2^.next;
//    end;
//  while (p1 <> nil) and (p2 <> nil) do
//    begin
//      if p1^.data <= p2^.data then
//        begin
//          p4^.next := p1;
//          p4 := p1;
//          p1 := p1^.next;
//        end
//      else
//        begin
//          p4^.next := p2;
//          p4 := p2;
//          p2 := p2^.next;
//        end;
//    end;
//  if p1 <> nil then
//    p4^.next := p1
//  else
//    p4^.next := p2;
//
//  p1 := nil;
//  p2 := nil;
//end;
//
//procedure SortMergeList(var head: PNode; n: integer);
//var p1, p2: PNode;
//    k, i: integer;
//begin
//  if n > 1 then
//    begin
//      k := n div 2;
//      p1 := head;
//      for i := 1 to k - 1 do p1 := p1^.next;
//      p2 := p1^.next; p1^.next := nil; p1 := head;
//      SortMergeList(p1, k);
//      SortMergeList(p2, n - k);
//      SortMergeList1(p1, p2, head);
//    end;
//end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var MyFile: TextFile;
    temp: PNode;
begin
  ListBox4.Clear;
  SelectDirectoryDialog1.Execute;
  path := SelectDirectoryDialog1.FileName;
  AssignFile(MyFile, path + '\' + ComboBox1.Text + '.txt');
  ReWrite(MyFile);
  if k_nonsortlist then
    begin
      temp := nonsortedlisthead;
      Writeln(MyFile, '-----Линейная-----');
      while temp <> nil do
        begin
          writeln(MyFile, temp^.data);
          temp := temp^.next;
        end;
    end;

  if k_sortinsertionlist then
    begin
      temp := sortedlisthead;
      Writeln(MyFile, '-----Вставками-----');
      while temp <> nil do
        begin
          writeln(MyFile, temp^.data);
          temp := temp^.next;
        end;
    end;
  listBox4.Items.Add('Данные записаны в ' + path + '\' + ComboBox1.Text + '.txt');
  CloseFile(MyFile);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ListBox4.Clear;
  if OpenDialog1.Execute then
    begin
      path := OpenDialog1.Filename;
      ListBox4.Items.Add('Открытие файла ' + path);
      ShellExecute(0, 'open', PChar(path), nil, nil, SW_SHOW);
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var temp: PNode;
    i: integer;
begin
  CreateList(StrToInt(Edit1.Text));

  ListBox1.Items.Clear;

  nonsortedlisthead := head;
  temp := nonsortedlisthead;
  i := 0;
  while temp <> nil do
    begin
      listBox1.Items.Add(IntToStr(temp^.data));
      temp := temp^.next;
      i := i + 1;
      if i = 40 then
        break;
    end;

  k_nonsortlist := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
var temp: PNode;
   i: integer;
begin
  CreateList(StrToInt(Edit1.Text));
  SortList(head);

  ListBox2.Items.Clear;

  temp := sortedlisthead;
  i := 0;
  while temp <> nil do
    begin
      listBox2.Items.Add(IntToStr(temp^.data));
      temp := temp^.next;
      i := i + 1;
      if i = 40 then
        break;
    end;

  k_sortinsertionlist := True;
end;

//procedure TForm1.Button6Click(Sender: TObject);
//var temp: PNode;
//   i, n: integer;
//begin
//  n := StrToInt(Edit1.Text);
//  CreateList(n);
//  SortMergeList(head, n);
//
//  ListBox2.Items.Clear;
//
//  temp := p1;
//  i := 0;
//  while temp <> nil do
//    begin
//      listBox2.Items.Add(IntToStr(temp^.data));
//      temp := temp^.next;
//      i := i + 1;
//      if i = 40 then
//        break;
//    end;
//
//  k_mergelist := True;
//end;



end.

