local mType = Game.createMonsterType("Deepsea Dragon Matron")
local monster = {}

monster.description = "a deepsea dragon"
monster.experience = 10000000
monster.outfit = {
	lookType = 248,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1500000
monster.maxHealth = 1200000
monster.race = "undead"
monster.corpse = 7091
monster.speed = 500
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    rewardBoss = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
    isBlockable = false,
    canPushItems = true,
    canPushCreatures = true,
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 2000,
    chance = 10,
    {text = "I will drown you in the depths!", yell = false},
    {text = "Feel the power of the ocean!", yell = false}
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "invisible", condition = true},
    {type = "drown", condition = true}
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 0},
    {type = COMBAT_ENERGYDAMAGE, percent = 0},
    {type = COMBAT_EARTHDAMAGE, percent = 0},
    {type = COMBAT_FIREDAMAGE, percent = 0},
    {type = COMBAT_LIFEDRAIN, percent = 0},
    {type = COMBAT_MANADRAIN, percent = 0},
    {type = COMBAT_DROWNDAMAGE, percent = 0},
    {type = COMBAT_ICEDAMAGE, percent = 0},
    {type = COMBAT_HOLYDAMAGE , percent = 0},
    {type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
    {name = "melee", interval = 2000, chance = 100, minDamage = -600, maxDamage = -800},
    {name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, length = 8, spread = 3, effect = CONST_ME_ICETORNADO, target = false, minDamage = -900, maxDamage = -1200},
    {name = "combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, radius = 4, target = true, effect = CONST_ME_ICEATTACK, minDamage = -500, maxDamage = -800},
    {name = "combat", interval = 1000, chance = 25, type = COMBAT_PHYSICALDAMAGE, length = 7, spread = 2, effect = CONST_ME_WATERSPLASH, target = false, minDamage = -750, maxDamage = -1000, shootEffect = CONST_ANI_SMALLICE}
}

monster.defenses = {
    defense = 70,
    armor = 80,
    {name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minHealing = 500, maxHealing = 700, effect = CONST_ME_MAGIC_BLUE},
    {name ="speed", interval = 2000, chance = 10, speedChange = 650, effect = CONST_ME_MAGIC_RED, duration = 5000}
}

monster.loot = {
    {id = 3035, chance = 100000, maxCount = 100}, -- platinum coin
    {id = 3043, chance = 100000, maxCount = 5}, -- crystal coin
    {id = 3032, chance = 23480, maxCount = 30}, -- small emerald
    {id = 3030, chance = 22700, maxCount = 30}, -- small ruby
    {id = 3033, chance = 24870, maxCount = 30}, -- small amethyst
    {id = 3281, chance = 30570}, -- giant sword
    {id = 3369, chance = 30480}, -- warrior helmet
    {id = 3370, chance = 20000}, -- knight armor
    {id = 5909, chance = 30910, maxCount = 5}, -- white piece of cloth
    {id = 5911, chance = 31220, maxCount = 5}, -- red piece of cloth
    {id = 5912, chance = 33390, maxCount = 5}, -- blue piece of cloth
    {id = 3583, chance = 20350, maxCount = 5}, -- dragon ham
    {id = 3567, chance = 25220}, -- blue robe
    {id = 238, chance = 35000, maxCount = 6}, -- great mana potion
    {id = 7643, chance = 22000, maxCount = 6}, -- ultimate health potion
    {id = 9057, chance = 34870, maxCount = 58}, -- small topaz
    {id = 16119, chance = 18260, maxCount = 8}, -- blue crystal shard
    {id = 16124, chance = 13000, maxCount = 8}, -- blue crystal splinter
    {id = 16125, chance = 16000, maxCount = 8}, -- cyan crystal fragment
    {id = 20203, chance = 18700}, -- trapped bad dream monster
    {id = 20204, chance = 17000}, -- bowl of terror sweat
    {id = 20062, chance = 12960}, -- cluster of solace
    {id = 3366, chance = 18590}, -- magic plate armor
    {id = 14142, chance = 10000}, -- foxtail
    {id = 12318, chance = 12000}, -- giant shrimp
    {id = 7428, chance = 10590}, -- bonebreaker
    {id = 3442, chance = 8000}, -- tempest shield
    {id = 8045, chance = 18000}, -- hibiscus dress
    {id = 9604, chance = 12000}, -- moon backpack
    {id = 16100, chance = 10000}, -- crystal backpack
    {id = 8059, chance = 10000}, -- frozen plate
    {id = 8050, chance = 12000}, -- crystalline armor
    {id = 10323, chance = 12000}, -- guardian boots
    {id = 7455, chance = 6000}, -- mythril axe
    {id = 16175, chance = 5000}, -- shiny blade
    {id = 8056, chance = 6000}, -- oceanborn leviathan armor
    {id = 3036, chance = 22000, maxCount = 5}, -- violet gem
    {id = 9058, chance = 22000, maxCount = 5}, -- gold ingot
    {id = 22118, chance = 10000}, -- TC Scroll
}

mType:register(monster)
