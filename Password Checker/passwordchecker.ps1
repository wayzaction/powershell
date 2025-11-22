cls
$firstName = Read-Host "Name:"
$lastName = Read-Host "Last Name:"
$correctbirth = "^\d{2}\.\d{2}\.\d{4}$" 
$correctpassword = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{15,}$" #This monstrosity is a password criteria. 15 symbols, 1 capital letter and 1 special symbol. Powershell syntax sucks.

#Ask user's date of birth..
do {
$birth = Read-Host "Date of Birth (dd.mm.yyyy)"
}

#..until user follows the format.
until ($birth -match $correctbirth)

#Ask user to create a password..
do { $password = Read-Host "Think of a password:"  
   }

#..until user follows the format.
until ($password -match $correctpassword)

Write-Host "Account Created."
