@echo off
CLS
TITLE ALLESebook Vendor ID
COLOR 17
chcp 1252>nul
set ue=�
set ae=�
set oe=�
set Uue=�
set Aae=�
set Ooe=�
set ss=�
chcp 850>nul
@ECHO Ger%ae%te-IDs werden eingetragen. Bitte warten ...
cd 3_adb
@adb kill-server
@adb start-server
@echo 0x1f85 >> "%USERPROFILE%\.android\adb_usb.ini
@echo 0x18d1 >> "%USERPROFILE%\.android\adb_usb.ini
@adb kill-server
@ECHO Fertig! Bitte schlie%ss%e dieses Fenster
PAUSE
