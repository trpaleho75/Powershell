# Create a new Active Directory user
Write-Host 'Create a new AD User: '

$nameFirst = Read-Host -Prompt 'First name'
$nameLast = Read-Host -Prompt 'Last name'
$nameMiddle = Read-Host -Prompt 'Middle initial'
$nameFull = $nameFirst + ' ' + $nameMiddle + '. ' + $nameLast
$username = Read-Host -Prompt 'Username'
$password = Read-Host -Prompt 'Password' -AsSecureString

New-ADUser `
	-Name $nameFull `
	-GivenName $nameFirst `
	-Surname $nameLast `
	-Initials $nameMiddle `
	-DisplayName $nameFull `
	-SamAccountName $username `
	-AccountPassword $password `
	-AccountExpirationDate (Get-Date).AddYears(1) `
	-HomeDirectory "\\fileserver\Home\$username" `
	-HomeDrive "H:" `
	-UserPrincipalName "$username@NGC.Authority" `
	-Enabled $true
	
	
	