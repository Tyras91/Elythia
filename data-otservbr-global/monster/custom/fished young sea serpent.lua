local mType = Game.createMonsterType("Fished Young Sea Serpent")
local monster = {}

monster.description = "a fished young sea serpent"
monster.experience = 1000
monster.outfit = {
    lookType = 317,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 1050
monster.maxHealth = 1050
monster.race = "blood"
monster.corpse = 8965
monster.speed = 320
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
    staticAttackChance = 85,
    targetDistance = 0,
    runHealth = 400,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "CHHHRRRR", yell = false},
    {text = "HISSSS", yell = false}
}

monster.immunities = {
    {type = "earth", condition = true},
    {type = "ice", condition = true},
    {type = "paralyze", condition = true},
    {type = "invisible", condition = true},
    {type = "drown", condition = true},
}

monster.elements = {
    {type = COMBAT_FIREDAMAGE, percent = 30},
    {type = COMBAT_ENERGYDAMAGE, percent = -10},
    {type = COMBAT_PHYSICALDAMAGE, percent = -15},
    {type = COMBAT_DEATHDAMAGE, percent = -15},
}



monster.attacks = {
    {name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200},
    {name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, length = 7, spread = 2, minDamage = -10, maxDamage = -250, effect = CONST_ME_PLANTATTACK},
    {name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, length = 7, spread = 2, minDamage = -80, maxDamage = -250, effect = CONST_ME_ICEATTACK},
    {name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, range = 5, target = true}
}


monster.defenses = {
    defense = 30,
    armor = 30,
    {name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minHealing = 25, maxHealing = 175, effect = CONST_ME_MAGIC_BLUE},
    {name = "speed", interval = 2000, chance = 15, speedChange = 400, duration = 5000, effect = CONST_ME_MAGIC_RED}
}


monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 3035, chance = 100000, maxCount = 2}, -- platinum coin
    {id = 3282, chance = 60000}, -- morning star
    {id = 3266, chance = 32000}, -- battle axe
    {id = 8895, chance = 22000}, -- rusty armor
    {id = 236, chance = 12500, maxCount = 3}, -- strong health potion
    {id = 9666, chance = 9500}, -- sea serpent scale
    {id = 3305, chance = 9500}, -- battle hammer
    {id = 237, chance = 9000, maxCount = 3}, -- strong mana potion
    {id = 3029, chance = 9000, maxCount = 5}, -- small sapphire
    {id = 3061, chance = 4450}, -- life crystal
}

mType:register(monster)
