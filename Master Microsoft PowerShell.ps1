Function MaxPct($employees, $race)
{
    $highestPctEmp = $employees[0]
    
    ForEach($employee in $employees)
    {
        if($employee.$race -gt $highestPctEmp.$race)
        {
            $highestPctEmp = $employee
        }
    }

    return $highestPctEmp
}  

$employees = Import-Csv -Path "C:\All Work\PowerShell Practice\Census1000.csv"
$highestHispanic = MaxPct -employees $employees -race "pcthispanic"
echo ($highestHispanic.Name + " | " + $highestHispanic.pcthispanic)
