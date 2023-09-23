function drawPlayersIds()
    addEventHandler ( "onClientRender", root, function()
        local players_on_screen = getPlayersInScreenRange( localPlayer )
        local x, y, z = getPedBonePosition( players_on_screen, 8 ); -- head
        local sX, sY = getScreenFromWorldPosition( x, y, z + 0.3 );
        dxDrawText( "id: " .. getElementData( players_on_screen, "id" ), sX-10, sY )
    end )
end
addEventHandler ( "onClientResourceStart", resourceRoot, drawPlayersIds )



function getPlayersInScreenRange( player )
    local x, y, z = getElementPosition( player ) -- Получаем позицию игрока
    local screenWidth, screenHeight = guiGetScreenSize() -- Получаем размер экрана

    local players_in_range = {} -- Создаем таблицу для хранения игроков в радиусе

    for _, other_player in ipairs( getElementsByType( "player" ) ) do
        if other_player ~= player then
            local px, py, pz = getElementPosition( other_player ) -- Получаем позицию другого игрока
            local screenX, screenY = getScreenFromWorldPosition( px, py, pz + 1 ) -- Преобразуем мировые координаты в координаты на экране
            -- Проверяем, находится ли игрок на экране и в радиусе 5 метров
            if screenX and screenY and getDistanceBetweenPoints3D( x, y, z, px, py, pz ) <= 5 then
                table.insert( players_in_range, other_player ) -- Добавляем игрока в таблицу
            end
        end 
    end
    return players_in_range
end

