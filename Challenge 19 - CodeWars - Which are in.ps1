function in-array
{
    [OutputType([string[]])]
    Param ([string[]]$a1, [string[]]$a2)

    [string[]]$arr = @()

    ForEach($member1 in $a1)
    {
        ForEach($member2 in $a2)
        {
            if($arr.Contains($member1)){break}

            if($member2.Contains($member1))
            {
                $arr += $member1
            }
        }
    }
    
    [array]::Sort($arr)
    return $arr    
}

$a1 = @("live", "arp", "strong") 
$a2 = @("lively", "alive", "harp", "sharp", "armstrong")
in-array -a1 $a1 -a2 $a2

$a3 = @("arp", "mice", "bull") 
$a4 = @("lively", "alive", "harp", "sharp", "armstrong")
in-array -a1 $a3 -a2 $a4

<#
$a1 = @("live", "arp", "strong") 
$a2 = @("lively", "alive", "harp", "sharp", "armstrong")
$r = @("arp", "live", "strong")
testing $a1 $a2 $r
    
$a1 = @("arp", "mice", "bull") 
$a2 = @("lively", "alive", "harp", "sharp", "armstrong")
$r = @("arp")
testing $a1 $a2 $r  
#>