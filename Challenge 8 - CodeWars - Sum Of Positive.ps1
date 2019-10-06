function Get-SumOfPositive($NumberArray)
{
    $sumOfArray = 0
    
    ForEach($num in $NumberArray)
    {
        if($num -ge 0){$sumOfArray += $num}
    }

    return $sumOfArray
}

Get-SumOfPositive -NumberArray @(1, 2, 3, 4, 5) #15
Get-SumOfPositive -NumberArray @(1, -2, 3, 4, 5) #13