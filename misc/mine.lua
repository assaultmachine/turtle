local nav = require("navigation")

local function isOre(data)
    if not data or not data.name then
        return false end
    return data.name == "minecraft:raw_copper"
end

local function dropJunk()
    for i = 1, 16 do
        turtle.select(i)
        local data = turtle.getItemDetail()
        if data and not isOre(data) then
            turtle.drop()
        end
    end
    turtle.select(1)
end


local function mineLayer(length, width)
    local forward = true
    for x = 1, width do
        for y = 1, length - 1 do
            if turtle.detect() then
                turtle.dig()
            end
            nav.forward(turtle)
            
            if turtle.detectUp() then
                turtle.digUp()
            end
            
            if turtle.detectDown() then
                turtle.digDown()
            end
        end
        
        if turtle.detectDown() then
            turtle.digDown()
        end
        
        if x < width then
            if forward then
                nav.turnRight(turtle)
                if turtle.detectDown() then
                    turtle.digDown()
                end
                nav.forward(turtle)
                nav.turnRight(turtle)
            else
                nav.turnLeft(turtle)
                if turtle.detectDown() then
                    turtle.digDown()
                end
                nav.forward(turtle)
                nav.turnLeft(turtle)
            end
            forward = not forward
        end
       dropJunk() 
    end
end

local function mine(length, width, depth)
    for layer = 1, depth do
        mineLayer(length, width)
        
        nav.returnOnZero(turtle)
        
        if layer < depth then
            nav.down(turtle)
            nav.down(turtle)
        end
    end
    
    nav.returnOnZero(turtle)
end

return {
    mine = mine,
    mineLayer = mineLayer,
    isOre = isOre,
    dropJunk = dropJunk
}