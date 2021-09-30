$dnslist = Get-Content ./dnslist.txt

$Results = foreach ($villain in $dnslist)
{
    Resolve-DNSName -type A -Name $villain -DnsOnly -QuickTimeout -ErrorAction SilentlyContinue 
}

$Results | Select Name,IPAddress | Export-Csv c:\temp\dga$((Get-date).ToString("yyyyMMdd")).csv -NoTypeInformation -Delimiter ";"