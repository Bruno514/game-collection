local colors = {"1" : red, "2" : green, "3" : blue, "4" : yellow}

local currentSequence = tostring(math.random(#colors))

function getNextTile()
    local randomTile = tostring(math.random(#colors))
    currentSequence = currentSequence + randomTile
end

function tileToColor(tileToConv)
    local color = colors[tileToConv]
    return color
end

isPlaying = false

function love.load()
  playButton = {"x" = love.graphics.getWidth() / 2, "y" = love.graphics.getHeight(), "width" = 200, "height" = 100}
end

function love.update(dt)
end

function love.draw()
end