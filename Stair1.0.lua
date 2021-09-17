function place()
    turtle.select(1)
    for i=1, 16, 1 do
        x = turtle.getItemDetail(i)
        if x ~= nil then
            if x.name == "minecraft:cobblestone_stairs" then
                turtle.select(i)
                break
            end
        end
    end
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.placeDown()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.select(1)    
 
end
function fuel()
    turtle.select(1)
    for i=1, 16, 1 do
        if turtle.getFuelLevel() < 15 then
            turtle.refuel(1)
            if turtle.getSelectedSlot() ~= 16 then
                turtle.select(turtle.getSelectedSlot()+1)
            else
                break
            end 
        end
    end
    turtle.select(1)
end
--function torch()
   --turtle.select(1)
   --for 1=1,16,1 do
        --z = turtle.getItemDetail(i)
        --if z ~= nil then
            --if z.name == "minecraft:torch" then
                --turtle.select(i)
                --break
            --end
        --end
    --end
--end
function detect()
    while turtle.detect() == true do
        turtle.dig()
        sleep(.25)
    end
end
function detectUp()
    while turtle.detectUp() == true do
        turtle.digUp()
        sleep(.25)
    end
end
    
function hollow()
    z = 0
    r = 0
    turtle.turnLeft()
    detect()
    turtle.turnLeft()
    turtle.turnLeft()
    detect()
    turtle.turnLeft()
    turtle.up()
    detectUp()
    turtle.up()
    while z ~= 4 do
        z = z + 1
        fuel()
        detect()
        turtle.turnLeft()
        detect()
        turtle.turnLeft()
        turtle.turnLeft()
        detect()
        turtle.turnLeft()
        turtle.forward()
    end
    turtle.turnLeft()
    detect()
    turtle.turnLeft()
    turtle.turnLeft()
    detect()
    turtle.turnRight()
    turtle.digDown()
    turtle.down()
    z = z + 1
    while z ~= 0 do
        fuel()
        turtle.turnLeft()
        detect()
        turtle.turnLeft()
        turtle.turnLeft()
        detect()
        turtle.turnLeft()
        detect()
        turtle.forward()
        z = z - 1
    end
    turtle.back()
    turtle.down()
    turtle.turnLeft()
    turtle.turnLeft()
    z = 0
    while z ~= 4 do
        detect()
        turtle.forward()
        turtle.turnLeft()
        detect()
        turtle.turnLeft()
        turtle.turnLeft()
        detect()
        turtle.turnLeft()
        z = z + 1
    end
    turtle.turnLeft()
    turtle.forward()
    detect()
    turtle.forward()
    turtle.turnLeft()
    detectUp()
    turtle.up()
    turtle.digUp()
    while z ~= 0 do
        detect()
        turtle.forward()
        turtle.digDown()
        detectUp()
        z = z - 1
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    detect()
    turtle.forward()
    turtle.turnLeft()
    detectUp()
    turtle.digDown()
    z = 0
    while z ~= 4 do
        detect()
        turtle.forward()
        turtle.digDown()
        detectUp()
        z = z + 1
    end
            
end
function dig()
    x = 0
    while x ~= 5 do
        fuel()
        while turtle.detect() == true do
            turtle.dig()
        end
        turtle.forward()
        x = x + 1
    end
    while x ~= 0 do
        turtle.back()
        x = x - 1
    end
    turtle.digDown()
    place()
    turtle.forward()
    turtle.digDown()
    turtle.down()
    turtle.select(1)
end
 
args = {...}
for f = 0, args[1], 1 do
    dig()
end
hollow()