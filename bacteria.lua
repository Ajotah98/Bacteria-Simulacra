local Bacteria = {}

function Bacteria:new(instance, generation)
    instance = instance or {}
    setmetatable(instance, self)
    self.__index = self

    -- Inicializar propiedades para la instancia
    instance.ellipseX = math.random(1,1280)
    instance.ellipseY = math.random(1,720)
    instance.speedX = 20
    instance.speedY = 20
    instance.rotation = 0
    instance.rotationSpeed = math.pi / 4
    instance.generation = generation or 1

    return instance
end


function Bacteria:move_and_oscille()
    love.graphics.setColor(1, 1, 1)
    love.graphics.push()

    love.graphics.translate(self.ellipseX, self.ellipseY)
    love.graphics.rotate(self.rotation)
    love.graphics.ellipse("fill", 0, 0, 10, 5)

    love.graphics.pop()
end


function Bacteria:recalc_coords(dt)
        -- Actualizar la posición de la elipse
        self.ellipseX = self.ellipseX + self.speedX * dt
        self.ellipseY = self.ellipseY + self.speedY * dt
        
        -- Actualizar la rotación de la elipse
        self.rotation = self.rotation + self.rotationSpeed * dt * math.random(-2,2)
    
        self.speedX = math.random(-1,1) * 100
        self.speedY = math.random(-1,1) * 100
end

return Bacteria