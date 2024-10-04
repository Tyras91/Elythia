local mType = Game.createMonsterType("Fished Quara Mantassin")
local monster = {}

monster.description = "a fished quara mantassin"
monster.experience = 400
monster.outfit = {
    lookType = 72,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 800
monster.maxHealth = 800
monster.race = "blood"
monster.corpse = 5522
monster.speed = 260
monster.manaCost = 480

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    illusionable = false,
    convinceable = true,
    pushable = false,
    rewardBoss = false,
    isBlockable = true,
    canPushItems = true,
    canPushCreatures = false,
    staticAttackChance = 80,
    targetDistance = 1,
    runHealth = 40,
}

monster.immunities = {
    {type = "drown", condition = true},
    {type = "fire", condition = true},
    {type = "ice", condition = true},
}

monster.elements = {
    {type = COMBAT_EARTHDAMAGE, percent = -10},
    {type = COMBAT_ENERGYDAMAGE, percent = -25},
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -140},
}

monster.defenses = {
    defense = 15,
    armor = 15,
    {name ="invisible", interval = 2000, chance = 20, duration = 2000, effect = CONST_ME_MAGIC_BLUE},
    {name ="speed", interval = 2000, chance = 15, speedChange = 400, duration = 5000, effect = CONST_ME_MAGIC_RED},
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Zuerk Pachak!", yell = false},
    {text = "Shrrrr", yell = false},
}

monster.loot = {
	{ id = 3031, chance = 5000, maxCount = 100 }, --gold coin
	{ id = 3031, chance = 29000, maxCount = 29 }, --gold coin
	{ id = 11489, chance = 12600 }, --mantassin tail
	{ id = 3581, chance = 5170, maxCount = 5 }, --3581 shrimp
	{ id = 3269, chance = 4970 }, --3269 halberd
	{ id = 3029, chance = 1130 }, --3029 small sapphire
	{ id = 3565, chance = 1090 }, --3565 cape
	{ id = 3049, chance = 1050 }, -- stealth ring 3049
	{ id = 3265, chance = 990 }, --3265 two handed sword
	{ id = 5895, chance = 610 }, --5895 fish fin
	{ id = 3373, chance = 100 }, --3373 strange helmet
	{ id = 3567, chance = 60 }, -- blue robe
}

mType:register(monster)
