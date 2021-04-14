ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('weed')
AddEventHandler('weed', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local weed = xPlayer.getInventoryItem('weed').count

    if weed > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Il semble que tu ne puisses plus porter de weed !')
    elseif weed < 50 then
        xPlayer.addInventoryItem('weed', 1)
    end
end)

RegisterNetEvent('weed_pooch')
AddEventHandler('weed_pooch', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local weed = xPlayer.getInventoryItem('weed').count
    local weed_pooch = xPlayer.getInventoryItem('weed_pooch').count

    if weed_pooch > 20 then
        TriggerClientEvent('esx:showNotification', source, '~r~Il semble que tu ne puisses plus porter de sachets Weed .. Vas les vendre')
    elseif weed < 3 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de Weed pour la vente')
    else
        xPlayer.removeInventoryItem('weed', 5)
        xPlayer.addInventoryItem('weed_pooch', 1)    
    end
    end)

    RegisterNetEvent('vendWeed')
AddEventHandler('vendWeed', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local weed_pooch = xPlayer.getInventoryItem('weed_pooch').count

    if weed_pooch > 0 then
        TriggerClientEvent('esx:showNotification', source, 'Bravo ! Vous avez vendu un de weed ')
    xPlayer.removeInventoryItem('weed_pooch', 1)
    xPlayer.addAccountMoney('black_money', 125)
    else
    end
end)