function SumCalculator($n)
{
    $divs = @(1, 10, 9, 12, 3, 4)
    $j = 0
    $calc = 0
    $digits = $n.ToString().ToCharArray()
    [array]::Reverse($digits)

    ForEach($digit in $digits)
    {
        $calc += [convert]::ToInt32($digit, 10) * $divs[$j]
        $j++

        if($j -eq $divs.Length){$j = 0}
    }

    return $calc
}

function thirt($n)
{
    $prevCalc = $n
    $calc = SumCalculator($n)

    while($prevCalc -ne $calc)
    {
        $prevCalc = $calc
        $calc = SumCalculator($calc)
    }

    return $calc
}

thirt -n 321
thirt -n 1234567
thirt -n 8529
thirt -n 85299258

<#
testing 321 48
testing 1234567 87
testing 8529 79
testing 85299258 31
#>