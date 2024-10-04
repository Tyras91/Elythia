local mType = Game.createMonsterType("Fished Quara Hydromancer")
local monster = {}

monster.description = "a fished quara hydromancer"
monster.experience = 800
monster.outfit = {
    lookType = 47,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 1100
monster.maxHealth = 1100
monster.race = "blood"
monster.corpse = 5524
monster.speed = 250
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    illusionable = true,
    convinceable = false,
    pushable = false,
    rewardBoss = false,
    isBlockable = true,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "invisible", condition = true},
    {type = "drown", condition = true},
    {type = "fire", condition = true},
    {type = "ice", condition = true},
}

monster.elements = {
    {type = COMBAT_EARTHDAMAGE, percent = -10},
    {type = COMBAT_ENERGYDAMAGE, percent = -25},
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80},
    {name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -180, type = COMBAT_ICEDAMAGE, effect = CONST_ME_BUBBLES},
    {name ="combat", interval = 2000, chance = 10, radius = 3, target = false, minDamage = -90, maxDamage = -150, type = COMBAT_ICEDAMAGE, effect = CONST_ME_BUBBLES},
    {name ="combat", interval = 2000, chance = 10, minDamage = -170, maxDamage = -240, type = COMBAT_LIFEDRAIN, effect = CONST_ME_GREENGLOW},
    {name ="combat", interval = 2000, chance = 15, range = 7, minDamage = -45, maxDamage = -170, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = true},
    {name ="speed", interval = 2000, chance = 15, range = 7, speedChange = -350, effect = CONST_ME_MAGIC_RED, duration = 15000},
}

monster.defenses = {
    defense = 15,
    armor = 15,
    {name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minHealing = 100, maxHealing = 120, effect = CONST_ME_MAGIC_BLUE},
}


monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Qua hah tsh!", yell = false},
    {text = "Teech tsha tshul!", yell = false},
    {text = "Quara tsha Fach!", yell = false},
    {text = "Tssssha Quara!", yell = false},
    {text = "Blubber.", yell = false},
    {text = "Blup.", yell = false}
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 11488, chance = 23000}, -- quara eye
    {id = 3026, chance = 13000, maxCount = 4}, -- white pearl
    {id = 3032, chance = 8000, maxCount = 6}, -- small emerald
    {id = 3581, chance = 10000, maxCount = 15}, -- shrimp
    {id = 3027, chance = 6000, maxCount = 4}, -- black pearl
    {id = 238, chance = 9000, maxCount = 3}, -- great mana potion
    {id = 5895, chance = 4000, maxCount = 3}, -- fish fin
    {id = 3073, chance = 3500}, -- wand of cosmic energy
    {id = 3370, chance = 1800}, -- knight armor
}

mType:register(monster)
