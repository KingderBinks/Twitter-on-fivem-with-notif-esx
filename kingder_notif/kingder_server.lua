--------------SCRIPT FAIT PAR "KYLIAN" EDITER PAR KINGDER (webhook logs)

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('twt', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Twitter', ''..name..'', ''..msg..'', 'CHAR_STRETCH', 0)

        end
        KingderWebhook(LogsBlue, "TWITTER", "Le joueur :"..name.." a envoyé le message : "..msg)
    end
end, false)


RegisterCommand('ano', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Darknet', 'Anonyme', ''..msg..'', 'CHAR_STRETCH', 0)
        end
        KingderWebhook(LogsBlue, "DARKNET", "Le joueur :"..name.." a envoyé le message : "..msg)
    end
end, false)

WebHook = "https://discord.com/api/webhooks/884435885830074408/MD4pcCGnSpjEfwubT8xbjNU8F3l9o069OpzNvhwEnRI3likfUYnemKnmDOVFSCKiCS5v"
Name = "Kingder"
Logo = "https://resize-europe1.lanmedia.fr/r/622,311,forcex,center-middle/img/var/europe1/storage/images/europe1/international/le-panda-geant-nest-plus-en-danger-mais-reste-menace-2837755/28733065-1-fre-FR/Le-panda-geant-n-est-plus-en-danger-mais-reste-menace.jpg" -- He must finish by .png or .jpg
LogsBlue = 3447003

function KingderWebhook(Color, Title, Description)
    local Content = {
            {
                ["color"] = Color,
                ["title"] = Title,
                ["description"] = Description,
                ["footer"] = {
                    ["text"] = Name,
                    ["icon_url"] = Logo,
                },
            }
        }
    PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end
