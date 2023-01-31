# v1.0.0
## Changes
1. _AppSetup. Add WinRAR activation
2. _AppSetup. Return Firefox Portable to default browser
3. _DebloatScript. Remove all Xbox stuff
4. _Registry. Add Capslock to change layout
5. _Registry. Remove all shortcut from dekstop

## Fixes
1. _PostInstall. Now fonts and keyboard setup correctly

# v0.9.2
## Changes
1. Fix bugs

# v0.9.1
## Changes
1. Remove icon from taskbar. Now I use toolbar
2. Add path to nvim

# v0.9
## Changes
1. Remove unused apps from _AppSetup.ps1
2. Change keyboard layout now at CAPS

# v0.8.3
## Changes
1. _PostInstall. Now check that user run script as administrator
2. Add Telegram.reg
# v0.8.2
## Changes
1. _AppSetup. All reg files now run silent

## Fixes
1. _PostInstall. Word.exe now restore from Windows Defender

# v0.8.1 
## Changes
1. _AppSetup. Enable preview pane

## Fixes
1. _PostInstall. Word.exe now restore from Windows Defender

# v0.8
## Changes
1. _AppSetup. Check that K drive is mounted, if not launch truecrypt.bat and wait
2. _AppSetup. OfficePortable add to Windows Defender exclusion
3. _AppSetup. Add reg file to restore WinRAR settings
4. _AppSetup. Add Telegram.reg files. Remove from _Registry.reg
5. _AppSetup. Add Studio One and Melodyne setup
6. _AppSetup. Git setups automatically
7. _Registry.reg. Timezone UTC+2 Kyiv

# v0.7.1
## Changes
1. Add registry that disable widgets in Windows 11. Free at least 1.5 Gb of RAM
2. _DebloatScript. Add XboxApp and Teams to uninstall

## Fixes 
1. Now _PostInstall.cmd can run from any path
2. Enviromental variables adds correctly
3. Now coping shortcut avaliable for every user
4. Block Uninstall bloat and Setup my apps now proceed correctly
5. Now Microsoft Edge uninstalling
6. Execution police for powershell now applied in cmd file
7. _AppSetup and _DeblaotScript now launch
8. Now script wait until C++ and DX to be installed

# v0.7
## Changes 
1. Move to PowerShell
2. Add ***_DebloatScript.ps1*** to uninstall blotware
3. Add ***_AppSetup.ps1*** to setup my apps
4. Move enviroment variable to script for better customization

# v0.6
## Changes
1. Uninstall Microsoft Edge in Windows 11 
2. Remove disabling Windows Defender in bat and reg files. Try to find better way
3. Remove disable auto update. This block settings in Windows Update 




