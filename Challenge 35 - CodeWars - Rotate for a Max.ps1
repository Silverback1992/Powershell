function max-rot($n)
{
    $max = $n
    $nStr = $n.ToString()

    For($i = 0; $i -lt $nStr.Length - 2; $i++)
    {
        if($i -eq 0){$tempStr = $nStr[($i+1)..($nStr.Length-1)] + $nStr[$i]}
        else{$tempStr = $tempStr[0..($i-1)] + $tempStr[($i+1)..($nStr.Length-1)] + $tempStr[$i]}
        
        $tempStr = -join $tempStr
        $tempNum = [long]$tempStr 
        if($tempNum -gt $max){$max = $tempNum}
    }

    return $max
}

max-rot 38458215 #85821534
max-rot 195881031 #988103115
max-rot 16130873362142 #63873362142110