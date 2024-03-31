local gui = {}

function gui:start()
    self.start_icon = love.graphics.newImage("images/start.png")
    self.pause_icon = love.graphics.newImage("images/pause.png")

    -- Añadir las posiciones y dimensiones iniciales de los íconos
    self.icons = {
        {icon = self.start_icon, x = 1240, y = 5, width = self.start_icon:getWidth(), height = self.start_icon:getHeight()},
        {icon = self.pause_icon, x = 1260, y = 5, width = self.pause_icon:getWidth(), height = self.pause_icon:getHeight()},
    }
end

function gui:update()
    local mouseX, mouseY = love.mouse.getPosition()

    for _, icon in ipairs(self.icons) do
        if mouseX >= icon.x and mouseX <= icon.x + icon.width and mouseY >= icon.y and mouseY <= icon.y + icon.height then
            -- Si el ratón está sobre el ícono, ajustar el tamaño
            icon.scale = 1 + math.sin(love.timer.getTime() * 5) * 0.1 -- Oscilación con el tiempo
        else
            icon.scale = 1 -- Tamaño normal
        end
    end
end

function gui:draw()
    for _, icon in ipairs(self.icons) do
        love.graphics.draw(icon.icon, icon.x, icon.y, 0, icon.scale or 1, icon.scale or 1)
    end
end

return gui