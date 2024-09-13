local function SendAlert(text, textype, length)
    if type(text) == "table" then
        local ttext = text.text or 'Placeholder'
        local caption = text.caption or 'Placeholder'
        local ttype = textype or 'info'
        local length = length or 5000
        SendNUIMessage({
            type = ttype,
            length = length,
            text = ttext,
            caption = caption
        })
    else
        local ttype = textype or 'info'
        local length = length or 5000
        SendNUIMessage({
            type = ttype,
            length = length,
            text = text
        })
    end
end

exports('SendAlert', SendAlert)

RegisterNetEvent('torpak:notify', function(text, type, length)
    SendAlert(text, type, length)
end)

RegisterNUICallback('getNotifyConfig', function(data, cb)
    cb(json.encode(Config.Notify))
end)
--[[ 
RegisterCommand('main', function()
    TriggerEvent('torpak:notify', -1, 'Test Ediom seni gidi', 'error')
end) ]]

RegisterCommand('main', function()
exports['torpak-notify']:SendAlert('Torpak', 'success')
--[[ exports['torpak-notify']:SendAlert('ED:V Inspired', 'info') 
exports['torpak-notify']:SendAlert('But Its Not Look Very Good :d', 'error') ]]
exports['torpak-notify']:SendAlert('What Ever. Its My First CSS Adventure LMAO', 'success')
--[[ exports['torpak-notify']:SendAlert('You Are Hunger So Much', 'warn') ]]
end)
