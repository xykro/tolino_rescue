@echo off
CLS
TITLE ALLESebook Recovery Image
COLOR 17
chcp 1252>nul
set ue=�
set ae=�
set oe=�
set Uue=�
set Aae=�
set Ooe=�
chcp 850>nul
set /p answer=Hast du die Anleitung gelesen und verstanden? (J/n):
if "%answer%" == "" goto G
if %answer% == J goto G
if %answer% == j goto G
if %answer% == y goto G
if %answer% == Y goto G
if %answer% == N goto N
if %answer% == n goto N
:N
exit
:G
cls
set /p answer=Willst du deinen Tolino Vision 4 HD rooten? (J/n):
if "%answer%" == "" goto G
if %answer% == J goto G
if %answer% == j goto G
if %answer% == y goto G
if %answer% == Y goto G
if %answer% == N goto N
if %answer% == n goto N
:N
exit
:G
cls
:: WITH all the cweiske versions we have adb root access (not on the tolino tho, is that supposed to be?). Not so with official version.
:: We DONT need the script Nr7, because the variant 'fastboot flash boot ...' does the flashing
set "img=tolino-vision-4hd-cweiske-adb-root-boot-15.2.0.img"
@REM set "img=tolino-vision-4hd-cweiske-adb-root-boot-14.1.0.img"
@REM set "img=tolino-vision-4hd-cweiske-adb-root-boot-13.2.1.img"
@REM set "img=cweiske-debug-boot-12.2.0.img"
@REM set "img=boot_v4hd_s2hd_12.2.0-14.2.0_to_15.2.0.img"

@REM set "img=custom_recovery.img"
@ECHO Den Tolino eReader nicht abstecken.
@ECHO Der Tolino eReader startet in einem kurzen Moment neu (nur Tolino Logo zu sehen).
cd 3_adb
@REM @fastboot boot ../1_images/%img%
@fastboot flash boot ../1_images/%img%
@fastboot reboot
@ECHO Schliesse dieses Fenster und folge der Anleitung.
pause