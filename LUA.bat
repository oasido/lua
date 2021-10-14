@echo off
title LUA/UAC Poging Tot Reparatie [oasido]

rem Clear console
cls

:start
rem Save current working directory
pushd %~dp0

echo.

echo 		^<  ^<  ^< Limited User Access/User Account Control Edit ^>  ^>  ^>
echo.
echo [ ! ] Make sure you run this script LOCALLY!
echo.
echo Available options:
echo 	1. [ENABLE] UAC + LUA
echo 	2. [DISABLE] UAC + LUA
echo 	0. What does it do?
echo.

set choice=
set /p choice=Please choose: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto enable
if '%choice%'=='2' goto disable
if '%choice%'=='0' goto info
echo "%choice%" is not vaild, please try again
echo.
goto start

:enable
start regedit /S "%cd%\uac-aan.reg" > nul
goto end

:disable
start regedit /S "%cd%\uac-af.reg" > nul
goto end

:info
echo.
echo.
echo The script alters the following registery keys:
echo		[ConsentPromptBehaviorAdmin]
echo		[ConsentPromptBehaviorUser]
echo		[EnableLUA]
echo		[PromptOnSecureDesktop]
echo.
echo Why run a batch file?
echo This way you could run it as a different user/admin. You can't do that easily with plain .reg files.
echo.
echo.



set infochoice=
set /p infochoice=Press 1 to go back, 0 to exit: 
if not '%infochoice%'=='' set infochoice=%infochoice:~0,1%
if '%infochoice%'=='1' goto start
if '%infochoice%'=='0' goto endInfo
echo "%infochoice%" is not vaild, please try again
echo.
goto start

:endInfo
cls
echo.
echo Pressed 0, exiting...
timeout 2 >nul
endlocal
exit /b

:end
cls
echo.
echo Script ran successfully, exiting...
timeout 2 >nul
endlocal
exit /b

rem oasido @ oct/2021