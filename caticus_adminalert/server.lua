local ESX, QBCore = nil, nil

if Config.Framework == 'esx' then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.Framework == 'qbcore' then
    if GetResourceState('qb-core') == 'started' then
        QBCore = exports['qb-core']:GetCoreObject()
    else
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
    end
end

RegisterCommand('adminalert', function(source, args, rawCommand)
    local msg = table.concat(args, " ", 1)
    local isAllowed = false
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        isAllowed = xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin'
    elseif Config.Framework == 'qbcore' then
        if QBCore and QBCore.Functions.HasPermission then
            isAllowed = QBCore.Functions.HasPermission(source, 'god')
        end
    end

    if isAllowed then
        TriggerClientEvent('adminAnnounce:showMessage', -1, msg)
    else
        if Config.Framework == 'esx' then
            TriggerClientEvent('esx:showNotification', source, 'You do not have permission to use this command.')
        elseif Config.Framework == 'qbcore' then
            TriggerClientEvent('QBCore:Notify', source, 'You do not have permission to use this command.', 'error')
        end
    end
end, false)
