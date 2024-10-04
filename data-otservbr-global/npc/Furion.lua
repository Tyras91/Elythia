local internalNpcName = "Furion (Legacy)"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 4

npcConfig.outfit = {
	lookType = 1444,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 78,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
	
end
npcConfig.voices = {
	interval = 150000,
	chance = 50,
	{text = 'Hey there, what are you up to now??'}
}
npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "name") then
		return npcHandler:say("Hello there |PLAYERNAME|! Im Furion.", npc, creature)
	elseif MsgContains(message, "trade") then
		return npcHandler:say("I was the defacto buyer for all the good stuff. But now? Im {retired} ", npc, creature)
	elseif MsgContains(message, "retired") then
		return npcHandler:say("Im growing too old to be dealing with adventurers like yourself.", npc, creature)
	end
	return true
end


keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'Im Furion.'})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = 'I was the defacto buyer for all the good stuff. But now? Im {retired}'})
keywordHandler:addKeyword({'retired'}, StdModule.say, {npcHandler = npcHandler, text = 'Im growing too old to be dealing with adventurers like yourself.'})


npcHandler:setMessage(MESSAGE_FAREWELL, "Take care now! I will see you again. <waves>")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
