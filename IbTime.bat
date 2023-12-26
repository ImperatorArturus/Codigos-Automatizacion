@echo off

:: Definir el valor del parámetro
set minutes=0

:: Ejecutar el script de PowerShell
start /min powershell.exe -ExecutionPolicy Bypass -ExecutionPolicy Unrestricted -File "F:\Imagenes\Nueva carpeta\ps1\TimeMaker.ps1" -minutes "%minutes%"

exit