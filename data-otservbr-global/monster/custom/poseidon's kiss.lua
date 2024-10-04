local mType = Game.createMonsterType("Poseidon's Kiss")
local monster = {}

monster.description = "Poseidon's Kiss"
monster.experience = 3000000
monster.outfit = {
    lookType = 11,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 700000
monster.maxHealth = 700000
monster.race = "undead"
monster.corpse = 9582
monster.speed = 300
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    illusionable = false,
    convinceable = false,
    pushable = false,
    isBlockable = true,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
    rewardBoss = true,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 2000,
    chance = 0, -- No voices defined in the XML
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
    {type = COMBAT_PHYSICALDAMAGE, percent = 0},
    {type = COMBAT_FIREDAMAGE, percent = 0},
    {type = COMBAT_ICEDAMAGE, percent = 0},
    {type = COMBAT_ENERGYDAMAGE, percent = 0},
    {type = COMBAT_EARTHDAMAGE, percent = 0},
    {type = COMBAT_HOLYDAMAGE , percent = 0},
    {type = COMBAT_DEATHDAMAGE , percent = 0},
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 40, attack = 320, poison = 100},
    {name ="combat", interval = 2000, chance = 20, type = COMBAT_DROWNDAMAGE, target = true, range = 7, radius = 5, minDamage = -100, maxDamage = -300, effect = CONST_ME_LOSEENERGY},
    {name ="combat", interval = 1000, chance = 20, type = COMBAT_ICEDAMAGE, range = 7, minDamage = -100, maxDamage = -350, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true},
    {name ="combat", interval = 2000, chance = 20, type = COMBAT_POISONDAMAGE, target = false, radius = 5, minDamage = -300, maxDamage = -350, effect = CONST_ME_POISONAREA},
}


monster.defenses = {
    defense = 80,
    armor = 80,
	{name ="combat", interval = 2000, chance = 8, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false},
}

monster.loot = {
    {id = 3043, chance = 100000, maxCount = 4}, -- crystal coin
    {id = 3035, chance = 100000, maxCount = 100}, -- platinum coin
    {id = 3578, chance = 40000, maxCount = 6}, -- fish
    {id = 3028, chance = 29000, maxCount = 20}, -- small diamond
    {id = 3032, chance = 29000, maxCount = 20}, -- small emerald
    {id = 239, chance = 30000, maxCount = 15}, -- great health potion
    {id = 238, chance = 30400, maxCount = 15}, -- great mana potion
    {id = 7158, chance = 25340, maxCount = 5}, -- rainbow trout
    {id = 7159, chance = 50590, maxCount = 5}, -- green perch
    {id = 8902, chance = 20590}, -- rusty shield
    {id = 3366, chance = 10590}, -- magic plate armor
    {id = 8045, chance = 15000}, -- hibiscus dress
    {id = 5887, chance = 20000}, -- piece of royal steel
    {id = 5891, chance = 15000, maxCount = 2}, -- enchanted chicken wing
    {id = 5801, chance = 20000}, -- jewelled backpack
    {id = 3573, chance = 10000}, -- magician hat
    {id = 3567, chance = 30000}, -- blue robe
    {id = 819, chance = 35000}, -- glacier shoes
    {id = 3036, chance = 20000, maxCount = 3}, -- violet gem
    {id = 9058, chance = 20000, maxCount = 4}, -- gold ingot
    {id = 3063, chance = 22000}, -- gold ring
    {id = 3434, chance = 25000}, -- vampire shield
    {id = 16100, chance = 10000}, -- crystal backpack
    {id = 8059, chance = 10000}, -- frozen plate
    {id = 8050, chance = 10000}, -- crystalline armor
    {id = 10323, chance = 10000}, -- guardian boots
    {id = 12547, chance = 5000}, -- diapason
    {id = 8104, chance = 5000}, -- calamity
    {id = 8038, chance = 6000}, -- Robe of the Ice Queen
    {id = 22118, chance = 10000, maxCount = 1}, -- TC Scroll
}

mType:register(monster)
