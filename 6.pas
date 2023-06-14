program Project1;
 
const
  M = 100; 
 
type
 
  TData = Integer;
  
  TQueue = record
    Arr : array[1..100] of TData; 
    Cnt : Integer;
  end;

function Push(var aQueue : TQueue; const aData : TData) : Boolean;
begin
  Push := False;
  with aQueue do
    if Cnt < 100 then begin
      Inc(Cnt);
      Arr[Cnt] := aData;
      Push := True;
    end;
end;
 
function Pop(var aQueue : TQueue; var aData : TData) : Boolean;
var
  i : Integer;
begin
  Pop := False;
  with aQueue do
    if Cnt > 0 then begin
      aData := Arr[1];
      Dec(Cnt);
      for i := 1 to Cnt do Arr[i] := Arr[i + 1];
      Pop := True;
    end;
end;

procedure Print(const aQueue : TQueue);
var
  i : Integer;
begin
  with aQueue do begin
    if Cnt = 0 then
      Writeln('Очередь пуста.')
    else begin
      for i := 1 to Cnt do begin
        if i > 1 then Write(', ');
        Write(Arr[i]);
      end;
      Writeln;
    end;
  end;
end;
 
var
  Q1, Q2 : TQueue;
  Data : TData;
  i : Integer;
  S : String;
begin
  repeat
    Q1.Cnt := 0;
    Q2.Cnt := 0;

    Randomize;
    for i := 1 to 10 do Push(Q1, Random(10));
    Writeln('Сформированы очереди.');
    Writeln('Q1:');
    Print(Q1);
    Writeln('Q2:');
    Print(Q2);
 
    while Pop(Q1, Data) and Push(Q2, Data) do; 
    Writeln('Очереди после переливания.');
    Writeln('Q1:');
    Print(Q1);
    Writeln('Q2:');
    Print(Q2);
 
    Writeln('Повторить - Enter. Выход - любой символ + Enter.');
    Readln(S);
  until S <> '';
end.