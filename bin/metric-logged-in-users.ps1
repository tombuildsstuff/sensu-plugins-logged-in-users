#
#   metric-logged-in-users.ps1
#
# DESCRIPTION:
#   This plugin collects and outputs the number of users logged in interactively.
#
# OUTPUT:
#   metric data
#
# PLATFORMS:
#   Windows
#
# DEPENDENCIES:
#   Powershell
#
# USAGE:
#   Powershell.exe -NonInteractive -NoProfile -ExecutionPolicy Bypass -NoLogo -File C:\\etc\\sensu\\plugins\\metric-logged-in-users.ps1
#
# NOTES:
#
# LICENSE:
#   Copyright 2016 sensu-plugins
#   Released under the same terms as Sensu (the MIT license); see LICENSE for details.
#
$ThisProcess = Get-Process -Id $pid
$ThisProcess.PriorityClass = "BelowNormal"

$Path = ($Counter.Path).Trim("\\") -replace " ","_" -replace "\\","." -replace "[\{\}]","" -replace "[\[\]]",""
$Value = (Get-WmiObject –Class Win32_ComputerSystem | Select-Object UserName | measure).Count
$Time = [int][double]::Parse((Get-Date -UFormat %s))

Write-Host "$Path $Value $Time"
