function nb-year([int]$p0, [double]$percent, [int]$aug, [int]$p)
{
    [double]$perc = $percent / 100
    $calculatedPop = $p0
    $years = 0

    while($p -gt $calculatedPop)
    {
        $calculatedPop = $calculatedPop + ($perc * $calculatedPop) + $aug
        $years++
    }

    return $years
}

nb-year 1500 5 100 5000
nb-year 1500000 2.5 10000 2000000
nb-year 1500000 0.25 1000 2000000
nb-year 1500000 0.25 -1000 2000000

<#
testing 1500 5 100 5000 15
testing 1500000 2.5 10000 2000000 10
testing 1500000 0.25 1000 2000000 94
testing 1500000 0.25 -1000 2000000 151
#>