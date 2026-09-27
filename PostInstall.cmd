@echo off
cd %systemroot%\system32
call :IsAdmin

@echo ----------------------------------------------------------------------------------Installing Files
@echo      -----Installing DirectX-----
"C:\Files\Packages\DirectX\DXSETUP.exe" /silent
timeout 2 >nul
@echo      -----Installing C++ Redist-----
set IS_X64=0
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set IS_X64=1
if "%PROCESSOR_ARCHITEW6432%"=="AMD64" set IS_X64=1
if "%PROCESSOR_ARCHITECTURE%"=="ARM64" set IS_X64=1

if "%IS_X64%" == "1" goto X64

echo 2005...
"C:\Files\Packages\Cpp\vcredist2005_x86.exe" /q

echo 2008...
"C:\Files\Packages\Cpp\vcredist2008_x86.exe" /qb

echo 2010...
"C:\Files\Packages\Cpp\vcredist2010_x86.exe" /passive /norestart

echo 2012...
"C:\Files\Packages\Cpp\vcredist2012_x86.exe" /passive /norestart

echo 2013...
"C:\Files\Packages\Cpp\vcredist2013_x86.exe" /passive /norestart

echo v14 (2015-2026
"C:\Files\Packages\Cpp\vcredist_v14.x86.exe" /passive /norestart

goto END

:X64

echo 2005...
"C:\Files\Packages\Cpp\vcredist2005_x86.exe" /q
"C:\Files\Packages\Cpp\vcredist2005_x64.exe" /q

echo 2008...
"C:\Files\Packages\Cpp\vcredist2008_x86.exe" /qb
"C:\Files\Packages\Cpp\vcredist2008_x64.exe" /qb

echo 2010...
"C:\Files\Packages\Cpp\vcredist2010_x86.exe" /passive /norestart
"C:\Files\Packages\Cpp\vcredist2010_x64.exe" /passive /norestart

echo 2012...
"C:\Files\Packages\Cpp\vcredist2012_x86.exe" /passive /norestart
"C:\Files\Packages\Cpp\vcredist2012_x64.exe" /passive /norestart

echo 2013...
"C:\Files\Packages\Cpp\vcredist2013_x86.exe" /passive /norestart
"C:\Files\Packages\Cpp\vcredist2013_x64.exe" /passive /norestart

echo v14 (2015-2026) ...
"C:\Files\Packages\Cpp\vcredist_v14.x86.exe" /passive /norestart
"C:\Files\Packages\Cpp\vcredist_v14.x64.exe" /passive /norestart

:END
timeout 2 >nul
@echo ----------------------------------------------------------------------------------Installing Optimizations
@echo      -----Importing registry-----
regedit.exe /s "C:\Files\Registry.reg"
timeout 2 >nul
@echo      -----Restart explorer-----
"C:\Files\Packages\Power.exe" /SW:0 "C:\Files\RPC.cmd"
timeout 2 >nul
@echo      -----Importing powerplan-----
"C:\Files\Packages\Power.exe" /SW:0 "C:\Files\Power.cmd"
timeout 2 >nul
@echo      -----Remove bloat-----
start powershell  "C:\Files\Debloat.ps1"
timeout 2 >nul
@echo      -----My preferences-----
start "" powershell "C:\Files\PostInstall.ps1" "%~1"
del "C:\Users\Public\Desktop\Microsoft Edge.lnk"
@echo ----------------------------------------------------------------------------------Optimize Sound Settings
mmsys.cpl
pause
@echo ----------------------------------------------------------------------------------Cleanup + System Restore Point
START control.exe sysdm.cpl ,4
"C:\Files\Packages\Power.exe" /SW:0 "C:\Files\clean.cmd"
pause
@echo ----------------------------------------------------------------------------------Restart PC
pause
rmdir /s /q C:\Files
C:\Windows\System32\shutdown.exe /r /t 10
del /s /q "C:\PostInstall.cmd"

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
