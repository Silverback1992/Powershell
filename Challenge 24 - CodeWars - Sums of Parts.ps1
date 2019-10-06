function parts-sums($ls) 
{
    $result = @()
    
    For($i = 0; $i -lt $ls.Length; $i++)
    {
        #$ls[$i..($ls.Length-1)] | ForEach{$sum += $_}
        #$sum = ($ls[$i..($ls.Length-1)] | Measure-Object -Sum).Sum
        $result += ($ls[$i..($ls.Length-1)] | Measure-Object -Sum).Sum
        #$sum = 0
    }

    $result+= 0
    return $result
}

parts-sums -ls @()
parts-sums -ls @(0, 1, 3, 6, 10)
parts-sums -ls @(744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358)

<#
dotest @() @(0)
dotest @(0, 1, 3, 6, 10) @(20, 20, 19, 16, 10, 0) 
dotest @(1, 2, 3, 4, 5, 6) @(21, 20, 18, 15, 11, 6, 0)
$u = @(744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358) 
$sol = @(10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0)
dotest $u $sol
#>