local mType = Game.createMonsterType("Fished Terrorsleep")
local monster = {}

monster.description = "a fished terrorsleep"
monster.experience = 6900
monster.outfit = {
    lookType = 593,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 7200
monster.maxHealth = 7200
monster.race = "blood"
monster.corpse = 20160
monster.speed = 270
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    illusionable = false,
    convinceable = false,
    pushable = false,
    isBlockable = true,
    canPushItems = false,
    canPushCreatures = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Aktat Roshok! Marruk!", yell = false},
    {text = "I will eat you in your sleep.", yell = false},
    {text = "I am the darkness around you...", yell = false},
}

monster.immunities = {
    {type = "earth", condition = true},
    {type = "paralyze", condition = true},
    {type = "invisible", condition = true},
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 40},
    {type = COMBAT_DEATHDAMAGE, percent = 1},
    {type = COMBAT_FIREDAMAGE, percent = 35},
    {type = COMBAT_ENERGYDAMAGE, percent = 10},
    {type = COMBAT_ICEDAMAGE, percent = 20},
    {type = COMBAT_HOLYDAMAGE, percent = -1},
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -1000, maxDamage = -1500, radius = 7, effect = CONST_ME_YELLOW_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -300, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "feversleep skill reducer", interval = 2000, chance = 10, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -350, maxDamage = -500, length = 6, spread = 0, effect = CONST_ME_YELLOWENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -450, radius = 1, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 50,
	armor = 50,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 350, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_HITAREA },
	{ name = "speed", interval = 2000, chance = 15, speedChange = 300, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
}


monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 3035, chance = 100000, maxCount = 15}, -- platinum coin
    {id = 3032, chance = 20000, maxCount = 6}, -- small emerald
    {id = 3030, chance = 18700, maxCount = 6}, -- small ruby
    {id = 3033, chance = 21870, maxCount = 6}, -- small amethyst
    {id = 3281, chance = 3500}, -- giant sword
    {id = 3369, chance = 4200}, -- warrior helmet
    {id = 3370, chance = 3000}, -- knight armor
    {id = 5909, chance = 8000, maxCount = 5}, -- white piece of cloth
    {id = 5911, chance = 7000, maxCount = 5}, -- red piece of cloth
    {id = 5912, chance = 9000, maxCount = 5}, -- blue piece of cloth
    {id = 5895, chance = 6500, maxCount = 3}, -- fish fin
    {id = 3567, chance = 3820}, -- blue robe
    {id = 238, chance = 50000, maxCount = 5}, -- great mana potion
    {id = 7643, chance = 32000, maxCount = 3}, -- ultimate health potion
    {id = 9057, chance = 20870, maxCount = 5}, -- small topaz
    {id = 16119, chance = 22260}, -- blue crystal shard
    {id = 16124, chance = 20000}, -- blue crystal splinter
    {id = 16125, chance = 24000}, -- cyan crystal fragment
    {id = 20203, chance = 16700}, -- trapped bad dream monster
    {id = 20204, chance = 25000}, -- bowl of terror sweat
    {id = 20062, chance = 2560, maxCount = 3}, -- cluster of solace
    {id = 22118, chance = 220}, -- tibia coins
}

mType:register(monster)
