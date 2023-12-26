from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.edge.service import Service

# Ruta del controlador de Microsoft Edge (msedgedriver.exe)
# Asegúrate de descargar el controlador compatible con tu versión de Edge
# y ajusta la ruta según sea necesario.
edge_driver_path = "F:\\Descargas\\msedgedriver.exe"

# Configuración del controlador de Edge
options = webdriver.EdgeOptions()
#options.use_chromium = True
options.add_argument("start-maximized")  # Abre la ventana maximizada

# Crear un objeto Service y pasar la ruta al ejecutable
edge_service = Service(edge_driver_path)

# Inicializar el controlador de Edge con el objeto Service
driver = webdriver.Edge(service=edge_service, options=options)

# Abre la página web
url = "https://ibystime.ibys.net/IbysTime/Marks/List.aspx"
driver.get(url)

"""# Espera un tiempo para que la página cargue completamente (puedes ajustar este tiempo según sea necesario)
driver.implicitly_wait(5)

# Encuentra el botón por XPath y haz clic en él
xpath_del_boton = "tu_xpath_aqui"  # Reemplaza esto con el XPath correcto del botón
boton = driver.find_element(By.XPATH, xpath_del_boton)
boton.click()"""

# Cierra el navegador al finalizar
driver.quit()


