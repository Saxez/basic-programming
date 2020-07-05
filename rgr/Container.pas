UNIT Container;
INTERFACE
  TYPE 
    Tree = ^NodeType;
    NodeType = RECORD
                 Word: STRING;
                 LLink, RLink: Tree;
                 Amount: INTEGER;
               END;
  PROCEDURE Insert(VAR Ptr:Tree; VAR Data: STRING);
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);
IMPLEMENTATION
  PROCEDURE Insert(VAR Ptr:Tree; VAR Data: STRING);
  BEGIN {Insert}
    IF Ptr = NIL
    THEN
      BEGIN
        NEW(Ptr);
        Ptr^.Amount := 1;
        Ptr^.Word := Data;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE
      IF Data < Ptr^.Word
      THEN
        Insert(Ptr^.LLink, Data)
      ELSE
        IF Data > Ptr^.Word
        THEN
          Insert(Ptr^.RLink, Data)
        ELSE
          Ptr^.Amount :=  Ptr^.Amount + 1
  END;  {Insert}

  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);
  BEGIN {PrintTree}
    IF Ptr <> NIL
    THEN 
      BEGIN
        PrintTree(Ptr^.LLink, FOut);
        WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Amount);
        PrintTree(Ptr^.RLink, FOut)
      END
  END;  {PrintTree}
  PROCEDURE ClearTree(VAR Ptr: Tree); 
  BEGIN {ClearTree}
    IF Ptr <> NIL
    THEN
      BEGIN
        ClearTree(Ptr^.LLink); 
        ClearTree(Ptr^.RLink);
        DISPOSE(Ptr);
        Ptr := NIL
      END
  END; {ClearTree}
END.

