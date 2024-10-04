local targetIdList = {
    [25879] = { itemId = 285, transform = 266 },
    [25880] = { itemId = 283, transform = 236 },
    [25881] = { itemId = 284, transform = 239 },
    [25882] = { itemId = 284, transform = 7643 },
    [25883] = { itemId = 284, transform = 23375 },
    [25889] = { itemId = 285, transform = 268 },
    [25890] = { itemId = 283, transform = 237 },
    [25891] = { itemId = 284, transform = 238 },
    [25892] = { itemId = 284, transform = 23373 },
    [25899] = { itemId = 284, transform = 7642 },
    [25900] = { itemId = 284, transform = 23374 },
    [25903] = { itemId = 285, transform = 266 },
    [25904] = { itemId = 283, transform = 236 },
    [25905] = { itemId = 284, transform = 239 },
    [25906] = { itemId = 284, transform = 7643 },
    [25907] = { itemId = 284, transform = 23375 },
    [25908] = { itemId = 285, transform = 268 },
    [25909] = { itemId = 283, transform = 237 },
    [25910] = { itemId = 284, transform = 238 },
    [25911] = { itemId = 284, transform = 23373 },
    [25913] = { itemId = 284, transform = 7642 },
    [25914] = { itemId = 284, transform = 23374 },
}

local flasks = Action()

function flasks.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Check if the target is an item (keg or cask)
    if not target or not target:isItem() then
        player:sendCancelMessage("You cannot use this object.")
        return false
    end

    -- Ensure that the target has charges (if applicable)
    local charges = target:getCharges()
    if not charges or charges <= 0 then
        player:sendCancelMessage("The keg is empty.")
        return false
    end

    -- Check if the item used is part of the target ID list
    local targetId = targetIdList[target:getId()]
    if not targetId or item:getId() ~= targetId.itemId then
        player:sendCancelMessage("You cannot use this item with the keg.")
        return false
    end

    -- Handle the transfer of charges between the keg and the item
    local itemCount = item:getCount()
    if itemCount > charges then
        itemCount = charges
    end

    local potMath = item:getCount() - itemCount
    local parent = item:getParent()
    
    -- Try to add the remaining potions back to the player's inventory
    if parent and parent:isContainer() and not parent:addItem(item:getId(), potMath) then
        player:addItem(item:getId(), potMath, true)
    end

    -- Transform the item and update the keg's charges
    item:transform(targetId.transform, itemCount)
    charges = charges - itemCount
    target:transform(target:getId(), charges)
    
    -- Notify the player of the remaining charges
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Remaining %d charges.", charges))

    -- If no charges remain, remove the keg
    if charges == 0 then
        target:remove()
    end
    
    return true
end

flasks:id(283, 284, 285)
flasks:register()
