$myShell = New-Object -com "Wscript.Shell"
# Importa la clase necesaria para enviar teclas
Add-Type -AssemblyName System.Windows.Forms

# Función recursiva para enviar la tecla de tabulador 10 veces
function SendTabKey($count) {
            if ($count -le 0) {
                return
            }
            # Envía la tecla de tabulador
            [System.Windows.Forms.SendKeys]::SendWait("{TAB}")

            # Espera un momento antes de la próxima pulsación
            Start-Sleep -Milliseconds 100

            # Llama recursivamente para enviar la tecla de tabulador nuevamente
            SendTabKey($count - 1)
        }





do {
    # Solicitar confirmación antes de ejecutar la tarea
    $confirm = Read-Host "¿Estás seguro de que deseas ejecutar la tarea? (Sí/No)"

    if ($confirm -eq "Si"-or $confirm -eq "Sí" -or $confirm -eq "si" -or $confirm -eq "sí" -or $confirm -eq "Y" -or $confirm -eq "y") {

        # Abre la configuracion de pantalla para proyectar en la pantalla 1
        Start-Process control -ArgumentList "desk.cpl"
        Start-Sleep -Seconds 1

        # Llama a la función para enviar la tecla de tabulador 11 veces
        SendTabKey(11)

        # Elegimos proyectar en el monitor 1
        $myShell.SendKeys("{ENTER}")
        Start-Sleep -Milliseconds 100
        $myShell.SendKeys("{DOWN}")
        Start-Sleep -Milliseconds 100
        $myShell.SendKeys("{ENTER}")

        # Llama a la función para enviar la tecla de tabulador 1 vez
        [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
        Start-Sleep -Milliseconds 100
        $myShell.SendKeys("{ENTER}")

        Start-Process -FilePath "F:\Imagenes\Nueva carpeta\IbTime.bat"
        Start-Sleep -Milliseconds 500

        # Abre TimeMaker en PowerShell ISE para editarlo
        powershell_ise.exe "F:\Imagenes\Nueva carpeta\ps1\TimeMaker.ps1"

    } else {
        Write-Host "Esperando 5 minutos..."

        # Esperar 5 minutos
        Start-Sleep -Seconds 300
    
    }
} while ($confirm -ne "Sí" -and $confirm -ne "sí" -and $confirm -ne "Y" -and $confirm -ne "y")



