BEGIN ~CMSHAR1~

IF ~True()~ THEN BEGIN Shar1
  SAY @0
IF ~~ THEN REPLY @1 DO ~SetGlobal("FoundThievesC","LOCALS",1)~ GOTO BiteMe
IF ~~ THEN REPLY @2 GOTO GoAway
END

IF ~~ THEN BEGIN BiteMe
  SAY @3 IF ~~ THEN DO ~SetGlobal("CmSharFight","GLOBAL",1)
Enemy()
~ EXIT
END
 
IF ~~ THEN BEGIN GoAway
  SAY @4
IF ~~ THEN EXIT
END