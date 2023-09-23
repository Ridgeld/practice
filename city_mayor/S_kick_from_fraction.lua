addEvent( "kickFromJob", true )
addEventHandler( "kickFromJob", resourceRoot, function( id )
    if getElementData( client, "fraction" ) == "city_mayor" and getElementData( client, "rang" ) == 2 then 
        local player = getPlayerByID( id )
        removeElementData( player, "rang" )
        removeElementData( player, "fraction" )
        setElementModel( player, 60 )
        outputChatBox( "Вы были уволены из фракции: " .. getElementData( player, "fraction" ) .. " игроком: ".. getPlayerName( client ), player, 255, 0, 0 )
        triggerClientEvent( player, "closeWindow", player )
    end
end )
