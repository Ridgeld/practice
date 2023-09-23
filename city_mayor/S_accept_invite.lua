addEvent( "acceptInvite", true )
addEventHandler( "acceptInvite", resourceRoot, function( player, fraction_id )
    if getElementData( client, "fraction" ) == "city_mayor" and getElementData( client, "rang" ) == 2  then 
        outputChatBox( "Вы приняли приглашение!", player, 0, 255, 0)
        setElementData( player, "rang", 1 )
        setElementData( player, "fraction", fraction_id )
        setElementModel( player, 57 )
    end   
end )
