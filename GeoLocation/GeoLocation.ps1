$result = Invoke-RestMethod -Uri ('http://ipinfo.io/'+(Invoke-WebRequest -UseBasicParsing -uri "http://ifconfig.me/ip").Content) | Select ip,hostname,city,region,country,loc,org,postal

Ninja-Property-Set geoip $result