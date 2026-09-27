Get-AppxPackage -allusers Clipchamp.Clipchamp | Remove-AppxPackage
Get-AppxPackage -allusers Disney.37853FC22B2CE | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.GetHelp | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Getstarted | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MSPaint | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Microsoft3DViewer | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MixedReality.Portal | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.OutlookForWindows | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.OneDriveSync | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.People | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.PowerAutomateDesktop | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.ScreenSketch | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Todos | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Wallet | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsAlarms | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsCalculator | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsCamera | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.YourPhone | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage -allusers MicrosoftCorporationII.QuickAssist | Remove-AppxPackage
Get-AppxPackage -allusers MicrosoftTeams | Remove-AppxPackage
Get-AppxPackage -allusers MicrosoftWindows.Client.WebExperience | Remove-AppxPackage
Get-AppxPackage -allusers SpotifyAB.SpotifyMusic | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsCommunicationsApps | Remove-AppxPackage
Get-WindowsPackage -Online | Where PackageName -like *Hello-Face* | Remove-WindowsPackage -Online -NoRestart
Get-WindowsPackage -Online | Where PackageName -like *QuickAssist* | Remove-WindowsPackage -Online -NoRestart
Get-ProvisionedAppxPackage -Online | `
Where-Object { $_.PackageName -match "xbox" } | `

Write-Host "Uninstalling: Edge . . ."
# stop edge running
$stop = "MicrosoftEdgeUpdate", "OneDrive", "WidgetService", "Widgets", "msedge", "msedgewebview2"
$stop | ForEach-Object { Stop-Process -Name $_ -Force -ErrorAction SilentlyContinue }
# uninstall copilot
Get-AppxPackage -allusers *Microsoft.Windows.Ai.Copilot.Provider* | Remove-AppxPackage
# disable edge updates regedit
reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d "1" /f | Out-Null
# allow edge uninstall regedit
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev" /v "AllowUninstall" /t REG_SZ /f | Out-Null
# new folder to uninstall edge
New-Item -Path "$env:SystemRoot\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
# new file to uninstall edge
New-Item -Path "$env:SystemRoot\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" -ItemType File -Name "MicrosoftEdge.exe" -ErrorAction SilentlyContinue | Out-Null
# find edge uninstall string
$regview = [Microsoft.Win32.RegistryView]::Registry32
$microsoft = [Microsoft.Win32.RegistryKey]::OpenBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $regview).
OpenSubKey("SOFTWARE\Microsoft", $true)
$uninstallregkey = $microsoft.OpenSubKey("Windows\CurrentVersion\Uninstall\Microsoft Edge")
try {
$uninstallstring = $uninstallregkey.GetValue("UninstallString") + " --force-uninstall"
} catch {
}
# uninstall edge
Start-Process cmd.exe "/c $uninstallstring" -WindowStyle Hidden -Wait
# remove folder file
Remove-Item -Recurse -Force "$env:SystemRoot\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" -ErrorAction SilentlyContinue | Out-Null
# find edgeupdate.exe
$edgeupdate = @(); "LocalApplicationData", "ProgramFilesX86", "ProgramFiles" | ForEach-Object {
$folder = [Environment]::GetFolderPath($_)
$edgeupdate += Get-ChildItem "$folder\Microsoft\EdgeUpdate\*.*.*.*\MicrosoftEdgeUpdate.exe" -rec -ea 0
}
# find edgeupdate & allow uninstall regedit
$global:REG = "HKCU:\SOFTWARE", "HKLM:\SOFTWARE", "HKCU:\SOFTWARE\Policies", "HKLM:\SOFTWARE\Policies", "HKCU:\SOFTWARE\WOW6432Node", "HKLM:\SOFTWARE\WOW6432Node", "HKCU:\SOFTWARE\WOW6432Node\Policies", "HKLM:\SOFTWARE\WOW6432Node\Policies"
foreach ($location in $REG) { Remove-Item "$location\Microsoft\EdgeUpdate" -recurse -force -ErrorAction SilentlyContinue }
# uninstall edgeupdate
foreach ($path in $edgeupdate) {
if (Test-Path $path) { Start-Process -Wait $path -Args "/unregsvc" | Out-Null }
do { Start-Sleep 3 } while ((Get-Process -Name "setup", "MicrosoftEdge*" -ErrorAction SilentlyContinue).Path -like "*\Microsoft\Edge*")
if (Test-Path $path) { Start-Process -Wait $path -Args "/uninstall" | Out-Null }
do { Start-Sleep 3 } while ((Get-Process -Name "setup", "MicrosoftEdge*" -ErrorAction SilentlyContinue).Path -like "*\Microsoft\Edge*")
}
# remove edgewebview regedit
cmd /c "reg delete `"HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView`" /f >nul 2>&1"
cmd /c "reg delete `"HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView`" /f >nul 2>&1"
# remove folders edge edgecore edgeupdate edgewebview temp
Remove-Item -Recurse -Force "$env:SystemDrive\Program Files (x86)\Microsoft" -ErrorAction SilentlyContinue | Out-Null
# remove edge shortcuts
Remove-Item -Recurse -Force "$env:SystemDrive\Windows\System32\config\systemprofile\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk" -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Recurse -Force "$env:USERPROFILE\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk" -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Recurse -Force "$env:USERPROFILE\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Recurse -Force "$env:USERPROFILE\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Tombstones\Microsoft Edge.lnk" -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Recurse -Force "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Recurse -Force "$env:SystemDrive\Users\Public\Desktop\Microsoft Edge.lnk" -ErrorAction SilentlyContinue | Out-Null
Clear-Host
Write-Host "Restart to apply . . ."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
exit
