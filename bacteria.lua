local Bacteria = {}

function Bacteria:new(instance, generation)
    instance = instance or {}
    setmetatable(instance, self)
    self.__index = self

    -- Inicializar propiedades para la instancia
    instance.ellipseX = instance.ellipseX or math.random(1,640)
    instance.ellipseY = instance.ellipseY or math.random(1,360)
    instance.speedX = instance.speedX or 20
    instance.speedY = instance.speedY or 20
    instance.rotation = instance.rotation or 0
    instance.rotationSpeed = instance.rotationSpeed or math.pi / 4
    instance.color = instance.color or {1,1,1}
    instance.generation = generation or 1

    return instance
end


function Bacteria:move_and_oscille()
    love.graphics.setColor(self.color)
    love.graphics.push()

    love.graphics.translate(self.ellipseX, self.ellipseY)
    love.graphics.rotate(self.rotation)
    love.graphics.ellipse("fill", 0, 0, 10, 5)

    love.graphics.pop()
end


function Bacteria:recalc_coords(dt)
    local windowWidth, windowHeight = love.graphics.getDimensions()

    -- Actualizar la posición de la elipse
    self.ellipseX = self.ellipseX + self.speedX * dt
    self.ellipseY = self.ellipseY + self.speedY * dt

    -- Verificar si está cerca de los bordes de la ventana
    if self.ellipseX <= 0 or self.ellipseX >= windowWidth then
        self.speedX = -self.speedX
    end
    if self.ellipseY <= 0 or self.ellipseY >= windowHeight then
        self.speedY = -self.speedY
    end

    -- Actualizar la rotación de la elipse
    self.rotation = self.rotation + self.rotationSpeed * dt * math.random(-2,2)
    
    self.speedX = math.random(-1,1) * 100
    self.speedY = math.random(-1,1) * 100
end

function Bacteria:reproduce(new_color, generation)
    local offspring = Bacteria:new({
        ellipseX = self.ellipseX + math.random(-10, 10),
        ellipseY = self.ellipseY + math.random(-10, 10),
        speedX = self.speedX + math.random(-5, 5),
        speedY = self.speedY + math.random(-5, 5),
        rotationSpeed = self.rotationSpeed,
        color = new_color
    }, generation or self.generation + 1)

    return offspring
end

return Bacteria