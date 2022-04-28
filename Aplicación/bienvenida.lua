-- Importar librerias
local composer  = require("composer")
local widget    = require("widget")


-- Mis accesos directos
-- Pantalla
local centroX   = display.contentCenterX
local centroY   = display.contentCenterY
local ancho     = display.contentWidth
local alto      = display.contentHeight

-- Escenas
local ACTUAL    = composer.getSceneName("current")


-- Crear escena
local escena = composer.newScene()


-- Ejecuta su contenido cuando la escena se crea
function escena:create(evento)
    print("\nEscena creada:\t"..ACTUAL)

    local vista = self.view

    -- Crear un fondo blanco que ocupe toda la pantalla
    local fondo = display.newRect(centroX, centroY, ancho, alto)
    fondo:setFillColor(1, 1, 1)

    -- Mostrar el logo de la aplicación
    local logo = display.newImageRect("Imagenes/icono.png", ancho, ancho)
    logo.x = centroX
    logo.y = alto * 0.3

    -- Crear un botón para ir a la pantalla 'principal'
    local botonInicio = widget.newButton(
        {
            -- Decoración
            label       = "Iniciar sesión",
            fontSize    = ancho / alto,
            labelColor  = { default = {1, 1, 1}, over = {0, 0, 0, 0.5} },
            -- Forma
            shape           = "roundedRect",
            cornerRadius    = 40,
            fillColor       = { default = {0, 0.8, 1}, over = {0, 0, 0, 0.5} },
            strokeColor     = { default = {0, 0, 0}, over = {0, 0, 0} },
            strokeWidth     = 7.5,
            -- Posición y tamaño
            x       = centroX,
            y       = alto * 0.6,
            width   = ancho * 0.5,
            height  = alto * 0.1,
            -- Función
            onEvent = function(evento)
                -- Cargar la escena 'inicio' tras pulsar el botón
                if evento.phase == "ended" then
                    composer.gotoScene("inicio", { effect = "slideDown", time = 250 })
                end
            end
        }
    )

    -- Crear un botón para ir a la pantalla 'principal'
    local botonRegistro = widget.newButton(
        {
            -- Decoración
            label       = "Registrarse",
            fontSize    = ancho / alto,
            labelColor  = { default = {1, 1, 1}, over = {0, 0, 0, 0.5} },
            -- Forma
            shape           = "roundedRect",
            cornerRadius    = 40,
            fillColor       = { default = {1, 0, 1}, over = {0, 0, 0, 0.5} },
            strokeColor     = { default = {0, 0, 0}, over = {0, 0, 0} },
            strokeWidth     = 7.5,
            -- Posición y tamaño
            x       = centroX,
            y       = alto * 0.8,
            width   = ancho * 0.5,
            height  = alto * 0.1,
            -- Función
            onEvent = function(evento)
                -- Cargar la escena 'registro' tras pulsar el botón
                if evento.phase == "ended" then
                    composer.gotoScene("registro", { effect = "slideUp", time = 250 })
                end
            end
        }
    )


    -- Añadir todos los objetos a la vista
    vista:insert(fondo)
    vista:insert(logo)
    vista:insert(botonInicio)
    vista:insert(botonRegistro)
end


-- Ejecuta su contenido cuando la escena se muestra
function escena:show(evento)
    local fase  = evento.phase

    -- La escena está a punto de ser mostrada
    if fase == "will" then
        print(ACTUAL..":\tLa escena se va a mostrar.")

    -- Llamado cuando la escena se ha mostrado
    elseif fase == "did" then
        print(ACTUAL..":\tLa escena se ha mostrado.")
    end
end


-- Ejecuta el contenido cuando se oculta la escena
function escena:hide(evento)
    local fase  = evento.phase

    -- La escena está a punto de ser ocultada
    if fase == "will" then
        print(ACTUAL..":\tLa escena se va a ocultar.")

        -- Llamado cuando la escena se ha ocultado
    elseif fase == "did" then
        print(ACTUAL..":\tLa escena se ha ocultado.")

        composer.removeScene("bienvenida")
    end
end


-- Ejecuta el contenido cuando se elimina la escena
function escena:destroy(evento)
    print(ACTUAL..":\tLa escena se ha eliminado.")

    -- local vista = self.view
end

---------------------------------------------------------------------------------

-- Configuración de los listeners
escena:addEventListener("create", escena)
escena:addEventListener("show", escena)
escena:addEventListener("hide", escena)
escena:addEventListener("destroy", escena)

---------------------------------------------------------------------------------

return escena
