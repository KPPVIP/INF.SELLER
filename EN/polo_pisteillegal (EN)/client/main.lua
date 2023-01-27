ESX                           = nil
local GUI					  = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
GUI.Time           			  = 0
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local times 				  = 0
local blipillegal 			  = {}
local randomnumber 			  = 0
local count					  = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("polo_pisteillegal:notify")
AddEventHandler("polo_pisteillegal:notify", function(icon, type, sender, title, text)
    Citizen.CreateThread(function()
		Wait(1)
		SetNotificationTextEntry("STRING");
		AddTextComponentString(text);
		SetNotificationMessage(icon, icon, true, type, sender, title, text);
		DrawNotification(false, true);
    end)
end)


function OpenInfoIllegalMenu()

  local elements = { }
      --table.insert(elements, {label = _U('wash') .. Config.PriceWashF .. _U('wash1'),    value = 'wash'})
	  table.insert(elements, {label = _U('weed') .. Config.PriceWeedF .. _U('weed1'),    value = 'weed'})
	  table.insert(elements, {label = _U('tweed') .. Config.PriceWeedT .. _U('tweed1'),    value = 'tweed'})
	  --table.insert(elements, {label = _U('ogkush') .. Config.PriceOgkushF .. _U('ogkush1'),    value = 'ogkush'})
	  --table.insert(elements, {label = _U('togkush') .. Config.PriceOgkushT .. _U('togkush1'),    value = 'togkush'})
	  table.insert(elements, {label = _U('opium') .. Config.PriceOpiumF .. _U('opium1'),    value = 'opium'})
	  table.insert(elements, {label = _U('topium') .. Config.PriceOpiumT .. _U('topium1'),    value = 'topium'})
	  table.insert(elements, {label = _U('coke') .. Config.PriceCokeF .. _U('coke1'),    value = 'coke'})
	  table.insert(elements, {label = _U('tcoke') .. Config.PriceCokeT .. _U('tcoke1'),    value = 'tcoke'})
	  --table.insert(elements, {label = _U('SellTurtle') .. Config.PriceTurtle .. _U('Turtle'),    value = 'SellTurtle'})
	  --table.insert(elements, {label = _U('SellShark') .. Config.PriceShark .. _U('Shark'),    value = 'SellShark'})

  ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'info',
      {
        title    = _U('info'),
        align    = 'top-left',
        elements = elements,
        },

        function(data, menu)

        if data.current.value == 'weed' then
           TriggerServerEvent("polo_pisteillegal:Weed")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'tweed' then
           TriggerServerEvent("polo_pisteillegal:TWeed")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'opium' then
           TriggerServerEvent("polo_pisteillegal:Opium")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'topium' then
           TriggerServerEvent("polo_pisteillegal:TOpium")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'coke' then
           TriggerServerEvent("polo_pisteillegal:Coke")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'tcoke' then
           TriggerServerEvent("polo_pisteillegal:TCoke")
		   ESX.UI.Menu.CloseAll()
        end
		
		--if data.current.value == 'ogkush' then
           --TriggerServerEvent("esx_infoillegal:OgKush")
		   --ESX.UI.Menu.CloseAll()
        --end
		
		--if data.current.value == 'togkush' then
           --TriggerServerEvent("esx_infoillegal:TOgKush")
		   --ESX.UI.Menu.CloseAll()
        --end
		
		--if data.current.value == 'SellTurtle' then
           --TriggerServerEvent("esx_infoillegal:SellTurtle")
		   --ESX.UI.Menu.CloseAll()
        --end
		
		--if data.current.value == 'SellShark' then
           --TriggerServerEvent("esx_infoillegal:SellShark")
		   --ESX.UI.Menu.CloseAll()
        --end
		
		--if data.current.value == 'wash' then
           --TriggerServerEvent("esx_infoillegal:wash")
		   --ESX.UI.Menu.CloseAll()
        --end

      CurrentAction     = 'menu_info_illegal'
      CurrentActionData = {}

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'menu_info_illegal'
      CurrentActionData = {}
    end
    )

end

RegisterNetEvent("polo_pisteillegal:WeedFarm")
AddEventHandler("polo_pisteillegal:WeedFarm", function()
	if Config.GPS then
		x, y, z = Config.WeedFarm.x, Config.WeedFarm.y, Config.WeedFarm.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), true, _U('RecWeed'))
	else
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), true, _U('RecWeed'))
	end
end)

RegisterNetEvent("polo_pisteillegal:WeedTreatment")
AddEventHandler("polo_pisteillegal:WeedTreatment", function()
	if Config.GPS then
		x, y, z = Config.WeedTreatment.x, Config.WeedTreatment.y, Config.WeedTreatment.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiWeed'))
	else
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiWeed1'))
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiWeed'))
	end
end)

RegisterNetEvent("polo_pisteillegal:OpiumFarm")
AddEventHandler("polo_pisteillegal:OpiumFarm", function()
	if Config.GPS then
		x, y, z = Config.OpiumFarm.x, Config.OpiumFarm.y, Config.OpiumFarm.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecOpium'))
	else
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecOpium'))
	end
end)

RegisterNetEvent("polo_pisteillegal:OpiumTreatment")
AddEventHandler("polo_pisteillegal:OpiumTreatment", function()
	if Config.GPS then
		x, y, z = Config.OpiumTreatment.x, Config.OpiumTreatment.y, Config.OpiumTreatment.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiOpium'))
	else
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiOpium1'))
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiOpium'))
	end
end)

RegisterNetEvent("polo_pisteillegal:CokeFarm")
AddEventHandler("polo_pisteillegal:CokeFarm", function()
	if Config.GPS then
		x, y, z = Config.CokeFarm.x, Config.CokeFarm.y, Config.CokeFarm.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecCoke'))
	else
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecCoke'))
	end
end)

RegisterNetEvent("polo_pisteillegal:CokeTreatment")
AddEventHandler("polo_pisteillegal:CokeTreatment", function()
	if Config.GPS then
		x, y, z = Config.CokeTreatment.x, Config.CokeTreatment.y, Config.CokeTreatment.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiCoke'))
	else
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiCoke1'))
		TriggerEvent("polo_pisteillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiCoke'))
	end
end)

--RegisterNetEvent("esx_infoillegal:OgkushFarm")
--AddEventHandler("esx_infoillegal:OgkushFarm", function()
	--if Config.GPS then
		--x, y, z = Config.MethFarm.x, Config.MethFarm.y, Config.MethFarm.z
		--SetNewWaypoint(x, y, z)
		--local source = GetPlayerServerId();
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	--else
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecOgkush'))
	--end
--end)

--RegisterNetEvent("esx_infoillegal:OgkushTreatment")
--AddEventHandler("esx_infoillegal:OgkushTreatment", function()
	--if Config.GPS then
		--x, y, z = Config.MethTreatment.x, Config.MethTreatment.y, Config.MethTreatment.z
		--SetNewWaypoint(x, y, z)
		--local source = GetPlayerServerId();
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	--else
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiOgkush1'))
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiOgkush'))
	--end
--end)

--RegisterNetEvent("esx_infoillegal:Turtle")
--AddEventHandler("esx_infoillegal:Turtle", function()
	--if Config.GPS then
		--x, y, z = Config.SellTurtle.x, Config.SellTurtle.y, Config.SellTurtle.z
		--SetNewWaypoint(x, y, z)
		--local source = GetPlayerServerId();
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	--else
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('SellTurtle1'))
	--end
--end)

--RegisterNetEvent("esx_infoillegal:Shark")
--AddEventHandler("esx_infoillegal:Shark", function()
	--if Config.GPS then
		--x, y, z = Config.SellShark.x, Config.SellShark.y, Config.SellShark.z
		--SetNewWaypoint(x, y, z)
		--local source = GetPlayerServerId();
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	--else
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('SellShark1'))
	--end
--end)

--RegisterNetEvent("esx_infoillegal:washmoney")
--AddEventHandler("esx_infoillegal:washmoney", function()
	--if Config.GPS then
		--x, y, z = Config.washmoney.x, Config.washmoney.y, Config.washmoney.z
		--SetNewWaypoint(x, y, z)
		--local source = GetPlayerServerId();
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	--else
		--TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('Recwash'))
	--end
--end)

AddEventHandler('polo_pisteillegal:hasEnteredMarker', function(zone)
	CurrentAction     = 'menu_info_illegal'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('polo_pisteillegal:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)


-- Create Blips

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		heure = tonumber(GetClockHours())
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		
		if Config.Hours then
			
			if heure > Config.openHours and heure < Config.closeHours then	
				if Config.Blip then
					if times == 0 then
					count = 0
						for k,v in pairs(Config.Zones) do
							count = count + 1
						end
					randomnumber = math.random(1,count)
						for k,v in pairs(Config.Zones)do
							if k == randomnumber then
								blipillegal[k] = AddBlipForCoord(v.x, v.y, v.z)
								SetBlipSprite (blipillegal[k], 133)
								SetBlipDisplay(blipillegal[k], 1)
								SetBlipScale  (blipillegal[k], 0.1)
								SetBlipColour (blipillegal[k], 5)
							 	SetBlipAsShortRange(blipillegal[k], true)

								BeginTextCommandSetBlipName('STRING')
								AddTextComponentString(_U('illegalblip'))
								EndTextCommandSetBlipName(blipillegal[k])
							end
						end
						times = 1
					end
				end
			else
				if times == 1 then
					for k, v in pairs(Config.Zones) do
						RemoveBlip(blipillegal[k])
					
					end
					times = 0
				end
			end
		else
			if times == 0 then
				for k,v in pairs(Config.Zones)do
					blipillegal[k] = AddBlipForCoord(v.x, v.y, v.z)
					SetBlipSprite (blipillegal[k], 133)
					SetBlipDisplay(blipillegal[k], 1)
					SetBlipScale  (blipillegal[k], 0.1)
					SetBlipColour (blipillegal[k], 5)
					SetBlipAsShortRange(blipillegal[k], true)

					BeginTextCommandSetBlipName('STRING')
					AddTextComponentString(_U('illegalblip'))
					EndTextCommandSetBlipName(blipillegal[k])
				end
				times = 1
			end
		end
		
		-- Enter / Exit marker events
			for k,v in pairs(Config.Zones) do
				if k == randomnumber then
					if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.MarkerSize.x / 2) then
						isInMarker  = true
						currentZone = k
					end
				end
			end
		
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('polo_pisteillegal:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('polo_pisteillegal:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then
		heure	= tonumber(GetClockHours())
		if heure > Config.openHours and heure < Config.closeHours then
		  SetTextComponentFormat('STRING')
		  AddTextComponentString(CurrentActionMsg)
		  DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustReleased(0, 38) and (GetGameTimer() - GUI.Time) > 1000 then
				heure		= tonumber(GetClockHours())
				GUI.Time 	= GetGameTimer()
				
				if CurrentAction == 'menu_info_illegal' then
					if Config.Hours then
						if heure > Config.openHours and heure < Config.closeHours then	
							OpenInfoIllegalMenu()
						else
							TriggerServerEvent('polo_pisteillegal:Nothere')
						end
					else
						OpenInfoIllegalMenu()
					end
				end
				CurrentAction = nil
			end
		end
    end
  end
end)
