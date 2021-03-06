local Base = require('utils.base')
local Pool = require('utils.pool')

local GameState = Base:subclass('GameState')

function GameState:initialize()
    self.pools = Pool()
    self.objects = Pool()
    self.clickable = Pool()
    self.pools:add(self.objects, self.clickable)
    self.finished = false
end

function GameState:update(dt)
    self.pools:update(dt)
end

function GameState:draw()
    self.pools:draw()
end

function GameState:mousemoved(x, y)
    self.clickable:mousemoved(x, y)
end

function GameState:mousepressed(x, y, button)
    self.clickable:mousepressed(x, y, button)
end

function GameState:isFinished()
    return self.finished
end

function GameState:next()
    error('No next state defined for ' .. self)
end

return GameState
