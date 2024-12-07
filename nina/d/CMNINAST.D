

BEGIN ~CMNINAST~  

IF ~NumTimesTalkedTo(0)
~ THEN BEGIN 0 
  SAY @0 
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 GOTO 2
  IF ~~ THEN REPLY @3 GOTO 3
END

IF ~~ THEN BEGIN 1 
  SAY @4 
  IF ~~ THEN REPLY @5 GOTO 2
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 2
  SAY @7 
  IF ~~ THEN DO ~StartStore("cmninast",LastTalkedToBy())
~ EXIT
END

IF ~~ THEN BEGIN 3 
  SAY @8 
  IF ~~ THEN EXIT
  
END

IF ~True()
~ THEN BEGIN 4 
  SAY @9 
  IF ~~ THEN REPLY @10 GOTO 1
  IF ~~ THEN REPLY @11 GOTO 2
  IF ~~ THEN REPLY @12 GOTO 3
END
