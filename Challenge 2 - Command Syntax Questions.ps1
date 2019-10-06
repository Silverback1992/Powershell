#PowerShell Command Syntax Questions

#Q1: 
#Every cmdlet is based on the same structure:
Verb-Noun
#A dash tells powershell that:
It indicates that a parameter will be used. Dash is followed by the parameter name and the passed value
#Two angle brackets tells me:
It tells that that is the datatype of the argument that should be passed for that parameter.
#A string is called a:
An array of characters. It is a complex datatype.
#When you see <String[]> , what does the [] tells you?
It tells me that that is basically a params or paramarray in other languages. Meaning I can pass 1 or more arguments as well in this case.
#The different versions of Get-Service are called?
Parameter sets. Basically the Get-Service cmdlet acts as an overloaded function in other languages.

#Q2:
#Which parts of the Get-Service cmdlet parameter sets are unique?
Get-Service [[-Name] <string[]>] [-ComputerName <string[]>] [-DependentServices] [-RequiredServices] [-Include <string[]>] [-Exclude <string[]>]  [<CommonParameters>]
Get-Service -DisplayName <string[]> [-ComputerName <string[]>] [-DependentServices] [-RequiredServices] [-Include <string[]>] [-Exclude <string[]>]  [<CommonParameters>]
Get-Service [-ComputerName <string[]>] [-DependentServices] [-RequiredServices] [-Include <string[]>] [-Exclude <string[]>] [-InputObject <ServiceController[]>]  [<CommonParameters>]
#Unique in each set:
Basically every parameter that only belongs to one of the sets are unique and those are the ones that make it unique.
#Common in each set:
Every parameter that appears in all 3 of the sets. Such as Include.
#What command would you use to check out the help of the common parameters
I would use Get-Help Get-Service -Online

#Q3:
#When are running Get-Service we can do so without any parameters. Why is that?
Because it every parameter is optional in the main implementation.

#Q4:
#Why does Get-Eventlog requires a parameter?
Because it has a parameter that is mandatory. You have to give it a value.

#Q5:
#Why does Get-Eventlog's InstanceId should be 2nd when calling the function?
It has to be second only when you are not explicitly typing out the parameter's name. 
Reason being is that the parameter's positional number is 2.

#Q6:
#Why can you place Get-Eventlog's Newest anywhere?
Because it is a named parameter which means you have to explicitly type out the parameter's name.



