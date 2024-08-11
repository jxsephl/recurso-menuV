local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('menu:client:OpenMenu', function()
    local playerName = QBCore.Functions.GetPlayerData().charinfo.firstname .. " " .. QBCore.Functions.GetPlayerData().charinfo.lastname
    local onlinePlayers = #GetActivePlayers()

    SendNUIMessage({
        type = "updatePlayerInfo",
        playerName = playerName,
        onlinePlayers = onlinePlayers
    })

    SetNuiFocus(true, true)
end)

RegisterCommand('openMenu', function()
    TriggerEvent('menu:client:OpenMenu')
end, false)

RegisterKeyMapping('openMenu', 'Abrir Menú Principal', 'keyboard', 'X')

RegisterNetEvent('menu:client:CloseMenu', function()
    SendNUIMessage({
        type = "closeMenu"
    })

    SetNuiFocus(false, false)
end)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('cursor', function(data, cb)
    SetNuiFocus(data.visible, data.visible)
    cb('ok')
end)

function CloseMenu()
    TriggerEvent('menu:client:CloseMenu')
end
