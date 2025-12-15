$logFilePath = "C:\temp\log.txt"

Import-Csv -Path C:\users.csv | ForEach-Object {

    $samAccountName = "$($_.FirstName)$($_.LastName)"
    
    try {
        New-ADUser -Name $_.FirstName -Enabled $true -GivenName $_.FirstName -Surname $_.LastName -AccountPassword (ConvertTo-SecureString $_.password -AsPlainText -Force) -SamAccountName $samAccountName -UserPrincipalName "$samAccountName@it.loc"
        "$samAccountName created successfully." | Out-File -FilePath $logFilePath -Append
    } catch {
        # Fail
        "$samAccountName failed to create." | Out-File -FilePath $logFilePath -Append
    }
}

# CSV EXAMPLE

<#
FirstName,LastName,Password
Hot,Dog,Kevade123
Red,Cat,Kevade123
Regular,Guy,Kevade123
John,Doe,123
#>
