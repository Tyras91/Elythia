local mType = Game.createMonsterType("Fished Crab")
local monster = {}

monster.description = "a fished crab"
monster.experience = 30
monster.outfit = {
    lookType = 112,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 55
monster.maxHealth = 55
monster.race = "undead"
monster.corpse = 6039
monster.speed = 140
monster.manaCost = 305

monster.flags = {
    summonable = true,
    attackable = true,
    hostile = true,
    convinceable = true,
    pushable = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
    isBlockable = true,
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
    chance = 0,
}

monster.immunities = {
    {type = "earth", condition = true},
    {type = "drown", condition = true}
}

monster.elements = {
    {type = COMBAT_ICEDAMAGE, percent = 1},
    {type = COMBAT_FIREDAMAGE, percent = -10},
    {type = COMBAT_ENERGYDAMAGE, percent = -10}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 10, attack = 20}
}

monster.defenses = {
    defense = 10,
    armor = 10
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 50}, -- gold coin
    {id = 10272, chance = 30000}, -- crab pincers
    {id = 3578, chance = 30000, maxCount = 2} -- fish
}

mType:register(monster)
