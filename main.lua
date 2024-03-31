-- Prints en pantalla
local bacteria = require("bacteria")
local gui = require("gui")


bacteria_instance = bacteria:new({},5)

function debug()
    love.graphics.print("Angulo = " .. bacteria_instance.rotation, 20, 20)
    love.graphics.print("Generacion = " .. bacteria_instance.generation, 20, 35)
    love.graphics.print("Posicion X = " .. bacteria_instance.ellipseX, 20, 50)
    love.graphics.print("Posicion Y = " .. bacteria_instance.ellipseY, 20, 65)
end


function love.load()
    love.window.setMode(1280,720)
    love.window.setTitle("Behavior Simulacra")
    gui:start()
end

function love.update(dt)
    gui:update()
    bacteria_instance:recalc_coords(dt)
end

function love.draw()
    gui:draw()
    bacteria_instance:move_and_oscille()
    debug()
end