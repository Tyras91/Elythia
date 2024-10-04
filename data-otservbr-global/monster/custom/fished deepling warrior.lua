local mType = Game.createMonsterType("Fished Deepling Warrior")
local monster = {}

monster.description = "a fished deepling warrior"
monster.experience = 1500
monster.outfit = {
    lookType = 441,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 1600
monster.maxHealth = 1600
monster.race = "blood"
monster.corpse = 13712
monster.speed = 210
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = true,
    staticAttackChance = 70,
    targetDistance = 0,
    runHealth = 30,
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
    {text = "Jou wjil all djie!", yell = false}
}

monster.immunities = {
    {type = "invisible", condition = true},
    {type = "fire", condition = true},
    {type = "ice", condition = true},
    {type = "drown", condition = true}
}

monster.elements = {
    {type = COMBAT_EARTHDAMAGE, percent = -20},
    {type = COMBAT_ENERGYDAMAGE, percent = -10}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 50, attack = 100},
    {name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -290, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, target = true}
}

monster.defenses = {
    defense = 25,
    armor = 25,
    {name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minHealing = 50, maxHealing = 150, effect = CONST_ME_BLUESHIMMER}
}


monster.loot = {
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 3035, chance = 100000, maxCount = 5}, -- platinum coin
    {id = 14013, chance = 23000}, -- deeptags
    {id = 14085, chance = 23000}, -- deepling filet
    {id = 14041, chance = 16000}, -- deepling ridge
    {id = 239, chance = 15000, maxCount = 2}, -- great health potion
    {id = 14012, chance = 15000}, -- deepling warts
    {id = 238, chance = 15000, maxCount = 2}, -- great mana potion
    {id = 14252, chance = 5000, maxCount = 35}, -- vortex bolt
    {id = 3032, chance = 4500, maxCount = 7}, -- small emerald
    {id = 12683, chance = 2500}, -- heavy trident
    {id = 5895, chance = 2500, maxCount = 3}, -- fish fin
    {id = 14042, chance = 1500}, -- warrior's shield
    {id = 12730, chance = 1000, maxCount = 3}, -- eye of a deepling
    {id = 14040, chance = 1000}, -- warrior's axe
}

mType:register(monster)
