-- Importar las librerías necesarias
local composer  = require("composer")



-- Mostrar la barra de estado por defecto (iOS)
display.setStatusBar(display.DefaultStatusBar)


-- Iniciar la aplicación en la ventana de inicio
composer.gotoScene("bienvenida", {effect = "fade", time = 500})
