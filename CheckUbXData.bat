rem LKB 2014-2015 (C)
rem Getting data from uBx 6.0 to R script
@ECHO OFF



md SS
rem uBlox
FOR /f %%F IN ('dir /b *.ubx') DO (
	ECHO**Processing uBlox %%F...
	d:\Utils\TEQC\teqc.exe -ublox ubx +nav %%F.nav +obs %%F.obs %%F
rem -R %%F
)
	mv *.ubx SS\
	ECHO.


FOR /f %%F IN ('dir /b *.obs') DO (

	rem to start with process RINEX
	d:\Utils\GPSToolkit\bin\RinDump.exe -obs COM11_150919_095723_first_test.ubx.15o C1C L1C S1C> SV.Rdmp
	cat SV.Rdmp |tr -s " " "," | cut -d, -f2,4-19 | sed "1,7d" >SV.csv
)

