::powershell -noexit "%~dp0\ChangeOrientation.ps1"

::powershell.exe -noexit "& '%~dp0ChangeOrientation.ps1'"

powershell.exe -ExecutionPolicy Bypass -File "%~dp0ChangeOrientation.ps1"
