$Domain = Read-Host "Think of a domain name (test.loc)"

Write-Host "Installing ADDS and DNS tools.."
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature -Name DNS -IncludeManagementTools

Import-Module ActiveDirectory
Import-Module DnsServer

Install-ADDSForest -DomainName "$Domain" -SafeModeAdministratorPassword (Read-Host -Prompt "Create Administrator password" -AsSecureString) -InstallDns -Force

Restart-Computer
