@echo off
@echo ----------------------------------------------------------------------------------Installing Files
timeout 2 >nul
"C:\Files\Packages\DirectX\DXSETUP.exe" /silent
timeout 2 >nul
"C:\Files\Packages\C++.exe" /S
timeout 2 >nul
"C:\Files\Packages\.NET\NET.exe" /install /quiet /norestart
timeout 2 >nul
del "C:\Users\Public\Desktop\Microsoft Edge.lnk"
pause
@echo ----------------------------------------------------------------------------------Installing Optimizations
regedit.exe /s "C:\Files\Registry.reg"
timeout 2 >nul
"C:\Files\Packages\Power.exe" /SW:0 "C:\Files\RPC.cmd"
timeout 2 >nul
"C:\Files\Packages\Power.exe" /SW:0 "C:\Files\Power.cmd"
timeout 2 >nul
start powershell -windowstyle hidden "& ""C:\Files\Debloat.ps1"""
timeout 80 >nul
start "" powershell "C:\Files\PostInstall.ps1"
pause
@echo ----------------------------------------------------------------------------------Optimize MSI Mode
"C:\Files\Packages\MSI.exe"
pause
@echo ----------------------------------------------------------------------------------Optimize AMD Settings
"C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe"
pause
@echo ----------------------------------------------------------------------------------Optimize Sound Settings
mmsys.cpl
pause
@echo ----------------------------------------------------------------------------------Cleanup + System Restore Point
START control.exe sysdm.cpl ,4
"C:\Files\Packages\Power.exe" /SW:0 "C:\Files\clean.cmd"
pause
@echo ----------------------------------------------------------------------------------Restart PC
pause
C:\Windows\System32\shutdown.exe /r /t 0
