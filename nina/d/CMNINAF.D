BEGIN ~CMNINAF~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Greeting
 SAY @0
IF ~Alignment([PC], MASK_EVIL)~ THEN REPLY @1 GOTO GetLost
IF ~!Alignment([PC], MASK_EVIL)~ THEN REPLY @1 GOTO OfferJoin
END

IF ~~ THEN BEGIN GetLost
  SAY @2 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OfferJoin
 SAY @3
IF ~~ THEN REPLY @4 GOTO Explain
END

IF ~~ THEN BEGIN Explain
 SAY @5
IF ~~ THEN REPLY @6 GOTO NinaJoin
IF ~~ THEN REPLY @7 GOTO NinaRejected
END

IF ~~ THEN BEGIN NinaJoin
  SAY @8 
IF ~~ THEN REPLY @9 DO ~SetGlobal("NinaJoin", "GLOBAL", 1) AddexperienceParty(9500)
JoinParty()
~ EXIT
END

IF ~~ THEN BEGIN NinaRejected
  SAY @10 IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN Return
  SAY @11
IF ~~ THEN REPLY @6 GOTO NinaJoin
IF ~~ THEN REPLY @7 GOTO NinaRejected
END

BEGIN ~BCMNINAF~

IF WEIGHT #0 
~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("NinaChats1","LOCALS",0)
TimeGT(5)
TimeLT(9)
~ THEN BEGIN NinaSunset
  SAY @12
IF ~~ THEN REPLY @13 DO ~SetGlobal("NinaChats1","LOCALS",1)~ GOTO NS1
IF ~~ THEN REPLY @14 DO ~SetGlobal("NinaChats1","LOCALS",1)~  GOTO NS2
END

IF ~~ THEN BEGIN NS1
  SAY @15
IF ~~ THEN REPLY @16 GOTO NS3
END

IF ~~ THEN BEGIN NS2
  SAY @17 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN NS3
  SAY @18 IF ~~ THEN EXIT
END

IF WEIGHT #1 
~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("NinaChats2","LOCALS",0)
AreaType(CITY)
~ THEN BEGIN NinaCity
  SAY @19
IF ~~ THEN REPLY @20 DO ~SetGlobal("NinaChats2","LOCALS",1)~ GOTO NC1
IF ~~ THEN REPLY @21 DO ~SetGlobal("NinaChats2","LOCALS",1)~  GOTO NC2
END

IF ~~ THEN BEGIN NC1
  SAY @22
IF ~~ THEN REPLY @23 GOTO NC3
END

IF ~~ THEN BEGIN NC2
  SAY @24 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN NC3
  SAY @25
IF ~~ THEN REPLY @26 GOTO NC4
END

IF ~~ THEN BEGIN NC4
  SAY @27 IF ~~ THEN EXIT
END

IF ~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
AreaCheck("AR2100")
Global("NinaBackground","LOCALS",1)~ THEN BEGIN NinaJonBackground
  SAY @28
IF ~~ THEN REPLY @29 DO ~SetGlobal("NinaBackground","LOCALS",2)~ GOTO HalfTruth END

IF ~~ THEN BEGIN HalfTruth
  SAY @30
IF ~Race(Player1,ELF)~ THEN REPLY @31 GOTO FellowElf 
IF ~!Race(Player1,ELF)~ THEN REPLY @31 GOTO NotElf 
END

IF ~~ THEN BEGIN FellowElf
  SAY @32
IF ~~ THEN REPLY @33 GOTO EndHalfTruth
END

IF ~~ THEN BEGIN NotElf
  SAY @34
IF ~~ THEN REPLY @33 GOTO EndHalfTruth
END

IF ~~ THEN BEGIN EndHalfTruth
  SAY @35 IF ~~ THEN EXIT
END

IF  
~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("NinaDrowChat","LOCALS", 0)
Global("PlayerLooksLikeDrow","GLOBAL",1)~ THEN BEGIN NinaHatesDrow
  SAY @36
IF ~~ THEN REPLY @37 DO ~SetGlobal("NinaDrowChat","LOCALS",1)~ GOTO AgreedC
IF ~~ THEN REPLY @38 DO ~SetGlobal("NinaDrowChat","LOCALS",1)~ GOTO F_U
END

IF ~~ THEN BEGIN AgreedC
  SAY @39 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN F_U
  SAY @40 IF ~~ THEN EXIT
END

CHAIN
IF ~InParty("Korgan")
InParty("cmninaf")
See("Korgan")
See("cmninaf")
!StateCheck("Korgan",STATE_SLEEPING)
!StateCheck("cmninaf",STATE_SLEEPING)
Global("NinaKorganTalk1","LOCALS",0)~ THEN BCMNINAF VileDwarf
@41
DO ~SetGlobal("NinaKorganTalk1","LOCALS",1)~
==BKORGAN
@42
==BCMNINAF
@43
==BKORGAN
@44
==BCMNINAF
@45
==BKORGAN
@46
==BCMNINAF
@47
EXIT

CHAIN
IF ~InParty("Mazzy")
InParty("cmninaf")
See("Mazzy")
See("cmninaf")
AreaCheck("AR2000")
!StateCheck("Mazzy",STATE_SLEEPING)
!StateCheck("cmninaf",STATE_SLEEPING)
Global("NinaMazzyTalk1","LOCALS",0)~ THEN BMAZZY Gods
@48 DO ~SetGlobal("NinaMazzyTalk1","LOCALS",1)~
==BCMNINAF
@49
==BMAZZY
@50
==BCMNINAF
@51
==BMAZZY
@52
==BCMNINAF
@53
==BMAZZY
@54 
==BCMNINAF
@55
EXIT

CHAIN
IF ~
InParty("Anomen")
InParty("cmninaf")
Global("AnomenIsKnight","GLOBAL",1)
See("Anomen")
See("cmninaf")
!StateCheck("Anomen",STATE_SLEEPING)
!StateCheck("cmninaf",STATE_SLEEPING)
Global("NinaAnomenTalk1","LOCALS",0)~ THEN BCMNINAF AnomenKnight
@56
DO ~SetGlobal("NinaAnomenTalk1","LOCALS",1)~
==BANOMEN
@57
==BCMNINAF
@58
==BANOMEN
@59
==BCMNINAF
@60
EXIT

CHAIN
IF ~InParty("Jaheira")
InParty("cmninaf")
AreaType("Outdoor")
See("Jaheira")
See("cmninaf")
!StateCheck("Jaheira",STATE_SLEEPING)
!StateCheck("cmninaf",STATE_SLEEPING)
Global("NinaJaheiraTalk1","LOCALS",0)~ THEN BJAHEIR TreeHugging
@61 DO ~SetGlobal("NinaJaheiraTalk1","LOCALS",1)~
==BCMNINAF
@62
==BJAHEIR
@63
==BCMNINAF @64
==BJAHEIR @65
EXIT

CHAIN IF
~InParty("cmninaf")
See("cmninaf")
!StateCheck("cmninaf",STATE_SLEEPING)
Global("NinaKeldornTalk1","LOCALS",0)~ THEN BKELDOR Fighters
@66 DO ~SetGlobal("NinaKeldornTalk1","LOCALS",1)~
== BCMNINAF @67 
== BKELDOR @68
== BCMNINAF @69
== BKELDOR @70
== BCMNINAF @71
== BKELDOR @72
== BCMNINAF @73
== BKELDOR @74
EXIT


CHAIN IF ~InParty("Minsc")
See("Minsc")
CombatCounter(0)
HPPercentLT("Minsc",20)
!HP("Minsc",1)
!StateCheck("Minsc",STATE_SLEEPING)
Global("NinaMinsc1","LOCALS",0)~ THEN BCMNINAF MinscWounded
@75 DO ~SetGlobal("NinaMinsc1", "LOCALS", 1)~
== BMINSC @76
== BCMNINAF @77
== BMINSC @78
== BCMNINAF @79
== BMINSC @80
== BCMNINAF @81 // IF ~~ THEN DO ~MoveToObject("Minsc")~ //
EXIT

CHAIN IF ~InParty("Imoen2")
See("Imoen2")
!StateCheck("Imoen2",STATE_SLEEPING)
Global("NinaImoenTalk1","LOCALS",0)~ THEN BCMNINAF ImoenChat
@82 DO ~SetGlobal("NinaImoenTalk1","LOCALS",1)~
== IMOEN2J @83 
== BCMNINAF @84
== IMOEN2J @85
== BCMNINAF @86
== IMOEN2J @87
== BCMNINAF @88
== IMOEN2J @89
== BCMNINAF @90
== IMOEN2J @91
== BCMNINAF @92
== IMOEN2J @93
== BCMNINAF @94
== IMOEN2J @95
EXIT



/* IF  
~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("NinaHomeChat","LOCALS", 0)
~ THEN BEGIN NinaHome
  SAY ~Hey <CHARNAME> I was wondering if I could ask you a personal question about Gorion.~
IF ~~ THEN REPLY ~Sure Nina what is it?~ DO ~SetGlobal("NinaHomeChat","LOCALS",1)~ GOTO NinaRoots
END

IF ~~ THEN BEGIN NinaRoots
  SAY ~Was Gorion a good father even though he was your adopted father? Do you ever wonder about your mother and her family?~
IF ~~ THEN REPLY ~He as a very good father to me and very protective plus he was stern at times. He wanted me to be very good at my studies and not goof around. I never knew anything about my mother or her family, Gorion says nothing about her. Why do you ask?~ GOTO NR1
END

IF ~~ THEN BEGIN NR1
  SAY ~I was "adopted" myself and do not really remember or know much about my family. We lived in a village that was attacked by drow raiders. My parents were killed along with a majority of the townsfolk. I do not recall much about that dreadful day since I was very young at the time.~
=
~I had an older sister but I know nothing about her or what happened to her. Her body was never found in the carnage. She may have been taken captive or her body burned to ash since a lot of the dwellings were reduced to smoldering cinders.~
IF ~~ THEN REPLY ~That sounds dreadful Nina, I am so sorry for your loss.~ GOTO NR2
END

IF ~~ THEN BEGIN NR2
  SAY ~(tear running down her cheek) I am sorry <CHARNAME> I don't know why I even brought this up. I don't want to talk about it any more.~ IF ~~ THEN EXIT
END */


BEGIN ~CMNINAFJ~

IF ~Global("FoundThievesC", "GLOBAL",1)
Global("MystraQuest", "GLOBAL", 0) 
PartyHasItem("CMBOOK99")~ THEN BEGIN HappyNina
SAY @96
=
@97 IF ~~ THEN EXIT
END

IF ~ReputationLT(Player1,2)
Global("NinaTooEvil","LOCALS",0)
~ THEN BEGIN TooEvil
  SAY @98
IF ~~ THEN DO ~LeaveParty() 
EscapeAreaMove("AR0406",470,1490,0)~ EXIT
END


I_C_T EDWIN 3 NinaEdwin
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @99
END

I_C_T BODHI 4 NinaBodhi
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @100
END

I_C_T BODHI 20 NinaBodhi2
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @101
END

I_C_T PPIRENI2 0 NinaJon
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @102
END

I_C_T PPIRENI2 35 NinaJon2
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @103 DO ~SetGlobal("NinaBackground","GLOBAL",1)~
END

I_C_T UDSILVER 26 NinaSilver
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @104
END

I_C_T HELLJON 7 NinaFYouIrenicus
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @105 
END

I_C_T HELLJON 8 NinaFYouIrenicus
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @105 
END

I_C_T HELLJON 9 NinaFYouIrenicus
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @105 
END

I_C_T HELLJON 10 NinaFYouIrenicus
== CMNINAFJ IF ~IsValidForPartyDialog("cmninaf")~ THEN @105 
END


EXTEND_BOTTOM PLAYER1 33 
IF ~IsValidForPartyDialog("cmninaf")
Global("NinaTOLTalk","GLOBAL",0)~ THEN DO ~SetGlobal("NinaTOLTalk","GLOBAL",1)~ GOTO TreeOfLifeChat
END

APPEND PLAYER1
IF ~~ THEN BEGIN TreeOfLifeChat
SAY @106
IF ~~ THEN REPLY @107 EXTERN CMNINAFJ LetsGo
IF ~~ THEN REPLY @108 EXTERN CMNINAFJ NotGoing
IF ~~ THEN REPLY @109 EXTERN CMNINAFJ NoChance
END
END

APPEND CMNINAFJ
IF ~~ THEN BEGIN LetsGo
SAY @110
IF ~~ GOTO NinaThanks
END

IF ~~ THEN BEGIN NinaThanks
SAY @111
COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN NotGoing
SAY @112
COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN NoChance
SAY @113
IF ~~ GOTO NinaThanks
END
END

BEGIN ~CMNINAP~

IF ~~ THEN BEGIN rejoin 
  SAY @114 
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF WEIGHT #1 
~Global("KickedOut","LOCALS",1)
~ THEN BEGIN greet 
  SAY @115
  IF ~~ THEN GOTO g2
END

IF ~~ THEN BEGIN g2
  SAY @116 
  IF ~~ THEN REPLY @117 GOTO reject
  IF ~~ THEN REPLY @118 GOTO join
END

IF ~~ THEN BEGIN reject 
  SAY @119 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN join 
  SAY @120 
  IF ~~ THEN DO ~SetGlobal("KickedOut","LOCALS",0)
JoinParty()
~ EXIT
END

IF WEIGHT #2 
~HappinessLT(Myself,-290)
~ THEN BEGIN mad 
  SAY @121
  IF ~~ THEN DO ~SetGlobal("KickedOut","LOCALS",1)
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN leave 
  SAY @122
  IF ~!AreaCheck("AR0601")
!AreaCheck("AR0602")
!AreaCheck("AR0603")
!AreaCheck("AR0410")
!AreaCheck("AR0411")
!AreaCheck("AR0412")
!AreaCheck("AR0413")
!AreaCheck("AR0414")
!AreaCheck("AR1512")
!AreaCheck("AR1513")
!AreaCheck("AR1514")
!AreaCheck("AR1515")
!AreaCheck("AR1516")
!AreaCheck("AR1501")
!AreaCheck("AR1502")
!AreaCheck("AR1503")
!AreaCheck("AR1504")
!AreaCheck("AR1505")
!AreaCheck("AR1506")
!AreaCheck("AR1507")
!AreaCheck("AR1508")
!AreaCheck("AR1509")
!AreaCheck("AR1510")
!AreaCheck("AR1511")
!AreaCheck("AR2100")
!AreaCheck("AR2101")
!AreaCheck("AR2102")
!AreaCheck("AR2200")
!AreaCheck("AR2202")
!AreaCheck("AR2203")
!AreaCheck("AR2204")
!AreaCheck("AR2205")
!AreaCheck("AR2206")
!AreaCheck("AR2207")
!AreaCheck("AR2208")
!AreaCheck("AR2209")
!AreaCheck("AR2210")
!AreaCheck("AR2300")
!AreaCheck("AR2400")
!AreaCheck("AR2401")
!AreaCheck("AR2402")
!AreaCheck("AR2900")
!AreaCheck("AR2901")
!AreaCheck("AR2902")
!AreaCheck("AR2903")
!AreaCheck("AR2904")
!AreaCheck("AR2905")
!AreaCheck("AR2906")
~ THEN REPLY @123 DO ~SetGlobal("KickedOut","LOCALS",1)
EscapeAreaMove("AR0406",470,1490,0)
~ EXIT
  IF ~!AreaCheck("AR0301")
!AreaCheck("AR0302")
!AreaCheck("AR0303")
!AreaCheck("AR0304")
!AreaCheck("AR0305")
!AreaCheck("AR0306")
!AreaCheck("AR0307")
!AreaCheck("AR0509")
!AreaCheck("AR0510")
!AreaCheck("AR0511")
!AreaCheck("AR1102")
!AreaCheck("AR1107")
!AreaCheck("AR0801")
!AreaCheck("AR0803")
!AreaCheck("AR1300")
!AreaCheck("AR1301")
!AreaCheck("AR1302")
!AreaCheck("AR1303")
!AreaCheck("AR0601")
!AreaCheck("AR0602")
!AreaCheck("AR0603")
!AreaCheck("AR0604")
!AreaCheck("AR0605")
!AreaCheck("AR0606")
!InWatchersKeep()
~ THEN REPLY @124 DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
  IF ~OR(3)
AreaCheck("AR0601")
AreaCheck("AR0602")
AreaCheck("AR0603")~ THEN REPLY @125 DO ~SetGlobal("KickedOut","LOCALS",1)
EscapeAreaMove("AR0406",470,1490,0)
~ EXIT
END

IF WEIGHT #3 
~True()
~ THEN BEGIN 8 
  SAY @126
  IF ~~ THEN REPLY @127 GOTO rejoin
  IF ~~ THEN REPLY @128 GOTO leave
END

