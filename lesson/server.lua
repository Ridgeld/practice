function joinHandler()
    -- spawnPlayer(source, spawnX, spawnY, spawnZ)
    -- fadeCamera(source, true)
    -- setCameraTarget(source, source)
    outputChatBox('Hello world!', source)
end

addEventHandler('onPlayerJoin', getRootElement(), joinHandler)