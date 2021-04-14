ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RMenu.Add('Drogue1', 'main1', RageUI.CreateMenu("Drogue1", "WEED"))



Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('Drogue1', 'main1'), true, true, true, function()
            RageUI.Button("Traiter la Weed", " ", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    notify('~g~Traitage de Weed')
                    RageUI.CloseAll()
                    local player = PlayerPedId()
                    
                   
                    if IsPedInAnyVehicle(player) then
                        
                        exports['progressBars']:startUI(30000, "Traitage en Cours....")
                    else

                        exports['progressBars']:startUI(30000, "Traitage en Cours....")
                        startScenario('world_human_gardener_plant')
                        Wait(5000)
                        TriggerServerEvent('weed_pooch')
                        Wait(5000)
                        TriggerServerEvent('weed_pooch')
                        Wait(5000)
                        TriggerServerEvent('weed_pooch')
                        Wait(5000)
                        TriggerServerEvent('weed_pooch')
                        Wait(5000)
                        TriggerServerEvent('weed_pooch')
                        Wait(5000)
                        TriggerServerEvent('weed_pooch')
                
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


    
    
    function startAnim(lib, anim)
        ESX.Streaming.RequestAnimDict(lib, function()
            TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        end)
    end



    function startScenario(anim)
        TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
    end

    function notify(text)
        SetNotificationTextEntry('STRING')
        AddTextComponentString(text)
        DrawNotification(false, false)
    end

    local position = {
        {x = 3725.40 , y = 4525.73, z = 22.47, }
    }    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            for k in pairs(position) do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
                if dist <= 1.0 then
                   RageUI.Text({
                        message = "[~b~E~w~] Traiter la ~g~Weed",
                        time_display = 1
                    })
                    if IsControlJustPressed(1,51)  then
                        RageUI.Visible(RMenu:Get('Drogue1', 'main1'), not RageUI.Visible(RMenu:Get('Drogue1', 'main1')))
                    end
                end
            end
        end
    end)