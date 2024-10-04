local mType = Game.createMonsterType("Fished Angry Furion")
local monster = {}

monster.description = "a fished angry furion"
monster.experience = 150000
monster.outfit = {
    lookType = 75,
    lookHead = 19,
    lookBody = 94,
    lookLegs = 38,
    lookFeet = 78,
    lookAddons = 0,
}

monster.health = 35000
monster.maxHealth = 35000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 225
monster.manaCost = 450
monster.maxSummons = 3

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
monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "Fished Massive Water Elemental", chance = 15, interval = 2000, count = 1 },
		{ name = "Fished Shark", chance = 5, interval = 2000, count = 1 },
		{ name = "Rogue Gamemaster", chance = 5, interval = 2000, count = 1 },
	},
}

monster.voices = {
    interval = 2000,
    chance = 5,
    {text = "How dare you pull me out of the water!", yell = true},
    {text = "I'm furious!", yell = true},
    {text = "You will pay for this!", yell = true},
    {text = "Back to the depths with you!", yell = true},
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
	{id = 22118, chance = 200, maxCount = 10} -- Tibia coins
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 100, attack = 91},
    {name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -50, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true},
    {name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -150, type = COMBAT_DROWNDAMAGE, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_BLUEBUBBLE, target = true}

}

monster.defenses = {
    defense = 35,
    armor = 25,
    {name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false},
    {name = "speed", interval = 2000, chance = 10, speedChange = 300, duration = 5000, effect = CONST_ME_MAGIC_RED},
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 0},
    {type = COMBAT_ENERGYDAMAGE, percent = 0},
    {type = COMBAT_EARTHDAMAGE, percent = 0},
    {type = COMBAT_FIREDAMAGE, percent = 0},
    {type = COMBAT_LIFEDRAIN, percent = 0},
    {type = COMBAT_MANADRAIN, percent = 0},
    {type = COMBAT_DROWNDAMAGE, percent = 0},
    {type = COMBAT_ICEDAMAGE, percent = 0},
    {type = COMBAT_HOLYDAMAGE, percent = 0},
    {type = COMBAT_DEATHDAMAGE, percent = 0},
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "outfit", condition = false},
    {type = "invisible", condition = true},
    {type = "bleed", condition = false},
}

mType:register(monster)
