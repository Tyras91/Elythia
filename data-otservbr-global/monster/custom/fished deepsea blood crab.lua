local mType = Game.createMonsterType("Fished Deepsea Blood Crab")
local monster = {}

monster.description = "a fished deepsea blood crab"
monster.experience = 160
monster.outfit = {
    lookType = 200,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 320
monster.maxHealth = 320
monster.race = "undead"
monster.corpse = 5688
monster.speed = 250
monster.manaCost = 505

monster.flags = {
    summonable = true,
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
    staticAttackChance = 90
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 0,
    chance = 0
}

monster.immunities = {
    {type = "ice", condition = true},
    {type = "earth", condition = true},
    {type = "drown", condition = true}
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 20},
    {type = COMBAT_FIREDAMAGE, percent = -10},
    {type = COMBAT_ENERGYDAMAGE, percent = -5}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 40, attack = 45}
}

monster.defenses = {
    defense = 20,
    armor = 20
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 3578, chance = 20000, maxCount = 3}, -- fish
    {id = 9633, chance = 13000, maxCount = 2}, -- bloody pincers
    {id = 3358, chance = 12000}, -- chain armor
    {id = 3372, chance = 4500}, -- brass legs
    {id = 3026, chance = 1000, maxCount = 6} -- white pearl
}

mType:register(monster)
