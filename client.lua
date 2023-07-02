local color = config.meTextColor -- Text color

local ragdoll = false

if config.ragdoll == true then
Citizen.CreateThread(function()
	while true do
 		Citizen.Wait(0)
		
 		if ragdoll then
 		SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
		SetPlayerInvincible(GetPlayerPed(-1), false) -- DON'T TOUCH! IT DOES NOT SET THEM INVINCIBLE!.
			end
		end
	end)
end
	
RegisterCommand('+ragdoll', function()
	ragdoll = true
end, false)

RegisterCommand('-ragdoll', function()
	ragdoll = false
end, false)

RegisterKeyMapping('+ragdoll', 'Ragdoll', 'keyboard', 'OEM_3')
	
if config.highPingKicker == true then 
Citizen.CreateThread(function() 
	while true do
		Wait(1000)

		TriggerServerEvent("CheckPlayerPing")
		end
	end)
end


if config.afkKicker == true then
Citizen.CreateThread(function()
	while true do
		Wait(1000)

local warn = config.adviseAfkStatus
local limit = 600

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if warn and time == math.ceil(limit - 300) then -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
						TriggerEvent("chatMessage", "BE ADVISED", {255, 45, 0}, "You have been AFK for 5 minutes, in 5 more minutes you will be kicked for being AFK!") -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
					end	
					if warn and time == math.ceil(limit - 360) then-- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
						TriggerEvent("chatMessage", "WARNING", {255, 45, 0}, "~h~You will be kicked in 4 minute(s) for being AFK!") -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
					end			
					if warn and time == math.ceil(limit - 420) then -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
						TriggerEvent("chatMessage", "WARNING", {255, 45, 0}, "~h~You will be kicked in 3 minute for being AFK!") -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
					end					
					if warn and time == math.ceil(limit - 480) then -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
						TriggerEvent("chatMessage", "WARNING", {255, 45, 0}, "~h~You will be kicked in 2 minute for being AFK!") -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
					end	
					if warn and time == math.ceil(limit - 540) then -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
						TriggerEvent("chatMessage", "WARNING", {255, 45, 0}, "~h~You will be kicked in 1 minute for being AFK!") -- YOU WILL NEED TO CHANGE THIS LINE IF YOU MODIFY THE AFK LIMIT!
					end	
					
					time = time - 1
					print(time) -- IF YOU TURN THIS ON, THIS WILL PRINT IN YOUR F8 MENU IN-GAME SO YOU CAN CHECK IF THE TIMER IS WORKING. NO NEED FOR IT TO BE ON REALLY!!
				else
					TriggerServerEvent("KickPlayer")
				end
			else
				time = limit
			end

			prevPos = currentPos
		end
		end
	end)
end

 
 blip = nil
blips = {}

local onduty = false

RegisterCommand(config.ondutycmd, function(source, args)
if config.ondutymode == false then
	TriggerEvent('chatMessage', '[SYSTEM]', {255,255,255}, '^1^*Onduty Mode is not enabled in the config.lua!')
end
    if config.passwordmode then 
        if args[1] == config.ondutypassword then
            if not onduty then 
                onduty = true
                TriggerEvent('chatMessage', '[SYSTEM]', {255,255,255}, '^3You are now ^*On-Duty^r^3 and you are able to recieve 911 calls.')
            else
                onduty = false
                TriggerEvent('chatMessage',  '[SYSTEM]', {255,255,255}, '^1You are now ^*Off-Duty^r^1 and you will no longer be able to recieve 911 calls.')
            end
        else
            TriggerEvent('chatMessage', '[SYSTEM]', {255,255,255}, '^1Incorrect Password')
        end
    else
	if config.ondutymode then
		if not onduty then
            onduty = true
            TriggerEvent('chatMessage', '[SYSTEM]', {255,255,255}, '^3You are now ^*On-Duty^r^3 and you are able to recieve 911 calls.')
        else
            onduty = false
            TriggerEvent('chatMessage', '[SYSTEM]', {255,255,255}, '^1You are now ^*Off-Duty^r^1 and you will no longer be able to recieve 911 calls.')
           end
       end
    end
end)

if config.passwordmode then
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/' .. config.ondutycmd, 'Allows you to go on-duty to receive 911 Calls from Dispatch!', {
    { name="Password", help="Enter the on-duty password!" }
})
end)
else
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/' .. config.ondutycmd, 'Allows you to go on-duty to receive 911 Calls from Dispatch!', {
    { name="NO PASSOWRD", help="You do not need a password!" }
})
end)
end


RegisterCommand('911', function(source, args)
    
local name = GetPlayerName(PlayerId())
local ped = GetPlayerPed(PlayerId())
local x, y, z = table.unpack(GetEntityCoords(ped, true))
local street = GetStreetNameAtCoord(x, y, z)
local location = GetStreetNameFromHashKey(street)
local msg = table.concat(args, ' ')

    if args[1] == nil then
        TriggerEvent('chatMessage', '^5911', {255, 255, 255}, 'What is the nature of your emergency?')
    end
    if args[1] ~= nil then
        TriggerServerEvent('911', location, msg, x, y, z, name)
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/911', 'Submits a call to Emergency Services!', {
    { name="Report", help="Enter the incident/report here!" }
})
end)

---------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(name, x, y, z)

blip = nil
blips = {}

local BlipInGeneralArea = AddBlipForCoord(x, y, z)

	SetBlipSprite(BlipInGeneralArea, config.blipSprite)
	SetBlipScale(BlipInGeneralArea, config.blipSpriteSize)

    BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("911 REQUEST - " .. name .. " ID: ")
    EndTextCommandSetBlipName(BlipInGeneralArea)

    table.insert(blips, BlipInGeneralArea)

    Wait(config.GeneralAreaDisplayTime * 1000)
    for i, GeneralArea in pairs(blips) do 
		RemoveBlip(BlipInGeneralArea)

    end
end)


RegisterNetEvent('911:setGeneralArea')
AddEventHandler('911:setGeneralArea', function(name, x, y, z)

blip = nil
blips = {}

local blip = AddBlipForRadius(x, y, z, 105.0)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, config.generalAreaColor)
	SetBlipAlpha(blip, 128)
	
	
local GeneralArea = AddBlipForCoord(x, y, z)

	SetBlipSprite(GeneralArea, sprite)
	SetBlipDisplay(GeneralArea, true)
	SetBlipScale(GeneralArea, 0.9)
	SetBlipColour(GeneralArea, config.generalAreaColor)
    SetBlipAsShortRange(GeneralArea, false)

    table.insert(blips, GeneralArea)
    table.insert(blips, BlipInGeneralArea)

    Wait(config.GeneralAreaDisplayTime * 1000)
    for i, GeneralArea in pairs(blips) do 
        RemoveBlip(blip)
        RemoveBlip(GeneralArea)
		RemoveBlip(BlipInGeneralArea)

    end
end)

RegisterNetEvent('911:sendtoteam')
AddEventHandler('911:sendtoteam', function(name, location, msg, x, y, z)
    if onduty then 
        TriggerServerEvent('911:sendmsg', name, location, msg, x, y, z)
    end
end)

 
 
 --
 
if config.allowToJailMyself == false then
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/jail', 'Send someone to jail!', {
    { name="Password", help="Enter the Jail password!" }, { name="ID", help="Suspect/Targeted User ID" }, { name="Time", help="Time in Seconds!"}
})
end)
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/unjail', 'Un-jail a User!', {
    { name="Password", help="Enter the Un-Jail password!" }, { name="ID", help="Targeted User ID" }
})
end)
else
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/jail', 'Send someone to jail!', {
    { name="Password", help="Enter the Jail password!" }, { name="ID", help="Suspect/Targeted User ID" }, { name="Time", help="Time in Seconds!"}
})
end)
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/unjail', 'Un-jail a User!', {
    { name="Password", help="Enter the Un-Jail password!" }, { name="ID", help="Targeted User ID" }
})
end)
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/jailmyself', 'Jail yourself!', {
    { name="Time", help="Time in Seconds!" }
})
end)
end

local cJ = false
local eJE = false

RegisterNetEvent("Jailed")
AddEventHandler("Jailed", function(jailTime)

    if c3 == true then
        return
    end

    local pC = GetPlayerPed(-1)
    if DoesEntityExist(pC) then
	

        Citizen.CreateThread(function()
            local playerOldLoc = GetEntityCoords(pC, true)
            SetEntityCoords(pC, config.x, config.y, config.z)
			notify(config.messageInJail)
            cJ = true
            eJE = false
            while jailTime > 0 and not eJE do
                pC  = GetPlayerPed(-1)
                RemoveAllPedWeapons(pC, true)
                SetEntityInvincible(pC, true)
                if IsPedInAnyVehicle(pC, false) then
                    ClearPedTasksImmediately(pC)
                end

                if jailTime % 30 == 0 then
                    TriggerEvent('chatMessage', "[Jail]", {0, 0, 0}, jailTime .. " more seconds until you are released from prison!")
                end
                Citizen.Wait(500)
                local pL = GetEntityCoords(pC, true)
                local D = Vdist(config.x, config.y, config.z, pL['x'], pL['y'], pL['z'])
                if D > 70 then
                    SetEntityCoords(pC, config.x, config.y, config.z)
                    if D > 125 then
                        jailTime = jailTime + 25
                        if jailTime > 1500 then
                            jailTime = 1500
                end
                TriggerEvent('chatMessage', "[Public Defender]", {0, 0, 0}, "Your jail time has been extended because of your unlawful escape attempt")
            end
        end
        jailTime = jailTime - 0.5
    end
    TriggerEvent('chatMessage', "[Advanced-Jailing]", { 0, 0, 0 }, GetPlayerName(PlayerId()) .." has been released from jail!")
			SetEntityCoords(pC, config.rx, config.ry, config.rz)
			cJ = false
			SetEntityInvincible(pC, false)
        end)
    end
end)

RegisterNetEvent("Unjail")
AddEventHandler("Unjail", function()
	eJE = true
end)

--

local pedDisplaying = {}

local function DrawText3D(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    local scale = 200 / (GetGameplayCamFov() * dist)

        SetTextColour(color.r, color.g, color.b, color.a)
        SetTextScale(0.0, config.meTextSize * scale)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextDropShadow()
        SetTextCentre(true)
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        SetDrawOrigin(coords, 0)
        EndTextCommandDisplayText(0.0, 0.0)
        ClearDrawOrigin()

end


local function Display(ped, text)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)

    if dist <= config.meShowDistance then

        pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1
		
        local display = true

        Citizen.CreateThread(function()
            Wait(config.meDisplayTime * 1000)
            display = false
        end)


        local offset = 0.8 + pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3D(vector3(x, y, z), text)
            end
            Wait(0)
        end

        pedDisplaying[ped] = pedDisplaying[ped] - 1

    end
end


RegisterCommand("dv", function()
    TriggerEvent("JM-DeleteVehicle:deleteVehicle")
end, false)

local distanceToCheck = 5.0
local numRetries = 5

RegisterNetEvent("JM-DeleteVehicle:deleteVehicle")
AddEventHandler("JM-DeleteVehicle:deleteVehicle", function()
    local ped = PlayerPedId()

    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)

        if (IsPedSittingInAnyVehicle(ped)) then 
            local vehicle = GetVehiclePedIsIn(ped, false)

            if (GetPedInVehicleSeat(vehicle, -1) == ped) then 
                DeleteGivenVehicle( vehicle, numRetries)
            else 
                notify("~o~Please Enter the Vehicle!")
            end 
        else
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, distanceToCheck, 0.0)
            local vehicle = GetVehicleInDirection(ped, pos, inFrontOfPlayer)

            if (DoesEntityExist(vehicle)) then 
                DeleteGivenVehicle(vehicle, numRetries)
            else 
                notify("~r~No Vehicles Nearby")
            end 
        end 
    end 
end )

function DeleteGivenVehicle(veh, timeoutMax)
    local timeout = 0 

    SetEntityAsMissionEntity(veh, true, true)
    DeleteVehicle(veh)

    if (DoesEntityExist(veh)) then
        notify("~r~Failed to delete vehicle")
        while (DoesEntityExist(veh) and timeout < timeoutMax) do 
            DeleteVehicle(veh)

            if (not DoesEntityExist(veh)) then 
                notify("~g~Vehicle Deleted")
            end 

            timeout = timeout + 1 
            Citizen.Wait(500)

            if (DoesEntityExist(veh) and (timeout == timeoutMax - 1)) then
                notify("~r~Failed to delete vehicle")
            end 
        end 
    else 
        notify("~g~Vehicle Deleted")
    end 
end 

function GetVehicleInDirection(entFrom, coordFrom, coordTo)
	local rayHandle = StartShapeTestCapsule(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7)
    local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
    
    if (IsEntityAVehicle( vehicle)) then 
        return vehicle
    end 
end

TriggerEvent('chat:addSuggestion', '/dv', 'Delete Nearby Vehicles!')

--

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

RegisterNetEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, serverId)
    local player = GetPlayerFromServerId(serverId)
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        Display(ped, text)
    end
end)

AddEventHandler("playerSpawned", function(spawn)
	SetCanAttackFriendly(GetPlayerPed(-1), config.PvP, false)
	NetworkSetFriendlyFireOption(config.PvP)
end)

RegisterNetEvent('sendProxMsgM')
AddEventHandler('sendProxMsgM', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^9Local OOC | ^0" .. GetPlayerName(PlayerId()) .. ": ".." " .. message .. " ")
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^9Local OOC | ^0" .. GetPlayerName(PlayerId()) .. ": ".." " .. message .. " ")
  end
end)
