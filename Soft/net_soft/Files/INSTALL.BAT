@echo off
cls
echo **********************************************
echo * (c) 1991 MicroSystem   Net-MS Installation *
echo **********************************************
rem Задан хотя бы один параметр?
if not -%1 == - goto M1
rem Нет.
echo Нет параметра.
goto ERREND
rem -----------------------------------------------------------
:M1
rem Да: инсталяция СПО УИК выполняется на дистрибутивный диск?
if not exist %1\NET-MS.ZIP goto M2
if not exist %1\INSTALL.BAT goto M2
rem Да.
echo Нельзя инсталировать СПО УИК на дистрибутивный диск.
goto ERREND
rem -----------------------------------------------------------
:M2
rem Нет: копирование на результирующий диск возможно?
copy INSTALL.BAT %1\ >nul
if exist %1\INSTALL.BAT goto M3
rem Нет.
echo Не выполняется копирование на диск %1.
goto ERREND
:M3
rem Удаление с результирующего диска файла INSTALL.BAT.
del %1\INSTALL.BAT >nul
rem -----------------------------------------------------------
rem Инсталяция для РМП "ПОИСК"?
if not -%2 == - goto M4
rem Да.
echo Инсталяция СПО УИК для РМП "ПОИСК" на диск %1.
goto M5
:M4
rem Нет.
echo Инсталяция СПО УИК для РМП "ПОИСК-2" на диск %1.
:M5
cd %1\
PKUNZIP -D -O NET-MS %1\ >nul
rem Инсталяция выполнилась нормально?
if not errorlevel 1 goto M6
rem Нет.
echo Ошибка копирования на диск %1.
goto ERREND
rem -----------------------------------------------------------
:M6
rem Да: инсталяция для РМП "ПОИСК"?
if not -%2 == - goto M8
rem Да: файл MCM.EXE инсталирован?
if exist %1\NET-MS\MCM.EXE goto M7
rem Нет.
echo В архиве NET-MS.ZIP отсутствует файл MCM.EXE.
goto ERREND
:M7
rem Да: файл MCM2.EXE инсталирован?
if not exist %1\NET-MS\MCM2.EXE goto M11
rem Да: удаление файла MCM2.EXE.
del %1\NET-MS\MCM2.EXE >nul
rem Удаление файла MCM2.EXE выполнилось нормально?
if not errorlevel 1 goto M11
rem Нет.
echo Не удаляется с диска %1 файл MCM2.EXE.
goto ERREND
rem -----------------------------------------------------------
:M8
rem Да: файл MCM2.EXE инсталирован?
if exist %1\NET-MS\MCM2.EXE goto M9
rem Нет.
echo В архиве NET-MS.ZIP отсутствует файл MCM2.EXE.
goto ERREND
:M9
rem Да: файл MCM.EXE инсталирован?
if not exist %1\NET-MS\MCM.EXE goto M10
rem Да: удаление файла MCM.EXE.
del %1\NET-MS\MCM.EXE >nul
rem Удаление файла MCM.EXE выполнилось нормально?
if not errorlevel 1 goto M10
rem Нет.
echo Не удаляется с диска %1 файл MCM.EXE.
goto ERREND
rem -----------------------------------------------------------
:M10
rem Да: переименование файла MCM2.EXE в MCM.EXE.
ren %1\NET-MS\MCM2.EXE MCM.EXE >nul
rem Переименование выполнилось нормально?
if not errorlevel 1 goto M11
rem Нет.
echo Не переименовывается на диске %1 файл MCM2.EXE в MCM.EXE.
goto ERREND
rem -----------------------------------------------------------
:M11
rem Да: файл MSU_CDI.EXE инсталирован?
if exist %1\UTIL-MS\MSU_CDI.EXE goto END
rem Нет.
echo В архиве NET-MS.ZIP отсутствует файл MSU_CDI.EXE.
rem -----------------------------------------------------------
:ERREND
rem Ненормальное завершение инсталяции СПО УИК.
echo Инсталяция СПО УИК не выполнена.
goto ENDBAT
rem -----------------------------------------------------------
:END
rem Нормальное завершение инсталяции СПО УИК.
echo Инсталяция СПО УИК выполнена.
rem -----------------------------------------------------------
:ENDBAT
rem Конец командного файла инсталяции СПО УИК.
