PROGRAM Task1(INPUT, OUTPUT);
CONST
  Max = 100;
VAR
  IntSet: SET OF 2..Max;
  Counter, Position: INTEGER;
BEGIN
  WRITE('all prime numbers from 2 to ', Max, ': ');
  IntSet := [2..Max];
  Position := 2;
  Counter := 2;
  WHILE (Counter <= Max)
  DO
    BEGIN
      Position := 2;
      IF (Counter IN IntSet)
      THEN
        BEGIN
          WRITE(Counter, ' ');
          WHILE (Position <= Max)
          DO
            BEGIN
              IF (Position MOD Counter = 0)
              THEN
                IntSet := IntSet - [Position];
              Position := Position +1
            END  
        END;
      Counter := Counter + 1
    END;
  READLN
END..
