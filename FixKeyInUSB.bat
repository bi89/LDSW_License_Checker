@echo OFF

echo =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
echo Start Working
echo =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
echo It will done in 30 seconds!
echo =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

FOR /F "tokens=*" %%F IN ('wmic logicaldisk get deviceid^,volumename ^| find "NECTEC LDSW"') DO SET var=%%F

set var=%var:NECTEC LDSW =%
set var=%var: =%

DEL %var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt
DEL %var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt
DEL %var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt
DEL %var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt

timeout /t 15 > nul

cscript c:\LDSW_License_Checker\covert.vbs key %var%\NECTEC\serial_Starter\excelStarter\tsc.xls %var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt
cscript c:\LDSW_License_Checker\covert.vbs key %var%\NECTEC\serial_Starter\excelStarter\twPre.xls %var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt
cscript c:\LDSW_License_Checker\covert.vbs key %var%\NECTEC\serial_Starter\excelStarter\twPro.xls %var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt
cscript c:\LDSW_License_Checker\covert.vbs key %var%\NECTEC\serial_Starter\excelStarter\tws.xls %var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt

type %var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt | findstr /v License | findstr /v Thai | findstr /v No | findstr /b 1, > %var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt

setlocal enabledelayedexpansion

for /F "tokens=*" %%A in (%var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt) do (
	set line=%%A
	echo !line:~2! > %var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt
)

type %var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt | findstr /v License | findstr /v Thai | findstr /v No | findstr /b 1, > %var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt

setlocal enabledelayedexpansion

for /F "tokens=*" %%B in (%var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt) do (
	set line=%%B
	echo !line:~2! > %var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt
)

type %var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt | findstr /v License | findstr /v Thai | findstr /v No | findstr /b 1, > %var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt

setlocal enabledelayedexpansion

for /F "tokens=*" %%C in (%var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt) do (
	set line=%%C
	echo !line:~2! > %var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt
)

type %var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt | findstr /v License | findstr /v Thai | findstr /v No | findstr /b 1, > %var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt

setlocal enabledelayedexpansion

for /F "tokens=*" %%D in (%var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt) do (
	set line=%%D
	echo !line:~2! > %var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt
)

exit /b