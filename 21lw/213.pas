PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  CharSet = SET OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  Length: 0..Len;
  ChiperFile: TEXT;
  AvailableSet: CharSet;
  ErrorFlag, LengthFlag: BOOLEAN;
 
PROCEDURE Initialize(VAR Code: Chiper; VAR Chip: TEXT; VAR AvSet: CharSet; VAR Error: BOOLEAN);
{Присвоить Code шифр замены}
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {Initialize}
  RESET(Chip);
  Ch1 := '';
  Ch2 := '';
  Ch3 := '';
  READ(Chip, Ch1);
  WHILE NOT EOF(Chip)
  DO                  
    BEGIN
      IF Ch2 = '=' 
      THEN
        BEGIN
          IF Ch1 = ' '
          THEN
            Error := TRUE;
          Code[Ch3] := Ch1;
          AvSet := AvSet + [Ch1]
        END;
      Ch3 := Ch2;
      Ch2 := Ch1;
      READ(Chip, Ch1)
    END
END;  {Initialize}
 
PROCEDURE Decode(VAR S: Str; VAR FullSet: CharSet); 
VAR
  Index: 1 .. Len;
  I: CHAR;
BEGIN {Encode}
  FOR Index := 1 TO Len
  DO
    BEGIN
      IF NOT (S[Index] IN FullSet) 
      THEN
        WRITE(S[Index])
      ELSE
        FOR I:= ' ' TO 'Z'
        DO
          BEGIN
            IF S[Index] = Code[I]
            THEN
              WRITE(I)
          END
    END;
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  ErrorFlag := FALSE;
  LengthFlag := FALSE;
  AvailableSet:= [];
  ASSIGN(ChiperFile, 'code.txt');
  Initialize(Code, ChiperFile, AvailableSet, ErrorFlag);
  IF NOT ErrorFlag
  THEN
    WHILE NOT EOF
    DO
      BEGIN
        I := 0;
        WHILE NOT EOLN AND (I < Len)
        DO
          BEGIN
            I := I + 1;
            Length := I;
            READ(Msg[I])
          END;
        READLN;
        IF (I > 0)
        THEN
          Decode(Msg, AvailableSet)
      END
  ELSE
    WRITE('error');
  READLN
END.  {Encryption}

