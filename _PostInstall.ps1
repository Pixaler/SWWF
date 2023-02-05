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
Write-Host .
Write-Host .
Get-AppxPackage -allusers Disney.37853FC22B2CE | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.GetHelp | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Getstarted | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Microsoft3DViewer | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MixedReality.Portal | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MSPaint | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.OneDriveSync | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.People | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.PowerAutomateDesktop | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Todos | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Wallet | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsAlarms | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsCamera | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.YourPhone | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage -allusers MicrosoftTeams | Remove-AppxPackage
Get-AppxPackage -allusers MicrosoftWindows.Client.WebExperience | Remove-AppxPackage
Get-AppxPackage -allusers SpotifyAB.SpotifyMusic | Remove-AppxPackage
Get-AppxPackage -allusers microsoft.windowscommunicationsapps | Remove-AppxPackage
Get-AppxPackage -allusers MicrosoftTeams* | Remove-AppxPackage
# Remove all xbox stuff
Get-ProvisionedAppxPackage -Online | `
Where-Object { $_.PackageName -match "xbox" } | `
ForEach-Object { Remove-ProvisionedAppxPackage -Online -AllUsers -PackageName $_.PackageName }
C:\Windows\SysWOW64\OneDriveSetup.exe -uninstall
Set-Location -Path "C:\Program Files (x86)\Microsoft\Edge\Application\9*\Installer" 
./setup.exe --uninstall --force-uninstall --system-level
Get-WindowsPackage -Online | Where PackageName -like *Hello-Face* | Remove-WindowsPackage -Online -NoRestart
Get-WindowsPackage -Online | Where PackageName -like *QuickAssist* | Remove-WindowsPackage -Online -NoRestart
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------SETUP MY SETTINGS-------------------------------------
Write-Host ---------------------------------------------------------------------------------
Write-Host "Setup my setting? (y/n)"
$setup_my_apps = Read-Host -Prompt "You options is"
if ($setup_my_apps -like 'y') {
    C:\_PersonalSetup.ps1
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
Stop-Process -name explorer -force
Write-Host .
Write-Host .
Start-Sleep -Seconds 15
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
Remove-Item C:\Windows\engcaps -Recurse
Remove-Item C:\Windows\ruscaps -Recurse
Remove-Item C:\Windows\ukrcaps -Recurse
Remove-Item C:\Windows\_BitsumHighestPerformance.pow
Remove-Item C:\Windows\_C++.exe
Remove-Item C:\Windows\_Registry.reg
Remove-Item C:\Windows\_PersonalRegistry.reg
Remove-item C:\Windows\hack.ttf
Remove-item C:\Windows\rarreg.key
Remove-Item C:\_PostInstall.cmd
Remove-Item C:\_PersonalSetup.ps1
Restart-Computer
Remove-Item C:\_PostInstall.ps1
