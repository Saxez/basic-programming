PROGRAM Task1(INPUT, OUTPUT);
CONST
  Max = 100;
VAR
  IntSet: SET OF 2..Max;
  Counter, Position: INTEGER;
BEGIN{Task1}
  Position := 2;
  IntSet : [2..Max];  
  WRITE('all prime numbers from 2 to ', Max,': ');
  WHILE (IntSet <> [])
    BEGIN
      WHILE (Counter <= Max)
        BEGIN
          IF ((Position MOD Counter) = 0) 
          THEN
            IntSet := IntSet - [Counter];
        END
      WRITE(Position, ', ')
    END
END.{Task1}
