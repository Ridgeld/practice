local screen_width, screen_height = guiGetScreenSize ( ) -- Get the screen resolution (width and height)

function drawPlayerId( )
    addEventHandler ( "onClientRender", root, function()
        dxDrawText( "id: " .. getElementData( localPlayer, "id" ), screen_width - 90, screen_height - screen_height + 20, screen_width, screen_height, tocolor ( 255, 255, 255, 255 ), 1, "pricedown" )
    end )
end
addEventHandler ( "onClientResourceStart", resourceRoot, drawPlayerId)
