local callback = EventCallback()

function Player:canReceiveLoot()
	return self:getStamina() > 840
end

function addLoot(container, itemId, count)
	-- Attempt to create the item
	local tmpItem = Game.createItem(itemId, count)
	-- Check if tmpItem is a valid item object
	if not tmpItem or type(tmpItem) ~= "userdata" then
		print("Error: Failed to create item with ID: " .. tostring(itemId) .. " and count: " .. tostring(count))
		return false
	end

	-- Attempt to add the item to the container
	if container:addItemEx(tmpItem) ~= RETURNVALUE_NOERROR then
		tmpItem:remove()
		print("Error: Failed to add item to container for item ID: " .. tostring(itemId))
		return false
	end

	return true
end

function callback.monsterOnDropLoot(monster, corpse)
	local player = Player(corpse:getCorpseOwner())
	local factor = 1.0
	local msgSuffix = ""
	if player and player:canReceiveLoot() then
		local config = player:calculateLootFactor(monster)
		factor = config.factor
		msgSuffix = config.msgSuffix
	end

	local mType = monster:getType()
	if not mType then
		logger.warning("monsterOnDropLoot: monster has no type")
		return
	end

	local charm = player and player:getCharmMonsterType(CHARM_GUT)
	local gut = charm and charm:raceId() == mType:raceId()

	local lootTable = mType:generateLootRoll({ factor = factor, gut = gut }, {})
	corpse:addLoot(lootTable)
	for _, item in ipairs(lootTable) do
		if item.gut then
			msgSuffix = msgSuffix .. " (active charm bonus)"
		end

		-- Add loot to the corpse using addLoot function
		if not addLoot(corpse, item.itemid, item.count) then
			print("Error: Could not add loot item ID " .. tostring(item.itemid) .. " to container.")
		end
	end
	local existingSuffix = corpse:getAttribute(ITEM_ATTRIBUTE_LOOTMESSAGE_SUFFIX) or ""
	corpse:setAttribute(ITEM_ATTRIBUTE_LOOTMESSAGE_SUFFIX, existingSuffix .. msgSuffix)
end

callback:register()
