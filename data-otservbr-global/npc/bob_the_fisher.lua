local internalNpcName = "Bob the Fisher"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 130,
    lookHead = 0,
    lookBody = 58,
    lookLegs = 76,
    lookFeet = 95,
    lookAddons = 3,
}

npcConfig.flags = {
    floorchange = false,
}

npcConfig.voices = {
    interval = 155000,
    chance = 50,
    { text = "Fresh fishing gear! Come and take a look!" },
}

local itemsTable = {
    ["fishing gear"] = {
        { itemName = "fishing rod", clientId = 3483, buy = 40 },
        { itemName = "worm", clientId = 3492, buy = 1 },
		{ itemName = "fish", clientId = 3578, sell = 1 },
		{ itemName = "green perch", clientId = 7159, sell = 1 },
		{ itemName = "rainbow trout", clientId = 7158, sell = 1 },
    },
}

npcConfig.shop = {}
for _, categoryTable in pairs(itemsTable) do
    for _, itemTable in ipairs(categoryTable) do
        table.insert(npcConfig.shop, itemTable)
    end
end

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

npcType.onCloseChannel = function(npc, creature)
    npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    local playerId = player:getId()

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    if message:lower() == "fishing gear" then
        npcHandler:say("I sell fishing rods and worms. What do you need?", npc, creature)
        return true
    end

    return true
end

local function onTradeRequest(npc, creature)
    return true
end

keywordHandler:addKeyword({ "fishing gear" }, StdModule.say, { npcHandler = npcHandler, text = "I sell fishing rods and worms. What do you need?" })

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hello there, adventurer! I'm Bob the Fisher. Looking to buy some fishing gear or sell some fish?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye! May the fish be with you!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Goodbye! May the fish be with you!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Here's what I have to offer.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
    npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
    player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
