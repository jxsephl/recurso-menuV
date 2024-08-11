local graphics = exports.graphics

local imagen = graphics.loadImage("https://i.imgur.com/n6x7Odt.png")

-- Define the toggleMenu command
RegisterCommand("toggleMenu", function(source, args, rawCommand)
    -- Use TriggerClientEvent to notify the client-side script
    TriggerClientEvent('menu:client:OpenMenu', source)
end, false)

-- NUI Callback for cursor visibility
RegisterNUICallback('cursor', function(data, cb)
    -- Ensure the cursor visibility is managed properly
    SetNuiFocus(data.visible, data.visible)
    cb('ok')
end)

-- Send player info to the client
RegisterNetEvent('menu:server:GetPlayerInfo', function()
    local src = source
    local playerName = QBCore.Functions.GetPlayer(src).PlayerData.charinfo.firstname .. " " .. QBCore.Functions.GetPlayer(src).PlayerData.charinfo.lastname
    local onlinePlayers = #GetActivePlayers()

    TriggerClientEvent('menu:client:SendPlayerInfo', src, playerName, onlinePlayers)
end)

-- Evento para cerrar el menú desde el servidor
RegisterNetEvent('menu:server:CloseMenu', function()
    local src = source
    TriggerClientEvent('menu:client:CloseMenu', src)
end)


