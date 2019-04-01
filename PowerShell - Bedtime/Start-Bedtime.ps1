# It's bedtime kids
# This script is intended to enforce bedtime and possibly white-list some school sites.

# Variables
$sleepSeconds = 60
$test = $true
$isLoggedOn = &{quser | Select-String -Pattern 'console' -Quiet}
$config = 'local' # local configuration - settings from script
#$config = 'web' # web configuration - settings from website
$config_URL = "http://"

# Functions
function config_local
{
	if ($test) {write-host "Using local configuration"}
	$script:bedtimeStart = 21
	$script:bedtimeEnd = 06
	$script:scheduled = $true
	$script:whitelist = $false
}

function config_web
{
	if ($test) {write-host "Using web configuration"}
	
	$thisComputer = $ENV:COMPUTERNAME
	
	Invoke-WebRequest 
	
	$script:bedtimeStart = 21
	$script:bedtimeEnd = 06
	$script:scheduled = $true
	$script:whitelist = $false
}

if ($test) {write-host "`$config = $config"}
switch($config)
{
	"local"
	{
		config_local
		break
	}
	"web"
	{
		config_web
		break
	}
}

function set_power_state
{
	if ($test) {write-host "Function `"set_power_state`" called."}
	Add-Type -AssemblyName System.Windows.Forms
	$powerState = [System.Windows.Forms.PowerState]::Suspend;
	$force = $true
	$disableWake = $false
	#[System.Windows.Forms.Application]::SetSuspendState($powerState, $force, $disableWake)
}

if ($test) {write-host "bedtimeStart=$bedtimeStart, bedtimeEnd=$bedtimeEnd, scheduled=$scheduled, whitelist=$whitelist"}
if ($test) {$script:loopCounter = 0; write-host "LoopCounter = $loopCounter"}

# Main
while ($true)
{
	if ($test) {write-host "Start Loop[$loopCounter]"}
	# Get the day of the week
	$dayOfTheWeek = (get-date).DayOfWeek
	$hourOfTheDay = (get-date).hour
	if ($test) {write-host "Today:$dayOfTheWeek"}
	if ($test) {write-host "Hour:$hourOfTheDay"}
	
	# If after 9 on weekdays go to sleep
	if ($hourOfTheDay -ge $bedtimeStart -Or $hourOfTheDay -lt $bedtimeEnd)
	{
		if ($test) {write-host "Time within range: Start Hour:$bedtimeStart; End Hour:$bedtimeEnd"}
		switch($dayOfTheWeek)
		{
			"Sunday"
			{
				if ($test) {Write-Host "It's Sunday."}
				if ($scheduled)
				{
					set_power_state
				}
				break
			}
			
			"Monday"
			{
				if ($test) {Write-Host "It's Monday."}
				if ($scheduled)
				{
					set_power_state
				}
				break
			}
			
			"Tuesday"
			{
				if ($test) {Write-Host "It's Tuesday."}
				if ($scheduled)
				{
					set_power_state
				}
				break
			}
			
			"Wednesday"
			{
				if ($test) {Write-Host "It's Wednesday."}
				if ($scheduled)
				{
					set_power_state
				}
				break
			}
			
			"Thursday"
			{
				if ($test) {Write-Host "It's Thursday."}
				if ($scheduled)
				{
					set_power_state
				}
				break
			}
			
			"Friday"
			{
				if ($test) {Write-Host "It's Friday."}
				if ($scheduled)
				{
					set_power_state
				}
				break
			}
			
			"Saturday"
			{
				if ($test) {Write-Host "It's Saturday."}
				if ($scheduled)
				{
					set_power_state
				}
				break
			}
		}
	}
	else
	{
		if ($test) {write-host "Time outside range: Start Hour:$bedtimeStart; End Hour:$bedtimeEnd"}
	}
		
	# Sleep for a minute
	if ($test) {Write-Host "Sleeping..."}
	Start-Sleep -Seconds $sleepSeconds
	if ($test) {$loopCounter++}
}