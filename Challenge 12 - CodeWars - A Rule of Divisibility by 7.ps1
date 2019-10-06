function seven([long]$m) 
{
    $methodCounter = 0

    while($m -ge 100)
    {
        $x = [math]::Floor($m / 10)
        $y = $m % 10
        $m = $x - 2 * $y
        $methodCounter++       
    }

    return @($m, $methodCounter)
}

seven -m 371
seven -m 1603
seven -m 477557101
seven -m 16
seven -m 17792772

<#
seven(371) should return [35, 1]
seven(1603) should return [7, 2]
seven(477557101) should return [28, 7]
#>