--------------------------------------------
---       © Copyright FuriousFoxGG       ---
---    https://github.com/FuriousF0xGG   ---
---     https://discord.gg/cPSAuJppyr    ---
--- Date Created: 03/26/2023 Time: 23:00 ---
--------------------------------------------

print("\n===========\nLoading " ..GetCurrentResourceName().. "\nScript Enabled: " ..tostring(Config.ScriptEnabled).. "\n===========")
if Config.ScriptEnabled then 
if GetCurrentResourceName() == "M-Announce" then -- DO NOT REMOVE
    
TriggerClientEvent('chat:addSuggestion', -1, '/'..Config.Announce.Command, 'Send an Announcement to the Server.', {{ name="Message", help="The message you would like to announce."}})

RegisterCommand(Config.Announce.Command, function(source, args, raw)
    if IsPlayerAceAllowed(source, "furiousfoxgg.announce") then 
        if args[1] then 
    if Config.Announce.MythicNotify then 
        TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'error', text =  "Announcement: " ..table.concat(args, " ") .. "<br/>By User: " ..GetPlayerName(source):gsub("~%a~", ""):gsub("~italic~", "")})
    elseif Config.Announce.tNotify then 
        TriggerClientEvent('t-notify:client:Custom', -1, {
            style  =  'error', duration  =  10000, title  =  'Announcement', message  =  "Announcement: "..table.concat(args, " ").."\nBy User: " ..GetPlayerName(source):gsub("~%a~", ""):gsub("~italic~", ""), sound  =  false})
    elseif Config.Announce.ChatMsg then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(44,46,45, 50); border-radius: 5px;">{0} <br> {1}</div>',
            args = {"Announcement By " ..GetPlayerName(source):gsub("~%a~", ""):gsub("~italic~", ""), table.concat(args, " ")}
        })
    end
else 
    TriggerClientEvent('chat:addMessage', source, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(44,46,45, 50); border-radius: 5px;">{0} <br> {1}</div>',
        args = {"~h~~r~SYSTEM ERROR: ", "Incorrect Usage: \"/Announce [Message]\""}
    })
end
else 
    TriggerClientEvent('chat:addMessage', source, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(44,46,45, 50); border-radius: 5px;">{0} <br> {1}</div>',
        args = {"~h~~r~SYSTEM ERROR: ", "You do not have permission to use this command."}
    })
    end
end)

else 
    print("\nERROR: " ..GetCurrentResourceName().. " Needs to be Named M-Announce\n===========")
    end
else 
    print("\n"..GetCurrentResourceName().. " is currently disabled as Config.ScriptEnabled = " ..tostring(Config.ScriptEnabled).. "\n===========")
end
