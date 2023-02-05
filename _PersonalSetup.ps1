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
Write-Host -------------------------------INSTALL FONTS-------------------------------------
Write-Host ---------------------------------------------------------------------------------
Copy-Item -Path "C:\Windows\hack.ttf" -Destination "C:\Windows\Fonts"
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host --------------------------EDIT ENVIROMENTAL VARIABLES----------------------------
Write-Host ---------------------------------------------------------------------------------
[Environment]::SetEnvironmentVariable("Path", $env:PATH + ";C:\BATCH;C:\PortableApps\VSCode\bin;C:\PortableApps\Git\bin;C:\PortableApps\nvim\bin", [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("Path", $env:PATH + ";C:\BATCH;C:\PortableApps\VSCode\bin;C:\PortableApps\Git\bin;C:\PortableApps\nvim\bin",  [System.EnvironmentVariableTarget]::Machine)
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host -------------------------------TOOLBAR LINKS-------------------------------------
Write-Host ---------------------------------------------------------------------------------
Copy-Item -Path "C:\BATCH\Links\*" -Destination "C:\Users\$env:USERNAME\Favorites\Links" -Recurse
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host ----------------------------IMPORTING PERSONAL REGISTRY TWEAKS----------------------------
Write-Host ---------------------------------------------------------------------------------
regedit.exe /s "C:\Windows\_PersonalRegistry.reg"
Stop-Process -name explorer -force
Write-Host .
Write-Host .
Start-Sleep -Seconds 15
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
Write-Host ----------------------------CAPS LIKE CHANGE LAYOUT------------------------------
Write-Host ---------------------------------------------------------------------------------
C:\Windows\engcaps\setup.exe 
Start-Sleep -Seconds 5
Stop-Process -name setup -force
C:\Windows\ruscaps\setup.exe 
Start-Sleep -Seconds 5
Stop-Process -name setup -force
C:\Windows\ukrcaps\setup.exe 
Start-Sleep -Seconds 5
Stop-Process -name setup -force
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
Copy-Item -Path "C:\Windows\rarreg.key" -Destination "C:\Users\Administrator\AppData\Roaming\WinRAR"
Write-Host .
Write-Host .
Start-Sleep -Seconds 2
Write-Host .
Write-Host .
Write-Host ---------------------------------------------------------------------------------
Write-Host ----------------------------MAKE FIREFOX PORTABLE DEFAULT------------------------
Write-Host ---------------------------------------------------------------------------------
Set-Location K:\FirefoxPortable
.\FirefoxPortable2DefaultPrograms.bat
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
