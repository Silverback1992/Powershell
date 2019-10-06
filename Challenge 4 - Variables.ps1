#Variables Challenge

$firstName = Read-Host -Prompt "Please enter your first name"
$lastName = Read-Host -Prompt "Please enter your last name"
$todaysDate = Get-Date -Format "ddMMyyyy-HHmmss"

Set-Content -Value "First Name: $firstName `r`nSecond Name: $lastName `r`nDate: $todaysDate" `
-Path "C:\All Work\Powershell Test Folder\$todaysDate-$firstName-$lastName.txt"