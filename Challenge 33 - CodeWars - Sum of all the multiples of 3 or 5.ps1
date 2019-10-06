function findSum($n) 
{
    $sum = 0
    $i = 3
    $j = 5

    while($i -le $n)
    {
        $sum += $i
        $i += 3
        if($j -le $n)
        {
            $sum += $j
            $j += 5
        }
    }

    return $sum
}

findSum(5)    # 8
findSum(10)   # 33