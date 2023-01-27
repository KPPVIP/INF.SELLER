RegisterServerEvent('polo_pisteillegal:Weed')
AddEventHandler('polo_pisteillegal:Weed', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceWeedF) then
			user.removeMoney(Config.PriceWeedF)
			TriggerClientEvent("polo_pisteillegal:WeedFarm", source)
		else
			TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('polo_pisteillegal:TWeed')
AddEventHandler('polo_pisteillegal:TWeed', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceWeedT) then
			user.removeMoney(Config.PriceWeedT)
			TriggerClientEvent("polo_pisteillegal:WeedTreatment", source)			
		else
			TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('polo_pisteillegal:Opium')
AddEventHandler('polo_pisteillegal:Opium', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceOpiumF) then
			user.removeMoney(Config.PriceOpiumF)
			TriggerClientEvent("polo_pisteillegal:OpiumFarm", source)
		else
			TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), true, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('polo_pisteillegal:TOpium')
AddEventHandler('polo_pisteillegal:TOpium', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceOpiumT) then
			user.removeMoney(Config.PriceOpiumT)
			TriggerClientEvent("polo_pisteillegal:OpiumTreatment", source)			
		else
			TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), true, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('polo_pisteillegal:Coke')
AddEventHandler('polo_pisteillegal:Coke', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceCokeF) then
			user.removeMoney(Config.PriceCokeF)
			TriggerClientEvent("polo_pisteillegal:CokeFarm", source)
		else
			TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('polo_pisteillegal:TCoke')
AddEventHandler('polo_pisteillegal:TCoke', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceCokeT) then
			user.removeMoney(Config.PriceCokeT)
			TriggerClientEvent("polo_pisteillegal:CokeTreatment", source)			
		else
			TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

--RegisterServerEvent('polo_pisteillegal:ogkush')
--AddEventHandler('polo_pisteillegal:ogkush', function()
	--local source = source
	--TriggerEvent('es:getPlayerFromId', source, function(user)
		--if (tonumber(user.getMoney()) >= Config.PriceMethF) then
			--user.removeMoney(Config.PriceMethF)
			--TriggerClientEvent("polo_pisteillegal:ogkushFarm", source)
		--else
			--TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		--end
	--end)
--end)

--RegisterServerEvent('polo_pisteillegal:Togkush')
--AddEventHandler('polo_pisteillegal:Togkush', function()
	--local source = source
	--TriggerEvent('es:getPlayerFromId', source, function(user)
		--if (tonumber(user.getMoney()) >= Config.PriceMethT) then
			--user.removeMoney(Config.PriceMethT)
			--TriggerClientEvent("polo_pisteillegal:ogkushTreatment", source)			
		--else
			--TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		--end
	--end)
--end)

--RegisterServerEvent('polo_pisteillegal:SellTurtle')
--AddEventHandler('polo_pisteillegal:SellTurtle', function()
	--local source = source
	--TriggerEvent('es:getPlayerFromId', source, function(user)
		--if (tonumber(user.getMoney()) >= Config.PriceTurtle) then
			--user.removeMoney(Config.PriceTurtle)
			--TriggerClientEvent("polo_pisteillegal:Turtle", source)				
		--else
			--TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		--end
	--end)
--end)

--RegisterServerEvent('polo_pisteillegal:SellShark')
--AddEventHandler('polo_pisteillegal:SellShark', function()
	--local source = source
	--TriggerEvent('es:getPlayerFromId', source, function(user)
		--if (tonumber(user.getMoney()) >= Config.PriceShark) then
			--user.removeMoney(Config.PriceShark)
			--TriggerClientEvent("polo_pisteillegal:Shark", source)				
		--else
			--TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		--end
	--end)
--end)

--RegisterServerEvent('polo_pisteillegal:wash')
--AddEventHandler('polo_pisteillegal:wash', function()
	--local source = source
	--TriggerEvent('es:getPlayerFromId', source, function(user)
		--if (tonumber(user.getMoney()) >= Config.PriceWashF) then
			--user.removeMoney(Config.PriceWashF)
			--TriggerClientEvent("polo_pisteillegal:washmoney", source)				
		--else
			--TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		--end
	--end)
--end)

RegisterServerEvent('polo_pisteillegal:Nothere')
AddEventHandler('polo_pisteillegal:Nothere', function()
	TriggerClientEvent("polo_pisteillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('Nothere'))
end)