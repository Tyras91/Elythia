-- File: data/scripts/events/double_experience.lua

local function setExperienceRate()
    local currentTime = os.time()
    local currentDate = os.date("*t", currentTime)
    local year = currentDate.year
    local month = currentDate.month
    local day = currentDate.day
    local weekday = currentDate.wday -- Sunday is 1, Monday is 2, ..., Saturday is 7

    -- Christmas date
    local christmasDate = os.time{year = year, month = 12, day = 25}

    if currentTime <= christmasDate and (weekday == 6 or weekday == 7) then
        Game.setRateValue(REGENERATION_TYPE_EXPERIENCE, 2) -- Double experience rate
        print("[Double Experience] Double experience rate activated for the weekend.")
    else
        Game.setRateValue(REGENERATION_TYPE_EXPERIENCE, 1) -- Normal experience rate
        print("[Double Experience] Normal experience rate activated.")
    end
end

function onStartup()
    setExperienceRate()
    addEvent(setExperienceRate, 24 * 60 * 60 * 1000) -- Check every day
    return true
end

function onGlobalSave()
    setExperienceRate()
    return true
end
