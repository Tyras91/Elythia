local mType = Game.createMonsterType("Godworm")
local monster = {}

monster.description = "a godworm"
monster.experience = 100
monster.outfit = {
    lookType = 26,
}

monster.health = 130
monster.maxHealth = 130
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5967
monster.speed = 140
monster.manaCost = 305
monster.maxSummons = 0

monster.changeTarget = {
    interval = 4000,
    chance = 0,
}

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    canPushItems = false,
    canPushCreatures = false,
    staticAttack = 70,
    targetDistance = 1,
    illusionable = false,
    runHealth = 0,
    isBlockable = true,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 2000,
    chance = 0,
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 3492, chance = 30000, maxCount = 6}, -- worm
    {id = 3577, chance = 25000, maxCount = 2}, -- meat
    {id = 3582, chance = 25120, maxCount = 2}, -- ham
    {id = 5856, chance = 20000}, -- sword
    {id = 3286, chance = 15000}, -- mace
    {id = 9692, chance = 12000}, -- lump of dirt
    {id = 3374, chance = 10010}, -- legion helmet
}

monster.attacks = {
    {name = "melee", interval = 2000, minDamage = 0, maxDamage = -40},
}

monster.defenses = {
    defense = 15,
    armor = 15,
}

monster.elements = {}

monster.immunities = {}

mType:register(monster)
