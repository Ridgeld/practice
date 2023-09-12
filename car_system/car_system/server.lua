local distance = 5

local carArray ={}

function deletecar(thePlayer)
    if carArray[thePlayer] and isElement(carArray[thePlayer].vehicle) then
        destroyElement(carArray[thePlayer].vehicle)
        carArray[thePlayer] = nil
    end
end

function createVehicleCommand ( thePlayer, commandName, carModel )

    deletecar(thePlayer)
    local x, y, z = getElementPosition ( thePlayer )
    local rotationX, rotationY, rotationZ = getElementRotation( thePlayer )
    spawnX = x + ( ( -math.sin ( math.rad ( rotationZ ) ) ) * distance) -- calculate the X position of the vehicle
    spawnY = y + ( ( math.cos ( math.rad ( rotationZ ) ) ) * distance) -- calculate the Y position of the vehicle


    local spawnedVehicle = createVehicle ( tonumber ( carModel ), spawnX, spawnY, z+2)
    -- Сохраняем информацию о созданном автомобиле для игрока
    setElementData(spawnedVehicle, "owner", thePlayer)
    
    -- Сохраняем информацию о созданном автомобиле для игрока
    carArray[thePlayer] = { vehicle = spawnedVehicle }


end
addCommandHandler ( "veh", createVehicleCommand)

function owner(thePlayer)
    local owner = getElementData(source, "owner")
    if onwer and owner ~= thePlayer then 
        cancelEvent()
    end
end
addEventHandler("onVehicleStartEnter", root, owner)

function quit()
    local thePlayer = source
    deletecar(thePlayer)
end
addEventHandler("onPlayerQuit", root, quit)
