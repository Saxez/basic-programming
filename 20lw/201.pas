PROGRAM WriteSymbol(INPUT, OUTPUT);
CONST
  Min = 0;
  Max = 25;
TYPE
  Matrix = SET OF Min..Max;
VAR
  Ch: CHAR;
  Sym: Matrix;

PROCEDURE Identification(VAR ChChecked: CHAR; VAR SetNull: Matrix);
BEGIN{Identification}
  CASE ChChecked OF
    'A': SetNull := [1, 6, 7, 11, 13, 16, 17, 18, 19, 21, 25];
    'B': SetNull := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': SetNull := [2, 3, 4, 5, 6, 11, 16, 22, 23, 24, 25];
    'D': SetNull := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': SetNull := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    'F': SetNull := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': SetNull := [2, 3, 4, 6, 11, 13, 14, 15, 16, 20, 22, 23, 24];
    'H': SetNull := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': SetNull := [2, 3, 4, 8, 13, 18, 22, 23, 24];
    'J': SetNull := [1, 2, 3, 4, 5, 8, 13, 16, 18, 22];
    'K': SetNull := [1, 4, 6, 8, 11, 12, 16, 18, 21, 24];
    'L': SetNull := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'M': SetNull := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': SetNull := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': SetNull := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': SetNull := [1, 2, 3, 6, 9, 11, 12, 13, 16, 21];
    'Q': SetNull := [2, 3, 4, 6, 10, 11, 15, 16, 19, 22, 23, 25];
    'R': SetNull := [1, 2, 6, 8, 11, 12, 16, 18, 21, 24];
    'S': SetNull := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': SetNull := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': SetNull := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': SetNull := [1, 5, 7, 9, 12, 14, 18];
    'W': SetNull := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 24];
    'X': SetNull := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': SetNull := [1, 5, 7, 9, 13, 18, 23];
    'Z': SetNull := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
  ELSE
    SetNull := [];
  END
END;{Identification}

PROCEDURE WriteX(VAR SetFin: Matrix);
VAR
  Counter: INTEGER;
BEGIN{WriteX}
  FOR Counter := Min TO MAX
  DO
    BEGIN
      IF (Counter IN SetFin)
      THEN
        WRITE('X')
      ELSE
        WRITE(' ');
      IF (COUNTER MOD 5 = 0)
      THEN
        WRITELN
    END
END;{WriteX}

BEGIN{WriteSymbol}
  IF NOT EOLN
  THEN
    BEGIN
      READ(INPUT, Ch);
      Identification(Ch, Sym);
      IF (Sym = [])
      THEN
        WRITELN('This sign is not recorded')
      ELSE
        WriteX(Sym)
    END
  ELSE
    WRITELN('Input is empty')
END.{WriteSymbol}

