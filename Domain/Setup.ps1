Import-Module ActiveDirectory
Import-Module DnsServer

$Domain = Read-Host "Insert your domain name"
$Address = Read-Host "Insert server's IP address. (192.168.1.10)"
$Subnet = Read-Host "Insert server's subnet. (192.168.1.0/24)"

$Name = Read-Host "User's First Name"
$Surname = Read-Host "User's Last name"
$Username = $Name + $Surname
$Password = Read-Host "Password" -AsSecureString

$Unit = Read-Host "Create Organizational Unit"

$Path1 = "DC=" + $Domain -replace "\.", ",DC="
$Path2 = "OU=Users2," + ("DC=" + $Domain -replace "\.", ",DC=")

Enable-NetFirewallRule -DisplayGroup "Windows Remote Management"

Add-DnsServerPrimaryZone -Name "$Domain.ee" -ZoneFile "$Domain.ee.dns" -DynamicUpdate NonsecureAndSecure

Add-DnsServerResourceRecordA -Name "server1" -ZoneName "$Domain.ee" -IPv4Address "$Address" -TimeToLive 01:00:00

Add-DnsServerPrimaryZone -NetworkID "$Subnet" -ReplicationScope "Domain"

Add-DnsServerResourceRecordA -Name "newserver" -ZoneName "$Domain.ee" -IPv4Address "$Address" -CreatePtr

Set-DnsServerForwarder -IPAddress 8.8.8.8, 8.8.4.4 -PassThru

New-ADOrganizationalUnit -Name "$Unit" -Path $Path1

New-ADUser -Name "$Name" -GivenName "$Name" -Surname "$Surname" -SamAccountName "$Username" -UserPrincipalName "$Username@$Domain" -Path $Path2 -AccountPassword $Password -Enabled $true

Write-Host "$Username is your user's nickname, you can use it to join your fresh domain."

