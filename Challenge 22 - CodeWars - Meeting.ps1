function FormatName([string]$fullName)
{
    $firstName = $fullName.Substring(0, $fullName.IndexOf(":"))
    $lastName = $fullName.Substring($fullName.IndexOf(":") + 1)
    return ("(" + $lastName + ", " + $firstName + ")")
}

function meeting($s)
{
    $s = $s.ToUpper()
    $arr = $s.split(";")

    For($i = 0; $i -lt $arr.Length; $i++)
    {
        $arr[$i] = FormatName($arr[$i])
    }

    [array]::Sort($arr)
    return $arr -join ""
}

$test1 = "Alexis:Wahl;John:Bell;Victoria:Schwarz;Abba:Dorny;Grace:Meta;Ann:Arno;Madison:STAN;Alex:Cornwell;Lewis:Kern;Megan:Stan;Alex:Korn" 
meeting -s $test1 
$test2 = "John:Gates;Michael:Wahl;Megan:Bell;Paul:Dorries;James:Dorny;Lewis:Steve;Alex:Meta;Elizabeth:Russel;Anna:Korn;Ann:Kern;Amber:Cornwell"
meeting -s $test2

<#
$a = "Alexis:Wahl;John:Bell;Victoria:Schwarz;Abba:Dorny;Grace:Meta;Ann:Arno;Madison:STAN;Alex:Cornwell;Lewis:Kern;Megan:Stan;Alex:Korn" 
testing $a "(ARNO, ANN)(BELL, JOHN)(CORNWELL, ALEX)(DORNY, ABBA)(KERN, LEWIS)(KORN, ALEX)(META, GRACE)(SCHWARZ, VICTORIA)(STAN, MADISON)(STAN, MEGAN)(WAHL, ALEXIS)"
$a = "John:Gates;Michael:Wahl;Megan:Bell;Paul:Dorries;James:Dorny;Lewis:Steve;Alex:Meta;Elizabeth:Russel;Anna:Korn;Ann:Kern;Amber:Cornwell"
testing $a "(BELL, MEGAN)(CORNWELL, AMBER)(DORNY, JAMES)(DORRIES, PAUL)(GATES, JOHN)(KERN, ANN)(KORN, ANNA)(META, ALEX)(RUSSEL, ELIZABETH)(STEVE, LEWIS)(WAHL, MICHAEL)"
#>