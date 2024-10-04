local mType = Game.createMonsterType("Fished Coral Frog")
local monster = {}

monster.description = "a fished coral frog"
monster.experience = 20
monster.outfit = {
    lookType = 226,
    lookHead = 114,
    lookBody = 98,
    lookLegs = 97,
    lookFeet = 114,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 60
monster.maxHealth = 60
monster.race = "blood"
monster.corpse = 6079
monster.speed = 200
monster.manaCost = 305

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
    isBlockable = true,
    canPushItems = false,
    canPushCreatures = false,
    illusionable = false
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Ribbit!", yell = false},
    {text = "Ribbit! Ribbit!", yell = false}
}

monster.immunities = {}

monster.elements = {
    {type = COMBAT_ICEDAMAGE, percent = 10},
    {type = COMBAT_FIREDAMAGE, percent = -10}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 10, attack = 24}
}

monster.defenses = {
    defense = 5,
    armor = 5
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 50}, -- gold coin
    {id = 3492, chance = 20000, maxCount = 10} -- worm
}

mType:register(monster)
