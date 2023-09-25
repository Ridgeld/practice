function drawPlayersIds()
    addEventHandler ( "onClientRender", root, function()
        local players_on_screen = getPlayersInScreenRange( localPlayer )
        local x, y, z = getPedBonePosition( players_on_screen, 8 ); -- head
        local sX, sY = getScreenFromWorldPosition( x, y, z + 0.3 );
        dxDrawText( "id: " .. getElementData( players_on_screen, "id" ), sX-10, sY )
    end )
end
addEventHandler ( "onClientResourceStart", resourceRoot, drawPlayersIds )



function getPlayersInRange( player )
    local x, y, z = getElementPosition( player )

    local players_in_range = getElementsWithinRange( x, y, z, 10, "player")

    for _, player in pairs( players_in_range ) do
        return players_in_range
    end
end

