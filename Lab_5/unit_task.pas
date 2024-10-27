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

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button4Click(Sender: TObject);
type
    // Определение типа узла линейного списка
    PNode = ^Node;
    Node = record
        data: Integer; // Данные узла
        next: PNode;   // Указатель на следующий узел
    end;
var
    head, temp, newNode: PNode;
    i, n, z: Integer;
begin
    randomize;
    ListBox1.Items.Clear;
    head := nil; // Инициализируем начало списка пустым

    // Ввод количества элементов, которые нужно добавить в список
    n := StrToInt(Edit1.Text);

    for i := 1 to n do
    begin
        // Создаем новый узел и заполняем его данными
        New(newNode);            // Выделяем память для нового узла
        newNode^.data := Random(2000) - 1000;  // Заполняем узел значением
        newNode^.next := nil;    // Устанавливаем указатель следующего узла в nil

        if head = nil then
            head := newNode     // Если список пуст, то новый узел становится головой списка
        else
        begin
            temp := head;
            // Находим последний узел в списке
            while temp^.next <> nil do
                temp := temp^.next;
            temp^.next := newNode; // Добавляем новый узел в конец списка
        end;
    end;

    // Вывод элементов списка
    //WriteLn('Элементы списка: ');
    temp := head;
    if n > 40 then
      begin
        z := 0;
        while z <> 40 do
          begin
            ListBox1.Items.Add(IntToStr(temp^.data));
            temp := temp^.next;
            z := z + 1;
          end;
      end
    else
      begin
        while temp <> nil do
          begin
            ListBox1.Items.Add(IntToStr(temp^.data));
            temp := temp^.next;
          end;
      end;
end;



end.

