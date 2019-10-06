#Euler’s Totient Function
function Phi($n)
{
    $result = $n

    for($i = 2; $i*$i -le $n; ++$i)
    {
        if($n % $i -eq 0)
        {
            while($n % $i -eq 0){$n = $n / $i}
            $result = $result - ($result / $i)
        }
    }

    if($n -gt 1){$result = $result - ($result / $n)}
    
    return $result
}

function Cycle
{
    [OutputType([int])]
    Param ([int]$n)

    #If not coprimes
    if($n % 2 -eq 0 -or $n % 5 -eq 0){return -1}

    #If coprimes
    $phiResult = Phi $n

    $cycle = -1
    $numStr = ([decimal](1 / $n)).ToString()
    $decimalsStr = $numStr.Substring($numStr.IndexOf(".")+1)

    ForEach($i in (1..$phiResult))
    {
        if($i * 2 -le $decimalsStr.Length)
        {
            if($decimalsStr.Substring(0,$i) -eq $decimalsStr.Substring($i,$i))
            {
                $cycle = $i
                break
            }
        }
        else{break}
    }

    return $cycle
}

Cycle 1
Cycle 3 #1
Cycle 33 #2
Cycle 18118 #-1
Cycle 5 #-1
Cycle 13 #6
Cycle 21 #6
Cycle 27 #3
Cycle 33 #2
Cycle 37 #3
Cycle 94 #-1
Cycle 22 #-1
Cycle 69 # 22
Cycle 70147 #2730

<#
function dotest($n, $expect) 
{
    Write-Host "n : " $n
    $ans = Cycle $n
    Write-Host "actual " $ans
    Write-Host "expect " $expect
    $ans | Should -Be $expect
    Write-Host "*"
}

function fixed()
{
    dotest 3 1
    dotest 33 2
    dotest 18118 -1
     
}

Describe "Cycle" {
  Context "Fixed Tests" {
    It "Should Pass Fixed Tests" {
      fixed
    } 
  }
}
#>