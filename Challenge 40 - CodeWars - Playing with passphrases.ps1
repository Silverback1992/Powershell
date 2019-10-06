function play-pass([string]$s, $n)
{
    $charArr = $s.ToCharArray()

    For($i = 0; $i -lt $charArr.Length; $i++)
    {
        if($charArr[$i] -match '[a-z]') #Powershell case insensitive
        {
            $ascii = [int][char]$charArr[$i]

            if($ascii + $n -gt 122 -and $ascii -in 97..122){$val = $ascii + $n - 26}
            elseif($ascii + $n -gt 90 -and $ascii -in 65..90){$val = $ascii + $n - 26}
            else{$val = $ascii + $n}

            if($i % 2 -eq 0){$charArr[$i] = ([char]$val).ToString().ToUpper()}
            else{$charArr[$i] = ([char]$val).ToString().ToLower()}
        }

        if($charArr[$i] -match '[0-9]'){$charArr[$i] = (9 - $charArr[$i].ToString().ToInt32($null)).ToString()}
    }

    [array]::Reverse($charArr)
    return $charArr -join ""
}

play-pass "BORN IN 2015!" 1
play-pass "I LOVE YOU!!!" 1
play-pass "I LOVE YOU!!!" 0
play-pass "AAABBCCY" 1
play-pass "wdN0OdBJNL34gHDviTKPh HaKtS" 20

#mNeUb bJeNcPxBa56FhDvXi9hXq
#MnE[B BjEnCpXbA56fHdV^I9H^Q