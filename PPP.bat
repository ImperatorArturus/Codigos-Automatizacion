@echo off

:: Abrir Bloc de notas
start notepad.exe

:: Esperar unos segundos para asegurarse de que Notepad esté completamente cargado.
timeout /t 4

:: Ejecutar el script de PowerShell
start /min powershell.exe -ExecutionPolicy Bypass -ExecutionPolicy Unrestricted -File "F:\Imagenes\Nueva Carpeta\ps1\PPP.ps1"


exit
