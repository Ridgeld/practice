function addFraction()
    local fraction_id = "city_mayor"
    local lider_name
    local fraction_players = {}
    for _, player in pairs( getElementsByType( "player" ) ) do 
        if getElementData( player, "fraction" ) == "city_mayor" then 
            fraction_players[ player ] = player
        end
        if getElementData( player, "rang") == 2 then 
            lider_name = getPlayerName( player )
        end

    end
    exports.create_fraction.CreateFraction( fraction_id, lider_name, fraction_players )
end
