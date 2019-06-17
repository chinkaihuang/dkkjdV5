-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ========== Locations ===============
lSailPlan = Location(580, 64)
lBack = Location(520, 80)
lConfirmTarget = Location(257, 310)
lCancelTarget = Location(368, 312)
lSetOut = Location(540, 320)
lSetOutConfirm = Location(264, 206)
lCheckResult = Location(312, 312)
lCloseResult = Location(550, 340)
lHarborArrived = Location(318, 208)
lOpenChest = Location(528, 300)
lFinishBattle = Location(542, 338)

-- ========== Regions =================
rSeaMap = Region(47, 12, 387, 271)
rLevel = Region(305, 83, 110, 14)
rFleet = Region(166, 57, 27, 21)

-- ========== Constants ===============

-- ========== Function ================
-- preparation
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

-- no target handling
-- destroy target
function GoFight()
    click(lConfirmTarget)
    wait(1)
    click(lSetOut)
    click(lSetOutConfirm)
    if rFleet:exists("pirateflag.png", 15) then
        click(lCheckResult)
        wait(1)
        click(lCloseResult)
        wait(1)
        click(lCloseResult)
        wait(1)
        click(lHarborArrived)
        wait(1)
        click(lOpenChest)
        wait(1)
        click(lFinishBattle)
    else
        errExit()
    end
    wait(2)
end

-- exit with error
function errExit()
    vibrate(0.3)
    wait(0.3)
    vibrate(0.3)
    scriptExit()
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

-- if bfixed == true then
--     toast("fixed level.")
-- else
--     toast("non fixed level.")
-- end 

-- toast("level: " .. level)

for i = 1, count do
    -- preparation
    click(lSailPlan)
    wait(3)

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
                        GoFight()
                        break
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
        errExit()
    end
end