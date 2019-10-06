#PowerShell Help System Questions

#Q1: Pick a service that is currently running and get the dependent services
#To get every service:
Get-Service 
#To get the dependent services of the chosen service
Get-Service -DependentServices Winmgmt

#Q2: Get the 20 most recent entries from the system log
#To see the logs
Get-EventLog -list
#To get the system's 20 most recent:
Get-EventLog -LogName System -Newest 20

#Q3: Get all commands of all types
#For all:
Get-Command *
#For alias
Get-Alias
Get-Command -CommandType Alias
#For functions:
Get-Command -CommandType Function
#For cmdlets:
Get-Command -CommandType Cmdlet

#Q4: Get the contents of a text file
Get-Content -Path 'C:\All Work\dataSPEC.txt'

#Q5: Delete the first and the last command of your history. Then delete your entire history.
#First Entry:
Clear-History -Count 1
#Last Entry:
Clear-History -Count 1 -Newest
#All Entries:
Clear-History

#Q6: How to figure out the alias for some command
Get-Alias -Definition Get-Service

#Q7: How would you start and stop a service and see the results
#To see running services
Get-Service | Where-Object {$_.Status -eq "Running"}
#Stop a service, and see it among stopped
Stop-Service -Name BITS
Get-Service | Where-Object {$_.Status -eq "Stopped"}
#Start a service and see it among running
Start-Service -Name BITS
Get-Service | Where-Object {$_.Status -eq "Running"}

#Q8: How would you display the installed version of PowerShell
$PSVersionTable

#Q9: How would you count the number of aliases in the current session
Get-Alias | Measure-Object




















