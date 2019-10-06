function Get-HighestScoringWord([string]$s)
{ 
    $tempSum = 0
    $maxSum = 0
    $highestScoringWord = "" 

    ForEach($word in $s -split " ")
    {
        ForEach($char in $word.ToCharArray())
        {
            $tempSum += ([int]$char - 96)
        }

        if($tempSum -gt $maxSum)
        {
            $maxSum = $tempSum
            $highestScoringWord = $word
        }

        $tempSum = 0
    }

    return $highestScoringWord
}

Get-HighestScoringWord -s "man i need a taxi up to ubud"
Get-HighestScoringWord -s "what time are we climbing up to the volcano"
Get-HighestScoringWord -s "take me to semynak" 

<#
Get-HighestScoringWord("man i need a taxi up to ubud") | Should Be "taxi"
Get-HighestScoringWord("what time are we climbing up to the volcano") | Should Be "volcano"
Get-HighestScoringWord("take me to semynak") | Should Be "semynak"
#>