local QBCore = exports['qb-core']:GetCoreObject()

local function validateDB()
    MySQL.ready(function()
        MySQL.Sync.execute([=[
            CREATE TABLE IF NOT EXISTS `template` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `name` VARCHAR(255) DEFAULT NULL,
            `smallData` VARCHAR(255) DEFAULT NULL,
            `longData` LONGTEXT DEFAULT NULL,
            PRIMARY KEY (`id`)
            );
        ]=])
    end)
end

local function tradeItems(src, tradeTable, rewardsTable, takeItems)
    local missingItems = {}
    local traded = true
    local itemAction = false
    local Player = QBCore.Functions.GetPlayer(src)
    for itemName, amount in pairs(tradeTable) do
        if takeItems then
            itemAction = Player.Functions.RemoveItem(itemName, amount) 
        else
            itemAction = amount > Player.Functions.GetItemByName(itemName).amount
        end
        if not itemAction then
            traded = false
            missingItems[itemName] = amount
        end
    end
    if not traded then return false, missingItems end
    if not takeItems then
        for itemName, amount in pairs(rewardsTable) do
            itemAction = Player.Functions.AddItem(itemName, amount)
            if not itemAction then traded = false end
        end
    end
    return traded, {}
end

RegisterNetEvent('QBCore:Server:UpdateObject', function()
	if source ~= '' then return false end
	QBCore = exports['qb-core']:GetCoreObject()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    if Config.Items then exports['qb-core']:AddItems(Config.Items) end
end)
