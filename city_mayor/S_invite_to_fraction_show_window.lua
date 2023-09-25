local lastMessageTime = {} 
local show_invite = true
addEvent( "inviteToJob", true )
addEventHandler( "inviteToJob", resourceRoot, function( id )
    local client_fraction = getElementData( client, "fraction" )
    if not client_fraction then 
        return
    end  

    local player = getPlayerByID( id )
    if not player then
        outputChatBox("Игрок с указанным ID не найден.",client, 255, 0, 0)
        return
    end
    
    local currentTime = getTickCount()
    local lastTime = lastMessageTime[ id ] or 0
    if currentTime - lastTime < 60000 then
        outputChatBox( "Вы можете отправить приглашение этому игроку только раз в 1 минуту.", client,  255, 0, 0 )
        return
    end

    lastMessageTime[ id ] = currentTime
          
    local player_fraction = getElementData( player, "fraction" )
    if not player_fraction then 
        triggerClientEvent( player, "inviteWindow", player,  getPlayerName( client ), getElementData( client, "fraction" ) )
    end
end )
