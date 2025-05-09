local playerLogout = CreatureEvent("PlayerLogout")

function playerLogout.onLogout(player)
	local playerId = player:getId()

	if _G.NextUseStaminaTime[playerId] then
		_G.NextUseStaminaTime[playerId] = nil
	end
	

	local stats = player:inBossFight()
	if stats then
		local boss = Monster(stats.bossId)
		if boss then
			local dmgOut = boss:getDamageMap()[playerId]
			if dmgOut then
				stats.damageOut = (stats.damageOut or 0) + dmgOut.total
			end

			stats.stamina = player:getStamina()
		end
	end
	
	-- Check if the player has auto-fishing storage set, reset if needed
    if player:getStorageValue(39850) == 1 then
        player:setStorageValue(39850, 0)
    end
	
	if _G.OnExerciseTraining[playerId] then
		stopEvent(_G.OnExerciseTraining[playerId].event)
		_G.OnExerciseTraining[playerId] = nil
		player:setTraining(false)
	end
	return true
end


playerLogout:register()
