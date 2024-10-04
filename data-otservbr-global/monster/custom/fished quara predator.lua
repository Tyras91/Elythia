local mType = Game.createMonsterType("Fished Quara Predator")
local monster = {}

monster.description = "a fished quara predator"
monster.experience = 1600
monster.outfit = {
    lookType = 20,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 2200
monster.maxHealth = 2200
monster.race = "blood"
monster.corpse = 5525
monster.speed = 280
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    illusionable = true,
    convinceable = false,
    pushable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Rrrah!", yell = false},
    {text = "Rraaar!", yell = false}
}

monster.immunities = {
    {type = "invisible", condition = true},
    {type = "drown", condition = true},
    {type = "fire", condition = true},
    {type = "ice", condition = true}
}

monster.elements = {
    {type = COMBAT_EARTHDAMAGE, percent = -10},
    {type = COMBAT_ENERGYDAMAGE, percent = -25}
}

monster.attacks = {
    {name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -470}
}

monster.defenses = {
    defense = 45,
    armor = 45,
    {name = "speed", interval = 2000, chance = 15, speedChange = 30, duration = 5000, effect = CONST_ME_GREENSHIMMER},
    {name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minHealing = 50, maxHealing = 100, effect = CONST_ME_MAGIC_BLUE}
}


monster.loot = {
	{ id = 3031, chance = 28000, maxCount = 100 }, --gold coin
	{ id = 3031, chance = 50000, maxCount = 54 }, --gold coin
	{ id = 11491, chance = 9860 }, --quara bone
	{ id = 7378, chance = 9240, maxCount = 7 }, --royal spear
	{ id = 3028, chance = 5300, maxCount = 2 }, --small diamond
	{ id = 3581, chance = 4980, maxCount = 5 }, --shrimp
	{ id = 3275, chance = 3011 }, --double axe
	{ id = 5895, chance = 1920, maxCount = 1 }, --fish fin
	{ id = 239, chance = 1040 }, --great health potion
	{ id = 7383, chance = 670 }, --relic sword
	{ id = 7368, chance = 530 }, --assassin star
	{ id = 824, chance = 440 }, --glacier robe
	{ id = 5741, chance = 390 }, --skull helmet
	{ id = 12318, chance = 10 }, --giant shrimp
}

mType:register(monster)
