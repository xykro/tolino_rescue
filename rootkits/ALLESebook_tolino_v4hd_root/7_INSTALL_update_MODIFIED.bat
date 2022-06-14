@echo off
CLS
TITLE ALLESebook Boot Image 
COLOR 17
chcp 1252>nul
chcp 850>nul
set /p answer=Wurden die ADB-Treiber korrekt installiert und ist das Tolino-Logo am eReader sichtbar (siehe Anleitung)? (J/n):
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
set /p answer=Willst du das Update jetzt auf eigene Gefahr installieren (siehe Anleitung)? (J/n):
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
@REM set "img=custom_boot.img"
set "img=tolino-vision-4hd-cweiske-adb-root-boot-15.2.0.img"
@REM set "img=tolino-vision-4hd-cweiske-adb-root-boot-14.1.0.img"
@REM set "img=tolino-vision-4hd-cweiske-adb-root-boot-13.2.1.img"
@REM set "img=cweiske-debug-boot-12.2.0.img"
@ECHO Bitte warten ...
cd 3_adb
@adb kill-server
@adb devices
@ECHO Schritt 1 (push image) wird ausgefuehrt. Bitte warten ...
@adb push ../1_images/%img% /sdcard/
@adb shell ls /sdcard/
set /p answer="Wird das Image %img% angezeigt? (j/N):"
if "%answer%" == "" goto N
if %answer% == J goto G
if %answer% == j goto G
if %answer% == y goto G
if %answer% == Y goto G
if %answer% == N goto N
if %answer% == n goto N
:N
exit
:G
@ECHO Schritt 2 (copy image to boot partition) wird ausgefuehrt. Bitte warten ...
@adb shell busybox dd if=/sdcard/%img% of=/dev/block/mmcblk0p1 bs=2M
@adb shell sleep 3
@adb shell sync
@ECHO Schritt 3 wird ausgefuehrt. Bitte warten ...
@adb shell sleep 3
@adb shell sync
@ECHO Der Tolino eReader wird nun neu gestartet. Bitte warten ...
@adb shell reboot
@ECHO Sobald der Startvorgang beendet ist und man sich am Startbildschim befindet, schliesse dieses Fenster und folge der Anleitung zum naechsten Punkt.
cd ..
PAUSE
