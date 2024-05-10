local colors = {"red", "green", "blue", "yellow"}

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
  love.window.setTitle("Simon")
  playBtnFont = love.graphics.setNewFont(20)
  playBtn = {x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2, w = 200, h = 100}
  playBtnText = "Jogar"
end

function love.update(dt)
end

function love.draw()
  love.graphics.setBackgroundColor(20/255, 20/255, 20/255)
  if isPlaying == false then
    local fontHeight = playBtnFont:getHeight(playBtnText) -- font expected, got null
    local fontWidth = playBtnFont:getWidth(playBtnText)

    love.graphics.rectangle("fill", playBtn.x - (playBtn.w / 2), playBtn.y - (playBtn.h / 2), playBtn.w, playBtn.h, 20)
    love.graphics.setFont(playBtnFont)
    love.graphics.print({{0,0,0}, playBtnText}, playBtn.x - (fontWidth / 2), playBtn.y - (fontHeight / 2))
  else
    love.graphics.setFont(playBtnFont)
    love.graphics.print("JOGANDO", 20, 20)
  end

end