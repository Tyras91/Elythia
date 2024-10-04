local waterIds = { 12564 }
local lootTrash = { 3119, 3123, 3264, 3409 }
local lootCommon = { 3035, 3051, 3052, 3580, 236, 237 }
local lootRare = { 3026, 3029, 3032, 7158, 7159, 3578 }
local lootVeryRare = { 281, 282, 9303 }
local lootVeryRare1 = { 281, 12557 }
local lootRare1 = { 3026, 12557 }
local lootCommon1 = { 3035, 237, 12557 }

local elementals = {
	chances = {
		{ from = 0, to = 500, itemId = 3026 }, -- white pearl
		{ from = 501, to = 801, itemId = 3029 }, -- small sapphire
		{ from = 802, to = 1002, itemId = 3032 }, -- small emerald
		{ from = 1105, to = 1115, itemId = 9303 }, -- leviathan's amulet
	},
}

local useWorms = true


--Auto Fishing
local autoFishingStorage = 39850 -- storage value to control auto-fishing
local wormItemId = 3492

local autofish = true
local autofishdelay = 1000


-- OPG Fishing
local baseChance = 100000 --This chance is used against all other chances to dertermine if a monster is caught, and item is fished up, or a fish is fished up.
local monsters = {
    [1] = {name = "Fished Crab", chance = 4000, level = 5, fishing = 10, msg = "|PLAYERNAME| !", broadcast = false},
    [2] = {name = "Fished Coral Frog", chance = 4000, level = 10, fishing = 10, msg = "|PLAYERNAME| !", broadcast = false},
    [3] = {name = "Fished Calamary", chance = 4000, level = 14, fishing = 10, msg = "|PLAYERNAME| !", broadcast = false},
    [4] = {name = "Fished Fish", chance = 4000, level = 18, fishing = 10, msg = "|PLAYERNAME| !", broadcast = false},
    [5] = {name = "Fished Jellyfish", chance = 4000, level = 22, fishing = 10, msg = "|PLAYERNAME| !", broadcast = false},	
    [6] = {name = "Fished Deepsea Blood Crab", chance = 3000, level = 28, fishing = 15, msg = "|PLAYERNAME| !", broadcast = false},
    [7] = {name = "Fished Deepling Worker", chance = 3000, level = 34, fishing = 15, msg = "|PLAYERNAME| !", broadcast = false},	
    [8] = {name = "Fished Shark", chance = 3000, level = 40, fishing = 15, msg = "|PLAYERNAME| !", broadcast = false},
    [9] = {name = "Fished Ice Golem", chance = 3000, level = 55, fishing = 20, msg = "|PLAYERNAME| !", broadcast = false},
    [10] = {name = "Fished Deepling Warrior", chance = 2500, level = 65, fishing = 25, msg = "|PLAYERNAME| !", broadcast = false},
    [11] = {name = "Fished Water Elemental", chance = 2500, level = 70, fishing = 30, msg = "|PLAYERNAME| !", broadcast = false},
    [12] = {name = "Fished Quara Mantassin", chance = 2500, level = 80, fishing = 30, msg = "|PLAYERNAME| !", broadcast = false},
    [13] = {name = "Fished Deepling Spellsinger", chance = 2000, level = 85, fishing = 35, msg = "|PLAYERNAME| !", broadcast = false},
    [14] = {name = "Fished Quara Hydromancer", chance = 2000, level = 90, fishing = 35, msg = "|PLAYERNAME| !", broadcast = false},
    [15] = {name = "Fished Quara Pincher", chance = 1800, level = 95, fishing = 40, msg = "|PLAYERNAME| !", broadcast = false},
    [16] = {name = "Fished Quara Predator", chance = 1800, level = 100, fishing = 40, msg = "|PLAYERNAME| !", broadcast = false},
    [17] = {name = "Fished Young Sea Serpent", chance = 1200, level = 105, fishing = 45, msg = "|PLAYERNAME| !", broadcast = false},
    [18] = {name = "Fished Sea Serpent", chance = 800, level = 110, fishing = 45, msg = "|PLAYERNAME| !", broadcast = false},
    [19] = {name = "Fished Massive Water Elemental", chance = 800, level = 115, fishing = 45, msg = "|PLAYERNAME| !", broadcast = false},
    [20] = {name = "Fished Deepling Tyrant", chance = 600, level = 120, fishing = 45, msg = "|PLAYERNAME| !", broadcast = false},
    [21] = {name = "Fished Seacrest Serpent", chance = 400, level = 130, fishing = 50, msg = "|PLAYERNAME| !", broadcast = false},
    [22] = {name = "Fished Terrorsleep", chance = 300, level = 140, fishing = 50, msg = "|PLAYERNAME| !", broadcast = false},
	[23] = {name = "Fished Angry Furion", chance = 3, level = 100, fishing = 50, msg = "|PLAYERNAME| !", broadcast = false}
}	

local boss = {
    [1] = {name = "Crystal Guardian", chance = 10, level = 80, fishing = 50, msg = "|PLAYERNAME| has caught a Crystal Guardian!", broadcast = true},
    [2] = {name = "Puddle", chance = 8, level = 100, fishing = 60, msg = "|PLAYERNAME| has caught a Puddle!", broadcast = true},
    [3] = {name = "Poseidon's Kiss", chance = 6, level = 150, fishing = 70, msg = "|PLAYERNAME| has caught Poseidon's Kiss!", broadcast = true},
	[4] = {name = "Deepsea Shock Absorber", chance = 4, level = 300, fishing = 80, msg = "|PLAYERNAME| has caught Deepsea Shock Absorber!", broadcast = true},
	[5] = {name = "Deepsea Dragon Matron", chance = 2, level = 400, fishing = 90, msg = "|PLAYERNAME| has caught Deepsea Dragon Matron!", broadcast = true}
}





local fishing = Action()


local function delayedFishing(player, item, pos, target, toPosition, isHotkey)
    -- Add a delay of 500 milliseconds (0.5 seconds)
    addEvent(function()
        autoFishing(player, item, pos, target, toPosition, isHotkey)
    end, autofishdelay)
end


function autoFishing(player, item, pos, target, toPosition, isHotkey)
    if player:getStorageValue(autoFishingStorage) == 1 then
        if player:getPosition() ~= pos then
            player:setStorageValue(autoFishingStorage, 0)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are no longer automatically fishing.")
            return true
        end
		
		if player:getItemCount(wormItemId) < 1 then
			player:setStorageValue(autoFishingStorage, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are no longer automatically fishing.")
			player:sendCancelMessage("You have run out of worms.")
			return true
		end

        if not table.contains(waterIds, target.itemid) then
		return false
	end

	local targetId = target.itemid
	if targetId == 9582 then
		local owner = target:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
		if owner ~= 0 and owner ~= player.uid then
			player:sendTextMessage(MESSAGE_FAILURE, "You are not the owner.")
			return true
		end

		toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
		target:transform(target.itemid + 1)

		local chance = math.random(10000)
		for i = 1, #elementals.chances do
			local randomItem = elementals.chances[i]
			if chance >= randomItem.from and chance <= randomItem.to then
				player:addItem(randomItem.itemId, 1)
			end
			if chance > 1115 then
				player:say("There was just rubbish in it.", TALKTYPE_MONSTER_SAY)
				return true
			end
		end
	end

	if targetId == 12560 then
		toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
		local rareChance = math.random(100)
		if rareChance == 1 then
			player:addItem(lootVeryRare1[math.random(#lootVeryRare1)], 1)
		elseif rareChance <= 3 then
			player:addItem(lootRare1[math.random(#lootRare1)], 1)
		elseif rareChance <= 10 then
			player:addItem(lootCommon1[math.random(#lootCommon1)], 1)
		else
			player:addItem(lootTrash[math.random(#lootTrash)], 1)
		end
		return true
	end

	if targetId ~= 7236 then
		toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
	end

	if targetId == 622 or targetId == 13989 then
		return true
	end

	if useWorms and targetId == 21414 and player:removeItem("worm", 1) then
		if player:getStorageValue(Storage.Quest.U10_55.Dawnport.TheDormKey) == 2 then
			if math.random(100) >= 97 then
				player:addItem(21402, 1)
				player:setStorageValue(Storage.Quest.U10_55.Dawnport.TheDormKey, 3)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "With a giant splash, you heave an enormous fish out of the water.")
				return true
			end
		elseif math.random(100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
			player:addItem(3578, 1)
		end
	end

	if player:getItemCount(3492) > 0 then
		player:addSkillTries(SKILL_FISHING, 1, true)
	end
	
	
	
	
	-- lägg in nya att den kan dra upp monster istället
	for i = 1, #monsters do
        if player:getLevel() >= monsters[i].level and player:getSkillLevel(SKILL_FISHING) >= monsters[i].fishing then   
            if math.random(1, baseChance) <= monsters[i].chance then
				Game.createMonster(monsters[i].name, player:getPosition())					
				
                if monsters[i].broadcast then
                    local text = string.gsub(monsters[i].msg, "|PLAYERNAME|", player:getName())
					for _, targetPlayer in ipairs(Game.getPlayers()) do
						targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE,''.. text ..'')
					end
                end
            end
        end
    end

    for i = 1, #boss do
        if player:getLevel() >= boss[i].level and player:getSkillLevel(SKILL_FISHING) >= boss[i].fishing then   
            if math.random(1, baseChance) <= boss[i].chance then
				local mob = Game.createMonster(boss[i].name, player:getPosition())	
				if mob then
					mob:setReward(true)
				else
					print("Boss not spawned.")
				end					
					
				if boss[i].broadcast then
					local text = string.gsub(boss[i].msg, "|PLAYERNAME|", player:getName())
					for _, targetPlayer in ipairs(Game.getPlayers()) do
						targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE,''.. text ..'')
					end
				end
            end
        end
    end

	
	if math.random(100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		if useWorms and not player:removeItem("worm", 1) then
			return true
		end

		if targetId == 13988 then
			target:transform(targetId + 1)
			target:decay()

			if math.random(100) >= 97 then
				player:addItem(13992, 1)
				return true
			end
		elseif targetId == 7236 then
			target:transform(7237)
			local position = target:getPosition()
			addEvent(refreeIceHole, 1000 * 60 * 15, position)
			local rareChance = math.random(100)
			if rareChance == 1 then
				player:addItem(7158, 1)
				player:addAchievementProgress("Exquisite Taste", 250)
				return true
			elseif rareChance <= 4 then
				player:addItem(3580, 1)
				player:addAchievementProgress("Exquisite Taste", 250)
				return true
			elseif rareChance <= 10 then
				player:addItem(7159, 1)
				player:addAchievementProgress("Exquisite Taste", 250)
				return true
			end
		end
		player:addItem(3578, 1)
		player:addAchievementProgress("Here, Fishy Fishy!", 250)
	end

	
	-- Aktivera auto-fishing om det inte redan är aktiverat
    if player:getStorageValue(autoFishingStorage) <= 0 then
        local pos = player:getPosition() -- Spara spelarens nuvarande position när auto-fishing startar
        player:setStorageValue(playerPositionStorage, pos)
        player:setStorageValue(autoFishingStorage, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Auto-fishing activated.")
        delayedFishing(player, item, pos, target, toPosition, isHotkey)
    else
        -- Fortsätt fiska manuellt om auto-fishing redan är på
        delayedFishing(player, item, pos, target, toPosition, isHotkey)
    end
    end
end




local function refreeIceHole(position)
	local iceHole = Tile(position):getItemById(7237)
	if iceHole then
		iceHole:transform(7200)
	end
end



function fishing.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not table.contains(waterIds, target.itemid) then
		return false
	end

	local targetId = target.itemid
	if targetId == 9582 then
		local owner = target:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
		if owner ~= 0 and owner ~= player.uid then
			player:sendTextMessage(MESSAGE_FAILURE, "You are not the owner.")
			return true
		end

		toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
		target:transform(target.itemid + 1)

		local chance = math.random(10000)
		for i = 1, #elementals.chances do
			local randomItem = elementals.chances[i]
			if chance >= randomItem.from and chance <= randomItem.to then
				player:addItem(randomItem.itemId, 1)
			end
			if chance > 1115 then
				player:say("There was just rubbish in it.", TALKTYPE_MONSTER_SAY)
				return true
			end
		end
	end

	if targetId == 12560 then
		toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
		local rareChance = math.random(100)
		if rareChance == 1 then
			player:addItem(lootVeryRare1[math.random(#lootVeryRare1)], 1)
		elseif rareChance <= 3 then
			player:addItem(lootRare1[math.random(#lootRare1)], 1)
		elseif rareChance <= 10 then
			player:addItem(lootCommon1[math.random(#lootCommon1)], 1)
		else
			player:addItem(lootTrash[math.random(#lootTrash)], 1)
		end
		return true
	end

	if targetId ~= 7236 then
		toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
	end

	if targetId == 622 or targetId == 13989 then
		return true
	end

	if useWorms and targetId == 21414 and player:removeItem("worm", 1) then
		if player:getStorageValue(Storage.Quest.U10_55.Dawnport.TheDormKey) == 2 then
			if math.random(100) >= 97 then
				player:addItem(21402, 1)
				player:setStorageValue(Storage.Quest.U10_55.Dawnport.TheDormKey, 3)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "With a giant splash, you heave an enormous fish out of the water.")
				return true
			end
		elseif math.random(100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
			player:addItem(3578, 1)
		end
	end

	if player:getItemCount(3492) > 0 then
		player:addSkillTries(SKILL_FISHING, 1, true)
	end
	
	

	
	if math.random(100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		if useWorms and not player:removeItem("worm", 1) then
			return true
		end

		if targetId == 13988 then
			target:transform(targetId + 1)
			target:decay()

			if math.random(100) >= 97 then
				player:addItem(13992, 1)
				return true
			end
		elseif targetId == 7236 then
			target:transform(7237)
			local position = target:getPosition()
			addEvent(refreeIceHole, 1000 * 60 * 15, position)
			local rareChance = math.random(100)
			if rareChance == 1 then
				player:addItem(7158, 1)
				player:addAchievementProgress("Exquisite Taste", 250)
				return true
			elseif rareChance <= 4 then
				player:addItem(3580, 1)
				player:addAchievementProgress("Exquisite Taste", 250)
				return true
			elseif rareChance <= 10 then
				player:addItem(7159, 1)
				player:addAchievementProgress("Exquisite Taste", 250)
				return true
			end
		end
		player:addItem(3578, 1)
		player:addAchievementProgress("Here, Fishy Fishy!", 250)
	end

	if autofish then
		-- Aktivera auto-fishing om det inte redan är aktiverat
		if player:getStorageValue(autoFishingStorage) <= 0 then
			local pos = player:getPosition() -- Spara spelarens nuvarande position när auto-fishing startar
			player:setStorageValue(autoFishingStorage, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Auto-fishing activated.")
			delayedFishing(player, item, pos, target, toPosition, isHotkey)
		else
			-- Fortsätt fiska manuellt om auto-fishing redan är på
			delayedFishing(player, item, pos, target, toPosition, isHotkey)
		end
	end
	
	
	return true
end

fishing:id(3483)
fishing:allowFarUse(true)
fishing:register()
