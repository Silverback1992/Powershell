function int-rac([long]$n, [long]$guess)
{
    $e = 1
    $newGuess = [math]::Floor(($guess + $n / $guess) / 2)
    $count = 1

    while([math]::Abs($guess - $newGuess) -ge $e)
    {
        $guess = $newGuess
        $newGuess = [math]::Floor(($guess + $n / $guess) / 2)
        $count++
    }

    return $count
}

int-rac 125348 300
int-rac 236 12 
int-rac 48981764 8000
int-rac 25 1
int-rac 125348 300
int-rac 125348981764 356243

<#
testing 125348 300 3
testing 236 12 2 
testing 48981764 8000 3
#>