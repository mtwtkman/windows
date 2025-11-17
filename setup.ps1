# install PSReadLine(https://github.com/PowerShell/PSReadLine)
Write-Output "Install PSReadLine"
Install-Module -Name PowerShellGet -Force
Install-Module PSReadLine

Write-Output "Put powershell profile"
Copy-Item WindowsPowerShell -Recurse $Env:USERPROFILE\Documents

# install GlazeWM(https://github.com/glazerdesktop/GlazeWM)
Write-Output "Install GlazeWM"
winget install GlazeWM
powershell
$galzewmExePath = (Get-Command glazewm).Path
$sh = New-Object -comObject WScript.Shell
$dest = [System.Environment]::GetFolderPath("StartMenu") + "\galzewm.lnk"
$shortcut = $sh.CreateShortcut($dest)
$shortcut.TargetPath = $galzewmExePath
$shortcut.Save()

Copy-Item WIndowsTerminal\settings.json $Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

Write-Output "Put setting files"
Copy-Item -Recurse User\* $Env:USERPROFILE

# wsl setting
wsl --install archlinux
wsl -u root -e mount --make-rshared /
