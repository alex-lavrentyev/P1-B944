@echo off
cls
echo **********************************************
echo * (c) 1991 MicroSystem   Net-MS Installation *
echo **********************************************
rem ����� ��� �� ���� ��ࠬ���?
if not -%1 == - goto M1
rem ���.
echo ��� ��ࠬ���.
goto ERREND
rem -----------------------------------------------------------
:M1
rem ��: ���⠫��� ��� ��� �믮������ �� ����ਡ�⨢�� ���?
if not exist %1\NET-MS.ZIP goto M2
if not exist %1\INSTALL.BAT goto M2
rem ��.
echo ����� ���⠫�஢��� ��� ��� �� ����ਡ�⨢�� ���.
goto ERREND
rem -----------------------------------------------------------
:M2
rem ���: ����஢���� �� १������騩 ��� ��������?
copy INSTALL.BAT %1\ >nul
if exist %1\INSTALL.BAT goto M3
rem ���.
echo �� �믮������ ����஢���� �� ��� %1.
goto ERREND
:M3
rem �������� � १������饣� ��᪠ 䠩�� INSTALL.BAT.
del %1\INSTALL.BAT >nul
rem -----------------------------------------------------------
rem ���⠫��� ��� ��� "�����"?
if not -%2 == - goto M4
rem ��.
echo ���⠫��� ��� ��� ��� ��� "�����" �� ��� %1.
goto M5
:M4
rem ���.
echo ���⠫��� ��� ��� ��� ��� "�����-2" �� ��� %1.
:M5
cd %1\
PKUNZIP -D -O NET-MS %1\ >nul
rem ���⠫��� �믮������� ��ଠ�쭮?
if not errorlevel 1 goto M6
rem ���.
echo �訡�� ����஢���� �� ��� %1.
goto ERREND
rem -----------------------------------------------------------
:M6
rem ��: ���⠫��� ��� ��� "�����"?
if not -%2 == - goto M8
rem ��: 䠩� MCM.EXE ���⠫�஢��?
if exist %1\NET-MS\MCM.EXE goto M7
rem ���.
echo � ��娢� NET-MS.ZIP ��������� 䠩� MCM.EXE.
goto ERREND
:M7
rem ��: 䠩� MCM2.EXE ���⠫�஢��?
if not exist %1\NET-MS\MCM2.EXE goto M11
rem ��: 㤠����� 䠩�� MCM2.EXE.
del %1\NET-MS\MCM2.EXE >nul
rem �������� 䠩�� MCM2.EXE �믮������� ��ଠ�쭮?
if not errorlevel 1 goto M11
rem ���.
echo �� 㤠����� � ��᪠ %1 䠩� MCM2.EXE.
goto ERREND
rem -----------------------------------------------------------
:M8
rem ��: 䠩� MCM2.EXE ���⠫�஢��?
if exist %1\NET-MS\MCM2.EXE goto M9
rem ���.
echo � ��娢� NET-MS.ZIP ��������� 䠩� MCM2.EXE.
goto ERREND
:M9
rem ��: 䠩� MCM.EXE ���⠫�஢��?
if not exist %1\NET-MS\MCM.EXE goto M10
rem ��: 㤠����� 䠩�� MCM.EXE.
del %1\NET-MS\MCM.EXE >nul
rem �������� 䠩�� MCM.EXE �믮������� ��ଠ�쭮?
if not errorlevel 1 goto M10
rem ���.
echo �� 㤠����� � ��᪠ %1 䠩� MCM.EXE.
goto ERREND
rem -----------------------------------------------------------
:M10
rem ��: ��२��������� 䠩�� MCM2.EXE � MCM.EXE.
ren %1\NET-MS\MCM2.EXE MCM.EXE >nul
rem ��२��������� �믮������� ��ଠ�쭮?
if not errorlevel 1 goto M11
rem ���.
echo �� ��२�����뢠���� �� ��᪥ %1 䠩� MCM2.EXE � MCM.EXE.
goto ERREND
rem -----------------------------------------------------------
:M11
rem ��: 䠩� MSU_CDI.EXE ���⠫�஢��?
if exist %1\UTIL-MS\MSU_CDI.EXE goto END
rem ���.
echo � ��娢� NET-MS.ZIP ��������� 䠩� MSU_CDI.EXE.
rem -----------------------------------------------------------
:ERREND
rem ����ଠ�쭮� �����襭�� ���⠫�樨 ��� ���.
echo ���⠫��� ��� ��� �� �믮�����.
goto ENDBAT
rem -----------------------------------------------------------
:END
rem ��ଠ�쭮� �����襭�� ���⠫�樨 ��� ���.
echo ���⠫��� ��� ��� �믮�����.
rem -----------------------------------------------------------
:ENDBAT
rem ����� ���������� 䠩�� ���⠫�樨 ��� ���.
