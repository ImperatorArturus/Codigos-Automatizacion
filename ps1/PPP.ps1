# Cuantas horas queremos que se ejecute el codigo
param($hours = 9)
# minutos entre pulsacion y pulsacion
$minutes_interval = 3

$sleeping = $minutes_interval * 60
$laps = $hours * (60/$minutes_interval)
#echo $laps
$myShell = New-Object -com "Wscript.Shell"

# Bucle que ejecuta X veces esperando 240s entre cada bucle
for ($i = 0; $i -lt $laps; $i++) {
  Start-Sleep -Seconds $sleeping
  $myShell.sendkeys("p")
}

Start-Sleep -Seconds 0.5
$myShell.SendKeys("~")
$myShell.SendKeys("~")
$myShell.sendkeys("Proceso terminado ")
$myShell.SendKeys("~")
$myShell.SendKeys("Duracion: $hours horas")