-- Prints en pantalla
local bacteria = require("bacteria")
local gui = require("gui")

local bacterias = {}
table.insert(bacterias,bacteria:new())


local timer = 0
local total_time = 0

local function debug()
    love.graphics.print("Timer = " .. timer, 20, 20)
    love.graphics.print("Total_time = " .. total_time, 20, 35)
    love.graphics.print("Total_bact = " .. #bacterias, 20, 50)
end

function love.load()
    love.window.setMode(1280,720)
    love.window.setTitle("Behavior Simulacra")
    gui:start()
end

function love.update(dt)
    gui:update()
    timer = timer + dt
    total_time = total_time + dt
    if timer >= 5 then
        timer = 0
        local selectedBacteria = bacterias[math.random(#bacterias)]
        local newBacteria = selectedBacteria:reproduce({math.random(),math.random(), math.random()}, #bacterias)
        table.insert(bacterias, newBacteria)
    end

    for _, bacteria in ipairs(bacterias) do
        bacteria:recalc_coords(dt)
    end
end

function love.draw()
    gui:draw()
    for _, bacteria in ipairs(bacterias) do
        bacteria:move_and_oscille()
    end
    love.graphics.setColor(1, 1, 1)

    debug()
end