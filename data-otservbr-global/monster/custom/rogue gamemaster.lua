local mType = Game.createMonsterType("Rogue Gamemaster")
local monster = {}

monster.description = "a rogue gamemaster"
monster.experience = 150
monster.outfit = {
    lookType = 75,
    lookHead = 117,
    lookBody = 87,
    lookLegs = 94,
    lookFeet = 78,
    lookAddons = 0,
}

monster.health = 350
monster.maxHealth = 350
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 225
monster.manaCost = 450
monster.maxSummons = 0

monster.changeTarget = {
    interval = 4000,
    chance = 0,
}

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttack = 90,
    targetDistance = 1,
    illusionable = false,
    runHealth = 0,
    isBlockable = true,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 2000,
    chance = 5,
    {text = "You can't avoid justice!", yell = false},
    {text = "Banhammer incomming!", yell = false},
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 300}, -- gold coin
    {id = 3112, chance = 15000, maxCount = 3}, -- meat
    {id = 1781, chance = 10000, maxCount = 2}, -- small stone
    {id = 3028, chance = 1000}, -- small diamond
    {id = 3030, chance = 1000}, -- small ruby
    {id = 3029, chance = 1000}, -- small sapphire
    {id = 3033, chance = 1000}, -- small amethyst
    {id = 3032, chance = 1000}, -- small emerald
}

monster.attacks = {
    {name = "melee", interval = 2000, minDamage = 0, maxDamage = -25},
    {name = "combat", interval = 2000, chance = 20, range = 6, minDamage = 0, maxDamage = -10, shootEffect = CONST_ANI_SMALLSTONE},
}

monster.defenses = {
    defense = 25,
    armor = 25,
    { name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
    {name = "speed", interval = 2000, chance = 10, speedChange = 300, duration = 5000, effect = CONST_ME_MAGIC_RED},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = -20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}
mType:register(monster)
