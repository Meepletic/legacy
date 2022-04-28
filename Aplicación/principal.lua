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

    -- Crear un botón para ir a la pantalla 'partidas'
    local botonPerfil = widget.newButton(
        {
            -- Decoración
            label       = "Perfil",
            fontSize    = ancho / alto,
            labelColor  = { default = {1, 1, 1}, over = {0, 0, 0, 0.5} },
            -- Forma
            shape           = "roundedRect",
            cornerRadius    = 20,
            fillColor       = { default = {1, 0.5, 0}, over = {0, 0, 0, 0.5} },
            strokeColor     = { default = {0, 0, 0}, over = {0, 0, 0} },
            strokeWidth     = 5,
            -- Posición y tamaño
            x       = centroX,
            y       = alto * 0.1,
            width   = ancho * 0.25,
            height  = alto * 0.05,
            -- Función
            onEvent = function(evento)
                -- Cargar la escena 'juegos' tras pulsar el botón
                if evento.phase == "ended" then
                    composer.gotoScene("partidas", { effect = "slideLeft", time = 250 })
                end
            end
        }
    )

    -- Crear un marco que muestre el nombre de un juego y su descripción
    local tarjeta = display.newGroup()

    do
        -- Crear el marco de la tarjeta
        local marco = display.newRoundedRect(tarjeta, centroX, alto * 0.45, ancho * 0.8, alto * 0.5, 20)
        marco:setFillColor(1, 1, 1)
        marco.strokeWidth = 7.5
        marco:setStrokeColor(0, 0, 0)

        -- Crear el texto del nombre del juego
        -- local nombre = display.newText(tarjeta, "Juego", marco.x, marco.height * 0.1, native.systemFontBold, 32)
        local nombre = display.newText(
            {
                parent  = tarjeta,
                -- Decoración
                text        = "Juego",
                font        = native.systemFontBold,
                fontSize    = ancho / alto,
                align       = "left",
                -- Posición y tamaño
                x       = marco.x,
                y       = marco.y - marco.height * 0.25,
                width   = ancho * 0.7,
                height  = marco.height * 0.25
            }
        )
        nombre:setFillColor(0, 0, 0)

        -- Crear el texto de la descripción del juego
        local descripcion = display.newText(
            {
                parent  = tarjeta,
                -- Decoración
                text        = "Descripción del juego...",
                font        = native.systemFont,
                fontSize    = ancho / alto / 2,
                align       = "left",
                -- Posición y tamaño
                x       = marco.x,
                y       = marco.y,
                width   = ancho * 0.7,
                height  = marco.height * 0.5,
            }
        )
        descripcion:setFillColor(0, 0, 0)

        -- Crear el texto de la lista de participantes
        local participantes = display.newText(
            {
                parent  = tarjeta,
                -- Decoración
                text        = "Participantes:",
                font        = native.systemFont,
                fontSize    = ancho / alto / 2,
                align       = "left",
                -- Posición y tamaño
                x       = marco.x,
                y       = marco.y + marco.height * 0.25,
                width   = ancho * 0.7,
                height  = marco.height * 0.25,
            }
        )
        participantes:setFillColor(0, 0, 0)
    end

    -- Crear un botón para descartar partidas
    local botonDescartar = widget.newButton(
        {
            -- Decoración
            defaultFile = "Imagenes/partida-descartar.png",
            overFile    = "Imagenes/partida-descartar-marcado.png",
            -- Posición y tamaño
            x       = ancho * 0.25,
            y       = alto * 0.8,
            width   = ancho * 0.2,
            height  = ancho * 0.2,
            -- Función
            onEvent = function(evento)
                -- Cargar la escena 'juegos' tras pulsar el botón
                if evento.phase == "ended" then
                    -- TODO: Eliminar partida de la tabla de partidas compatibles
                end
            end
        }
    )

    -- Crear un botón para aceptar partidas
    local botonAceptar = widget.newButton(
        {
            -- Decoración
            defaultFile = "Imagenes/partida-aceptar.png",
            overFile    = "Imagenes/partida-aceptar-marcado.png",
            -- Posición y tamaño
            x       = ancho * 0.75,
            y       = alto * 0.8,
            width   = ancho * 0.2,
            height  = ancho * 0.2,
            -- Función
            onEvent = function(evento)
                -- Cargar la escena 'juegos' tras pulsar el botón
                if evento.phase == "ended" then
                    -- TODO: Eliminar partida de la tabla de partidas compatibles y añadirla al historial de partidas
                end
            end
        }
    )


    -- Crear un botón para aceptar partidas
    local botonRecargar = widget.newButton(
        {
            -- Decoración
            defaultFile = "Imagenes/partida-recargar.png",
            overFile    = "Imagenes/partida-recargar-marcado.png",
            -- Posición y tamaño
            x       = centroX,
            y       = alto * 0.8,
            width   = ancho * 0.15,
            height  = ancho * 0.15,
            -- Función
            onEvent = function(evento)
                -- Cargar la escena 'juegos' tras pulsar el botón
                if evento.phase == "ended" then
                    -- TODO: Solicitar nuevas partidas para mostrar
                end
            end
        }
    )

    -- Añadir todos los objetos a la vista
    vista:insert(fondo)
    vista:insert(tarjeta)
    vista:insert(botonPerfil)
    vista:insert(botonDescartar)
    vista:insert(botonAceptar)
    vista:insert(botonRecargar)
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


-- Ejecuta el contenido al pulsarse una tecla o botón del móvil
local function pulsacion(evento)

    -- Si se pulsa la tecla 'atrás' ('back') en Android, evita que se salga de la aplicación
    if (evento.keyName == "back") then
        if (system.getInfo("platform") == "android") then
            -- Volver a la escena anterior
            composer.gotoScene("bienvenida", { effect = "slideDown", time = 250 })

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
