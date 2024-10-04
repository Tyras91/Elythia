local mType = Game.createMonsterType("Fished Fish")
local monster = {}

monster.description = "a fished fish"
monster.experience = 10
monster.outfit = {
    lookType = 455,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 25
monster.maxHealth = 25
monster.race = "undead"
monster.corpse = 3125
monster.speed = 180
monster.manaCost = 0

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = true,
    targetDistance = 0,
    runHealth = 25,
    isBlockable = true,
    canPushItems = false,
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
    {text = "Blib!", yell = false},
    {text = "Blub!", yell = false}
}

monster.immunities = {
    {type = "earth", condition = true},
    {type = "invisible", condition = true},
    {type = "drown", condition = true}
}

monster.elements = {}

monster.attacks = {}

monster.defenses = {
    defense = 5,
    armor = 5
}

monster.loot = {}

mType:register(monster)
