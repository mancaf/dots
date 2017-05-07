local class = require('utils.class')

local Pool = class('Pool')

function Pool:initialize()
    self.objects = {}
end

function Pool:add(object, key)
    table.insert(self.objects, object)
    if key then self.objects[key] = object end
end

function Pool:update(dt)
    for _, object in ipairs(self.objects) do
        object:update(dt)
    end
end

function Pool:draw()
    for _, object in ipairs(self.objects) do
        object:draw()
    end
end

function Pool:find(callback)
    for _, object in ipairs(self.objects) do
        if callback(object) then return object end
    end
    return nil
end

return Pool
