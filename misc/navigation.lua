local x, y, z = 0, 0, 0
local direction = "+x"

local function turnLeft(turtle)
    if turtle.forward() == false then
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
    if turtle.forward() == false then
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

    if direction == "+x" then x = x + 1
    elseif direction == "-x" then x = x - 1
    elseif direction == "+y" then y = y + 1
    else y = y -1 end

    return true
end

local function back(turtle)
    if turtle.back() == false then
        return false
    end

    if direction == "+x" then 
        x = x - 1 
    elseif direction == "-x" then
        x = x + 1
    elseif direction == "+y" then
        y = y - 1
    else y = y + 1
    end

    return true
end

local function right(turtle)
    if turtle.right() == false then
        return false
    end

    if direction == "+x" then
        y = y + 1
    elseif direction == "-x" then
        y = y - 1
    elseif direction == "+y" then
        x = x - 1
    else x = x + 1
    end

    return true
end

local function left(turtle)
    if turtle.left() == false then
        return false
    end
    
    if direction == "+x" then
        y = y - 1
    elseif direction == "-x" then
        y = y + 1
    elseif direction == "+y" then
        x = x + 1
    else x = x - 1
    end

    return true
end

local function up(turtle)
    if turtle.up() == false then
        return false
    end

    z = z + 1
    return true
end

local function down(turtle)
    if turtle.down() == false then
        return false
    end

    z = z - 1
    return true
end

return { turnLeft = turnLeft, turnRight = turnRight,
        forward = forward, back = back,
        right = right, left = left,
        up = up, down = down, x = x, y = y, z = z }