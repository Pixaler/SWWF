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
