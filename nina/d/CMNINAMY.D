BEGIN ~CMNINAMY~

IF ~NumTimesTalkedTo(0)
Global("MystraQuest","GLOBAL",0)~ THEN BEGIN HiThere
  SAY @0
IF ~~ THEN REPLY @1 GOTO PcInterested
IF ~~ THEN REPLY @2 GOTO PcTurnedDown
END

IF ~~ THEN BEGIN PcInterested
  SAY @3 
IF ~~ THEN REPLY @4 GOTO Details
END

IF ~~ THEN BEGIN PcTurnedDown
  SAY @5 IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ 
EXIT
END

IF ~~ THEN BEGIN Details
  SAY @6
IF ~~ THEN REPLY @7 DO ~SetGlobal("AcceptQuestNina","GLOBAL",1)~ EXIT
END

IF ~NumTimesTalkedToGT(0)
!PartyHasItem("CMBOOK99")
Global("MystraQuest","GLOBAL",0)
~ THEN BEGIN NoBook
  SAY @8
IF ~~ THEN REPLY @9 GOTO HurryUp
END

IF ~~ THEN BEGIN HurryUp
  SAY @10 IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)
PartyHasItem("CMBOOK99")
Global("MystraQuest","GLOBAL",0)
~ THEN BEGIN HaveBook
  SAY @11 IF ~~ THEN DO ~TakePartyItem("CMBOOK99")
GivePartyGold(1000) SetGlobal("MystraQuest", "GLOBAL", 1) AddexperienceParty(12500)~ EXIT
END

IF ~NumTimesTalkedToGT(0)
Global("MystraQuest","GLOBAL",1)
~ THEN BEGIN Shopping
  SAY @12
IF ~~ THEN REPLY @13 GOTO StartStore
IF ~~ THEN REPLY @14 GOTO ComeBack
END

IF ~~ THEN BEGIN StartStore
  SAY @15 
  IF ~~ THEN DO ~StartStore("cmninamy",LastTalkedToBy())
~ EXIT
END

IF ~~ THEN BEGIN ComeBack
  SAY @16 IF ~~ THEN EXIT
END
