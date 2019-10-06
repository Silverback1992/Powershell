#PowerShell Objects, Properties and Methods Questions

#Q1: What are objects?
Objects are instances of classes. They have members declared in the class that consist of properties and methods. 
#Q2: Objects consist of?
Objects consist of properties and methods.
#Q3: Describe a property of a car.
Property of a car can be its color.
#Q4: Describe a method of a car.
A possible method: start engine.
#Q5: How can I display the properties or Methods of a Command?
We have to use a pipeline operator for this. Example:
Get-Service | Get-Member
#Q6: How would you kill an instance of a program
#Ex.: word
(Get-Process -Name WINWORD).Kill()
#Q7: How would you copy a file from a folder to a different folder
(Get-ChildItem "C:\All Work\joke.jpg").CopyTo("C:\All Work\KeyPass\LOOOOL.jpg")
#Q8: Get the current timezone where you currently live
Get-TimeZone -Name (Get-TimeZone).DaylightName
#Q9: Get the BIOS version of the computer
(Get-WmiObject -Class Win32_Bios).BIOSVersion 