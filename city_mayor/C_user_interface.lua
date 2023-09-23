addEventHandler( "onClientKey", root, function ( button, press)
    if press and button == "p" then
        if getElementData( localPlayer, "fraction") == "city_mayor" then
            if isElement( INVITE_PANEL ) then 
                destroyElement( INVITE_PANEL )
                showCursor( false )
            end
            if WINDOW and isElement( WINDOW ) then 
                destroyElement( WINDOW )
                showCursor( false )
            else
                showCursor( true )
                WINDOW = guiCreateWindow ( 0.3, 0.3, 0.4, 0.3, "Панель фракции", true )  
                local tab_panel = guiCreateTabPanel ( 0, 0.1, 0.7, 1, true, WINDOW )
                local tab_players = guiCreateTab( "Список участников", tab_panel )
                player_list = guiCreateGridList( 0, 0, 1, 1, true, tab_players )

                guiGridListAddColumn( player_list, "Игроки", 0.3 )
                guiGridListAddColumn( player_list, "ID", 0.2 )
                CLOSE = guiCreateButton( 0.75, 0.85, 0.2, 0.1, "Закрыть", true, WINDOW )

                -- Добавление всех фракционных игроков в список(имена)+(ID)
                for _, player in ipairs( getElementsByType( "player" ) ) do
                    if getElementData( player, "fraction" ) == "city_mayor" then 
                        guiGridListAddRow( player_list, getPlayerName( player ), getElementData( player, "id" ) )
                    end
                end
                -- Вкладка для лидера + кнопки
                if getElementData( localPlayer, "rang" ) == 2 then
                    KICK_JOB = guiCreateButton( 0.75, 0.2, 0.2, 0.1, "Уволить", true, WINDOW )
                    INVITE = guiCreateButton( 0.75, 0.32, 0.2, 0.1, "Пригласить", true, WINDOW )
                    local tab_city = guiCreateTab( "Управление городом", tab_panel )  
                    guiCreateLabel( 0.02, 0.04, 0.94, 0.92, "В разработке", true, tab_city )  
                end
                addEventHandler( "onClientGUIClick", CLOSE, closeWindow, false )
                addEventHandler( "onClientGUIClick", INVITE, inviteWindow, false )
                addEventHandler( "onClientGUIClick", KICK_JOB, kickJob, false )
            end
        end
    end
end )

-- Окно приглашения
function inviteWindow()
    INVITE_PANEL = guiCreateWindow( 0.7, 0.3, 0.2, 0.2, "Приглашение", true )
    INPUT = guiCreateEdit( 0, 0.2, 1, 0.2, "Введите id игрока", true, INVITE_PANEL )
    CHECK = guiCreateButton( 0.5, 0.7, 0.5, 0.2, "Пригласить", true, INVITE_PANEL )
    addEventHandler( "onClientGUIClick", CHECK, inviteToJob, false )
end
-- отправка приглашения
function inviteToJob()
    local id = tonumber( guiGetText( INPUT ) )
    if not id  or getElementType( id ) == string then 
        outputChatBox( "Неверный id!", 255, 0, 0 )
    else
        triggerServerEvent( "inviteToJob", resourceRoot, tonumber( id ), getElementData(client, "fraction" ) )
    end
    guiSetText( INPUT, "" )
end

function kickJob()
    local id = guiGridListGetItemText( player_list, guiGridListGetSelectedItem( player_list ), 2 )
    triggerServerEvent( "kickFromJob", resourceRoot, tonumber( id ) )
end

addEvent( "closeWindow" , true )
addEventHandler( "closeWindow", localPlayer, closeWindow)

function closeWindow()
    destroyElement( WINDOW )
    showCursor( false )
    if isElement( INVITE_PANEL ) then 
        destroyElement( INVITE_PANEL )
    end
end
