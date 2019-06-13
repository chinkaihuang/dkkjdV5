-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ==========  locations ==============
lAddAp = Location(266, 240)
lInvestBtn = Location(550, 244)
lConfirmBtn = Location(264, 214)
lReadyCheck = Location(322, 148)
lAddBtn = Location(482, 218)
lStopBtn = Location(552, 218)
lFinishBtn = Location(518, 298)
lCheckBtn = Location(318, 222)
lCardBack = Location(514, 172)

-- ==========  regions ================
rAPCheck = Region(201, 114, 223, 40)
rCard1 = Region(148, 145, 35, 53)
rCard2 = Region(234, 145, 35, 53)
rCard3 = Region(320, 145, 35, 53)
rCard4 = Region(500, 145, 35, 53)
rResult1 = Region(99, 220, 36, 41)
rResult2 = Region(188, 220, 36, 41)
rResult3 = Region(273, 220, 36, 41)
rStopBtn = Region(538, 212, 27, 16)
rFinishBtn = Region(500, 292, 39, 15)
rTotal = Region(388, 238, 60, 19)

-- ==========  constants ==============
BIGR = 177
BIGG = 6
BIGB = 4
SMALLR = 23
SMALLG = 103
SMALLB = 173

-- ========== Function ================
function CardOCR(card)
    local v
    local r = true

    if card == 1 then
    v, r = numberOCRNoFindException(rCard1, "card")
    elseif card == 2 then
    v, r = numberOCRNoFindException(rCard2, "card")
    elseif card == 3 then
    v, r = numberOCRNoFindException(rCard3, "card")
    else
    v, r = numberOCRNoFindException(rCard4, "card")
    end

    return v, r
end

function SumOCR(reg)
    local v
    local r = true

    v, r = numberOCRNoFindException(reg, "sum")

    return v, r
end

function Largest(a, b, c)
    if a > b then
        if a > c then
            return 1, a
        else
            return 3, c
        end
    else
        if b > c then
            return 2, b
        else
            return 3, c
        end
    end
end

function Smallest(a, b, c)
    if a < b then
        if a < c then
            return 1, a
        else
            return 3, c
        end
    else
        if b < c then
            return 2, b
        else
            return 3, c
        end
    end
end

function EndRound()
    click(lStopBtn)

    while(rStopBtn:waitVanish("stop.png", 1) == false) do
        click(lStopBtn)
    end

    if rTotal:exists("total.png", 10) then
        wait(0.5)
        click(lFinishBtn)

        while(rFinishBtn:waitVanish("finish.png", 1) == false) do
            click(lFinishBtn)
        end
    end
end

-- ==========  main program ===========
-- v, r = SumOCR(rResult1)
-- if r == true then toast("value A " .. v) end
-- v, r = SumOCR(rResult2)
-- if r == true then toast("value B " .. v) end
-- v, r = SumOCR(rResult3)
-- if r == true then toast("value C " .. v) end
while(true) do
    click(lInvestBtn)

    if rAPCheck:exists("noap.png", 1) then
    click(lAddAp)
    wait(2)
    click(lInvestBtn)
    end

    wait(0.2)
    click(lConfirmBtn)

    while(true) do
        r, g, b = getColor(lReadyCheck)
        if r == 255 and g == 255 and b == 255 then
            break
        else wait(1)
        end
    end

    card1, res = CardOCR(1)
    card2, res = CardOCR(2)
    card3, res = CardOCR(3)
    card4, res = CardOCR(4)
    if res ~= true then
        if card1 ~= 0 and card2 ~= 0 and card3 ~= 0 then
            largest, val = Largest(card1, card2, card3)
            if val < 5 then
                smallest, val = Smallest(card1, card2, card3)
                if smallest == 1 then
                    click(rCard1)
                elseif smallest == 2 then
                    click(rCard2)
                else
                    click(rCard3)
                end
                click(lAddBtn)
                wait(0.5)
            else
                if largest == 1 then
                    click(rCard1)
                elseif largest == 2 then
                    click(rCard2)
                else
                    click(rCard3)
                end
            end
        elseif card1 == 0 and card2 == 0 and card3 == 0 then -- zero
            click(rCard3)
            click(lAddBtn)
            wait(1)
            sum, res = SumOCR(rResult3)
            if res == true and sum < 4 then
                click(lAddBtn)
                wait(1)
                sum, res = SumOCR(rResult3)
            end
           if res == true and sum < 4 then
                click(lAddBtn)
                wait(1)
                sum, res = SumOCR(rResult3)
            end
          if res == true and sum < 4 then
                click(lAddBtn)
                wait(0.5)
            end
        else
            if card1 == 0 then
                click(rCard1)
            elseif card2 == 0 then
                click(rCard2)
            elseif card3 == 0 then
                click(rCard3)
            end
            click(lAddBtn)
            wait(1)
            if card1 == 0 then
                val, res = SumOCR(rResult1)
            elseif card2 == 0 then
                val, res = SumOCR(rResult2)
            elseif card3 == 0 then
                val, res = SumOCR(rResult3)
            end
            if res == true and val < 4 then
                click(lAddBtn)
                wait(0.5)
            end
        end
    else -- foresee
        complement = 9 - card4
        if card1 == complement then
            click(rCard1)
            click(lAddBtn)
        elseif card2 == complement then
            click(rCard2)
            click(lAddBtn)
        elseif card3 == complement then
            click(rCard3)
            click(lAddBtn)
        else
            largest, vL = Largest(card1, card2, card3)

            if card1 > complement and card2 > complement and card3 > complement then
                if largest == 1 then
                    click(rCard1)
                elseif largest == 2 then
                    click(rCard2)
                else
                    click(rCard3)
                end
            else
                plus1 = card1 + card4
                if plus1 > 8 then
                    plus1 = 0
                end
                plus2 = card2 + card4
                if plus2 > 8 then
                    plus2 = 0
                end
                plus3 = card3 + card4
                if plus3 > 8 then
                    plus3 = 0
                end

                largest, vL = Largest(plus1, plus2, plus3)

                if largest == 1 then
                    click(rCard1)
                elseif largest == 2 then
                    click(rCard2)
                else
                    click(rCard3)
                end
                click(lAddBtn)
                wait(1)
                
                if largest == 1 then
                    sum, res = SumOCR(rResult1)
                elseif largest == 2 then
                    sum, res = SumOCR(rResult2)
                else
                    sum, res = SumOCR(rResult3)
                end

                card4, res = CardOCR(4)
                if res == true and card4 + sum < 10 then
                    click(lAddBtn)
                    wait(0.5)
                end
            end
        end
    end

    EndRound()

    wait(1)
    click(lCheckBtn)
    wait(0.2)
    click(lCheckBtn)
    wait(0.5)
end