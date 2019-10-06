function mx-dif-lg($a1, $a2)
{
    $max = -1
    ForEach($s1item in $s1)
    {
        ForEach($s2item in $s2)
        {
            $tempMax = [math]::Abs($s1item.Length - $s2item.Length)
            if($tempMax -gt $max){$max = $tempMax}
        }
    }

    return $max
}

$s1 = "hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"
$s2 = "cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"
mx-dif-lg $s1 $s2 #13

$s1 = "ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"
$s2 = "bbbaaayddqbbrrrv"
mx-dif-lg $s1 $s2 #10

$s1 = ""
$s2 = "oocccffuucccjjjkkkjyyyeehh"
mx-dif-lg $s1 $s2 #26

$s1 = "txywcqubs", "rcximzvljw", "capguxo", "eqysu", "hdw", "gpclzfm", "swncyqvdhk", "hbirgalqpc", "szweilbuco", "ice", "xhulzea", "czobafpimlu", "giyaosxb", "kbcqlvoasuj"
$s2 = "xomw", "hatrn", "pjwgvlz", "dbi", "rlcndsbq", "mjqepant", "jibe", "tvmjy", "lekd", "kaw", "yt", "cgvylmfj", "tuqyzdsr", "ncujrzhaq"
mx-dif-lg $s1 $s2 #9