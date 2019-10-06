function CountCharOccurances([string]$s)
{
    
    $occurenceDict = @{}

    ForEach($char in $s.Replace(" ","").ToCharArray())
    {
        if($char -cmatch "^[a-z]*$")
        {
            $counter = 0
        
            if(-Not $occurenceDict.ContainsKey($char))
            {
                ForEach($subChar in $s.ToCharArray())
                {
                    if($subChar -eq $char -and $subChar -cmatch "^[a-z]*$"){$counter++}
                }
            }

            if($counter -gt 1){$occurenceDict.Add($char,$counter)}
        }
    }

    return $occurenceDict
}

function ConcatenateDicts([hashtable]$s1Dict, [hashtable]$s2Dict)
{
    [array]$concatenatedDict = @{}

    ForEach($key in $s1Dict.Keys)
    {
        if(-Not $s2Dict.ContainsKey($key))
        {
            $concatenatedDict += "1:" + ($key.ToString() * $s1Dict[$key])
        }
        else
        {
            if($s2Dict[$key] -lt $s1Dict[$key])
            {
                $concatenatedDict += "1:" + ($key.ToString() * $s1Dict[$key])
            }
            elseif($s2Dict[$key] -gt $s1Dict[$key])
            {
                $concatenatedDict += "2:" + ($key.ToString() * $s2Dict[$key])
            }
            else
            {
                $concatenatedDict += "E:" + ($key.ToString() * $s1Dict[$key])
            }
        }
    }

    ForEach($key in $s2Dict.Keys)
    {
        if(-Not $s1Dict.ContainsKey($key))
        {
            $concatenatedDict += "2:" + ($key.ToString() * $s2Dict[$key])
        }
    }

    return $concatenatedDict
}

function mix($s1, $s2) 
{
    [hashtable]$s1Dict = CountCharOccurances -s $s1
    [hashtable]$s2Dict = CountCharOccurances -s $s2
    
    [array]$s1s2Concatenated = ConcatenateDicts -s1Dict $s1Dict -s2Dict $s2Dict
    [array]$sortedByLength = $s1s2Concatenated | Sort-Object -Property Length -Descending
    [array]$s1s2Sorted = $s1s2Concatenated | Sort-Object

    [string]$result = ""
    For($i = 0; $i -lt $s1s2Sorted.Count - 1; $i++)
    {
        if($i -eq $s1s2Sorted.Count - 2){$result += ($s1s2Sorted[$i])}
        else{$result += ($s1s2Sorted[$i] + "/")}
        
    }

    return $result
}

mix -s1 "Are they here" -s2 "yes, they are here"
mix -s1 "uuuuuu" -s2 "uuuuuu"
mix -s1 "looping is fun but dangerous" -s2 "less dangerous than coding"
mix -s1 " In many languages" -s2 " there's a pair of functions"
mix -s1 "Lords of the Fallen" -s2 "gamekult"
mix -s1 "codewars" -s2 "codewars"
mix -s1 "A generation must confront the looming " -s2 "codewarrs"

<#
testing "Are they here" "yes, they are here" "2:eeeee/2:yy/E:hh/E:rr"
testing "uuuuuu" "uuuuuu" "E:uuuuuu"
testing "looping is fun but dangerous" "less dangerous than coding" "1:ooo/1:uuu/2:sss/E:nnn/1:ii/2:aa/2:dd/2:ee/E:gg"
testing " In many languages" " there's a pair of functions" "1:aaa/1:nnn/1:gg/2:ee/2:ff/2:ii/2:oo/2:rr/2:ss/2:tt"
testing "Lords of the Fallen" "gamekult" "1:ee/1:ll/1:oo"
testing "codewars" "codewars" ""
testing "A generation must confront the looming " "codewarrs" "1:nnnnn/1:ooooo/1:tttt/1:eee/1:gg/1:ii/1:mm/E:rr"
#>