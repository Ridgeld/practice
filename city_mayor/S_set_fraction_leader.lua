addCommandHandler( "set_player_fraction_leader", function ( thePlayer, commandName, player_id, fraction_id )
    local player_id = tonumber( player_id )
    local target_player = getPlayerByID( player_id )

    if not player_id and not fraction_id then 
        outputChatBox( "Использование команды: /set_player_fraction_leader [ID игрока] [название_фракции]", thePlayer, 0, 255, 0 )
        return
    end

    if not player_id then
        outputChatBox( "Неверный ID игрока!", thePlayer, 255, 0, 0 )
        return
    end

    if not target_player then
        outputChatBox( "Игрок с ID " .. player_id .. " не найден.", player, 255, 0, 0 )
        return
    end
    local target_player_rang = getElementData( target_player, "rang" )
    local target_player_fraction = getElementData( target_player, "fraction" )

    if not fraction_id and target_player_fraction then
        outputChatBox( "Игрок: " .. getPlayerName( target_player ) .. " покинул пост лидера фракции ", thePlayer, 0, 255, 0 )
        outputChatBox( "Вы были сняты с поста лидера фракции" .. getElementData( target_player, "fraction" ) .. "  ждем Вас снова!", target_player, 0, 255, 0 )
        setElementModel( target_player, 60 )
        removeElementData( target_player, "rang" )
        removeElementData( target_player, "fraction" )
        return
    end

    if not target_player_rang and not target_player_fraction then 
        outputChatBox( "Игрок: " .. getPlayerName( target_player ) .. " стал лидером фракции: ".. fraction_id, thePlayer, 0, 255, 0 )
        outputChatBox( "Вы стали лидером фракции "..fraction_id.." , желаем удачи!", target_player, 0, 0, 255 )
        setElementModel( target_player, 68 )
        setElementData( target_player, "rang", RANGS.second )
        setElementData( target_player, "fraction", fraction_id )
    else 
        outputChatBox( "Для повышения необходимо уволиться из организации!", target_player, 255, 0, 0 )
    end
    local add_fraction = addFraction()
end )
