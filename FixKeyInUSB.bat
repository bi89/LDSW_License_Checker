@echo OFF

echo =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
echo Start Working
echo =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
echo It will take about 40 seconds!
echo =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

FOR /F "tokens=*" %%F IN ('wmic logicaldisk get deviceid^,volumename ^| find "NECTEC LDSW"') DO SET var=%%F

set var=%var:NECTEC LDSW =%
set var=%var: =%

DEL %var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt
DEL %var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt
DEL %var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt
DEL %var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt

cscript c:\LDSW_License_Checker\covert.vbs key %var%\NECTEC\serial_Starter\excelStarter\tsc.xls %var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt
cscript c:\LDSW_License_Checker\covert.vbs key %var%\NECTEC\serial_Starter\excelStarter\twPre.xls %var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt
cscript c:\LDSW_License_Checker\covert.vbs key %var%\NECTEC\serial_Starter\excelStarter\twPro.xls %var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt
cscript c:\LDSW_License_Checker\covert.vbs key %var%\NECTEC\serial_Starter\excelStarter\tws.xls %var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt

timeout /t 5 > nul

setlocal enabledelayedexpansion

for /F "tokens=*" %%A in (%var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt) do (
	set line=%%A
	echo !line:~2! > %var%\NECTEC\serial_Starter\txtStarter\ThSp_Starter.txt
)
for /F "tokens=*" %%B in (%var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt) do (
	set line=%%B
	echo !line:~2! > %var%\NECTEC\serial_Starter\txtStarter\wp_Starter.txt
)

for /F "tokens=*" %%C in (%var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt) do (
	set line=%%C
	echo !line:~2! > %var%\NECTEC\serial_Starter\txtStarter\ThWp_Starter.txt
)

for /F "tokens=*" %%D in (%var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt) do (
	set line=%%D
	echo !line:~2! > %var%\NECTEC\serial_Starter\txtStarter\ws_Starter.txt
	
)

echo DONE!
exit /b