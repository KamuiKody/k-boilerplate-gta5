local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Server:UpdateObject', function()
	if source ~= '' then return false end
	QBCore = exports['qb-core']:GetCoreObject()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    if Config.Items then exports['qb-core']:AddItems(Config.Items) end
end)
