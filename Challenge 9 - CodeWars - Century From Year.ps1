function Get-CenturyFromYear ([int]$year)
{
    if($year % 100 -ne 0)
    {
        return [math]::Floor($year / 100) + 1
    }
    else
    {
        return $year / 100
    }
}

Get-CenturyFromYear -year 1705
Get-CenturyFromYear -year 2000
Get-CenturyFromYear -year 1
Get-CenturyFromYear -year 273999
