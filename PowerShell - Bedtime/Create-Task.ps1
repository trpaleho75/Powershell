# Start-Bedtime task setup

$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument '-Command "&{\\192.168.1.1\Scripts\Start-Bedtime.ps1" -WindowStyle Hidden'
$trigger = New-ScheduledTaskTrigger -AtStartup
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BedtimeKids" -Description "Goodnight suckers" -Principal $principal