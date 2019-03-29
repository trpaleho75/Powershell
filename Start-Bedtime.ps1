function suspend-computer
{
	# Set power state
	$powerState = [System.Windows.Forms.PowerState]::Suspend
	$force = $true
	$disableWake = $false
	[System.Windows.Forms.Application]::SetSuspendState($powerState, $force, $disableWake)
}

while ($true)
{
	# Get the day of the week
	$dayOfTheWeek = (get-date).DayOfWeek
	$hourOfTheDay = (get-date).hour

	# If after 9 on weekdays go to sleep
	if ($hourOfTheDay -ge 21)
	{
		write-host $dayOfTheWeek
		switch($dayOfTheWeek)
		{
			"Sunday"
			{
				suspend-computer
				break
			}
			
			"Monday"
			{
				suspend-computer
				break
			}
			
			"Tuesday"
			{
				suspend-computer
				break
			}
			
			"Wednesday"
			{
				suspend-computer
				break
			}
			
			"Thursday"
			{
				suspend-computer
				break
			}
			
			"Friday"
			{
				break
			}
			
			"Saturday"
			{
				break
			}
		}
	}
	
	# Sleep for a minute
	Start-Sleep -Seconds 60
}