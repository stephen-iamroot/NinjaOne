### Toggle the CloudProxyEnable to TRUE, allowing splashtop to go through proxies configured in windows ###
Set-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Splashtop Inc.\Splashtop Remote Server" CloudProxyEnable 1

### Restart the service so change takes effect ###
Restart-Service -Name SplashtopRemoteService