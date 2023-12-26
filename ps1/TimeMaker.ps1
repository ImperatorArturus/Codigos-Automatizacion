
# Cuantas minutos queremos retrasar la ejecución
#  $minutes = 5, 6, 7 ===> 08:35, 08:36, 08:37, etc...
param($minutes = 5) 

$sleeper = $minutes * 60

Start-Sleep -Seconds $sleeper


Add-Type -AssemblyName System.Windows.Forms

$myShell = New-Object -com "Wscript.Shell"

$screen = [System.Windows.Forms.SystemInformation]::VirtualScreen

# Función para hacer clic en una posición específica del ratón
function Click-MouseButton {

    param (
        [int]$x,
        [int]$y
    )

    $signature = @'
        [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
        public static extern void mouse_event(uint dwFlags, int dx, int dy, uint dwData, UIntPtr dwExtraInfo);
'@

    $SendMouseClick = Add-Type -MemberDefinition $signature -Name "Win32MouseEvent" -Namespace Win32Functions -PassThru

    # Valores para un clic izquierdo del ratón
    $leftMouseButtonDown = 0x0002
    $leftMouseButtonUp = 0x0004

    # Simular clic izquierdo del ratón
    $SendMouseClick::mouse_event($leftMouseButtonDown, $x, $y, 0, [UIntPtr]::Zero)
    $SendMouseClick::mouse_event($leftMouseButtonUp, $x, $y, 0, [UIntPtr]::Zero)
}


# Abre Microsoft Edge en la direccion indicada y esperamos que cargue
Start-Process "msedge" "https://ibystime.ibys.net/IbysTime/Marks/List.aspx" -WindowStyle Maximized



Start-Sleep -Seconds 5



# Doble ENTER para iniciar sesion
$myShell.sendkeys("{ENTER}")
Start-Sleep -Seconds 0.5
$myShell.sendkeys("{ENTER}")


# Guardamos la posicion de pantalla donde queremos hacer click
$screen.X = 210
$screen.Y = 180

#Vamos a la posicion de pantalla indicada
[Windows.Forms.Cursor]::Position = "$($screen.X),$($screen.Y)"


# Llamamos a la funcion para hacer click en esa posicion
Start-Sleep -Seconds 3
Click-MouseButton


# Paramos 2 sec y damos a ENTER
Start-Sleep -Seconds 2
$myShell.sendkeys("{ENTER}")

# Paramos 3 sec y damos a ENTER
Start-Sleep -Seconds 2
$myShell.sendkeys("{ENTER}")
Start-Sleep -Seconds 1
$myShell.sendkeys("{ENTER}")
