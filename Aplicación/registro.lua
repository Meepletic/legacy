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
local ANTERIOR  = composer.getSceneName("previous")
local OVERLAY  = composer.getSceneName("overlay")


-- Crear escena
local escena = composer.newScene()


-- Ejecuta su contenido cuando la escena se crea
function escena:create(evento)
    print("\nEscena creada:\t"..ACTUAL)

    local vista = self.view

    -- Crear un fondo blanco que ocupe toda la pantalla
    local fondo = display.newRect(centroX, centroY, ancho, alto)
    fondo:setFillColor(1, 1, 1)

    -- Crear formulario de registro
    local formulario = display.newGroup()

    do
        local cuadro = display.newRoundedRect(formulario, centroX, alto * 0.4, ancho * 0.8, ancho, 20)
        cuadro:setFillColor(1, 1, 1)
        cuadro.strokeWidth = 2
        cuadro:setStrokeColor(0, 0, 0)

        local usuario = display.newText(formulario, "Usuario", centroX, 100, native.systemFont, 24)
        usuario:setFillColor(0, 0, 0)

        local datosUsuario = native.newTextField(centroX, 150, 200, 30)
        datosUsuario.inputType = "no-emoji"
        formulario:insert(datosUsuario)

        local contra = display.newText(formulario, "Contraseña", centroX, 200, native.systemFont, 24)
        contra:setFillColor(0, 0, 0)

        local datosContra = native.newTextField(centroX, 250, 200, 30)
        datosContra.isSecure = true
        datosContra.inputType = "no-emoji"
        formulario:insert(datosContra)
    end

    -- Crear un botón para ir a la pantalla 'principal'
    local boton = widget.newButton(
            {
                -- Decoración
                label       = "Verificar datos",
                labelColor  = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
                defaultFile = "Imagenes/boton-verde.png",
                overFile    = "Imagenes/boton-marcado.png",
                -- Posición y tamaño
                x       = centroX,
                y       = alto * 0.85,
                width   = 110,
                height  = 40,
                -- Función
                onEvent = function(evento)
                    -- Cargar la escena 'principal' tras pulsar el botón
                    if evento.phase == "ended" then
                        -- TODO: Comprobar que el usuario no existe y crearlo
                        composer.gotoScene("inicio", { effect = "slideDown", time = 250 })
                    end
                end
            }
    )


    -- Añadir todos los objetos a la vista
    vista:insert(fondo)
    vista:insert(formulario)
    vista:insert(boton)
end


-- Ejecuta su contenido cuando la escena se muestra
function escena:show(evento)
    local vista = self.view
    local fase  = evento.phase

    -- La escena está a punto de ser mostrada
    if fase == "will" then
        print(ACTUAL..":\tLa escena se está mostrando.")

        -- Llamado cuando la escena se ha mostrado
    elseif fase == "did" then
        print(ACTUAL..":\tLa escena se ha mostrado.")
    end
end


-- Ejecuta el contenido cuando se oculta la escena
function escena:hide(evento)
    local vista = self.view
    local fase  = evento.phase

    -- La escena está a punto de ser ocultada
    if fase == "will" then
        print(ACTUAL..":\tLa escena se está ocultando.")


        -- Llamado cuando la escena se ha ocultado
    elseif fase == "did" then
        print(ACTUAL..":\tLa escena se ha ocultado.")

        composer.removeScene("registro")
    end
end


-- Ejecuta el contenido cuando se elimina la escena
function escena:destroy(evento)
    local vista = self.view

    print(ACTUAL..":\tLa escena se ha eliminado.")
end


-- Ejecuta el contenido al pulsarse una tecla o botón del móvil
local function pulsacion(evento)

    -- Si se pulsa la tecla 'atrás' ('back') en Android, evita que se salga de la aplicación
    if (evento.keyName == "back") then
        if (system.getInfo("platform") == "android") then
            -- Volver a la escena anterior
            composer.gotoScene("bienvenida", { effect = "slideUp", time = 250 })

            return true
        end
    end

    -- ¡Importante! Devuelve 'falso' para indicar que esta aplicación NO está sobreescribiendo la tecla recibida,
    -- de esta forma, el sistema operativo ejecutará su gestor predeterminado para la tecla
    return false
end

---------------------------------------------------------------------------------

-- Configuración de los listeners
escena:addEventListener("create", escena)
escena:addEventListener("show", escena)
escena:addEventListener("hide", escena)
escena:addEventListener("destroy", escena)

Runtime:addEventListener("key", pulsacion)

---------------------------------------------------------------------------------

return escena
