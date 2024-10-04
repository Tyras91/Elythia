local mType = Game.createMonsterType("Crystal Guardian")
local monster = {}

monster.description = "a crystal guardian"
monster.experience = 500000
monster.outfit = {
    lookType = 261,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "undead"
monster.corpse = 7282
monster.speed = 220
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    rewardBoss = true,
    staticAttackChance = 50,
    targetDistance = 1,
    runHealth = 0,
    isBlockable = true,
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 2000,
    chance = 5,
    {text = "Chrrrkrhhh.", yell = false},
    {text = "Crrrrkrrrrh.", yell = false},
    {text = "Gnarrwwrawww.", yell = false}
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "invisible", condition = true},
    {type = "outfit", condition = false},
    {type = "drunk", condition = false},
    {type = "bleed", condition = false}
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 35},
    {type = COMBAT_ENERGYDAMAGE, percent = 20},
    {type = COMBAT_EARTHDAMAGE, percent = 0},
    {type = COMBAT_FIREDAMAGE, percent = 0},
    {type = COMBAT_LIFEDRAIN, percent = 0},
    {type = COMBAT_MANADRAIN, percent = 0},
    {type = COMBAT_DROWNDAMAGE, percent = 0},
    {type = COMBAT_ICEDAMAGE, percent = 0},
    {type = COMBAT_HOLYDAMAGE , percent = 0},
    {type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 100, attack = 90},
    {name ="speed", interval = 2000, chance = 10, speedChange = -800, radius = 1, effect = CONST_ME_ENERGYHIT, target = false, duration = 20000},
    {name ="combat", interval = 2000, chance = 10, minDamage = -50, maxDamage = -285, type = COMBAT_ICEDAMAGE, range = 7, ShootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true}
}

monster.defenses = {
    defense = 80,
    armor = 80
}

monster.loot = {
    {id = 3043, chance = 100000, maxCount = 2}, -- crystal coin
    {id = 3035, chance = 100000, maxCount = 50}, -- platinum coin
    {id = 9661, chance = 50000}, -- frosty heart
    {id = 7441, chance = 50000}, -- ice cube
    {id = 3027, chance = 30000, maxCount = 6}, -- black pearl
    {id = 3029, chance = 57800, maxCount = 6}, -- small sapphire
    {id = 236, chance = 1500, maxCount = 4}, -- strong health potion
    {id = 3284, chance = 41200}, -- ice rapier
    {id = 3567, chance = 25220}, -- blue robe
    {id = 8050, chance = 5220}, -- crystalline armor
    {id = 7290, chance = 38000}, -- shard
    {id = 645, chance = 4000}, -- blue legs
    {id = 7407, chance = 12000}, -- haunted blade
    {id = 7428, chance = 15000}, -- bonebreaker
    {id = 829, chance = 25000}, -- glacier mask
    {id = 8045, chance = 10000}, -- hibiscus dress
    {id = 3028, chance = 32000, maxCount = 4}, -- small diamond
    {id = 9058, chance = 22000, maxCount = 2}, -- gold ingot
    {id = 22118, chance = 3000}, -- TC Scroll
}

mType:register(monster)
