local mType = Game.createMonsterType("Fished Jellyfish")
local monster = {}

monster.description = "a fished jellyfish"
monster.experience = 10
monster.outfit = {
    lookType = 452,
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
monster.corpse = 13857
monster.speed = 170
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = true,
    rewardBoss = false,
    illusionable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 80,
    targetDistance = 0,
    runHealth = 0,
    isBlockable = true,
}

monster.immunities = {
    {type = "earth", condition = true},
    {type = "invisible", condition = true},
    {type = "drown", condition = true},
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 10, attack = 10},
}

monster.defenses = {
    defense = 10,
    armor = 10,
    {name ="invisible", interval = 2000, chance = 15, duration = 3000},
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Luuurrrp", yell = false},
}

monster.loot = {
    {id = 3581, chance = 8333, maxCount = 15}, -- shrimp
    {id = 3031, chance = 8333, maxCount = 15}, -- gold coin
}

mType:register(monster)
