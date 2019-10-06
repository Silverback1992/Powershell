function part-list
{
    [OutputType([string])]
    Param ([string[]]$arr)
    
    $sol = @()
    $i = 0
    while($i -ne $arr.Length - 1)
    {
        $sol += ("(" + ($arr[0..$i] -join " ") + ", " + ($arr[($i+1)..($arr.Length-1)] -join " ") + ")")
        $i++
    }

    return $sol -join ""
}


part-list -arr @("az", "toto", "picaro", "zone", "kiwi")

#a = ["az", "toto", "picaro", "zone", "kiwi"] -->
#[["az", "toto picaro zone kiwi"], ["az toto", "picaro zone kiwi"], ["az toto picaro", "zone kiwi"], ["az toto picaro zone", "kiwi"]]