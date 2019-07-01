-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ========== Locations ===============
lSailPlan = Location(580, 64)
lSetOut = Location(540, 320)
lSetOutConfirm = Location(264, 206)
lParkingConfirm = Location(318, 200)

-- ========== Regions =================

-- ========== Constants ===============
Areas = {"歐洲", "北非", "南非", "中東", "印度", "大西洋", "北美", "南美", "東南亞", "遠東", "太平洋"}
Maps = {
    {{"伊比利半島", 4}, {"地中海", 4}, {"亞得里亞海", 3}, {"小亞細亞", 4}, {"黑海", 5}, {"法蘭西", 3}, {"不列顛群島", 3}, {"北海", 3}, {"波羅的海", 4}, {"俄羅斯", 3}, {"挪威海", 1}},
    {{"馬格里布西部", 3}, {"馬格里布東部", 4}, {"埃及", 4}, {"尼羅河北部", 2}, {"尼羅河南部", 2}, {"非洲西岸", 2}, {"撒哈拉沙漠", 3}},
    {{"剛果河", 2}, {"非洲南端", 2}, {"非洲東岸", 2}, {"馬達加斯加", 2}},
    {{"阿拉伯半島", 2}, {"中亞", 2}, {"裏海", 2}},
    {{"阿拉伯海", 2}, {"孟加拉灣", 3}, {"印度洋", 2}},
    {{"北大西洋", 2}, {"南大西洋", 1}, {"亞速爾群島", 1}},
    {{"北美東海岸", 1}, {"加勒比海", 2}, {"墨西哥灣", 4}, {"加州", 1}},
    {{"巴拿馬地峽", 1}, {"蓋亞那", 2}, {"亞馬遜河", 2}, {"巴西", 1}, {"拉普拉塔河", 1}, {"智利", 1}, {"祕魯", 2}},
    {{"大巽他群島", 1}, {"東南亞島嶼", 1}, {"南海", 2}},
    {{"華南", 2}, {"華北", 2}, {"東海", 2}, {"日本近海", 2}, {"朝鮮半島", 1}},
    {{"北太平洋", 1}, {"馬紹爾群島", 1}, {"南太平洋", 1}, {"皮特肯群島", 1}}
}
Coordinates = {
    -- 歐洲
    {
        -- 伊比利半島
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(200, 95), Location(330, 150), Location(385, 200)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 地中海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(333, 136), Location(213, 182), Location(222, 238)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 亞得里亞海
        {{Location(175, 122), Location(250, 177), Location(273, 200)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 小亞細亞
        {{Location(247, 126), Location(310, 123), Location(255, 190)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 黑海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(226, 181), Location(226, 215), Location(362, 218)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 法蘭西
        {{Location(96, 108), Location(86, 180), Location(250, 214)},
         {Location(96, 108), Location(86, 180), Location(250, 214)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 不列顛群島
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(116, 89), Location(375, 80), Location(131, 247)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 北海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(88, 101), Location(101, 155), Location(406, 178)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 波羅的海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 俄羅斯
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 挪威海
        {{Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 北非
    {
        -- 馬格里布西部
        {{Location(211, 114), Location(121, 133), Location(111, 199)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 馬格里布東部
        {{Location(139, 121), Location(341, 126), Location(352, 175)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 埃及
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(260, 104), Location(226, 125), Location(181, 184)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 尼羅河北部
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 尼羅河南部
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 非洲西岸
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 撒哈拉沙漠
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 南非
    {
        -- 剛果河
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 非洲南端
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 非洲東岸
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 馬達加斯加
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 中東
    {
        -- 阿拉伯半島
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 中亞
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 裏海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 印度
    {
        -- 阿拉伯海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 孟加拉灣
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 印度洋
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 大西洋
    {
        -- 北大西洋
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 南大西洋
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 亞速爾群島
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 北美
    {
        -- 北美東海岸
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 加勒比海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 墨西哥灣
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 加州
        {{Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 南美
    {
        -- 巴拿馬地峽
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 蓋亞那
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 亞馬遜河
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 巴西
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 拉普拉塔河
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 智利
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 祕魯
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 東南亞
    {
        -- 大巽他群島
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 東南亞島嶼
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 南海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 遠東
    {
        -- 華南
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 華北
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 東海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 日本近海
        {{Location(0, 0), Location(0, 0), Location(0, 0)},
         {Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 朝鮮半島
        {{Location(0, 0), Location(0, 0), Location(0, 0)}}
    },
    -- 太平洋
    {
        -- 北太平洋
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 馬紹爾群島
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 南太平洋
        {{Location(0, 0), Location(0, 0), Location(0, 0)}},
        -- 皮特肯群島
        {{Location(0, 0), Location(0, 0), Location(0, 0)}}
    }
}

colorNationalShip = {154, 25, 25}

-- ========== Function ================
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
addRadioGroup("area", 1)
for i = 1, 11 do
    addRadioButton(Areas[i], i)
end
dialogShow("選擇海域")

dialogInit()
addRadioGroup("place", 1)
i = 1
while Maps[area][i] ~= nil do
    addRadioButton(Maps[area][i][1], i)
    i = i + 1
end
dialogShow("選擇海圖")

dialogInit()
addRadioGroup("ver", 1)
for i = 1, Maps[area][place][2] do
    addRadioButton(tostring(i), i)
end
dialogShow("編號")

-- go to map
if CheckPointColor(lSailPlan, 239, 218, 179) ~= true then
    click(lSailPlan)
    wait(3)
end

-- check every point
lTreasure = nil
i = 1
while Coordinates[area][place][ver][i] ~= nil and lTreasure == nil do
    repeat
        if CheckPointColor(Coordinates[area][place][ver][i], 0, 0, 0) then
            i = i + 1
            break
        elseif CheckPointColor(Coordinates[area][place][ver][i], colorNationalShip[1], colorNationalShip[2], colorNationalShip[3]) then
            i = i + 1
            break
        else
            lTreasure = Coordinates[area][place][ver][i]
        end
    until true
end

if lTreasure == nil then
    errExit("Cannot find missed point.")
end

-- set out
click(lTreasure:offset(0, -14))
wait(2)
click(lSetOut)
wait(1)
click(lSetOutConfirm)
repeat
    wait(1)
until CheckPointColor(lParkingConfirm, 117, 97, 87)
click(lParkingConfirm)

-- Marine salvage

-- Check result
