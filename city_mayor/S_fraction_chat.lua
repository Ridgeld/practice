addCommandHandler( "f", function( thePlayer, commandName, ... )
    local fraction_players = getFractionPlayers()
    local message = table.concat({...}, " " )
    if getElementData( thePlayer, "rang" ) == 2 then 
        outputChatBox( "[Лидер]: "..message, fraction_players, 150, 150, 150 )
    elseif 
        getElementData( thePlayer,"rang" ) == 1 then 
        outputChatBox( "[Сотрудник]: "..message, fraction_playerss, 150, 150, 150 )
    end
end )


function getFractionPlayers()    
    for _, player in ipairs( getElementsByType( "player" ) ) do
        if getElementData( player, "fraction" ) == "city_mayor" then
            return player
        end
    end
end
