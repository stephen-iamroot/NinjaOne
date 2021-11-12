@Echo Off
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Splashtop Inc.\Splashtop Remote Server" /v "CloudProxyEnable" /t REG_DWORD /d "1" /f
Exit

net stop SplashtopRemoteService
net start SplashtopRemoteService

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof