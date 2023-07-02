--------------------------------- RP - CORE ----------------------------------
-- Need Support? Join my Modifications discord: https://discord.gg/kSCgxB3Ucz


-- Do not change anything unless you know what your doing -- 
-- Do not change anything unless you know what your doing -- 
-- Do not change anything unless you know what your doing -- 
-- Do not change anything unless you know what your doing -- 
-- Do not change anything unless you know what your doing -- 
-- Do not change anything unless you know what your doing -- 


-------------------------------------------------------
RegisterCommand("ooc", function(source, args, message, raw) 
    if #args <= 0 then return end
    local message = table.concat(args, " ")
    TriggerClientEvent('chatMessage', -1, '^9 OOC | ^0' ..  GetPlayerName(source) .. " ^0", {128, 128, 128}, message)
end)

RegisterCommand("looc", function(source, args, raw) 
    TriggerClientEvent('sendProxMsgM', -1,  GetPlayerName(source) .. " ^0", {128, 128, 128}, table.concat(args, " "))
end)

RegisterCommand("twt", function(source, args, message, raw) 
    if #args <= 0 then return end
    local message2 = table.concat(args, " ")
    TriggerClientEvent('chatMessage', -1, '^4^* Twitter | ^4(@' ..  GetPlayerName(source) ..") | ^0", {128, 128, 128}, message2) -- THis is the Twt line just edit the ` ") | ^4 " part for config
end)

RegisterCommand("do", function(source, args, message, raw) 
    if #args <= 0 then return end
    local message3 = table.concat(args, " ")
    TriggerClientEvent('chatMessage', -1, '^4 Do | ^0' ..  GetPlayerName(source) .." ^0", {128, 128, 128}, message3)
end)

RegisterCommand("it", function(source, args, message, raw) 
    if #args <= 0 then return end
    local message4 = table.concat(args, " ")
    TriggerClientEvent('chatMessage', -1, '^4 It | ^0' ..  GetPlayerName(source) .." ^0", {128, 128, 128}, message4)
end)

RegisterCommand("darkweb", function(source, args, message, raw) 
    if #args <= 0 then return end
    local message5 = table.concat(args, " ")
    TriggerClientEvent('chatMessage', -1, '^9^*(^1^*Darkweb^9^*) ^0^* ANONYMOUS^0#'.. source.. ' ^0',  {128, 128, 128}, message5)
end)

RegisterCommand("anontwt", function(source, args, message, raw) 
    if #args <= 0 then return end
    local message6 = table.concat(args, " ")
    TriggerClientEvent('chatMessage', -1, '^4^* Twitter | ^4(^*@ANONYMOUS^5#'.. source.. '^4) ^0',  {128, 128, 128}, message6)
end)

RegisterCommand("advert", function(source, args, message, raw) 
if #args <= 0 then return end
	local message = table.concat(args, " ")
	if config.advertStyle == 1 then
				TriggerClientEvent('chatMessage', -1, '^0^*[^3^*Local Advertisement^0^*] ^r^*#'.. source ..' |^0', {255,215,0}, message) --ADVERT WITH USERNAME
			elseif config.advertStyle == 2 then
				TriggerClientEvent('chatMessage', -1, '^0^*[^1Local AD^0] ^r^*#'.. source ..' |^0', {255,215,0}, message) --ADVERT WITH TWITTER STYLE USERNAME HANDLE
			elseif config.advertStyle == 3 then
				TriggerClientEvent('chatMessage', -1, '^0^*[^1ADVERT^0]^r', {255,215,0}, message) --ADVERT WITH NO USERS IDENTIFIER [NOT SUGGESTED AS IT CAN BE ABUSED!]
			end
	end, false)

RegisterCommand("discord", function(source, args, message) 
 if config.enableDiscordCommand == false then
	TriggerClientEvent('chatMessage', source, " ".. config.disabledCommandMessage)
else
    TriggerClientEvent('chatMessage', source, " ^1".. config.discordLink)
end
end)


RegisterCommand("cad", function(source, args, message, raw) 
 if config.enableCadCommand == false then
	TriggerClientEvent('chatMessage', source, " ".. config.disabledCommandMessage)
else
    TriggerClientEvent('chatMessage', source, " ^1".. config.activecadLink)
end
end)


RegisterCommand("website", function(source, args, message, raw) 
 if config.enableWebsiteCommand == false then
	TriggerClientEvent('chatMessage', source, " ".. config.disabledCommandMessage)
else
    TriggerClientEvent('chatMessage', source, " ^1".. config.websiteLink)
end
end)

Citizen.CreateThread(function()
	print('^7[^4AuroraHosts^7] ^3Use code ^5JMMODS^3 at checkout for ^625% ^3off of any selected game server. Use this Referral Link: ^5https://billing.aurorahosts.com/aff.php?aff=82 ^3to get started!');
end) 

local function TableToString(tab)
	local str = ""
	for i = 1, #tab do
		str = str .. " " .. tab[i]
	end
	return str
end

RegisterCommand("me", function(source, args)
    local text = "*" .. TableToString(args) .. " *"
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end)

if config.highPingKicker then
RegisterServerEvent("CheckPlayerPing")
AddEventHandler("CheckPlayerPing", function()
	ping = GetPlayerPing(source)
	if ping >= config.maxPingLimit then
		DropPlayer(source, "Ping is too high (Limit: " .. config.maxPingLimit .. " Your Ping: " .. ping .. ")")
	end
end)
end

if config.afkKicker then
RegisterServerEvent("KickPlayer")
AddEventHandler("KickPlayer", function()
	DropPlayer(source, "You have been kicked for being AFK too long!!")
end)
end

-- Do not change anything unless you know what your doing! -- 

RegisterServerEvent('911')
AddEventHandler('911', function(location, msg, x, y, z, name, p)
	
	local pName = GetPlayerName(source)
	local p = GetPlayerPed(source)
	if config.disableChatCalls == false then
		if config.ondutymode then
				TriggerClientEvent('911:sendtoteam', -1, name, location, msg, x, y, z)
				TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1This call has been sent to the Emergency Services!')
			else
				TriggerClientEvent('chatMessage', -1, '^*^8New 911 Report:', {0, 255, 238})
				TriggerClientEvent('chatMessage', -1, '   ^*^8[Caller Name]^r^7', {0, 255, 238}, " " .. pName .. " ")
				TriggerClientEvent('chatMessage', -1, '   ^*^8[Caller ID]^r^7', {0, 255, 238}, " " .. source .. " ")
				TriggerClientEvent('chatMessage', -1, '   ^*^8[Location]^r^7', {0, 255, 238}, location)
				TriggerClientEvent('chatMessage', -1, '   ^*^8[Report]^r^7', {0, 255, 238}, msg)
			end
				sendDiscord('911 Call Logger \n', '**Caller Name: **' .. pName .. '\n**  Caller ID: **' .. source .. '\n**  Location: **' .. location .. '\n**  Report: **' .. msg)
				TriggerClientEvent('911:setBlip', -1, name, x, y, z)
		if config.showCallerArea == true then
				TriggerClientEvent('911:setGeneralArea', -1, name, x, y, z)
				TriggerClientEvent('911:setBlip', -1, name, x, y, z)
		end
	end
end)

RegisterServerEvent('911:sendmsg')
AddEventHandler('911:sendmsg', function(name, location, msg, x, y, z)
	TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^*^8Dispatch: ^8Caller ID: ^r' .. name .. ' (' .. source .. ')' .. '^*^8 | Location: ^r' .. location .. '^*^8 | Report: ^r' .. msg)
	TriggerClientEvent('911:setBlip', source, name, x, y, z)
	if config.showCallerArea then
	TriggerClientEvent('911:setGeneralArea', source, name, x, y, z)
		TriggerClientEvent('911:setBlip', source, name, x, y, z)
	end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('chatMessage', function(source, name, msg)

sm = stringsplit(msg, " ")

if sm[1] == "/jail" then
        CancelEvent()
   
        if sm[2] == nil then
            TriggerClientEvent("chat:addMessage", source, {
                color = {0, 0, 0},
                args = {"[SYSTEM]", "You have forgotten to provide the password! ^7/jail (password) (id) (time)"}
            })
            return
        end

        if sm[2] ~= config.jailPassword then
            TriggerClientEvent("chat:addMessage", source, {
                color = {0, 0, 0},
                args = {"[SYSTEM]", "The password you have provided is incorrect!"}
            })
            return
        end

        if sm[3] == nil then
            TriggerClientEvent("chat:addMessage", source, {
                color = {0, 0, 0},
                args = {"[SYSTEM]", "You have forgotten to provide an ID! ^7/jail (password) (id) (time)"}
            })
            return
        end

        if sm[4] == nil then
            TriggerClientEvent("chat:addMessage", source, {
                color = {0, 0, 0},
                args = {"[SYSTEM]", "You have forgotten to provide a time! ^7/jail (password) (id) (time)"}
            })
            return
        end

    if tablelength(sm) > 2 then
    if sm[2] == config.jailPassword then
    
        local playerID = tonumber(sm[3])
        local jailTime = config.defaultJailTime

    if tablelength(sm) > 3 then
        if sm[4] ~= nil then
            jailTime = tonumber(sm[4])

    end

    if jailTime > config.maxJailTime then
        jailTime = config.maxJailTime
    end

    if GetPlayerName(playerID) == nil then
        
        TriggerClientEvent('chat:addMessage', source, {
            color = {0, 0, 0},
            args = {"[SYSTEM]","Player has not been found!"}
        })

    return
end

    if GetPlayerName(playerID) ~= nil then
if config.assignJailPed then
	SetPlayerModel(playerID, config.jailPedHash)
    TriggerClientEvent("Jailed", source, jailTime)
    TriggerClientEvent('chatMessage', -1, "[Judge]", {0, 0, 0}, GetPlayerName(playerID) .. " has been jailed for " .. jailTime .. " seconds!")
else
    TriggerClientEvent("Jailed", source, jailTime)
    TriggerClientEvent('chatMessage', -1, "[Judge]", {0, 0, 0}, GetPlayerName(playerID) .. " has been jailed for " .. jailTime .. " seconds!")
end
	return
end


                end
            end
        end
    end

 if sm[1] == "/unjail" then
     CancelEvent()

     if sm[2] == nil then
        TriggerClientEvent("chat:addMessage", source, {
            color = {0, 0, 0},
            args = {"[SYSTEM]", "You have forgotten to provide the password! ^7/unjail (password) (id)"}
        })
        return
    end
     
    if sm[2] ~= config.jailPassword then
        TriggerClientEvent("chat:addMessage", source, {
            color = {0, 0, 0},
            args = {"[SYSTEM]", "The password you have provided is incorrect!"}
        })
        return
    end

    if sm[3] == nil then
                TriggerClientEvent("chat:addMessage", source, {
                    color = {0, 0, 0},
                    args = {"[SYSTEM]", "You have forgotten to provide an ID! ^7/unjail (password) (id)"}
                })
                return
            end

     if tablelength(sm) > 2 then
        if sm[2] == config.jailPassword then
            
            local jailPlayerID = tonumber(sm[3])


    if GetPlayerName(jailPlayerID) == nil then
        TriggerClientEvent("chat:addMessage", source, {
            color = {0, 0, 0},
            args = {"[SYSTEM]","Player has not been found!"}
        })
        return
     end

     if GetPlayerName(jailPlayerID) ~= nil then
        TriggerClientEvent("Unjail", jailPlayerID)
        TriggerClientEvent("chat:addMessage", source, {
            color = {0, 0, 0},
            args = {"[SYSTEM]", "You have been released from jail!"}})
            end
       
            
            end
    end
end

if config.allowToJailMyself == false then
elseif sm[1] == "/jailmyself" then
    CancelEvent()
    local jailTime = config.defaultJailTime

    if sm[2] == nil then
        TriggerClientEvent("chat:addMessage", source, {
            color = {0, 0, 0},
            args = {"[SYSTEM]", "You have forgotten to provide the time! ^7/jailmyself (time)"}
        })
        return
    end

    if sm[2] ~= nil then
        jailTime = tonumber(sm[2])
    end

    if jailTime > config.maxJailTime then
        jailTime = config.maxJailTime 
    end
	
if config.assignJailPed then
	SetPlayerModel(source, config.jailPedHash)
    TriggerClientEvent("Jailed", source, jailTime)
    TriggerClientEvent('chatMessage', -1, "[Judge]", {0, 0, 0}, GetPlayerName(source) .. " has been jailed for " .. jailTime .. " seconds!")
else
    TriggerClientEvent("Jailed", source, jailTime)
    TriggerClientEvent('chatMessage', -1, "[Judge]", {0, 0, 0}, GetPlayerName(source) .. " has been jailed for " .. jailTime .. " seconds!")
end
end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

if config.hideDisabledCommandsInChat == false then
return;
else
AddEventHandler('chatMessage', function(Source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
    if string.find(args[1], "/") then
        local cmd = args[1]
        table.remove(args, 1)
	else
		TriggerClientEvent('chatMessage', -1, Name, { 255, 255, 255 }, Msg)
	end
end)
end

local embedColor = config.embedColor
local embedName = config.webhookUsername
local IconURL = config.webhookIcon


function sendDiscord(name, message, icon_url)
	local content = {
        {
        	["color"] =  embedColor,
            ["title"] = "**911 Caller Reported**",
	    ["icon_url"] = IconURL,
            ["description"] = message,
        }
    }
  	PerformHttpRequest(config.dispatchWebhook, function(err, text, headers) end, 'POST', json.encode({username = embedName, embeds = content, avatar_url = IconURL}), { ['Content-Type'] = 'application/json' })
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end