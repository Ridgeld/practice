local lastMessageTime = {} 
local show_invite = true
addEvent( "inviteToJob", true )
addEventHandler( "inviteToJob", resourceRoot, function( id )
    if getElementData( client, "fraction" ) then 
        local player = getPlayerByID( id )
        if not player then
            outputChatBox("Игрок с указанным ID не найден.",client, 255, 0, 0)
            return
        end
        local currentTime = getTickCount() -- Текущее время в миллисекундах
        local lastTime = lastMessageTime[ id ] or 0 -- Время последней отправки сообщения для данного ID

        -- Проверяем, прошла ли минута с момента последней отправки для данного ID
        if currentTime - lastTime < 60000 then
            outputChatBox( "Вы можете отправить приглашение этому игроку только раз в 1 минуту.", client,  255, 0, 0 )
            return
        end

        -- Обновляем время последней отправки сообщения для данного ID
        lastMessageTime[ id ] = currentTime
                
        if getElementData( player, "fraction" ) then 
            outputChatBox( "Данный игрок уже состоит во фракции!", client, 255, 0, 0 )
                
        else
            triggerClientEvent( player, "inviteWindow", player,  getPlayerName( client ), getElementData( client, "fraction" ) )
        end
    end
end )
