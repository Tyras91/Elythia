local rewardItem = TalkAction("/rw")

-- Custom explode function to split a string by a delimiter
local function explode(div, str)
    if div == '' then return false end
    local pos, arr = 0, {}
    for st, sp in function() return string.find(str, div, pos, true) end do
        table.insert(arr, string.sub(str, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(str, pos))
    return arr
end

-- Ensure MESSAGE_STATUS_CONSOLE_BLUE is defined
local MESSAGE_STATUS_CONSOLE_BLUE = MESSAGE_STATUS_CONSOLE_BLUE or 19 -- Replace 19 with the correct value if different in your environment

function rewardItem.onSay(cid, words, param, channel)
    if param == '' then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
        return true
    end

    -- Ensure getPlayersOnline function exists and returns a list of online players
    local function getPlayersOnline()
        -- Dummy implementation, replace with actual logic to get online players
        return {1, 2, 3} -- Replace with actual player IDs
    end

    local creature = Creature(cid)

    for _, pid in ipairs(getPlayersOnline()) do
        local t = explode(",", param)
        local ret = RETURNVALUE_NOERROR
        local pos = creature:getPosition()

        local id = tonumber(t[1])
        if not id then
            -- Temporarily handle errors while getting item ID by name
            local success, result = pcall(function()
                return getItemIdByName(t[1])
            end)

            id = result

            if not success or not id then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item with such name does not exist.")
                return true
            end
        end

        local amount = tonumber(t[2]) or 1

        -- Correctly create the item
        local item = Game.createItem(id, amount)
        if not item then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Failed to create item.")
            return true
        end

        if t[3] and getBooleanFromString(t[3]) then
            if t[4] and getBooleanFromString(t[4]) then
                pos = creature:getLookPosition()
            end
            ret = item:moveTo(pos)
        else
            local targetCreature = Creature(pid)
            doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "O " .. creature:getName() .. " gave (" .. amount .. "x) " .. ItemType(id):getName() .. " to all online players.")
            ret = targetCreature:addItem(item, true)
        end

        if ret ~= RETURNVALUE_NOERROR then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Couldn't add item: " .. t[1])
            return true
        end

        item:decay()
        if not creature:isGhost() then
            pos:sendMagicEffect(CONST_ME_MAGIC_RED)
        end
    end
    return true
end

rewardItem:separator(" ")
rewardItem:groupType("god")
rewardItem:register()
