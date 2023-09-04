# install PSReadLine(https://github.com/PowerShell/PSReadLine)
Write-Output "Install PSReadLine"
Install-Module -Name PowerShellGet -Force
Install-Module PSReadLine

# install komorebi(https://github.com/LGUG2Z/komorebi)
Write-Output "Install komorebi"
winget install LGUG2Z.whkd
winget install LGUG2Z.komorebi
Copy-Item -Recurse User\* $Env:USERPROFILE
komorebic fetch-app-specific-configuration $Env:USERPROFILE\.config\komorebi\applications.yaml

# install Windows Terminal Preview
Write-Output "Install WindowsTerminal(Preview Edition)"
winget install Microsoft.WindowsTerminalPreview
Copy-Item WIndowsTerminal\settings.json $Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\setings.json
