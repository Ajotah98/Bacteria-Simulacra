local Conditions = {}

function Conditions:new(instance, sun)
    instance = instance or {}
    setmetatable(instance, self)
    self.__index = self
    self.sun = sun

    return instance
end

return Conditions