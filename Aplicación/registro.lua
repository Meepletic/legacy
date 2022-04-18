-- Importar librerias
local composer  = require("composer")
local widget    = require("widget")


-- Mis accesos directos
local centroX   = display.contentCenterX
local centroY   = display.contentCenterY
local ancho     = display.contentWidth
local alto      = display.contentHeight


-- Crear escena
local escena = composer.newScene()


-- Ejecuta su contenido cuando la escena se crea
function escena:create(evento)
    local vista = self.view

    -- Crear un fondo blanco que ocupe toda la pantalla
    local fondo = display.newRect(centroX, centroY, ancho, alto)
    fondo:setFillColor(1, 1, 1)

    -- Crear texto para mostrar en la escena
    -- local titulo = display.newText("Registro", display.contentCenterX, 125, native.systemFont, 32)
    -- titulo:setFillColor(0, 0, 0)

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
    -- vista:insert(titulo)
    vista:insert(formulario)
    vista:insert(boton)
end


-- Ejecuta su contenido cuando la escena se muestra
function escena:show(evento)
    local vista = self.view
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
    local vista = self.view
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
    local vista = self.view

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
