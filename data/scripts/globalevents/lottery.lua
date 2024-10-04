local lottery = GlobalEvent("lottery")

local config = {
    interval = 180, -- 1 minute
    rewards = {
        {3043, 3},      -- {Crystal Coin, 3} -- {itemID, quantity}
        {3043, 5},      -- {Crystal Coin, 5}
        {22721, 10},    -- {Gold Token, 10}
        {22721, 5},     -- {Gold Token, 5}
        {22516, 10},    -- {Silver Token, 10}
        {22516, 5},     -- {Silver Token, 5}
        {18339, 1},     -- {zaoan chess box, 1}
        {3734, 5},      -- {blood herb, 5}
        {21819, 5},     -- {Spider Silk, 5}
        {22118, 5},     -- {Tibia coin, 5}
		{22118, 10},     -- {Tibia coin, 10}
		{22118, 25},     -- {Tibia coin, 25}
        {5922, 10},     -- {Holy Orchid, 10}
        {5925, 15},     -- {hardened bone, 15}
        {5912, 10}      -- {Blue piece of cloth, 10}
    },
    website = true
}

function lottery.onThink(interval)
    local players = {}
    for _, player in ipairs(Game.getPlayers()) do
        if not player:getGroup():getAccess() then
            table.insert(players, player)
        end
    end

    local c = #players
    if c <= 0 then
        return true
    end

    local winner = players[math.random(#players)]

    local reward = config.rewards[math.random(#config.rewards)]
    local itemid, amount = reward[1], reward[2]
    winner:addItem(itemid, amount)

    local it = ItemType(itemid)
    local name = (amount == 1) and (it:getArticle() .. " " .. it:getName()) or (amount .. " " .. it:getPluralName())

    broadcastMessage("[LOTTERY SYSTEM] " .. winner:getName() .. " won " .. name .. "! Congratulations! (Next lottery in " .. config.interval .. " minute)")

    return true
end

lottery:interval(config.interval * 60 * 1000) -- Convert minutes to milliseconds
lottery:register()
