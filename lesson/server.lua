function joinHandler()
    outputChatBox('Hello world!', source)
end

addEventHandler('onPlayerJoin', getRootElement(), joinHandler)
