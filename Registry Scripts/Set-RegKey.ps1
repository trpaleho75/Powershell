# This is a generic registry editing script, modify as necessary

function Set-RegistryKey {
    param (
    [string]$Path,
    [string]$Name,
    [string]$Type,
    [string]$Value
    )

    if (!(Test-Path $Path)) {
        New-Item -Path $(Split-Path -Path $Path -Parent) -Name $(Split-Path -Path $Path -Leaf)
        New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType $Type
    } else {
        if (!(Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue)) {
            New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType $Type
        } else {
            Set-ItemProperty -Path $Path -Name $Name -Value $Value
        }
    }  
}

# Add one of these sections for each registry key to modify
$registryPath = "HKCU:\Software\Microsoft\Office\15.0\Common\Internet"
$keyName = "UseOnlineContent"
$keyType = "DWord"
$keyValue = 1
Set-RegistryKey -Path $registryPath -Name $keyName -Value $keyValue -Type $keyType