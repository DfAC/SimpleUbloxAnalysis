rem LKB 2014-2015 (C)
rem Getting data from uBx 6.0 to R script
@ECHO OFF

rem first lets get RINEX out

md SS
rem uBlox
FOR /f %%F IN ('dir /b *.ubx') DO (
	ECHO**Processing uBlox %%F...
	d:\Utils\TEQC\teqc.exe -ublox ubx +nav %%~nF.nav +obs %%~nF.obs %%F
rem -R %%F
)
	mv *.ubx SS\
	ECHO.	


rem Now lets extract values in data frame format

FOR /f %%F IN ('dir /b *.obs') DO (

	rem to start with process RINEX
	d:\Utils\GPSToolkit\bin\RinDump.exe --ref "3850179.7690,79543.5650,5067398.3140" --obs %%F --nav %%~nF.nav C1C L1C S1C  > SV.Rdmp
	rem ELE AZI RNG crash RinDump, RTKLib reads RAW ubx properly, check this
	cat SV.Rdmp |tr -s " " "," | cut -d, -f2-19 | sed "1,8d" >SV.csv
)

del SV.Rdmp, *.obs, *.nav

