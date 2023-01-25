Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------TEST K DRIVE--------------------------------------
Write-Host ---------------------------------------------------------------------------------
$check_k_drive = Test-Path -Path "K:\"
if ($check_k_drive -eq $false) {
    C:\BATCH\truecrypt.bat
    Wait-Process VeraCrypt-x64
}
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -----------------------------RESTORE WINRAR SETTINGS-----------------------------
Write-Host ---------------------------------------------------------------------------------
regedit.exe /s "C:\Windows\_WinRAR.reg"
New-Item -Path "C:\Users\Administrator\AppData\Roaming" -Name "WinRAR" -ItemType "directory" 
Copy-Item -Path "C:\BATCH\!shit\!files\Activation\rarreg.key" -Destination "C:\Users\Administrator\AppData\Roaming\WinRAR"
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -----------------------------RESTORE WINRAR SETTINGS-----------------------------
Write-Host ---------------------------------------------------------------------------------
Set-Location K:\FirefoxPortable
./FirefoxPortable2DefaultPrograms.bat
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -----------------------------ADD TELEGRAM EXTENSION------------------------------
Write-Host ---------------------------------------------------------------------------------
regedit.exe /s "C:\Windows\_Telegram.reg"
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------SETUP GIT-----------------------------------------
Write-Host ---------------------------------------------------------------------------------
C:\PortableApps\Git\bin\git.exe config --global user.name "Pixaler"
C:\PortableApps\Git\bin\git.exe config --global user.email "gnidko02@gmail.com"
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Exit