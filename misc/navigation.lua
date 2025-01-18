local coordinates = {
    ["x"] = 0,
    ["y"] = 0,
    ["z"] = 0
}
local direction = "+x"

local function turnLeft(turtle)
    if turtle.turnLeft() == false then
        return false
    end

    if direction == "+x" then
        direction = "-y"
    elseif direction == "-y" then
        direction = "-x"
    elseif direction == "-x" then
        direction = "+y"
    else direction = "+x"
    end
    
    return true
end

local function turnRight(turtle)
    if turtle.turnRight() == false then
        return false
    end

    if direction == "+x" then
        direction = "+y"
    elseif direction == "+y" then
        direction = "-x"
    elseif direction == "-x" then
        direction = "-y"
    else direction = "+x"
    end
    
    return true
end

local function forward(turtle)
    if turtle.forward() == false then
        return false
    end

    if direction == "+x" then coordinates["x"] = coordinates["x"] + 1
    elseif direction == "-x" then coordinates["x"] = coordinates["x"] - 1
    elseif direction == "+y" then coordinates["y"] = coordinates["y"] + 1
    else coordinates["y"] = coordinates["y"] -1 end

    return true
end

local function back(turtle)
    if turtle.back() == false then
        return false
    end

    if direction == "+x" then 
        coordinates["x"] = coordinates["x"] - 1 
    elseif direction == "-x" then
        coordinates["x"] = coordinates["x"] + 1
    elseif direction == "+y" then
        coordinates["y"] = coordinates["y"] - 1
    else coordinates["y"] = coordinates["y"] + 1
    end

    return true
end

local function right(turtle)
    if turtle.right() == false then
        return false
    end

    if direction == "+x" then
        coordinates["y"] = coordinates["y"] + 1
    elseif direction == "-x" then
        coordinates["y"] = coordinates["y"] - 1
    elseif direction == "+y" then
        coordinates["x"] = coordinates["x"] - 1
    else coordinates["x"] = coordinates["x"] + 1
    end

    return true
end

local function left(turtle)
    if turtle.left() == false then
        return false
    end
    
    if direction == "+x" then
        coordinates["y"] = coordinates["y"] - 1
    elseif direction == "-x" then
        coordinates["y"] = coordinates["y"] + 1
    elseif direction == "+y" then
        coordinates["x"] = coordinates["x"] + 1
    else coordinates["x"] = coordinates["x"] - 1
    end

    return true
end

local function up(turtle)
    if turtle.up() == false then
        return false
    end

    coordinates["z"] = coordinates["z"] + 1
    return true
end

local function down(turtle)
    if turtle.down() == false then
        return false
    end

    coordinates["z"] = coordinates["z"] - 1
    return true
end

--- returns turtle to zero cords
local function returnOnZero(turtle)
    if coordinates.y > 0 then
        while direction ~= "-y" do
            turnLeft(turtle)
        end
    elseif coordinates.y < 0 then
        while direction ~= "+y" do
            turnLeft(turtle)
        end
    end
    while coordinates.y ~= 0 do
        forward(turtle)
    end

    if coordinates.x > 0 then
        while direction ~= "-x" do
            turnLeft(turtle)
        end
    elseif coordinates.x < 0 then
        while direction ~= "+x" do
            turnLeft(turtle)
        end
    end
    while coordinates.x ~= 0 do
        forward(turtle)
    end

    if coordinates.z > 0 then
        while coordinates.z ~= 0 do
            down(turtle)
        end
    else
        while coordinates.z ~= 0 do
            up(turtle)
        end
    end
end

return { turnLeft = turnLeft, turnRight = turnRight,
        forward = forward, back = back,
        right = right, left = left,
        up = up, down = down, coordinates = coordinates }