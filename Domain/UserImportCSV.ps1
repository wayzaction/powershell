$logFilePath = "C:\temp\log.txt"
$Pass = Read-Host "Think of a temporary password for users in the CSV file" -AsSecureString
$ErrorActionPreference = 'silentlycontinue'
 
Import-Csv -Path C:\users.csv | ForEach-Object {
    $samAccountName = "$($_.FirstName)$($_.LastName)"
    $DomainSyntax = "DC=" + $_.Domain -replace "\.", ",DC="
    $OuSyntax = "OU=" + $_.Unit + ("," + $DomainSyntax -replace "\.", ",DC=")

    New-ADOrganizationalUnit -Name $_.Unit -Path $DomainSyntax -ProtectedFromAccidentalDeletion $False
    try {
        New-ADUser -Name $_.FirstName -Enabled $true -GivenName $_.FirstName -Surname $_.LastName -AccountPassword $Pass -Path $OuSyntax -SamAccountName $samAccountName -UserPrincipalName "$samAccountName@it.loc" -ChangePasswordAtLogon:$true
        "$samAccountName created successfully." | Out-File -FilePath $logFilePath -Append
    } catch {
        # Fail
        "$samAccountName failed to create." | Out-File -FilePath $logFilePath -Append
    }
}

# CSV EXAMPLE

<#

FirstName,LastName,Unit,Domain
Max,Wayz,Account,it.loc
Red,Harlow,Account,it.loc
John,Marston,Account,it.loc
Yellow,White,Account,it.loc

#>
