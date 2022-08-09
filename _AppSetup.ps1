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
Write-Host -------------------------------GOODBYE DPI---------------------------------------
Write-Host ---------------------------------------------------------------------------------
C:\PortableApps\goodbyedpi\service_install_any_dnsredir.cmd
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------SETUP SPOTIFY-------------------------------------
Write-Host ---------------------------------------------------------------------------------
C:\PortableApps\Spotify\start.bat
Write-Host .
Write-Host .
Start-Sleep -Seconds 10
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -----------------------------------FIREFOX TO DEFAULT----------------------------
Write-Host ---------------------------------------------------------------------------------
K:\FirefoxPortable\FirefoxPortable2DefaultPrograms.bat
Write-Host .
Write-Host .
Start-Sleep -Seconds 10
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------ADD OFFICEPORTABLE FOLDER TO WHITELIST------------------
Write-Host ---------------------------------------------------------------------------------
Set-Location -Path "C:\Program Files\Windows Defender"
./mpcmdrun -Restore -Name Trojan:Win32/Occamy.C -All -Path "C:\PortableApps\OfficePortable"
Set-MpPreference -ExclusionPath C:\PortableApps\OfficePortable
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -----------------------------RESTORE WINRAR SETTINGS-----------------------------
Write-Host ---------------------------------------------------------------------------------
regedit.exe /s "C:\Windows\_WinRAR.reg"
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
Write-Host -----------------------------SETUP STUDIO ONE------------------------------------
Write-Host ---------------------------------------------------------------------------------
C:\PortableApps\StudioOne\'Studio One 5.5.2 Noinstall'\StudioOne5.5.2CreateSymLink.cmd
C:\PortableApps\StudioOne\'Studio One 5.5.2 Noinstall'\StudioOne5.reg
Set-Location -Path "C:\Program Files\PreSonus\Studio One 5"
./'Studio One.exe'
Wait-Process 'Studio One'
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -----------------------------SETUP MELODYNE--------------------------------------
Write-Host ---------------------------------------------------------------------------------
C:\PortableApps\Melodyne\'Melodyne 5'\SymLinkDeInstaller.cmd
C:\PortableApps\Melodyne\'Melodyne 5'\SymLinkInstaller.cmd
C:\PortableApps\Melodyne\'Melodyne 5'\Reg\1.reg
C:\PortableApps\Melodyne\'Melodyne 5'\Reg\2.reg
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