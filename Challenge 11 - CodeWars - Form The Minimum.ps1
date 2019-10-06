function Get-MinValue ([int[]]$values)
{
    return -join ($values | Select-Object -Unique | Sort-Object)
}

Get-MinValue @(5, 7, 9, 5, 7)