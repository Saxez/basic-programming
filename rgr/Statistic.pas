UNIT Statistic;
INTERFACE
  CONST
    AlphabetUp = ['A'..'Z', 'À'..'ß', '¨'];
    AlphabetDown = ['a'..'z', 'à'..'ÿ', '¸'];
    Alphabet = AlphabetUp + AlphabetDown;
    LetterChange = 32;
  PROCEDURE GetWord(VAR FInput: TEXT; VAR WordTree: STRING);
IMPLEMENTATION
  PROCEDURE Checking(VAR Uncheked: CHAR);
  BEGIN{Checking}
    IF ((Uncheked = '¨') OR (Uncheked = '¸'))
    THEN
      Uncheked := 'å';
    IF (Uncheked IN AlphabetUp)
    THEN 
      Uncheked := CHR(ORD(Uncheked) + LetterChange);
  END;{Checking}
  PROCEDURE GetWord(VAR FInput: TEXT; VAR WordTree: STRING);
  VAR
    Ch: CHAR;
  BEGIN {GetWord}
    WordTree := '';
    READ(FInput, Ch);
    WHILE NOT(Ch IN Alphabet) AND NOT EOF(FInput)
    DO
      READ(FInput, Ch);  
    WHILE ((Ch IN Alphabet) AND NOT EOF(FInput))
    DO
      BEGIN
        Checking(Ch);
        WordTree := WordTree + Ch;
        READ(FInput, Ch)
      END;
    IF (Ch IN Alphabet) AND EOF(FInput)
    THEN
      BEGIN
        Checking(Ch);
        WordTree := WordTree + Ch
      END
  END;{GetWord}
BEGIN
END.

