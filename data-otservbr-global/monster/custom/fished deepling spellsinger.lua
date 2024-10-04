local mType = Game.createMonsterType("Fished Deepling Spellsinger")
local monster = {}

monster.description = "a fished deepling spellsinger"
monster.experience = 1000
monster.outfit = {
    lookType = 443,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 850
monster.maxHealth = 850
monster.race = "blood"
monster.corpse = 13771
monster.speed = 190
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = true,
    staticAttackChance = 60,
    targetDistance = 0,
    runHealth = 60,
    isBlockable = true,
    canPushItems = true,
    canPushCreatures = true,
    illusionable = true
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Jey Obu giotja!!", yell = false},
    {text = "Mmmmmoooaaaaaahaaa!!", yell = false}
}

monster.immunities = {
    {type = "invisible", condition = true},
    {type = "ice", condition = true},
    {type = "drown", condition = true},
    {type = "fire", condition = true}
}

monster.elements = {
    {type = COMBAT_EARTHDAMAGE, percent = -20},
    {type = COMBAT_ENERGYDAMAGE, percent = -20},
    {type = COMBAT_DEATHDAMAGE, percent = 50}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 45, attack = 55},
    {name ="combat", interval = 2000, chance = 10, minDamage = -180, maxDamage = -350, type = COMBAT_ICEDAMAGE, length = 10, spread = 3, effect = CONST_ME_ICETORNADO, target = false},
    {name ="combat", interval = 2000, chance = 20, minDamage = -90, maxDamage = -130, type = COMBAT_DROWNDAMAGE, radius = 4, effect = CONST_ME_BUBBLES, target = true},
    {name ="combat", interval = 2000, chance = 15, minDamage = -60, maxDamage = -140, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_SMALLPLANTS, target = true},
    {name ="combat", interval = 2000, chance = 10, minDamage = -60, maxDamage = -140, type = COMBAT_MANADRAIN, range = 7, effect = CONST_ME_SMALLPLANTS, target = true}
}

monster.defenses = {
    defense = 25,
    armor = 25
}

monster.loot = {
    {id = 3031, chance = 75190, maxCount = 100}, -- gold coin
    {id = 3035, chance = 82100, maxCount = 10}, -- platinum coin
    {id = 14008, chance = 15200}, -- spellsinger's seal
    {id = 14085, chance = 15010}, -- deepling filet
    {id = 14009, chance = 15760}, -- key to the drowned library
    {id = 3578, chance = 13540}, -- fish
    {id = 3029, chance = 22950, maxCount = 8}, -- small sapphire
    {id = 12730, chance = 12540}, -- eye of a deepling
    {id = 13987, chance = 5000}, -- deepling staff
    {id = 13990, chance = 3780}, -- necklace of the deep
    {id = 5895, chance = 6490, maxCount = 3}, -- fish fin
    {id = 14247, chance = 1220}, -- ornate crossbow
}

mType:register(monster)
