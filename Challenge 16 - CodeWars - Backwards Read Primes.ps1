function IsPrime($num)
{
    if($num -le 3){$num -gt 1}
    elseif($num % 2 -eq 0 -or $num % 3 -eq 0){return $false}

    $i = 5
    while($i * $i -le $num)
    {
        if($num % $i -eq 0 -or $num % ($i + 2) -eq 0){return $false}
        $i += 6
    }

    return $true
}

# return a string
function backwards-prime($start, $stop) 
{
    $backWardsPrimes = ""

    For($i = $start; $i -le $stop; $i++)
    {
        $arr = $i.ToString() -split ""
        [array]::Reverse($arr) 
        $rev = [int]($arr -join "")

        if(($i.ToString().Length -ge 2) -and ($rev -ne $i) -and (IsPrime($i)) -and (IsPrime($rev)))
        {
            if($backWardsPrimes -eq "")
            {
                $backWardsPrimes = $i.ToString()
            }
            else
            {
                $backWardsPrimes = ($backWardsPrimes + ", $i")
            }
        }
    }

    return $backWardsPrimes
}

backwards-prime -start 1 -stop 100
backwards-prime -start 1 -stop 31
backwards-prime -start 101 -stop 199
backwards-prime -start 9900 -stop 10000

<#
$a = "13, 17, 31, 37, 71, 73, 79, 97"
dotest 1 100 $a
$a = "13, 17, 31"
dotest 1 31 $a
$a = "107, 113, 149, 157, 167, 179, 199"
dotest 101 199 $a
#>