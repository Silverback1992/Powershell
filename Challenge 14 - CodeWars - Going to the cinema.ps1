function movie([int]$card, [int]$ticket, [double]$percent)
{
    $systemA = 0
    $systemB = $card
    $systemBCounter = 1
    $n = 0

    while([math]::Ceiling($systemB) -ge $systemA)
    {
        $systemA += $ticket
        $systemB += $ticket * [math]::Pow($percent,$systemBCounter) 
        $systemBCounter++
        $n++
    }

    return $n
}

movie -card 500 -ticket 15 -percent 0.9
movie -card 100 -ticket 10 -percent 0.95

<#
testing 500 15 0.9 43
testing 100 10 0.95 24
#>