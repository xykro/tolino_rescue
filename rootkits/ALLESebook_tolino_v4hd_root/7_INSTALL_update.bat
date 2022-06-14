@echo off
CLS
TITLE ALLESebook Boot Image 
COLOR 17
chcp 1252>nul
set ue=ü
set ae=ä
set oe=ö
set Uue=Ü
set Aae=Ä
set Ooe=Ö
set ss=ß
chcp 850>nul
set /p answer=Wurden die ADB-Treiber korrekt installiert und ist das Tolino-Logo am eReader sichtbar (siehe Anleitung)? (J/N):
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
set /p answer=Willst du das Update jetzt auf eigene Gefahr installieren (siehe Anleitung)? (J/N):
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
@ECHO Bitte warten ...
cd 3_adb
@adb kill-server
@adb devices
@ECHO Schritt 1 wird ausgef%ue%hrt. Bitte warten ...
@adb push ../1_images/custom_boot.img /sdcard/
@ECHO Schritt 2 wird ausgef%ue%hrt. Bitte warten ...
@adb shell busybox dd if=/sdcard/custom_boot.img of=/dev/block/mmcblk0p1 bs=2M
@adb shell sleep 3
@adb shell sync
@ECHO Schritt 3 wird ausgef%ue%hrt. Bitte warten ...
@adb shell sleep 3
@adb shell sync
@ECHO Der Tolino eReader wird nun neu gestartet. Bitte warten ...
@adb shell reboot
@ECHO Sobald der Startvorgang beendet ist und man sich am Startbildschim befindet, schlie%ss%e dieses Fenster und folge der Anleitung zum n%ae%chsten Punkt.
PAUSE
