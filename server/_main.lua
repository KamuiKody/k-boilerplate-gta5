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

