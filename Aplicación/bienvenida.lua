-- Importar librerias
local composer  = require("composer")
local widget    = require("widget")


-- Crear escena
local escena = composer.newScene()


-- Ejecuta su contenido cuando la escena se crea
function escena:create(evento)
    local grupo = self.view

    -- Crear un fondo blanco que ocupe toda la pantalla
    local fondo = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    fondo:setFillColor(1, 1, 1)

    -- Crear texto para mostrar en la escena
    local titulo = display.newText("Bienvenida", display.contentCenterX, 125, native.systemFont, 32)
    titulo:setFillColor(0, 0, 0)

    -- Crear un botón para ir a la pantalla 'principal'
    local botonInicio = widget.newButton(
            {
                -- Decoración
                label       = "Iniciar sesión",
                labelColor  = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
                defaultFile = "Imagenes/boton-azul.png",
                overFile    = "Imagenes/boton-marcado.png",
                -- Posición y tamaño
                x       = display.contentCenterX,
                y       = display.contentHeight * 0.6,
                width   = 100,
                height  = 40,
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
                label       = "Crear cuenta",
                labelColor  = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
                defaultFile = "Imagenes/boton-verde.png",
                overFile    = "Imagenes/boton-marcado.png",
                -- Posición y tamaño
                x       = display.contentCenterX,
                y       = display.contentHeight * 0.8,
                width   = 100,
                height  = 40,
                -- Función
                onEvent = function(evento)
                    -- Cargar la escena 'registro' tras pulsar el botón
                    if evento.phase == "ended" then
                        composer.gotoScene("registro", { effect = "slideUp", time = 250 })
                    end
                end
            }
    )


    -- Añadir todos los objetos al grupo
    grupo:insert(fondo)
    grupo:insert(titulo)
    grupo:insert(botonInicio)
    grupo:insert(botonRegistro)
end


-- Ejecuta su contenido cuando la escena se muestra
function escena:show(evento)
    local grupo = self.view
    local fase  = evento.phase

    -- La escena está a punto de ser mostrada
    if fase == "will" then
        -- TODO

        -- Llamado cuando la escena se ha mostrado
    elseif fase == "did" then
        -- TODO
    end
end


-- Ejecuta el contenido cuando se oculta la escena
function escena:hide(evento)
    local grupo = self.view
    local fase  = evento.phase

    -- La escena está a punto de ser ocultada
    if fase == "will" then
        -- TODO

        -- Llamado cuando la escena se ha ocultado
    elseif fase == "did" then
        -- TODO
    end
end


-- Ejecuta el contenido cuando se elimina la escena
function escena:destroy(evento)
    local grupo = self.view

    -- TODO
end

---------------------------------------------------------------------------------

-- Configuración de los listeners
escena:addEventListener("create", escena)
escena:addEventListener("show", escena)
escena:addEventListener("hide", escena)
escena:addEventListener("destroy", escena)

---------------------------------------------------------------------------------

return escena
