@echo off
set key=HKCU\Software\Microsoft\Internet Explorer\Main
set value=Start page
set data="http://10.1.5.212"
reg.exe add "%key%" /v "%value%" /d "%data%" /f