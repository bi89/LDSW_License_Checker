@echo OFF

mkdir %UserProfile%\Desktop\NECTEC
mkdir %UserProfile%\Desktop\NECTEC\serial_Starter\
mkdir %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter

FOR /F "tokens=*" %%F IN ('wmic logicaldisk get deviceid^,volumename ^| find "NECTEC LDSW"') DO SET var=%%F

set var=%var:NECTEC LDSW =%
set var=%var: =%

copy %var%\NECTEC\serial_Starter\excelStarter\tsc.xls %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter\tsc.xls
copy %var%\NECTEC\serial_Starter\excelStarter\twPre.xls %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter\twPre.xls
copy %var%\NECTEC\serial_Starter\excelStarter\twPro.xls %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter\twPro.xls
copy %var%\NECTEC\serial_Starter\excelStarter\tws.xls %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter\tws.xls

start %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter\tsc.xls
start %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter\twPre.xls
start %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter\twPro.xls
start %UserProfile%\Desktop\NECTEC\serial_Starter\excelStarter\tws.xls

exit /b