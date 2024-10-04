local mType = Game.createMonsterType("Fished Seacrest Serpent")
local monster = {}

monster.description = "a fished seacrest serpent"
monster.experience = 2600
monster.outfit = {
    lookType = 675,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "venom"
monster.corpse = 21893
monster.speed = 500
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    illusionable = false,
    convinceable = false,
    pushable = false,
    rewardBoss = false,
    isBlockable = true,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 90,
    targetDistance = 0,
    runHealth = 0,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 2000,
    chance = 5,
    {text = "WARAAAHAAARRRR!", yell = false},
    {text = "LOOK INTO THE LIGHT...", yell = false},
    {text = "LEAVE THESE GROUNDS...", yell = false},
    {text = "THE DARK TIDE WILL SWALLOW YOU...", yell = false},
}

monster.immunities = {
    {type = "ice", condition = true},
    {type = "drown", condition = true},
    {type = "paralyze", condition = true},
    {type = "invisible", condition = true},
}

monster.elements = {
    {type = COMBAT_FIREDAMAGE, percent = 20},
    {type = COMBAT_ENERGYDAMAGE, percent = 10},
    {type = COMBAT_EARTHDAMAGE, percent = 20},
    {type = COMBAT_PHYSICALDAMAGE, percent = 15},
    {type = COMBAT_DEATHDAMAGE, percent = 5},
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 120, attack = 82 },
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -260, range = 7, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_SOUND_RED, target = true },
	{ name = "combat", interval = 2000, chance = 11, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -285, radius = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "seacrest serpent wave", interval = 2000, chance = 30, minDamage = 0, maxDamage = -284, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -300, length = 4, spread = 3, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.defenses = {
	defense = 31,
	armor = 51,
	mitigation = 1.21,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 145, maxDamage = 200, effect = CONST_ME_SOUND_BLUE, target = false },
	{ name = "melee", interval = 2000, chance = 10, minDamage = 0, maxDamage = 0 },
}


monster.loot = {
    {id = 3583, chance = 40000, maxCount = 3}, -- dragon ham
    {id = 21801, chance = 28040, maxCount = 2}, -- seacrest hair
    {id = 762, chance = 15020, maxCount = 80}, -- shiver arrow
    {id = 829, chance = 2500}, -- glacier mask
    {id = 21892, chance = 900}, -- crest of the deep seas
    {id = 3035, chance = 100000, maxCount = 12}, -- platinum coin
    {id = 236, chance = 15020, maxCount = 5}, -- strong health potion
    {id = 237, chance = 19370, maxCount = 5}, -- strong mana potion
    {id = 21747, chance = 15030, maxCount = 4}, -- seacrest pearl
    {id = 3026, chance = 9000, maxCount = 6}, -- white pearl
    {id = 3027, chance = 5500, maxCount = 6}, -- black pearl
    {id = 281, chance = 2500, maxCount = 2}, -- giant shimmering pearl
    {id = 5944, chance = 6000, maxCount = 4}, -- soul orb
    {id = 3028, chance = 7520, maxCount = 8}, -- small diamond
    {id = 21800, chance = 10390, maxCount = 2}, -- seacrest scale
    {id = 815, chance = 2500}, -- glacier amulet
    {id = 823, chance = 1500}, -- glacier kilt
    {id = 8902, chance = 1400}, -- rusty shield
    {id = 819, chance = 1900}, -- glacier shoes
    {id = 16096, chance = 550}, -- wand of defiance
    {id = 8093, chance = 900}, -- wand of draconia
    {id = 22118, chance = 200}, -- Tibia coins
}

mType:register(monster)
