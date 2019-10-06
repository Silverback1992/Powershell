$array = @()

Get-ChildItem -Path Cert:\CurrentUser\My -recurse |
    Where-Object {$_.PSISContainer -eq $false} |
    foreach-object ({
    
    $obj = New-Object -TypeName PSObject
    $obj | Add-Member -MemberType NoteProperty -Name “DnsNameList” -Value $_.DnsNameList
    $obj | Add-Member -MemberType NoteProperty -Name “Issuer” -Value $_.Issuer
    $obj | Add-Member -MemberType NoteProperty -Name “IssuerName” -Value $_.IssuerName.Name
    $obj | Add-Member -MemberType NoteProperty -Name “NotAfter” -Value $_.NotAfter

    $array += $obj
    $obj = $null

    })

$array | Export-Csv -Path “C:\All Work\Temps\Cert.csv”