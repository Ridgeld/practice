addEvent( "acceptInvite", true )
addEventHandler( "acceptInvite", resourceRoot, function( player, fraction_id )
    local client_fraction = getElementData( client, "fraction" )
    local client_rang = getElementData( client, "rang" )
    if client_fraction == "city_mayor" and client_rang == 2  then 
        outputChatBox( "Вы приняли приглашение!", player, 0, 255, 0)
        setElementData( player, "rang", 1 )
        setElementData( player, "fraction", fraction_id )
        setElementModel( player, 57 )
    end   
end )
