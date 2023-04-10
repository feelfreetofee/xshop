local shops = {}

RegisterNetEvent('xshop:buy')
AddEventHandler('xshop:buy', function(id, selected)
	local src = source
	local shop = shops[id]
	if not shop then return end
	local element = shop.elements[selected.name]
	if not element then return end
	local xPlayer = ESX.GetPlayerFromId(src)
	if shop.job and xPlayer.job.name ~= shop.job then return end
	if element.grade and element.grade > xPlayer.job.grade then return end
	if element.price then
		if xPlayer.getAccount('money').money >= element.price then
			xPlayer.removeAccountMoney('money', element.price)
		elseif xPlayer.getAccount('bank').money >= element.price then
			xPlayer.removeAccountMoney('bank', element.price)
		else
			xPlayer.showNotification('Not enough money')
			return
		end
	end
	shop.action(src, xPlayer, selected)
end)

exports('register', function(shop)
	table.insert(shops, shop)
	return #shops
end)