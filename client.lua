RegisterNetEvent('xshop:menuDefault')
AddEventHandler('xshop:menuDefault', function(id, title, elements)
	local MenuOpened = true
	ESX.UI.Menu.Open("default", "xshop", "xshop", {
		title = title,
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('xshop:buy', id, data.current)
		MenuOpened = false
		menu.close()
	end, function(data, menu)
		MenuOpened = false
		menu.close()
	end)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local player = PlayerId()
	while MenuOpened and #(GetEntityCoords(ped) - coords) < 10 and not IsPlayerDead(player) do Wait(1500) end
	if MenuOpened then
		ESX.UI.Menu.Close("default", "xshop", "xshop")
	end
end)