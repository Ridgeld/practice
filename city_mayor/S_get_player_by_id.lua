function getPlayerByID( player_id )
    for _, player in ipairs( getElementsByType( "player" ) ) do
        if getElementData( player, "id" ) == player_id then
            return player 
        end
    end
    return nil
end
