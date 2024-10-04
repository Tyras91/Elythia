local mType = Game.createMonsterType("Fished Water Elemental")
local monster = {}

monster.description = "a fished water elemental"
monster.experience = 650
monster.outfit = {
    lookType = 286,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 550
monster.maxHealth = 550
monster.race = "undead"
monster.corpse = 9582
monster.speed = 220
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
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 0,
    chance = 0,
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
    {type = COMBAT_PHYSICALDAMAGE, percent = 35},
    {type = COMBAT_HOLYDAMAGE, percent = 50},
    {type = COMBAT_DEATHDAMAGE, percent = 50},
    {type = COMBAT_ENERGYDAMAGE, percent = -25},
}

monster.attacks = {
    {name = "melee", interval = 2000, chance = 100, skill = 30, attack = 80, condition = {type = CONDITION_POISON, startDamage = 60, interval = 4000}},
    {name = "combat", interval = 2000, chance = 10, type = COMBAT_DROWNDAMAGE, target = true, range = 7, radius = 2, minDamage = -125, maxDamage = -235, effect = CONST_ME_BUBBLES},
    {name = "combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, range = 7, minDamage = -88, maxDamage = -150},
    {name = "combat", interval = 2000, chance = 15, type = COMBAT_POISONDAMAGE, target = false, radius = 5, minDamage = -225, maxDamage = -260, effect = CONST_ME_POISONAREA},
}


monster.defenses = {
    defense = 20,
    armor = 20,
    {name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minHealing = 50, maxHealing = 80, effect = CONST_ME_MAGIC_BLUE},
    {name = "speed", interval = 2000, chance = 15, speedChange = 300, duration = 5000, effect = CONST_ME_MAGIC_RED}
}


monster.loot = {
    {id = 3031, chance = 75000, maxCount = 100}, -- gold coin
    {id = 3035, chance = 25000, maxCount = 4}, -- platinum coin
    {id = 3578, chance = 30000, maxCount = 2}, -- fish
    {id = 3032, chance = 3500, maxCount = 5}, -- small emerald
    {id = 3028, chance = 3500, maxCount = 3}, -- small diamond
    {id = 3029, chance = 4000, maxCount = 3}, -- small sapphire
    {id = 281, chance = 1500, maxCount = 2}, -- giant shimmering pearl
    {id = 236, chance = 15000, maxCount = 2}, -- strong health potion
    {id = 237, chance = 15000, maxCount = 2}, -- strong mana potion
    {id = 7158, chance = 1500}, -- rainbow trout
    {id = 7159, chance = 1550}, -- green perch
    {id = 9303, chance = 400}, -- leviathan's amulet
}

mType:register(monster)
