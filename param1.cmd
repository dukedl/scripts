@echo off


fsutil dirty query %systemdrive% >>nul

wmic baseboard get Manufacturer,Product
wmic computersystem get Caption,Manufacturer,Model

Set /P _model=Please enter Model: 
Set /P _manufacturer=Please enter Manufacturer: 

IF %ERRORLEVEL% EQU 0 (

cd /d %~dp0

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /f /v Model        /t REG_SZ /d "%_model%"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /f /v Manufacturer /t REG_SZ /d "%_manufacturer%"
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /f /v Logo         /t REG_SZ /d "c:\windows\oem.bmp"

move oem1.bmp %windir%\oem.bmp
if %errorLevel% == 0 (
    del oem1.bmp
) else (
    echo Not copied.
    pause
)

) ELSE (
    echo Failure: Current permissions inadequate.
   pause
)

pause