$package = Read-Host "Delete all appx package(y/n): "

if ($package -eq "y"){
  Get-AppxPackage | Where-Object { $_.NonRemovable -eq $false } | ForEach-Object { Remove-AppxPackage -Package $_.PackageFullName -AllUsers -ErrorAction SilentlyContinue }
} 
else {
  C:\Files\MinimalDebloat.ps1
}


# Remove OneDrive
taskkill /f /im OneDrive.exe
Stop-Service -Name "OneDrive Updater Service" -Force -ErrorAction SilentlyContinue
& (Get-Item "$env:localappdata\Microsoft\OneDrive\*\OneDriveSetup.exe" | Select-Object -First 1).FullName /uninstall

$edge = Read-Host "Delete MicrosoftEdge(y/n): "

if ($edge -eq "y"){
  # Remove Edge
  C:\Files\RemoveEdge.ps1
}
else {
  Write-Host "MicrosoftEdge not deleted"
}
