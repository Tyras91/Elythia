local symbol = MoveEvent()

function symbol.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local strangeSymbolsStorage = Storage.ChildrenoftheRevolution.StrangeSymbols
    local mission03Storage = Storage.ChildrenoftheRevolution.Mission03
    local mission04Storage = Storage.ChildrenoftheRevolution.Mission04

    if player:getStorageValue(strangeSymbolsStorage) < 1 and player:getStorageValue(mission03Storage) >= 2 then
        -- Questlog, Children of the Revolution 'Mission 4: Zze Way of Zztonezz'
        player:setStorageValue(mission04Storage, 2)
        player:setStorageValue(strangeSymbolsStorage, 1)
        player:say("A part of the floor before you displays an arrangement of strange symbols.", TALKTYPE_MONSTER_SAY)
    end
    return true
end

symbol:type("stepin")
symbol:position(Position(33357, 31123, 5))
symbol:register()
