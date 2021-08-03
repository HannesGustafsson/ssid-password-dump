(netsh wlan show profiles) |
Select-String "\:(.+)$" |
%{$name=$_.Matches.Groups[1].Value.Trim(); $_} |
%{(netsh wlan show profile name="$name" key=clear)}  |
Select-String "Key Content\W+\:(.+)$" |
%{$pass=$_.Matches.Groups[1].Value.Trim(); $_} |
%{[PSCustomObject]@{ SSID_NAME=$name;PASSWORD=$pass }} |
Format-Table -AutoSize |
Out-File -Append -FilePath .\PW_DUMP.txt