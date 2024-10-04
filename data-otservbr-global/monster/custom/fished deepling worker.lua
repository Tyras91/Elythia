local mType = Game.createMonsterType("Fished Deepling Worker")
local monster = {}

monster.description = "a fished deepling worker"
monster.experience = 130
monster.outfit = {
    lookType = 470,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 190
monster.maxHealth = 190
monster.race = "blood"
monster.corpse = 14094
monster.speed = 210
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = true,
    targetDistance = 0,
    runHealth = 20,
    isBlockable = true,
    canPushItems = true,
    canPushCreatures = true,
    illusionable = false
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "Qjell afar gou jey!", yell = false}
}

monster.immunities = {
    {type = "invisible", condition = true},
    {type = "paralyze", condition = true},
    {type = "drown", condition = true},
    {type = "fire", condition = true},
    {type = "ice", condition = true}
}

monster.elements = {
    {type = COMBAT_ENERGYDAMAGE, percent = -20},
    {type = COMBAT_EARTHDAMAGE, percent = -20}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 30, attack = 40}
}

monster.defenses = {
    defense = 10,
    armor = 10
}

monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 14017, chance = 10000, maxCount = 3}, -- deepling scales
    {id = 12683, chance = 400}, -- heavy trident
    {id = 5895, chance = 750, maxCount = 3}, -- fish fin
    {id = 12730, chance = 500}, -- eye of a deepling
    {id = 3578, chance = 18020, maxCount = 3}, -- fish
    {id = 3032, chance = 1000, maxCount = 4}, -- small emerald
}

mType:register(monster)
