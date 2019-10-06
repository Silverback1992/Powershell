function PrimeFactorCounter($n)
{
    $counter = 0

    while($n % 2 -eq 0)
    {
        $counter++
        $n /= 2
    }

    for($i = 3; $i -le [math]::Sqrt($n); $i+=2)
    {
        while($n % $i -eq 0)
        {
            $counter++;
            $n /= $i
        }
    }

    if($n -gt 2){$counter++}

    return $counter
}

function kprimes-step($k, $step, $start, $nd) 
{
    $result = "["
    $kPrimes = @()

    #Loop through the numbers from start to end
        #Get prime factors
        
        #If number of prime factors = $k
            #Add to k-primes array    
        #End If
    #End Loop

    ForEach($i in ($start..$nd))
    {
        #Get prime factors
        #echo $i
        $primeFactorsCount = PrimeFactorCounter $i

        If($primeFactorsCount -eq $k){$kPrimes += $i}
    }

    #Loop through k-primes array
        #If subtraction of the current and next item is equal to $step
            #Add to result array
        #End If
    #End Loop

    For($i = 0; $i -lt $kPrimes.Count - 1; $i++)
    {
        For($j = $i + 1; $j -lt $kPrimes.Count; $j++)
        {
            If($kPrimes[$j] - $kPrimes[$i] -eq $step)
            {
                If($i -ne $kPrimes.Count - 2){$result += ("(" + $kPrimes[$i] + ", " + $kPrimes[$j] + "), ")}
                Else{$result += ("(" + $kPrimes[$i] + ", " + $kPrimes[$j] + ")")}
            }
        }
    }

    return ($result + "]")
}

#kprimes-step 10 8 2425364 2425700
kprimes-step 6 8 2627408 2627504

<#
dotest 10 8 2425364 2425700 "[]"
dotest 6 8 2627408 2627504  "[(2627408, 2627416), (2627440, 2627448), (2627496, 2627504)]"
#>