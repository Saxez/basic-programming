PROGRAM isPrime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
TYPE
  SetOfNumbers = SET  OF Min..Max;
VAR
  IntSet: SetOfNumbers;
  I, J, Prime: INTEGER;
BEGIN {isPrime}
  IntSet := [Min..Max];
  I := Min;
  WHILE I * I <= Max
  DO
    BEGIN
      J := I;
      IF J IN IntSet
      THEN
        BEGIN 
          Prime := J;
          J := J + Prime;
          WHILE J <= Max
          DO
            BEGIN
              IntSet := IntSet - [J];  
              J := J + Prime;
            END;
        END; 
      I := I + 1; 
    END;
  J := Min;
  WRITE(OUTPUT, '{ ');
  WHILE J <= Max
  DO
    BEGIN
      IF J IN IntSet
      THEN
        WRITE(OUTPUT, J, ' ');
      J := J + 1
    END;
  WRITE(OUTPUT, '}')
END. {isPrime}
