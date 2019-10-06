function comp($a1, $a2)
{
    if($a1 -eq $null -or $a2 -eq $null){return $false}
    if($a1.Count -eq 0 -and $a2.Count -eq 0){return $true}
    if($a1.Count -eq 0 -or $a2.Count -eq 0){return $false}
    if($a2.Count -gt $a1.Count){return $false}
    
    $allExists = $true

    ForEach($a1Elem in $a1)
    {
        $same = $false

        For($i = 0; $i -lt $a2.Count; $i++)
        {
            if(($a1Elem*$a1Elem) -eq $a2[$i])
            {
                $same=$true
                if($i -eq 0){$a2 = $a2[($i+1)..($a2.Count-1)]}
                else{$a2 = $a2[0..($i-1)] + $a2[($i+1)..($a2.Count-1)]}
                break
            }
        }

        if(-Not $same){$allExists = $false}
    }
    
    return $allExists
}

$a1 = 150, 14, 571, 198, 402, 562, 85 
$a2 = 161605, 22500, 39204, 161604, 7225, 326041, 196, 315844 
comp $a1 $a2 #False
$a1 = 2,2,3
$a2 = 4,9,9,9
comp $a1 $a2 #false
$a1 = 150, 14, 571, 198, 402, 562, 85
$a2 = 161605, 315844 
comp $a1 $a2 #false
$a1 =  121, 144, 19, 161, 19, 144, 19, 11 
$a2 =  14641, 20736, 361, 25921, 361, 20736, 361, 121 
comp $a1 $a2 #$true
$a1 =  121, 144, 19, 161, 19, 144, 19, 11 
$a2 =  231, 20736, 361, 25921, 361, 20736, 361, 121
comp $a1 $a2 #$false   
$a1 = 121, 144, 19, 161, 19, 144, 19, 11
$a2 = 14641, 20736, 3610, 25921, 361, 20736, 361, 121
comp $a1 $a2 #false

