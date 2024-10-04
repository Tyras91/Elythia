local traps = {
	[2145] = { transformTo = 2146, damage = { -50, -100 } },
	[2148] = { damage = { -50, -100 } },
	[3482] = { transformTo = 3481, damage = { -15, -30 }, ignorePlayer = (Game.getWorldType() == WORLD_TYPE_NO_PVP) },
	[3944] = { transformTo = 3945, damage = { -15, -30 }, type = COMBAT_EARTHDAMAGE },
	[12368] = { ignorePlayer = true },
}

-- Define the step-in event handler
local stepInTrap = MoveEvent()

function stepInTrap.onStepIn(creature, item, position, fromPosition)
	local trap = traps[item.itemid]
	if not trap then
		return true
	end

	local tile = Tile(position)
	if not tile then
		return true
	end

	if tile:hasFlag(TILESTATE_PROTECTIONZONE) then
		return true
	end

	if tile:getItemCountById(3482) > 1 then
		return true
	end

	if trap.ignorePlayer and creature:isPlayer() then
		return true
	end

	if trap.transformTo then
		item:transform(trap.transformTo)
	end

	if item.itemid == 12368 and creature:getName() == "Starving Wolf" then
		position:sendMagicEffect(CONST_ME_STUN)
		creature:remove()
		Game.createItem(12369, 1, position)
	else
		-- Add a check to ensure `trap.damage` is not nil
		if trap.damage then
			doTargetCombatHealth(0, creature, trap.type or COMBAT_PHYSICALDAMAGE, trap.damage[1], trap.damage[2], CONST_ME_NONE)
		else
			-- Optional: print debugging info if damage is not defined
			print("Warning: Damage not defined for item ID " .. item.itemid)
		end
	end

	return true
end

stepInTrap:type("stepin")
for itemId, _ in pairs(traps) do
	stepInTrap:id(itemId)
end
stepInTrap:register()

-- Define the step-out event handler
local stepOutTrap = MoveEvent()

function stepOutTrap.onStepOut(creature, item, position, fromPosition)
	if Tile(position):hasFlag(TILESTATE_PROTECTIONZONE) then
		return true
	end

	if item.itemid == 2146 or item.itemid == 3945 then
		item:transform(item.itemid - 1)
	end
	
	return true
end

stepOutTrap:type("stepout")
stepOutTrap:id(2146, 3945)
stepOutTrap:register()

-- Define the remove-item event handler
local removeItemTrap = MoveEvent()

function removeItemTrap.onRemoveItem(item, position)
	local itemPosition = item:getPosition()
	if itemPosition:getDistance(position) > 0 then
		item:transform(item.itemid - 1)
		itemPosition:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end

removeItemTrap:type("removeitem")
removeItemTrap:id(3482)
removeItemTrap:register()
