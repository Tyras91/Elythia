local mType = Game.createMonsterType("Fished Shark")
local monster = {}

monster.description = "a shark"
monster.experience = 700
monster.outfit = {
    lookType = 453,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 1200
monster.maxHealth = 1200
monster.race = "blood"
monster.corpse = 13860
monster.speed = 230
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    illusionable = false,
    convinceable = false,
    pushable = true,
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
    chance = 7,
    {text = "Rarr chomp chomp!", yell = false},
}

monster.immunities = {
    {type = "invisible", condition = true},
    {type = "drown", condition = true},
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 1},
    {type = COMBAT_FIREDAMAGE, percent = 1},
    {type = COMBAT_ICEDAMAGE, percent = 1},
    {type = COMBAT_ENERGYDAMAGE, percent = -5},
    {type = COMBAT_EARTHDAMAGE, percent = 20},
}

monster.attacks = {
    {name ="melee", interval = 2000, skill = 50, attack = 50},
}

monster.defenses = {
    defense = 10,
    armor = 10,
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 3031, chance = 50000, maxCount = 50}, -- gold coin
    {id = 3578, chance = 25000, maxCount = 5}, -- fish
    {id = 14017, chance = 12000}, -- deepling scales
    {id = 12730, chance = 18000}, -- eye of a deepling
    {id = 3029, chance = 3000}, -- small sapphire
    {id = 281, chance = 900}, -- giant shimmering pearl
    {id = 5895, chance = 300}, -- fish fin
}

mType:register(monster)
