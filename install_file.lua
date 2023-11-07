-- This file will be blank after initial install
local grabImage = function(imgLink)
    local image = imgLink:match(".+/([^/]+)$")
    local filename = GetResourcePath('qb-inventory'):gsub('//', '/')..'/html/images/'..image
    PerformHttpRequest(imgLink, function(Error, Result, _)
        if Error == 404 then
            return print("oh no the internet died")
        end
        if Error ~= 200 then return end
        local f = assert(io.open(filename, 'wb')) -- open in "binary" mode
        print("^3[^DOWNLOADING^0] ^2" .. image .. "^0 from: ^2" .. imgLink .."^0 to: ^2"..filename .. "^0")
        f:write(Result)
        f:close()
    end, 'GET')
end

local check = function(err, response, headers)
    response = json.decode(response)
    for k,v in pairs(response) do
        grabImage(v.download_url)
    end
    local path = GetResourcePath(GetCurrentResourceName()):gsub('//', '/')..'/install_file.lua' -- make this the path of this file specifically
    local file = io.open(path, 'w+')
    file:write('-- Installation Complete')
    file:close()
    print("^2[^COMPLETE^0] ^2 INSTALLATION COMPLETE:^0 check install_file.lua to be sure that it says 'Installation Complete'")
end
