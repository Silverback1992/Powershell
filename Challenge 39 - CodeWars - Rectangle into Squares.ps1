function sq-in-rect($lng, $wdth)
{
    if($lng -eq $wdth){return "nil"}

    [string]$result = ""
    
    while($lng -ne 0 -and $wdth -ne 0)
    {
        if($lng -gt $wdth)
        {
            $lng = $lng - $wdth
            $result += ($wdth.ToString() + " ") 

            while($lng -ge $wdth)
            {
                $lng = $lng - $wdth
                $result += ($wdth.ToString() + " ") 
            }
        }
        else
        {
            $wdth = $wdth - $lng
            $result += ($lng.ToString() + " ")

            while($wdth -ge $lng)
            {
                $wdth = $wdth - $lng
                $result += ($lng.ToString() + " ")
            }
        }
    }

    return $result.TrimEnd()
}

sq-in-rect 20 20 #"nil"
sq-in-rect 20 14 #"14 6 6 2 2 2"
sq-in-rect 5 3 #"3 2 1 1"
