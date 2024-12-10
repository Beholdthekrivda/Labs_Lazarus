program project1;
{$codepage UTF-8}

uses SysUtils, Windows;

var ArrIndex, i, z, j: integer;
    arr1, arr2, arr3, arr4, arr5: array[0..100] of string;
    arr6: array[0..100] of integer;
    IndexArr6: array of integer;
    inputfile: TextFile;
    line, s: string;

procedure IndexSort(var IndexArr: array of integer; n: integer; arr: array of integer);
var i, j, k: integer;
begin
  for i := 0 to n do
    IndexArr[i] := i;

  j := 0;
  while j < n do
  begin
    if arr[IndexArr[j]] <= arr[IndexArr[j + 1]] then
      j := j + 1
    else
      begin
        k := IndexArr[j];
        IndexArr[j] := IndexArr[j + 1];
        IndexArr[j + 1] := k;
        j := 0;
      end;
  end;
end;

begin

  ArrIndex := 0;

  AssignFile(inputfile, 'file1.txt');
  Reset(inputfile);

  while not EOF(inputfile) do
    begin
      readln(inputfile, line);

      arr1[ArrIndex] := copy(line, 0, pos(' ', line));
      Delete(line, 1, pos(' ', line + ' '));

      line := trim(line);

      arr2[ArrIndex] := copy(line, 0, pos(' ', line));
      Delete(line, 1, pos(' ', line + ' '));

      line := trim(line);

      arr3[ArrIndex] := line;

      ArrIndex := ArrIndex + 1;
    end;

  CloseFile(inputfile);

  AssignFile(inputfile, 'file2.txt');
  Reset(inputfile);

  while not EOF(inputfile) do
    begin
      readln(inputfile, line);

      arr1[ArrIndex] := copy(line, 0, pos(' ', line));
      Delete(line, 1, pos(' ', line + ' '));

      line := trim(line);

      arr2[ArrIndex] := copy(line, 0, pos(' ', line));
      Delete(line, 1, pos(' ', line + ' '));

      line := trim(line);

      arr3[ArrIndex] := line;

      ArrIndex := ArrIndex + 1;
    end;

   CloseFile(inputfile);

   ArrIndex := 0;

  AssignFile(inputfile, 'file3.txt');
  Reset(inputfile);

  while not EOF(inputfile) do
    begin
      readln(inputfile, line);

      arr4[ArrIndex] := copy(line, 0, pos(' ', line));
      Delete(line, 1, pos(' ', line + ' '));

      line := trim(line);

      arr5[ArrIndex] := copy(line, 0, pos(' ', line));
      Delete(line, 1, pos(' ', line + ' '));

      line := trim(line);

      arr6[ArrIndex] := StrToInt(line);

      ArrIndex := ArrIndex + 1;
    end;

  CloseFile(inputfile);

  AssignFile(inputfile, 'file4.txt');
  Reset(inputfile);

  while not EOF(inputfile) do
    begin
      readln(inputfile, line);

      arr4[ArrIndex] := copy(line, 0, pos(' ', line));
      Delete(line, 1, pos(' ', line + ' '));

      line := trim(line);

      arr5[ArrIndex] := copy(line, 0, pos(' ', line));
      Delete(line, 1, pos(' ', line + ' '));

      line := trim(line);

      arr6[ArrIndex] := StrToInt(line);

      ArrIndex := ArrIndex + 1;
    end;

  CloseFile(inputfile);

  for i := 0 to ArrIndex - 1 do
    begin
      for j := 0 to ArrIndex - 1 do
        begin
          if arr1[i] = arr4[j] then
            begin
              s := arr4[j];
              arr4[j] := arr4[i];
              arr4[i] := s;

              s := arr5[j];
              arr5[j] := arr5[i];
              arr5[i] := s;

              z := arr6[j];
              arr6[j] := arr6[i];
              arr6[i] := z;
            end;
        end;
    end;

  writeln('Неотсортированная таблица');
  writeln;

  for i := 0 to ArrIndex - 1 do
    writeln(Format('%-15s|%-15s|%-15s|%-15s|%-9s|%-5d|', [arr1[i], arr2[i], arr3[i], arr4[i], arr5[i], arr6[i]]));

  //П1
  SetLength(IndexArr6, ArrIndex - 1);

  IndexSort(IndexArr6, ArrIndex - 1, arr6);

  writeln;
  writeln('Отсортированная таблица');
  writeln;

  for i := 0 to ArrIndex - 1 do
    writeln(Format('%-15s|%-15s|%-15s|%-15s|%-9s|%-5d|', [arr1[IndexArr6[i]], arr2[IndexArr6[i]], arr3[IndexArr6[i]], arr4[IndexArr6[i]], arr5[IndexArr6[i]], arr6[IndexArr6[i]]]));


  readln;
end.


