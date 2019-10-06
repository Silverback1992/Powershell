function bouncing-ball
{
    [OutputType([int])]
    Param ([double]$h, [double]$bounce, [double]$window)

    #Condition Check
    if($h -le 0 -or $bounce -ge 1 -or $bounce -le 0 -or $window -ge $h){return -1}

    #Code
    $bounceCounter = 1

    while($h -gt $window)
    {
        $h = $h * $bounce
        if($h -gt $window){$bounceCounter+=2}
    }

    return $bounceCounter
}

bouncing-ball 3 0.66 1.5
bouncing-ball 10 0.6 10
bouncing-ball 40 1 10

<#
testing 3 0.66 1.5 3
testing 10 0.6 10 -1
testing 40 1 10 -1
#>    