function get-gps($s, $x) 
{
    $maxAvg = 0

    For($i = 1; $i -lt $x.Count; $i++)
    {
        $currentAvg = 3600 * ($x[$i] - $x[$i-1]) / $s
        if($currentAvg -gt $maxAvg){$maxAvg = [math]::Floor($currentAvg)}
    }

    return $maxAvg
}

$x = 0.0, 0.23, 0.46, 0.69, 0.92, 1.15, 1.38, 1.61
$s = 20
get-gps $s $x #41
$x = 0.0, 0.11, 0.22, 0.33, 0.44, 0.65, 1.08, 1.26, 1.68, 1.89, 2.1, 2.31, 2.52, 3.25
$s = 12
get-gps $s $x #219
$x = 0.0, 0.18, 0.36, 0.54, 0.72, 1.05, 1.26, 1.47, 1.92, 2.16, 2.4, 2.64, 2.88, 3.12, 3.36, 3.6, 3.84
$s = 20
get-gps $s $x #80