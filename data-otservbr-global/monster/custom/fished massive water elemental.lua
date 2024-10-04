local mType = Game.createMonsterType("Fished Massive Water Elemental")
local monster = {}

monster.description = "a fished massive water elemental"
monster.experience = 1100
monster.outfit = {
    lookType = 11,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 1250
monster.maxHealth = 1250
monster.race = "undead"
monster.corpse = 9582
monster.speed = 280
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    rewardBoss = false,
    illusionable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
    isBlockable = true,
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "invisible", condition = true},
    {type = "drown", condition = true},
    {type = "fire", condition = true},
    {type = "ice", condition = true},
    {type = "earth", condition = true},
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 30},
    {type = COMBAT_HOLYDAMAGE, percent = 30},
    {type = COMBAT_DEATHDAMAGE, percent = 50},
    {type = COMBAT_ENERGYDAMAGE, percent = -25},
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -220, condition = { type = CONDITION_POISON, totalDamage = 300, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, minDamage = -330, maxDamage = -450, range = 7, radius = 2, effect = CONST_ME_LOSEENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -170, maxDamage = -210, range = 7, shootEffect = CONST_ANI_SMALLICE, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -355, maxDamage = -420, radius = 5, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 45,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 120, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}


monster.loot = {
    {id = 3031, chance = 75000, maxCount = 100}, -- gold coin
    {id = 3035, chance = 30000, maxCount = 6}, -- platinum coin
    {id = 3578, chance = 60000, maxCount = 6}, -- fish
    {id = 3028, chance = 3000, maxCount = 6}, -- small diamond
    {id = 3032, chance = 3000, maxCount = 6}, -- small emerald
    {id = 239, chance = 15000, maxCount = 3}, -- great health potion
    {id = 238, chance = 15400, maxCount = 3}, -- great mana potion
    {id = 7158, chance = 2000}, -- rainbow trout
    {id = 7159, chance = 2300}, -- green perch
    {id = 8902, chance = 3300}, -- rusted shield
    {id = 22118, chance = 200}, -- TC Scroll
}

mType:register(monster)
