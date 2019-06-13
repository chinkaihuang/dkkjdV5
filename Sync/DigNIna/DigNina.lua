-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ==========  locations ==============
lDigBtn = Location(522, 64)
lLayer3 = Location(300, 200)
lAddAp = Location(266, 240)
lConfirmBtn = Location(264, 200)
lsDigPts = {Location(362, 80), Location(398, 80), Location(434, 80), Location(470, 80),
            Location(506, 80), Location(542, 80), Location(524, 116), Location(506, 152),
            Location(486, 186), Location(506, 224), Location(524, 258), Location(542, 296),
            Location(506, 296), Location(470, 296), Location(434, 296), Location(398, 296),
            Location(362, 296), Location(378, 258), Location(398, 224), Location(414, 186),
            Location(398, 152), Location(378, 116)}
            
-- ==========  regions ================
rRuin = Region(336, 58, 230, 258)
rLayers = Region(201, 114, 223, 107)
rNina = Region(153, 120, 113, 129)

-- ==========  constants ==============
SPOTDIST = 36

-- ==========  main program ===========
-- print(_VERSION)
click(lDigBtn)

rLayers:existsClick("layer3.png", 8)
if rLayers:exists("noap.png", 1) then
    click(lAddAp)
    wait(2)
    click(lDigBtn)
    rLayers:existsClick("layer3.png", 8)
end
rLayers:existsClick("ok.png", 5)

if rNina:exists("nina.png", 10) then
    continueClick(lConfirmBtn, 2)
end

wait(3)

clicks = 21
index = 0
if rRuin:exists("digflag.png", 1) then
    startloc = rRuin:getLastMatch():getCenter()
    print("start at x=" .. startloc:getX() .. " ,y=" .. startloc:getY())

    if startloc:getY() == 80 then
        for i = 1, 6 do
            if lsDigPts[i]:getX() == startloc:getX() then
                index = i
                break
            end
        end
    elseif startloc:getY() == 296 then
        for i = 12, 17 do
            if lsDigPts[i]:getX() == startloc:getX() then
                index = i
                break
            end
        end
    else
        if startloc:getY() == 116 then
            if startloc:getX() == 378 then index = 22 else index = 7 end
        elseif startloc:getY() == 152 then
            if startloc:getX() == 398 then index = 21 else index = 8 end
        elseif startloc:getY() == 186 then
            if startloc:getX() == 414 then index = 20 else index = 9 end
        elseif startloc:getY() == 224 then
            if startloc:getX() == 398 then index = 19 else index = 10 end
        elseif startloc:getY() == 258 then
            if startloc:getX() == 378 then index = 18 else index = 11 end
        end
    end
else scriptExit("fail") end

if index > 6 and index < 12 then
    currpos = startloc
    while (currpos:getX() ~= lsDigPts[index]:getX()) do
        longClick(currpos, 0.3)
        clicks = clicks - 1
        currpos = Location(currpos:getX() + SPOTDIST, currpos:getY())
        wait(1.2)
    end
end

for i = clicks, 1, -1 do
    longClick(lsDigPts[index], 0.3)
    if index == 22 then index = 1 else index = index + 1 end
    wait(1.2)
end

click(lConfirmBtn)

wait(2)