-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ========== Locations ===============
lNinaHair = Location(208, 125)
lSailPlan = Location(580, 64)
lBack = Location(520, 80)
lConfirmTarget = Location(257, 310)
lCancelTarget = Location(368, 312)
lSetOut = Location(540, 320)
lSetOutConfirm = Location(264, 206)
lPirateFlag = Location(179, 66)
lCheckResult = Location(312, 312)
lCloseResult = Location(550, 340)
lHarborArrived = Location(318, 208)
lFinishCheckPoint = Location(538, 334)
lOpenChest = Location(528, 300)
lFinishBattle = Location(542, 338)

-- ========== Regions =================
rSeaMap = Region(47, 12, 387, 271)
rLevel = Region(305, 83, 110, 14)
rFleet = Region(166, 57, 27, 21)
rPowerValue = Region(209, 81, 56, 18)

-- ========== Constants ===============

-- ========== Function ================
-- get target list
function GetTargetList()
    targets = regionFindAllNoFindException(rSeaMap, "pirateship.png")
    return targets
end

-- find target
function CheckLevel()
    level = table.getn(regionFindAllNoFindException(rLevel, "star.png"))
    return level
end

-- destroy target
function GoFight()
    click(lConfirmTarget)
    wait(1)
    click(lSetOut)
    wait(1)
    click(lSetOutConfirm)
    for i = 1, 60 do
        if CheckPointColor(lPirateFlag, 86, 85, 93) then
            break
        else
            wait(1)
        end
    end

    click(lCheckResult)

    for i = 1, 6 do
        if CheckPointColor(lCloseResult, 68, 45, 29) then
            break
        else
            wait(1)
        end
    end

    click(lCloseResult)
    wait(2)
    click(lCloseResult)
    wait(2)
    click(lHarborArrived)
    for i = 1, 20 do
        if CheckPointColor(lFinishCheckPoint, 247, 247, 247) then
            break
        else
            click(lOpenChest)
        end
        wait(1)
    end
    click(lFinishBattle)

    -- else
    --     errExit("No pirate flag in 40s.")
    -- end

    wait(1)
end

-- no target handling

-- tool functions
function errExit(msg)
    vibrate(0.3)
    wait(0.3)
    vibrate(0.3)
    print(msg)
    scriptExit()
end

function CheckPointColor(pt, r, g, b)
    vR, vG, vB = getColor(pt)
    if vR == r and vG == g and vB == b then
        return true
    else
        return false
    end
end

-- ========== Main program ============
dialogInit()
addTextView("Reqired Times: ")
addEditNumber("count", 6)
addTextView("  , ")
addCheckBox("bfixed", "Fixed Level?", false)
newRow()
addRadioGroup("requiredLevel", 4)
addRadioButton("2 stars", 1)
addRadioButton("3 stars", 2)
addRadioButton("4 stars", 3)
addRadioButton("5 stars", 4)
addRadioButton("6 stars", 5)
dialogShow("Wanted Target")

for i = 1, count do
    -- preparation
    for i = 1, 3 do
        if CheckPointColor(lNinaHair, 255, 199, 103) then
            click(lNinaHair)
            break
        else
            wait(0.3)
        end
    end

    click(lSailPlan)
    wait(4)

    -- get target list
    list = GetTargetList()

    -- find target
    n = table.getn(list)
    if n > 0 then
        for j, p in ipairs(list) do
            click(p)
            wait(1)
            -- toast("This is " .. CheckLevel() .. "stars")
            lv = CheckLevel()
            repeat
                if bfixed == true then
                    if lv ~= requiredLevel then
                        click(lCancelTarget)
                    else
                        GoFight()
                        break
                    end
                else
                    if lv >= requiredLevel then
                        v, r = numberOCRNoFindException(rPowerValue, "num")
                        if r == true and v < 4200 then
                            GoFight()
                            break
                        else
                            click(lCancelTarget)
                        end
                    else
                        click(lCancelTarget)
                    end
                end

            until true
            wait(1)
        end
    end

    -- no target handling
    if n == 0 then
        errExit("No pirate ship.")
    end
end
