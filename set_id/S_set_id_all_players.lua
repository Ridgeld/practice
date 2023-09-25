local used_id = { }

addEventHandler( "onPlayerJoin", root, function()
    local player_id = 1

    for i, v in ipairs( used_id ) do
        player_id = player_id + 1
    end

    setElementData( source, "id", player_id )

    used_id[ player_id ] = true
end )
