local mType = Game.createMonsterType("Fished Deepling Tyrant")
local monster = {}

monster.description = "a fished deepling tyrant"
monster.experience = 4200
monster.outfit = {
    lookType = 442,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 4900
monster.maxHealth = 4900
monster.race = "blood"
monster.corpse = 21956
monster.speed = 260
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = true,
    staticAttackChance = 70,
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
    {text = "QJELL NETA NA!!", yell = false}
}

monster.immunities = {
    {type = "invisible", condition = true},
    {type = "ice", condition = true},
    {type = "paralyze", condition = true},
    {type = "drown", condition = true},
    {type = "fire", condition = true}
}

monster.elements = {}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, skill = 100, attack = 91},
    {name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -375, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true},
    {name ="combat", interval = 2000, chance = 15, minDamage = -180, maxDamage = -215, type = COMBAT_DROWNDAMAGE, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_BLUEBUBBLE, target = true}
}

monster.defenses = {
    defense = 45,
    armor = 45,
    {name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minHealing = 200, maxHealing = 400, effect = CONST_ME_BLUESHIMMER}
}


monster.loot = {
    {id = 14011, chance = 84790}, -- deepling breaktime snack
    {id = 3031, chance = 100000, maxCount = 100}, -- gold coin
    {id = 3035, chance = 90960, maxCount = 12}, -- platinum coin
    {id = 239, chance = 33410, maxCount = 5}, -- great health potion
    {id = 238, chance = 32590, maxCount = 5}, -- great mana potion
    {id = 14010, chance = 23140}, -- deepling guard belt buckle
    {id = 12730, chance = 28850}, -- eye of a deepling
    {id = 14044, chance = 39950}, -- deepling claw
    {id = 3029, chance = 39880, maxCount = 8}, -- small sapphire
    {id = 12683, chance = 9540}, -- heavy trident
    {id = 14043, chance = 4460}, -- guardian axe
    {id = 14142, chance = 100}, -- foxtail
    {id = 14250, chance = 4530}, -- deepling squelcher
    {id = 14247, chance = 3260}, -- ornate crossbow
    {id = 14248, chance = 3510}, -- deepling backpack
    {id = 22118, chance = 200} -- TC Scroll
}

mType:register(monster)
