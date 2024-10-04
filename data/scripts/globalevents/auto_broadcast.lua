local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {

    "[Hey!]: Every three hours will result in a lottery! May the odds ever be in your favor!",
    "[Reminder]: Dont forget! You are the best!",
	"[Bugs]: If you have found something that is wrong on the map or something else that is wrong, dont forget to report it either on Discord or the website!",
	"[Discord]: If you want to join our discord, https://discord.com/invite/NrveNDn",

}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT) 
    return true
end
AutoBroadCast:interval(1900000)
AutoBroadCast:register()