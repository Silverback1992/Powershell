function PascalRow($n)
{
    $line = @(1)
    
    ForEach($i in (0..($n-1))){$line += $line[$i] * ($n-$i) / ($i+1)}

    return $line
}

function check-choose([long]$m, [int]$n) 
{
    $pRow = PascalRow($n)
    For($i = 0; $i -lt $pRow.Count; $i++)
    {
        if($pRow[$i] -eq $m){return $i}
    }

    return -1
}

#PascalRow 9

check-choose 6 4 #2
check-choose 4 4 #1
check-choose 4 2 #-1
check-choose 35 7 #3
check-choose 36 7 #-1

$a = 47129212243960
check-choose $a 50 #20
check-choose ($a + 1) 50 #-1