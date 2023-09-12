local engineState = false
setElementData(vehicle, "lightState", 1)


function toggleVehicleEngine()
    toggleControl("vehicle_look_right", false)
    local vehicle = getPedOccupiedVehicle(localPlayer)
    setVehicleEngineState(vehicle, engineState)
    setVehicleOverrideLights (vehicle, getElementData(vehicle, "lightState"))
end
addEventHandler("onClientVehicleEnter", root, toggleVehicleEngine)

local jump = false
function playerPressedKey(button, press)
    if (press) and button == "e" then 
        local vehicle = getPedOccupiedVehicle(localPlayer)
        if vehicle and getVehicleController(vehicle) == localPlayer and getPedOccupiedVehicleSeat(localPlayer) == 0 then
            setVehicleEngineState(vehicle, not getVehicleEngineState(vehicle))
            engineState = not engineState
        end          
    end
    if (press) and button == "l" then 
        local vehicle = getPedOccupiedVehicle(localPlayer)
        if vehicle and getVehicleOccupant(vehicle) == localPlayer and getPedOccupiedVehicleSeat(localPlayer) == 0 then
            if ( getVehicleOverrideLights ( vehicle ) ~= 2 ) then
                setVehicleOverrideLights ( vehicle, 2 )
            else
                setVehicleOverrideLights ( vehicle, 1 )
            end
        end
        setElementData(vehicle, "lightState", getVehicleOverrideLights(vehicle))
    end

    if (press) and button == "lshift" then
        if not jump then 
            jump = true 
            local vehicle = getPedOccupiedVehicle(localPlayer)
            if vehicle and getVehicleController(vehicle) == localPlayer and getPedOccupiedVehicleSeat(localPlayer) == 0 then
                local x, y, z = getElementPosition(vehicle)
                setElementPosition(vehicle, x, y, z + 1)
            end 
            setTimer(function()
                jump = false
            end, 1000, 1)
        end
    end
end
addEventHandler("onClientKey", root, playerPressedKey)
