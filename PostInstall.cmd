@echo off
cd %systemroot%\system32
call :IsAdmin

@echo ----------------------------------------------------------------------------------Installing Files
@echo      -----Installing DirectX-----
"C:\Files\Packages\DirectX\DXSETUP.exe" /silent
timeout 2 >nul
@echo      -----Installing C++ Redist-----
"C:\Files\Packages\C++.exe" /S
timeout 2 >nul
@echo      -----Installing .NET 6 Framework-----
"C:\Files\Packages\.NET\NET.exe" /install /quiet /norestart
timeout 2 >nul
del "C:\Users\Public\Desktop\Microsoft Edge.lnk"
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
start powershell -windowstyle hidden "& ""C:\Files\Debloat.ps1"""
timeout 120 >nul
@echo      -----My preferences-----
start "" powershell "C:\Files\PostInstall.ps1" "%~1"
@echo ----------------------------------------------------------------------------------Optimize MSI Mode
"C:\Files\Packages\MSI.exe"
pause
@echo ----------------------------------------------------------------------------------Optimize Sound Settings
mmsys.cpl
pause
@echo ----------------------------------------------------------------------------------Disable Windows Defender
"C:\Files\Packages\WindowsDefender.lnk"
pause
"C:\Files\Packages\7Zip\x64\7za.exe" x "C:\Files\Packages\disable-defender.7z" -oC:\Files\Packages
"C:\Files\Packages\disable-defender.exe"
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
