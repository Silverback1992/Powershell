function factorial($n)
{
    if($n -eq 1){return 1}
    else{return $n * (factorial($n - 1))}
}

function diagonal($n, $p)
{
    return [Convert]::ToInt64((factorial($n + 1)) / ((factorial($n - $p)) * (factorial($p + 1))))
}

diagonal -n 7 -p 1
diagonal -n 7 -p 2
diagonal -n 20 -p 3
diagonal -n 20 -p 4
diagonal -n 20 -p 5
diagonal -n 20 -p 15

<#
S(7, 1) 28 
S(7, 2) 56
testing 20 3  5985
testing 20 4  20349
testing 20 5  54264
testing 20 15  20349
#>