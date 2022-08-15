Start-Sleep -Seconds 2
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------YOU RUNNING AS ADMIN?-----------------------------
Write-Host ---------------------------------------------------------------------------------
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -eq $false)
{
    Write-Host .
    Write-Host .
    Write-Host Please run as administrator!
    Start-Sleep -Seconds 2
    Write-Host .
    Write-Host .
    Exit
}
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------CREATE FOLDERS------------------------------------
Write-Host ---------------------------------------------------------------------------------
New-Item -Path "C:\" -Name "TEMP" -ItemType "directory" 
New-Item -Path "C:\" -Name "!DOWNLOADS" -ItemType "directory" 
New-Item -Path "C:\" -Name "!APPS" -ItemType "directory" 
New-Item -Path "C:\" -Name "!GAMES" -ItemType "directory" 
New-Item -Path "C:\" -Name "!MYCOR" -ItemType "directory" 
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host --------------------------EDIT ENVIROMENTAL VARIABLES----------------------------
Write-Host ---------------------------------------------------------------------------------
[Environment]::SetEnvironmentVariable("Path", $env:PATH + ";C:\BATCH;C:\PortableApps\VSCode\bin;C:\PortableApps\Git\bin", [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("Path", $env:PATH + ";C:\BATCH;C:\PortableApps\VSCode\bin;C:\PortableApps\Git\bin",  [System.EnvironmentVariableTarget]::Machine)
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------DESKTOP SHORTCUTS---------------------------------
Write-Host ---------------------------------------------------------------------------------
Copy-Item -Path "C:\BATCH\Desktop\*" -Destination "C:\Users\$env:USERNAME\Desktop" -Recurse
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------EDITING SWAP--------------------------------------
Write-Host ---------------------------------------------------------------------------------
# Uncheck automatically set pagefile
$pagefile = Get-WmiObject Win32_ComputerSystem -EnableAllPrivileges
$pagefile.AutomaticManagedPagefile = $false
$pagefile.put() | Out-Null
# Set 8000 Mb pagefile on C drive
$pagefileset = Get-WmiObject Win32_pagefilesetting
$pagefileset.InitialSize = 8000
$pagefileset.MaximumSize = 8000
$pagefileset.Put() | Out-Null
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------DISABLE SERVICES----------------------------------
Write-Host ---------------------------------------------------------------------------------
Stop-Service -Name "ShellHWDetection" -Force
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -----------------------------INSTALLING POWER PLAN-------------------------------
Write-Host ---------------------------------------------------------------------------------
powercfg -import "C:\Windows\_BitsumHighestPerformance.pow" 77777777-7777-7777-7777-777777777777
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777777"
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a
powercfg -attributes SUB_PROCESSOR 75b0ae3f-bce0-45a7-8c89-c9611c25e100 -ATTRIB_HIDE
powercfg -setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 3000
powercfg -setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 3000
powercfg -change -monitor-timeout-ac 20
powercfg -change -monitor-timeout-dc 20
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------DISABLING HIBERNATE-------------------------------
Write-Host ---------------------------------------------------------------------------------
powercfg -h off
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------UNINSTALL BLOAT-----------------------------------
Write-Host ---------------------------------------------------------------------------------
Write-Host "Uninstall bloat? (y/n)"
$uninstall_bloat = Read-Host -Prompt "You options is"
if ($uninstall_bloat  -like 'y') {
    C:\_DebloatScript.ps1
}
if ($uninstall_bloat  -like 'n') {
    Start-Sleep -Seconds 1
}
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------SETUP MY APPS-------------------------------------
Write-Host ---------------------------------------------------------------------------------
Write-Host "Setup my apps? (y/n)"
$setup_my_apps = Read-Host -Prompt "You options is"
if ($setup_my_apps -like 'y') {
    C:\_AppSetup.ps1
}
if ($setup_my_apps -like 'n') {
    Start-Sleep -Seconds 1
}
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host ----------------------------------INSTALLING C++---------------------------------
Write-Host ---------------------------------------------------------------------------------
C:\Windows\_C++.exe /S
Wait-Process _C++
Write-Host .
Write-Host .
Write-Host .
Write-Host .
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -----------------------------------INSTALLING DX---------------------------------
Write-Host ---------------------------------------------------------------------------------
C:\Windows\_DX\DXSETUP.exe /silent
Wait-Process DXSETUP
Write-Host .
Write-Host .
Start-Sleep -Seconds 10
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host ----------------------------IMPORTING REGISTRY TWEAKS----------------------------
Write-Host ---------------------------------------------------------------------------------
regedit.exe /s "C:\Windows\_Registry.reg"
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host ----------------------------DISABLING NETWORK DISCOVERY--------------------------
Write-Host ---------------------------------------------------------------------------------
netsh advfirewall firewall set rule group="Network Discovery" new enable=No
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------CLEAR TEMP FOLDERS--------------------------------
Write-Host ---------------------------------------------------------------------------------
Get-ChildItem -Path "C:\Windows\Temp" *.* -Recurse | Remove-Item -Force -Recurse
Get-ChildItem -Path "$env:TEMP" *.* -Recurse | Remove-Item -Force -Recurse
Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Local\Temp" *.* -Recurse | Remove-Item -Force -Recurse
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host ------------------------------------RESTARTING PC--------------------------------
Write-Host ---------------------------------------------------------------------------------
Write-Host .
Write-Host .
Start-Sleep -Seconds 5
Remove-Item C:\Windows\_DX -Recurse
Remove-Item C:\Windows\_BitsumHighestPerformance.pow
Remove-Item C:\Windows\_C++.exe
Remove-Item C:\Windows\_Registry.reg
Remove-Item C:\Windows\_WinRAR.reg
Remove-Item C:\Windows\_Telegram.reg
Remove-Item C:\_PostInstall.cmd
Remove-Item C:\_DebloatScript.ps1
Remove-Item C:\_AppSetup.ps1
Restart-Computer
Remove-Item C:\_PostInstall.ps1