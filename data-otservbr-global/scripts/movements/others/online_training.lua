local FromUID = 60000  -- The specific UID from
local ToUID = 60200  -- The specific UID from
local interval = 1 * 60 * 1000 -- 1 minute interval to check soul
local teleportPosition = Position(32369, 32241, 7)  -- Teleport destination when soul is out
local activePlayers = {}
local playerEvents = {}

local currentUID = FromUID

local function checkTrainingTile(playerId)
    local player = Player(playerId)
    if not player or not player:isPlayer() then
        return
    end
	

    -- Check player's soul
    if player:getSoul() < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are too exhausted to continue training. You need more soul points to proceed.")
        player:teleportTo(teleportPosition)
        teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
        activePlayers[playerId] = nil
        return
    end


    playerEvents[playerId] = addEvent(function()
        if activePlayers[playerId] then  -- Only continue if the player is still active
			-- Deduct soul and repeat the check after the interval
			player:addSoul(-1)
            checkTrainingTile(playerId)
        end
    end, interval)
end


function showTimeLeft(number, usewords)
   local number = tonumber(number)
   if not number then
     return "error"
   end
 
   if number < 0 then
     return "expired"
   end
 
   local clocknum = os.date("!%X", number):split(":") -- h:m:s
   local day = math.floor(number / 86400)  -- Calculate full days
   local hour = tonumber(clocknum[1])
   local minute = clocknum[2]
   local second = clocknum[3]
 
   if day > 0 then
     hour = hour + (day * 24) -- Adjust hours based on the number of full days
   end

   if not usewords then
     return table.concat({day, hour, minute, second}, ":")
   end
 
   local text = {}
   if day > 0 then
     table.insert(text, day .. " day" .. (day > 1 and "s" or ""))
   end
 
   if hour ~= "00" then
     table.insert(text, tonumber(hour) .. " hour" .. (tonumber(hour) > 1 and "s" or ""))
   end
 
   if minute ~= "00" then
     table.insert(text, tonumber(minute) .. " minute" .. (tonumber(minute) > 1 and "s" or ""))
   end
 
   if second ~= "00" then
     table.insert(text, tonumber(second) .. " second" .. (tonumber(second) > 1 and "s" or ""))
   end
 
   countdown_text = ""
   if #text > 0 then
     countdown_text = text[1]
     for i = 2, #text - 1 do
       countdown_text = countdown_text .. ", " .. text[i]
     end
     if #text > 1 then
       countdown_text = countdown_text .. " and " .. text[#text]
     end
   else
     countdown_text = "expired"
   end
   return countdown_text
end


-- onStepIn
local onlinetraining = MoveEvent()
onlinetraining:type("stepin")

function onlinetraining.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return false
	end

	local playerId = creature:getId()
    
    -- Check if the player is already in the active list
    if not activePlayers[playerId] then
        activePlayers[playerId] = true
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Training started.\nCost: 1 Soul point per 1 minute.\nYou have " .. showTimeLeft(creature:getSoul() * interval / 1000, true) .. " of training time left.")
        
        -- Start the soul deduction
        checkTrainingTile(playerId)
    end
    
    return true
end


for uid = FromUID, ToUID do
	onlinetraining:uid(uid)
end
onlinetraining:register()

-- onStepOut
onlinetraining = MoveEvent()
onlinetraining:type("stepout")

function onlinetraining.onStepOut(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
	end
	
	local playerId = creature:getId()
	
	-- Cancel the scheduled soul deduction
    if playerEvents[playerId] then
        stopEvent(playerEvents[playerId])
        playerEvents[playerId] = nil
    end
	
    -- Remove the player from the active list when they step out
    activePlayers[playerId] = nil
    
    return true
end



for uid = FromUID, ToUID do
	onlinetraining:uid(uid)
end
onlinetraining:register()