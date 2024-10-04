local mType = Game.createMonsterType("Fished Quara Pincher")
local monster = {}

monster.description = "a fished quara pincher"
monster.experience = 1200
monster.outfit = {
    lookType = 77,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 1800
monster.maxHealth = 1800
monster.race = "blood"
monster.corpse = 5521
monster.speed = 210
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
    targetDistance = 1,
    runHealth = 0,
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -340},
    {name ="speed", interval = 2000, chance = 20, speedChange = -300, range = 1, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000},
}

monster.defenses = {
    defense = 50,
    armor = 50
}

monster.elements = {
    {type = COMBAT_EARTHDAMAGE, percent = -10},
    {type = COMBAT_ENERGYDAMAGE, percent = -25},
    {type = COMBAT_PHYSICALDAMAGE, percent = 10},
}

monster.immunities = {
    {type = "invisible", condition = true},
    {type = "drown", condition = true},
    {type = "fire", condition = true},
    {type = "ice", condition = true},
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Clank! Clank!", yell = false},
    {text = "Clap!", yell = false},
    {text = "Crrrk! Crrrk!", yell = false},
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 3035, chance = 50000, maxCount = 3}, -- platinum coin
    {id = 11490, chance = 21000}, -- quara pincers
    {id = 239, chance = 15000, maxCount = 2}, -- great health potion
    {id = 3030, chance = 10000, maxCount = 6}, -- small ruby
    {id = 3269, chance = 10000}, -- halberd
    {id = 3581, chance = 18000, maxCount = 15}, -- shrimp
    {id = 5895, chance = 2200, maxCount = 3}, -- fish fin
    {id = 3369, chance = 2200}, -- warrior helmet
    {id = 3381, chance = 1500}, -- crown armor
    {id = 824, chance = 1210}, -- glacier robe
    {id = 12318, chance = 150}, -- giant shrimp
}

mType:register(monster)
