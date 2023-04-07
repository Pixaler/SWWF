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
Write-Host ----------------------------REMOVE ARROW FROM SHORTCUT----------------------
Write-Host ---------------------------------------------------------------------------------
Copy-Item -Path "C:\Files\Packages\Blank.ico" -Destination "C:\Windows"
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------SETUP MY SETTINGS---------------------------------
Write-Host ---------------------------------------------------------------------------------
Write-Host "Setup my setting? (y/n)"
$setup_my_apps = Read-Host -Prompt "You options is"
if ($setup_my_apps -like 'y') {
    C:\Files\PersonalSetup.ps1
}
else {
    Start-Sleep -Seconds 1
}
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
