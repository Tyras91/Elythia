local mType = Game.createMonsterType("Fished Calamary")
local monster = {}

monster.description = "a fished calamary"
monster.experience = 10
monster.outfit = {
    lookType = 451,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 75
monster.maxHealth = 75
monster.race = "undead"
monster.corpse = 13853
monster.speed = 160
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = false,
    convinceable = false,
    pushable = false,
    staticAttackChance = 90,
    targetDistance = 0,
    runHealth = 75,
    canPushItems = false,
    canPushCreatures = false,
    illusionable = true
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Bubble!", yell = false},
    {text = "Bobble!", yell = false}
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "ice", condition = true},
    {type = "drown", condition = true}
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 0},
    {type = COMBAT_ENERGYDAMAGE, percent = 0},
    {type = COMBAT_EARTHDAMAGE, percent = 0},
    {type = COMBAT_FIREDAMAGE, percent = 0},
    {type = COMBAT_LIFEDRAIN, percent = 0},
    {type = COMBAT_MANADRAIN, percent = 0},
    {type = COMBAT_DROWNDAMAGE, percent = 100},
    {type = COMBAT_ICEDAMAGE, percent = 0},
    {type = COMBAT_HOLYDAMAGE , percent = 0},
    {type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {}

monster.defenses = {
    defense = 0,
    armor = 0
}

monster.loot = {
    {id = 3581, chance = 12270, maxCount = 15} -- shrimp
}

mType:register(monster)
