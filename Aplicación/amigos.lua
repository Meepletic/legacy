-- Importar librerias
local composer  = require("composer")
local widget    = require("widget")


-- Crear escena
local escena = composer.newScene()


-- Ejecuta su contenido cuando la escena se crea
function escena:create(evento)
    local vista = self.view

    -- Crear un fondo blanco que ocupe toda la pantalla
    local fondo = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    fondo:setFillColor(1, 1, 1)

    -- Crear texto para mostrar en la escena
    local titulo = display.newText("Perfil (amigos)", display.contentCenterX, 125, native.systemFont, 32)
    titulo:setFillColor(0, 0, 0)


    -- Crear botones para acceder a todas las opciones del perfil
    local botonJuegos = widget.newButton(
            {
                -- Decoración
                label       = "Juegos",
                labelColor  = { default={1, 1, 1}, over={ 0, 0, 0, 0.5 } },
                defaultFile = "Imagenes/boton-rojo.png",
                overFile    = "Imagenes/boton-marcado.png",
                -- Posición y tamaño
                x       = display.contentCenterX - display.contentWidth * 0.3,
                y       = display.contentHeight * 0.1,
                width   = 100,
                height  = 40,
                -- Función
                onEvent = function(evento)
                    -- Cargar la escena 'juegos' tras pulsar el botón
                    if evento.phase == "ended" then
                        composer.gotoScene("juegos", { time = 250 })
                    end
                end,

            }
    )

    local botonPartidas = widget.newButton(
            {
                -- Decoración
                label       = "Partidas",
                labelColor  = { default={1, 1, 1}, over={ 0, 0, 0, 0.5 } },
                defaultFile = "Imagenes/boton-amarillo.png",
                overFile    = "Imagenes/boton-marcado.png",
                -- Posición y tamaño
                x       = display.contentCenterX,
                y       = display.contentHeight * 0.1,
                width   = 100,
                height  = 40,
                -- Función
                onEvent = function(evento)
                    -- Cargar la escena 'juegos' tras pulsar el botón
                    if evento.phase == "ended" then
                        composer.gotoScene("partidas", { time = 250 })
                    end
                end
            }
    )

    local botonAmigos = widget.newButton(
            {
                -- Decoración
                label       = "Amigos",
                labelColor  = { default={ 0, 0, 0, 0.5 } },
                defaultFile = "Imagenes/boton-marcado.png",
                -- Posición y tamaño
                x       = display.contentCenterX + display.contentWidth * 0.3,
                y       = display.contentHeight * 0.1,
                width   = 100,
                height  = 40,
                -- Función
                onEvent = function(evento)
                    -- Cargar la escena 'juegos' tras pulsar el botón
                    if evento.phase == "ended" then
                        composer.gotoScene("amigos", { time = 250 })
                    end
                end,
                -- Botón selecionado
                isEnabled = false
            }
    )



    -- Añadir todos los objetos a la vista
    vista:insert(fondo)
    vista:insert(titulo)
    vista:insert(botonJuegos)
    vista:insert(botonPartidas)
    vista:insert(botonAmigos)
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
