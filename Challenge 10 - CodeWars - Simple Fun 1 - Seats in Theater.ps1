function seats_in_theater {
    [OutputType([int])]
    Param ([int]$total_col, [int]$total_row, [int]$col, [int]$row)
    
    if($total_col -eq $total_row -and $total_col -eq $col -and $total_col -eq $row)
    {
        return 0
    }
    else
    {
        return ($total_col - $col + 1) * ($total_row - $row)
    }
}

seats_in_theater -total_col 16 -total_row 11 -col 5 -row 3
seats_in_theater -total_col 1 -total_row 1 -col 1 -row 1
seats_in_theater -total_col 13 -total_row 6 -col 8 -row 3
seats_in_theater -total_col 60 -total_row 100 -col 60 -row 1
seats_in_theater -total_col 1000 -total_row 1000 -col 1000 -row 1000

<#
seats_in_theater 16 11 5 3 | Should Be 96
seats_in_theater 1 1 1 1 | Should Be 0
seats_in_theater 13 6 8 3 | Should Be 18
seats_in_theater 60 100 60 1 | Should Be 99
seats_in_theater 1000 1000 1000 1000 | Should Be 0
#>