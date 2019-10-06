function Get-TwoSum ([System.Array]$numbers, [int]$target)
{
    $idx1 = 0
    $idx2 = 0
    $canWeBreak = $false

    For($i = 0; $i -lt $numbers.Length; $i++)
    {
        For($j = $i + 1; $j -lt $numbers.Length; $j++)
        {
            if($numbers[$i] + $numbers[$j] -eq $target)
            {
                $idx1 = $i
                $idx2 = $j
                $canWeBreak = $true
                break
            }
        }

        if($canWeBreak){break}
    }

    return @($idx1,$idx2)
}

Get-TwoSum -numbers @(1, 2, 3) -target 4
Get-TwoSum -numbers @(1234, 5678, 9012) -target 14690
Get-TwoSum -numbers @(2, 2, 3) -target 4

<#
$expected = Get-TwoSum -numbers @(1, 2, 3) -target 4
$results = @(0, 2)

$expected = Get-TwoSum -numbers @(1234, 5678, 9012) -target 14690
$results = @(1, 2)
	
$expected = Get-TwoSum -numbers @(2, 2, 3) -target 4
$results = @(0, 1)
#>