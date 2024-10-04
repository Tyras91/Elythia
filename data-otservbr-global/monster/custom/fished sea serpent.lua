local mType = Game.createMonsterType("Fished Sea Serpent")
local monster = {}

monster.description = "a fished sea serpent"
monster.experience = 2300
monster.outfit = {
    lookType = 275,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 1950
monster.maxHealth = 1950
monster.race = "blood"
monster.corpse = 949
monster.speed = 350
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    illusionable = false,
    convinceable = false,
    pushable = false,
    rewardBoss = false,
    isBlockable = true,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 70,
    targetDistance = 0,
    runHealth = 0,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 2000,
    chance = 7,
    {text = "CHHHRRRR", yell = false},
    {text = "HISSSS", yell = false},
}

monster.immunities = {
    {type = "ice", condition = true},
    {type = "paralyze", condition = true},
    {type = "invisible", condition = true},
    {type = "drown", condition = true},
}

monster.elements = {
    {type = COMBAT_FIREDAMAGE, percent = 30},
    {type = COMBAT_ENERGYDAMAGE, percent = -5},
    {type = COMBAT_PHYSICALDAMAGE, percent = -15},
    {type = COMBAT_DEATHDAMAGE, percent = 10},
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250},
    {name ="combat", interval = 2000, chance = 15, minDamage = -60, maxDamage = -300, type = COMBAT_EARTHDAMAGE, range = 7, ShootEffect = CONST_ANI_NONE, effect = CONST_ME_SMALLPLANTS, target = false},
    {name ="combat", interval = 2000, chance = 15, minDamage = -101, maxDamage = -300, type = COMBAT_ICEDAMAGE, range = 7, ShootEffect = CONST_ANI_NONE, effect = CONST_ME_ICEATTACK, target = false},
    {name ="combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, range = 5, ShootEffect = CONST_ANI_NONE, target = false},
}

monster.defenses = {
    defense = 45,
    armor = 45,
    {name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minHealing = 70, maxHealing = 273, effect = CONST_ME_MAGIC_BLUE},
    {name = "speed", interval = 2000, chance = 15, speedChange = 400, effect = CONST_ME_MAGIC_RED, duration = 5000}
}


monster.loot = {
    {id = 3031, chance = 10000, maxCount = 100}, -- gold coin
    {id = 3583, chance = 90000, maxCount = 3}, -- dragon ham
    {id = 3035, chance = 40000, maxCount = 10}, -- platinum coin
    {id = 9666, chance = 15200, maxCount = 2}, -- sea serpent scale
    {id = 3557, chance = 2150}, -- plate legs
    {id = 3029, chance = 9600, maxCount = 8}, -- small sapphire
    {id = 236, chance = 7500, maxCount = 2}, -- strong health potion
    {id = 3297, chance = 6200}, -- serpent sword
    {id = 237, chance = 9050, maxCount = 2}, -- strong mana potion
    {id = 8042, chance = 6500}, -- spirit cloak
    {id = 8083, chance = 3500}, -- northwind rod
    {id = 238, chance = 2500, maxCount = 2}, -- great mana potion
    {id = 815, chance = 1770}, -- glacier amulet
    {id = 823, chance = 1040}, -- glacier kilt
    {id = 8043, chance = 900}, -- focus cape
    {id = 9303, chance = 180}, -- leviathan's amulet
    {id = 8050, chance = 150}, -- crystalline armor
    {id = 22118, chance = 150}, -- TC
}

mType:register(monster)
