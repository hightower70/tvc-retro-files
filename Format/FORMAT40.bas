﻿   1 REM \xc1@ABCD\xc3ű+\xc3~+\xc3\x8b+\xc3\xf8+\xc3",\xc36,\xc3`,ÁÚÖ\x0eá\xdbZW\xe6Ó\xfeÍ(\x0ay\xc6áOz\x0f\x0fWá\xf0y!\xfe*ÚŐw#<á\xfb\xf5\xc5\xd5:Í+O:\xfd*\xf6\xc1\xedy2\xfd*úÁÚÁ:\xfe*O\xedx\xcbO \x0cá\xf8ő \xef!ÉÁ\xd1\xc1\xf1\xc9úÁÚÁ\xedx\xcbO(Üá\xf8ő \xf3ű\xe8\xd1\xc1\xf1!ÁÁ\xc9{w\x0bx\xb1(Ő\xe5\xd1ó\xed\xb0\xc9\xf3!hBúüÚÁ:É+O\xd9:\xfe*O>\xf4\xedy\xd9\xd9\xedx\xcbO\xca\xa2+\xd9\xed\xa3\xc2\xa1+ő\xc2\xa1+\xfb\xc9ÁÁ\xfb\xc9\xfb\xc9.......................................................
   2 REM \xf3!hBúÍÚÁ:É+O\xd9:\xfe*O>\x84\xedy\xd9\xd9\xedx\xcbO\xca\x0f,\xd9\xed\xa2\xc2\x0e,ő\xc2\x0e,\xfb\xc9!hBÉÁÍ~\xfe\xe5\xc0#\x0bx\xb1 \xf6!ÁÁ\xc9\xf3!PFúÍÚÁ:É+O\xd9:\xfe*O>\xa4\xedy\xd9\xd9\xedx\xcbO\xcaM,\xd9\xed\xa3\xc2L,ő\xc2L,\xfb\xc9\xf3!hBúÍÚÁ:É+O\xd9:\xfe*O>\xa5\xedy\xd9\xd9\xedx\xcbO\xcaw,\xd9\xed\xa3\xc2v,ő\xc2v,\xfb\xc9\xfb\xc9.................................................................................................
   3 LOMEM 11000
  90 MTR=41
 100 REM ** floppy formatter ***
 110 GRAPHICS2:SET BORDER 3;PALETTE 3,85:CLS
 115 BAZ=11005:A=INT((BAZ+9)/256):POKE 35,BAZ+9-A*256:POKE 36,A
 120 PRINT AT 1,12,">> V-DOS DISK FORMATTER PROGRAM   by VAC <<":PRINT AT 5,20,"INSERT diskette to drive":PRINT AT 6,23,"and PRESS any key!"
 130 A$=INKEY$:GET A$
 135 X=USR(BAZ+6):P=PEEK(BAZ+1):IF X=1 THEN PRINT AT 23,1,"ERROR:Drive not ready.       [ A-abort,R-retry ]":GOSUB 800:GOTO 135
 140 PRINT AT 10,2,"00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20":SET INK 0;PAPER 1:PRINT AT 11,2,STRING$(62,32):SET INK 1;PAPER 0
 150 PRINT AT 13,2,"21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41":SET INK 0;PAPER 1:PRINT AT 14,2,STRING$(62,32)
 160 PRINT AT 17,27,"F";:SET INK1;PAPER 0:PRINT AT 17,28,"ormatting."
 165 GOSUB 820:OUT P,3:GOSUB 820
 170 GOSUB 820:OUT P+3,10:OUT P,19:GOSUB 820:OUT P,3:GOSUB 820
 180 DATA 80,78,12,0,3,246,1,252,50,78,12,0,0,0
 190 DATA 3,245,1,254,3,0,1,2,1,247,22,78,12,0,3,245,1,251,512,229,1,247,54,78,12,0,0,0
 200 RESTORE 180:A=17000
 210 READ S,K:IF S<>0 THEN EXT1,A,K,S:A=A+S:GOTO 210
 220 GG=1:FOR G=1 TO 9:RESTORE 190:M=A
 230 READ S,K:IF S<>0 THEN EXT1,A,K,S:A=A+S:GOTO 230
 240 POKE M+6,GG
 245 GG=GG-2:IF GG<1 THEN GG=9+GG
 250 NEXT G
 270 SET PAPER 1;INK 0:FOR TRK=0 TO MTR:GOSUB 820:OUT P+3,TRK:OUT P,19:GOSUB 820:A=INT(TRK/21):TESY=11+3*A:TESX=(TRK-A*21)*3+2
 275 PRINT AT TESY,TESX,"F";
 280 A=17162:FOR F=1 TO 9:POKE A,TRK:A=A+626:NEXT
 290 X=USR(BAZ+12)
 300 !write
 310 PRINT AT TESY,TESX,".";:NEXT TRK
 320 GOSUB 820:OUT P,3:GOSUB 820:EXT1,18000,0,512
 330 PRINT AT 17,27,"V":SET INK 1;PAPER 0:PRINT AT 17,28,"erifying.  "
 340 !verify
 395 SET INK 1;PAPER 0:BB=0:FB=0
 400 PRINT AT 19,24,"Free:       Bytes":PRINT AT 20,24,"Bad :   -   Bytes"
 410 SET PAPER 1;INK 0:FOR TRK=0 TO MTR:GOSUB 820:A=INT(TRK/21):TESY=11+3*A:TESX=(TRK-A*21)*3+3
 415 OUT P+3,TRK:OUT P,19:GOSUB 820
 420 PRINT AT TESY,TESX,"V";:SET INK 1;PAPER 0
 425 FOR SEC=1 TO 9
 430 OUT 66,SEC:X=USR(BAZ+15):X=USR(BAZ+18)
 440 IF X=0 THEN 500
 450 BB=BB+512:PRINT AT 20,29,"";:PRINT USING"######":BB
 460 OUT 66,SEC:X=USR(BAZ+24)
 490 GOTO 510
 500 FB=FB+512:PRINT AT 19,29,"";:PRINT USING"######":FB 
 510 NEXT SEC:SET INK 0;PAPER 1:PRINT AT TESY,TESX,".";:NEXT TRK
 520 OUT P,3:GOSUB 820
 680 OUT 68,0:SET INK 1;PAPER 0:PRINT AT 24,21,"End of program  (y/n)?";
 690 GET A$:IF A$="n" OR A$="N" THEN RUN
 700 CLS:END
 800 OUT P+4,0:GET A$:IF A$="a" OR A$="A" THEN CLS:END
 810 IF A$="r" OR A$="R" THEN PRINT AT 23,1,STRING$(63,32);:RETURN
 815 GOTO 800
 820 IF (IN(P) AND 1)=0 THEN RETURN:ELSE GOTO 820
 900 EXT 0
 901 .START 11005
 905 MOTELL .BYT 0
 910 COMRE  .BYT 0
 915 TRKRE  .BYT 0
 920 SECRE  .BYT 0
 925 DATRE  .BYT 0
 930 MOTRE  .BYT 0
1005 ; *************
1010 ; * FOPROGRAM *
1015 ; *************
1020 JP RESET:JP TOLT:JP TRKWRI:JP SECREA:JP ELL:JP SECWRT:JP BSEC
1025 RESET NOP
1095 ;
1100 LD B,4:LD C,16                 :;HOL A KARTYA
1105 IN A,($5A):LD D,A
1110 RECIK1 AND 3:CP 2:JR Z,MEGVAN
1120 LD A,C:ADD A,16:LD C,A
1125 LD A,D:RRCA:RRCA
1130 LD D,A:DJNZ RECIK1
1135 MEGVAN LD A,C:LD HL,COMRE
1140 LD B,5
1145 RECIK2 LD (HL),A
1150 INC HL:INC A:DJNZ RECIK2
1155 ;
1300 MOTON PUSH AF:PUSH BC:PUSH DE  :;MOTOR BE RUTIN
1305 LD A,(MOTRE):LD C,A
1310 LD A,(MOTELL):OR %11000001
1315 OUT (C),A:LD (MOTELL),A:LD D,0
1320 VE LD B,0:LD A,(COMRE):LD C,A  :;VARJUNK EGY LEFUTOELRE
1325 VEGY IN A,(C):BIT 1,A
1330 JR NZ,EG:DJNZ VEGY:DEC D
1332 JR NZ,VE
1335 HI LD HL,1:POP DE:POP BC:POP AF:RET
1340 EG  LD D,0
1345 EGY LD B,0
1350 VNUL IN A,(C):BIT 1,A
1355 JR Z,NUL:DJNZ VNUL:DEC D
1357 JR NZ,EGY
1360 JR HI
1365 NUL POP DE:POP BC:POP AF
1370 LD HL,0:RET
1375 ;
1380 TOLT LD A,E:LD (HL),A:DEC BC 
1385 LD A,B:OR C:JR Z,VI:PUSH HL
1390 POP DE:INC DE:LDIR:VI RET
1395 ;
1400 TRKWRI DI:LD HL,17000
1405 LD D,23:LD B,0:LD A,(DATRE)
1410 LD C,A:EXX:LD A,(COMRE)
1415 LD C,A:LD A,244:OUT (C),A
1420 EXX
1425 VAR EXX
1430 VAR1 IN A,(C):BIT 1,A:JP Z,VAR1
1445 EXX:OUTI:JP NC,VAR
1450 DEC D:JP NC,VAR:EI:RET
1455 ;
1460 .START 11256
1465 SECREA DI:LD HL,17000
1470 LD D,2:LD B,0:LD A,(DATRE)
1475 LD C,A:EXX:LD A,(COMRE)
1480 LD C,A:LD A,%10000100:OUT (C),A
1485 EXX
1490 VAA EXX
1495 VAA1 IN A,(C):BIT 1,A:JP Z,VAA1
1500 EXX:INI:JP NC,VAA
1505 DEC D:JP NC,VAA:EI:RET
1510 ;
1515 ELL LD HL,17000:LD BC,512
1520 ELC LD A,(HL):CP 229:RET NC
1525 INC HL:DEC BC:LD A,B:OR C:JR NZ,ELC
1530 LD HL,0:RET
1540 ;
1545 SECWRT DI:LD HL,18000
1550 LD D,2:LD B,0:LD A,(DATRE)
1555 LD C,A:EXX:LD A,(COMRE)
1560 LD C,A:LD A,%10100100:OUT (C),A
1565 EXX
1570 VAB EXX
1575 VAB1 IN A,(C):BIT 1,A:JP Z,VAB1
1580 EXX:OUTI:JP NC,VAB
1585 DEC D:JP NC,VAB:EI:RET
1590 ;
1595 BSEC DI:LD HL,17000
1600 LD D,2:LD B,0:LD A,(DATRE)
1605 LD C,A:EXX:LD A,(COMRE)
1610 LD C,A:LD A,%10100101:OUT (C),A
1615 EXX
1620 VAC EXX
1625 VAC1 IN A,(C):BIT 1,A:JP Z,VAC1
1630 EXX:OUTI:JP NC,VAC
1635 DEC D:JP NC,VAC:EI:RET
1640 ;
2500 .END
2510 END
9900 ;
9905 ; HIBAÜZENETEK
9910 ;
9915 HCS .BYT 10,13,"*** "
9950 HIB .BYT 0,"Drive not ready",0,"Illegal track",0,"Lost data",0
9980 .END
9981 END
9995 FOR A=0 TO 6000:A$="   "&STR$(PEEK(17000+A)):PRINT A$(LEN(A$)-3:);:NEXT:STOP
9997 FOR A=0 TO 255:POKE 17000+A,64+A-INT(A/64)*64:NEXT:STOP
9998 FOR A=0 TO 512:D=PEEK(17000+A):PRINT CHR$(D);:NEXT:END 
9999 FOR A=0 TO 255:POKE 18000+A,58:NEXT
