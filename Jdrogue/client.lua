ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)
RMenu.Add('Drogue', 'main', RageUI.CreateMenu("Drogue", "WEED"))
Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('Drogue', 'main'), true, true, true, function()
            RageUI.Button("Récolter de la Weed", " ", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    notify('~g~Récolte de Weed')
                    local player = PlayerPedId()
                    if IsPedInAnyVehicle(player) then
                        exports['progressBars']:startUI(30000, "Récolte en Cours....")
                    else

                        exports['progressBars']:startUI(30000, "Récolte en Cours....")
                        startScenario('world_human_gardener_plant')
                        Wait(5000)
                        FreezeEntityPosition()
                        TriggerServerEvent('weed')
                        Wait(5000)
                        TriggerServerEvent('weed')
                        
                        Wait(5000)
                        TriggerServerEvent('weed')
                        
                        Wait(5000)
                        TriggerServerEvent('weed')
                        
                        Wait(5000)
                        TriggerServerEvent('weed')
                        
                        Wait(5000)
                        TriggerServerEvent('weed')
                
                    end
          
                end
            end)         
            RageUI.Button("Stop Animation !", " ", {}, true, function(Hovered, Active, Selected)    
                if (Selected) then
                    startAnim('gestures@m@standing@casual', 'gesture_me')
                end
            end)
            end, function()
            end, 1)
    
    
            Citizen.Wait(0)
        end
    end)

    function notify(text)
        SetNotificationTextEntry('STRING')
        AddTextComponentString(text)
        DrawNotification(false, false)
    end

    local position = {
        {x = 2224.27 , y = 5577.67, z = 53.78, }
    }    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            for k in pairs(position) do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
                if dist <= 1.0 then
                   RageUI.Text({
                        message = "[~b~E~w~] Récolte ~g~Weed",
                        time_display = 1
                    })
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('Drogue', 'main'), not RageUI.Visible(RMenu:Get('Drogue', 'main')))
                    end
                end
            end
        end
    end)