PROGRAM Rgr(INPUT, OUTPUT);
USES
  Statistic, Container;
  
PROCEDURE GetStatistic(VAR FIn, FOut: TEXT);
VAR
  WordTree: STRING;
  Root: Tree;
BEGIN{GetStatistic}
  Root:= NIL;
  RESET(FIn);
  REWRITE(FOut);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      GetWord(FIn, WordTree);
      IF (WordTree <> '')
      THEN
        Insert(Root, WordTree);
    END;
  PrintTree(Root, FOut)
END;{GetStatistic}
 
BEGIN
  ASSIGN(INPUT, 'INPUT.txt');
  ASSIGN(OUTPUT, 'OUTPUT.txt');
  GetStatistic(INPUT, OUTPUT);
END.  
