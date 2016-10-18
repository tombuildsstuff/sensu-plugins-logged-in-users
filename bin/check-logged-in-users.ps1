#
#   check-logged-in-users.ps1
#
# DESCRIPTION:
#   This plugin fires a WARNING when a user is interactively logged in to a machine.
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Windows
#
# DEPENDENCIES:
#   Powershell
#
# USAGE:
#   Powershell.exe -NonInteractive -NoProfile -ExecutionPolicy Bypass -NoLogo -File C:\\etc\\sensu\\plugins\\check-logged-in-users.ps1
#
# NOTES:
#
# LICENSE:
#   Copyright 2016 Tom Harvey MIT
#
[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
   [int]$WARNING,
)

$ThisProcess = Get-Process -Id $pid
$ThisProcess.PriorityClass = "BelowNormal"

$Value = (Get-WmiObject –Class Win32_ComputerSystem | Select-Object UserName | measure).Count

If ($Value -gt 0) {
  Write-Host CheckLoggedInUsers WARNING: $Value% are logged in.
  Exit 1
} Else {
  Write-Host CheckLoggedInUsers OK: $Value% users are logged in.
  Exit 0
}
