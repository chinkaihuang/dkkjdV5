-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ==========  locations ==============
lRefresh = Location(580, 50)
lAPBtn = Location(204, 14)
lGroupingBtn = Location(392, 54)
lRewardBtn = Location(476, 54)
lAreaSelectBtn = Location(550, 338) -- claim reward
lScrollDown = Location(318, 280)
lChooseBtn = Location(256, 313)
lStrength1 = Location(168, 116)
lFightBtn = Location(264, 290)
lFightConfirmBtn = Location(228, 228) -- add ap
lMissedBtn = Location(318, 206) -- reward point report confirm, no ap
lAreaCheck = Location(518, 51)
lBattleCheck = Location(318, 200) -- arrive harbor
lBonusConfirmBtn = Location(318, 220)
lCallForHelp = Location(265, 214) -- get reward confirm, battle confirm
lCloseHelpList = Location(520, 28)
lLostReward = Location(318, 226)
lCloseBattleBtn = Location(550, 336)
lAddEVBtn = Location(556, 292)
lAddEVConfirmBtn = Location(266, 240)
lBackBtn = Location(414, 260)
lAdd1Ev = Location(240, 180)
lAdd2Ev = Location(315, 180)
lAdd3Ev = Location(390, 180)
lAdd4Ev = Location(240, 217)
lYesBtn = Location(256, 311)
lNoBtn = Location(369, 311)
lSailBtn = Location(540, 318)
lResultBtn = Location(314, 314)

-- ==========  regions ================
rSail = Region(555, 45, 46, 48)
rEV = Region(401, 271, 122, 27)
rMap = Region(105, 12, 270, 270)
rBossMsg1 = Region(182, 133, 64, 14)
rBossMsg2 = Region(182, 205, 64, 14)
rBossMsg3 = Region(182, 277, 64, 14)
rGrouping = Region(376, 44, 30, 18)
rWanted = Region(59, 233, 50, 14)
rGoBtns = Region(529, 123, 42, 172)
rTimeLeft1 = Region(407, 132, 14, 14)
rTimeLeft2 = Region(407, 204, 14, 14)
rTimeLeft3 = Region(407, 276, 14, 14)
rMissed = Region(287, 136, 61, 15)
rNoAP = Region(208, 143, 77, 19)
rAttackType = Region(207, 118, 216, 88)
rBattleResult = Region(233, 44, 180, 32)
rGetReward = Region(520, 329, 57, 18)
rPowerNumber = Region(222, 79, 45, 21)
rArea2 = Region(57, 157, 238, 63)

-- ==========  constants ==============
MAXREFRESH = 20
-- ADDEVAMOUNT = 2
ATTACKTYPE = 1

-- ========== Function ================
function RefreshOverlord()
    res = false

    for i = 1, MAXREFRESH do
        click(lRefresh)
        if rSail:waitVanish("sail.png", 4) == true then
            wait(0.5)
            HasEV, evNum = HasEnoughEV()
            if HasEV == true and evNum > 5 or t:check() > 1800 then
                BeatPirate()
                t:set()
            elseif HasEV == false then
                AddEV()
            end

            if OverlordAppear() == true then
                res = true
                break
            else
                click(lRefresh)
            end
        end
    end

    return res
end

function HasEnoughEV()
    evs = table.getn(regionFindAllNoFindException(rEV, "evpoint.png"))
    if (evs > 0) then
        return true, evs
    else
        return false, 0
    end    
end    

function AddEV()
    click(lAddEVBtn)
    wait(1)
--    if amount == 1 then
       click(lAdd1Ev)
       click(lAddEVConfirmBtn)
--    elseif amount == 2 then
        -- click(lAdd2Ev)
        -- click(lAddEVConfirmBtn)
--    elseif amount == 3 then
--        click(lAdd3Ev)
--        click(lAddEVConfirmBtn)
--    elseif amount == 4 then
--        click(lAdd4Ev)
--        click(lAddEVConfirmBtn)
--    else
--        click(lBackBtn)
--    end
    wait(1)
end

function OverlordAppear()
    click(lScrollDown)
    if rWanted:exists("wanted.png", 0.5) then
        click(rWanted)
        return true
    else
        return false
    end
end

function ChooseOverlord(left)
    btns = regionFindAllNoFindException(rGoBtns, "go.png")
    overlordCnt = table.getn(btns)

    for i = 1, overlordCnt do
        if i == 1 then
            v, r = numberOCRNoFindException(rTimeLeft1, "num")
        elseif i == 2 then
            v, r = numberOCRNoFindException(rTimeLeft2, "num")
        else
            v, r = numberOCRNoFindException(rTimeLeft3, "num")
        end

        if r == true and v >= left and v > 24 then
            if FightOverlord(btns[i]) == true then
                return 0
            else
                return v
            end
        end 
    end

    click(lRefresh)
    return left
end

function FightOverlord(goBtn)
    click(goBtn)
    if rNoAP:exists("noap.png", 0.8) then
        click(lMissedBtn)
        click(lAPBtn)
        wait(0.5)
        click(lFightConfirmBtn)
        wait(2.5)
        click(goBtn)
        wait(0.3)
    end
    click(lChooseBtn)
    wait(0.5)
    click(lStrength1)
    click(lFightBtn)
    wait(0.3)
    click(lFightConfirmBtn)

    if rMissed:exists("missed.png") then
        click(lMissedBtn)
        return false
    end

    while(true) do
        if ATTACKTYPE == 1 then
            rAttackType:existsClick("power.png", 2)
        else
            rAttackType:existsClick("skill.png", 2)
        end

        r, g, b = getColor(lBattleCheck)
        if r == 241 and g == 218 and b == 179 then
            break
        else
            wait(1)
        end
    end

    click(lBonusConfirmBtn)
    click(lCallForHelp)
    wait(1)
    click(lCloseHelpList)
    click(lLostReward)
    click(lCloseBattleBtn)
    if rBattleResult:exists("lose.png", 0.5) then
        click(lCloseBattleBtn)
        return false
    else
        click(lCloseBattleBtn)
        return true
    end
end

function CollectReward()
    click(lRefresh)
    if rSail:waitVanish("sail.png", 4) == true then
        click(lRewardBtn)
        rGetReward:existsClick("getreward.png", 4)
        wait(1.5)
        click(lAreaSelectBtn)
        wait(0.3)
        click(lCallForHelp)
        wait(3)
        click(lMissedBtn)
        wait(2)
        click(lRefresh)
    end
end

function BeatPirate()
    click(rArea2)
    click(lAreaSelectBtn)
    while(true) do
        r, g, b = getColor(lAreaCheck)
        if r == 241 and g == 218 and b == 179 then
            pirates = regionFindAll(rMap, "pirate.png")
            pirateCnt = table.getn(pirates)
            for i = 1, pirateCnt do
                click(pirates[i])
                wait(0.8)
                v, r = numberOCRNoFindException(rPowerNumber, "num")
                if r == true and v < 4000 then
                    click(lYesBtn)
                    wait(0.5)
                    click(lSailBtn)
                    wait(0.5)
                    click(lCallForHelp)
                    while(true) do
                        r, g, b = getColor(lAreaCheck)
                        if r == 164 and g == 121 and b == 76 then
                            click(lResultBtn)
                            wait(0.5)
                            click(lStrength1)
                            click(lFightBtn)
                            wait(5)
                            click(lBonusConfirmBtn)
                            wait(1)
                            click(lCloseBattleBtn)
                            wait(0.6)
                            click(lCloseBattleBtn)
                            wait(3)
                            click(lBattleCheck)
                            wait(4)
                            click(lCloseBattleBtn)
                            break
                        else
                            wait(1)
                        end
                    end
                    return
                else
                    click(lNoBtn)
                end
            end
        else
            wait(1)
        end
    end
end

function SwitchCompose()
end

function BeatBoss()
end

-- ==========  main program ===========
-- pirates = regionFindAll(rMap, "pirate.png")
-- pirateCnt = table.getn(pirates)
-- if pirateCnt > 0 then print("There are " .. pirateCnt .. "pirates.") end
-- if rMap:exists("goldenship.png") then print("Golden Ship!") else print("No Golden Ship.") end

t = Timer()
t:set()

defeatedCnt = 0
timeleft = 0

while(true) do
    if batteryLevel() < 20 and chargerConnected() == false then
        scriptExit()
    end

    if RefreshOverlord() == true then
        timeleft = ChooseOverlord(timeleft)
        defeatedCnt = defeatedCnt + 1
    end

    if defeatedCnt > 7 then
        CollectReward()
        defeatedCnt = 0
    end
end