local mType = Game.createMonsterType("Puddle")
local monster = {}

monster.description = "a massive water bender"
monster.experience = 1000000
monster.outfit = {
    lookType = 286,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 400000
monster.maxHealth = 400000
monster.race = "undead"
monster.corpse = 9582
monster.speed = 400
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
    {type = COMBAT_PHYSICALDAMAGE, percent = 20},
    {type = COMBAT_HOLYDAMAGE, percent = 10},
    {type = COMBAT_ENERGYDAMAGE, percent = -15},
}

monster.attacks = {
    {name = "melee", interval = 2000, chance = 100, skill = 20, attack = 190, poison = 50},
    {name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, target = true, range = 7, radius = 2, minDamage = -100, maxDamage = -250, effect = CONST_ME_LOSEENERGY},
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -200, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true },
    {name = "combat", interval = 2000, chance = 20, type = COMBAT_POISONDAMAGE, target = false, radius = 5, minDamage = -100, maxDamage = -250, effect = CONST_ME_POISONAREA},
}


monster.defenses = {
    defense = 30,
    armor = 30,
    {name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minHealing = 100, maxHealing = 150, effect = CONST_ME_MAGIC_BLUE},
}

monster.loot = {
    {id = 3043, chance = 100000, maxCount = 3}, -- crystal coin
    {id = 3035, chance = 100000, maxCount = 100}, -- platinum coin
    {id = 3578, chance = 100000, maxCount = 6}, -- fish
    {id = 3028, chance = 40000, maxCount = 6}, -- small diamond
    {id = 3032, chance = 40000, maxCount = 6}, -- small emerald
    {id = 239, chance = 35000, maxCount = 5}, -- great health potion
    {id = 238, chance = 35400, maxCount = 5}, -- great mana potion
    {id = 7158, chance = 20000}, -- rainbow trout
    {id = 7159, chance = 23000}, -- green perch
    {id = 8038, chance = 3000}, -- robe of the ice queen
    {id = 823, chance = 23000}, -- glacier kilt
    {id = 8902, chance = 23000}, -- rusty shield
    {id = 19362, chance = 3000}, -- icicle bow
    {id = 7451, chance = 20000}, -- shadow sceptre
    {id = 16118, chance = 5000}, -- glacial rod
    {id = 10323, chance = 8000}, -- guardian boots
    {id = 3442, chance = 3000}, -- tempest shield
    {id = 8075, chance = 10000}, -- spellbook of lost souls
    {id = 3036, chance = 20000, maxCount = 2}, -- violet gem
    {id = 3041, chance = 20000, maxCount = 4}, -- blue gem
    {id = 9058, chance = 20000, maxCount = 3}, -- gold ingot
    {id = 22118, chance = 5000}, -- TC Scroll
}

mType:register(monster)
