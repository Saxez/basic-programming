PROGRAM isPrime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
TYPE
  SetOfNumbers = SET  OF Min..Max;
VAR
  IntSet: SetOfNumbers;
PROCEDURE WriteSet(VAR SetFin: SetOfNumbers; VAR FOut: TEXT);
{������� � ���� ���������}
VAR
  J: INTEGER;
BEGIN{WriteSet}
  J := Min;
  WRITE(FOut, '{ ');
  WHILE J <= Max
  DO
    BEGIN
      IF J IN SetFin
      THEN
         WRITE(FOut, J, ' ');
      J := J + 1
    END;
  WRITELN(FOut, '}')
END;{WriteSet}
PROCEDURE GetPrimeSet(VAR SetUnfin: SetOfNumbers; VAR FOut: TEXT);
{�������� ������ }
VAR
  I, J, Prime: INTEGER;  
BEGIN{GetPrimeSet}
  I := Min;
  WHILE I * I <= Max
  DO
    BEGIN
      J := I;
      IF J IN SetUnfin
      THEN
        BEGIN 
          Prime := J;
          J := J + Prime;
          WHILE J <= Max
          DO
            BEGIN
              SetUnfin := SetUnfin - [J];  
              J := J + Prime;
            END;
          WRITELN(FOut, '�� ������ �����: ');
          WriteSet(SetUnfin, FOut);
        END; 
      I := I + 1; 
    END;
END;{GetPrimeNumber}
BEGIN {isPrime}
  IntSet := [Min..Max];
  GetPrimeSet(IntSet, OUTPUT)
END. {isPrime}
