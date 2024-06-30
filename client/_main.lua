local listener = false

local function reduceFocus()
	SetNuiFocus(false, false)
end
RegisterNuiCallback('Close', reduceFocus)

local function listenForKeyPress()
	while listener do
		Wait(5)
		if IsControlJustReleased(0, Config.Keys.Focus) then
			SetNuiFocus(true, true)
			listener = false
		end
	end
end

local function openUI(data, bool)
	SendNUIMessage({listener = 'open', data = data})
	if bool then SetNuiFocus(bool, bool) return end
	if listener then return end
	listener = true
	CreateThread(listenForKeyPress)
end
