local used_id = { }

addEventHandler( "onPlayerJoin", root, function()
    local player_id
    repeat
        player_id = math.random( 1, 200 )
    until not used_id[ player_id ]

    setElementData( source, "id", player_id )

    used_id[ player_id ] = true
end )
