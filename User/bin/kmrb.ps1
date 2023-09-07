$KomorebiDir = "$Env:USERPROFILE\.config\komorebi"

function Start-Komorebi {
  komorebic start -c $KomorebiDir\komorebi.json --whkd
}

function Stop-Komorebi {
  Stop-Process -Force -Name "whkd"
  Stop-Process -Force -Name "komorebi"
}

function Restart-Komorebi {
  Stop-Komorebi
  Start-Komorebi
}

function Show-Usage {
  Write-Output "[Usage]"
  Write-Output "kmrb.ps1 (start|stop|restart)"
  Write-Output "Start komorebi process:    kmrb.ps1 (start)"
  Write-Output "Stop komorebi process:     kmrb.ps1 stop"
  Write-Output "Restart komorebi process:  kmrb.ps1 restart"
}

function Load-Komorebi-Custom-Layout($LayoutFile) {
  komorebic load-custom-layout $KomorebiDir\custom_layout\$LayoutFile
}

if ($args.Length -eq 0 -or $args -eq "start") {
  Start-Komorebi
} elseif ($args -eq "stop") {
  Write-Output "Stop komorebi and whkd"
  Stop-Komorebi
} elseif ($args -eq "restart") {
  Restart-Komorebi
} elseif ($args.Length -eq 2 -and $args[0] -eq "load") {
  Load-Komorebi-Custom-Layout($args[1])
}  else {
  Show-Usage
}
