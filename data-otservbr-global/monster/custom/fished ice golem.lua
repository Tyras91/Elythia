local mType = Game.createMonsterType("Fished Ice Golem")
local monster = {}

monster.description = "a fished ice golem"
monster.experience = 295
monster.outfit = {
    lookType = 261,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 385
monster.maxHealth = 385
monster.race = "undead"
monster.corpse = 7282
monster.speed = 195
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    targetDistance = 1,
    runHealth = 0,
    isBlockable = true,
    canPushItems = true,
    canPushCreatures = false,
    illusionable = false,
    staticAttackChance = 50
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 2000,
    chance = 5,
    {text = "Chrrr.", yell = false},
    {text = "Crrrrk.", yell = false},
    {text = "Gnarr.", yell = false}
}

monster.immunities = {
    {type = "holy", condition = true},
    {type = "death", condition = true},
    {type = "fire", condition = true},
    {type = "ice", condition = true},
    {type = "invisible", condition = true},
    {type = "paralyze", condition = true}
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 25},
    {type = COMBAT_ENERGYDAMAGE, percent = -20}
}

monster.attacks = {
    {name = "melee", interval = 2000, chance = 100, skill = 100, attack = 40},
    {name = "speed", interval = 2000, chance = 10, speedChange = -800, radius = 8, effect = CONST_ME_ENERGYAREA, target = false, duration = 20000},
    {name = "combat", interval = 2000, chance = 10, minDamage = -50, maxDamage = -85, range = 7, radius = 1, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, type = COMBAT_ICEDAMAGE, target = true},
}


monster.defenses = {
    defense = 26,
    armor = 25
}

monster.loot = {
    {id = 3031, chance = 50000, maxCount = 100}, -- gold coin
    {id = 3035, chance = 50000, maxCount = 5}, -- platinum coin
    {id = 9661, chance = 20000}, -- frosty heart
    {id = 7441, chance = 10000}, -- ice cube
    {id = 3027, chance = 3000, maxCount = 6}, -- black pearl
    {id = 3029, chance = 578, maxCount = 4}, -- small sapphire
    {id = 3373, chance = 1800}, -- strange helmet
    {id = 236, chance = 3500}, -- strong health potion
    {id = 3284, chance = 2200}, -- ice rapier
    {id = 7290, chance = 1800}, -- shard
    {id = 7449, chance = 900}, -- crystal sword
    {id = 829, chance = 600}, -- glacier mask
    {id = 3028, chance = 12000, maxCount = 2}, -- small diamond
}

mType:register(monster)
