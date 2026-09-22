<#
.SYNOPSIS
    Sample new-user onboarding script for Active Directory (SANITIZED).
.DESCRIPTION
    Reflects the structure I use to provision new-hire accounts consistently:
    create AD user, add to department group, set home folder, force password
    change at first login, and log the action. No real usernames, OUs, or
    domain names included — replace <placeholders> before use.
#>

param(
    [Parameter(Mandatory=$true)][string]$FirstName,
    [Parameter(Mandatory=$true)][string]$LastName,
    [Parameter(Mandatory=$true)][string]$Department,
    [Parameter(Mandatory=$true)][string]$JobTitle,
    [string]$Domain = "<yourdomain.local>",
    [string]$OU = "OU=Users,OU=<DepartmentPlaceholder>,DC=<yourdomain>,DC=local"
)

Import-Module ActiveDirectory

# --- Build account details ---
$SamAccountName = ("{0}.{1}" -f $FirstName, $LastName).ToLower()
$UserPrincipalName = "$SamAccountName@$Domain"
$DisplayName = "$FirstName $LastName"
$InitialPassword = ConvertTo-SecureString "<TempPassword-ChangeMe123!>" -AsPlainText -Force
$HomeDir = "\\<fileserver-placeholder>\Home\$SamAccountName"

# --- Create the AD account ---
try {
    New-ADUser `
        -Name $DisplayName `
        -GivenName $FirstName `
        -Surname $LastName `
        -SamAccountName $SamAccountName `
        -UserPrincipalName $UserPrincipalName `
        -Path $OU `
        -AccountPassword $InitialPassword `
        -Enabled $true `
        -ChangePasswordAtLogon $true `
        -Department $Department `
        -Title $JobTitle `
        -HomeDirectory $HomeDir `
        -HomeDrive "H:"

    Write-Output "Created account: $SamAccountName"
}
catch {
    Write-Error "Failed to create account for $DisplayName. Error: $_"
    exit 1
}

# --- Add to department security group ---
try {
    Add-ADGroupMember -Identity "<DepartmentPlaceholder>-Users" -Members $SamAccountName
    Write-Output "Added $SamAccountName to <DepartmentPlaceholder>-Users group"
}
catch {
    Write-Warning "Could not add $SamAccountName to department group. Error: $_"
}

# --- Create home directory ---
try {
    New-Item -Path $HomeDir -ItemType Directory -Force | Out-Null
    Write-Output "Home directory created at $HomeDir"
}
catch {
    Write-Warning "Could not create home directory. Error: $_"
}

# --- Log the onboarding action ---
$LogEntry = "{0} | Created user {1} ({2}) in {3}" -f (Get-Date -Format "yyyy-MM-dd HH:mm"), $SamAccountName, $JobTitle, $Department
Add-Content -Path "C:\Logs\onboarding-log.txt" -Value $LogEntry

Write-Output "Onboarding complete for $DisplayName."
