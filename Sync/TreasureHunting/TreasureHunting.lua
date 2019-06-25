-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ========== Locations ===============

-- ========== Regions =================

-- ========== Constants ===============
Areas = {"歐洲", "北非", "南非", "中東", "印度", "大西洋", "北美", "南美", "東南亞", "遠東", "太平洋"}
Maps = {
    {{"伊比利半島", 4}, {"地中海", 4}, {"亞得里亞海", 4}, {"小亞細亞", 4}, {"黑海", 4}, {"法蘭西", 4}, {"不列顛群島", 4}, {"北海", 4}, {"波羅的海", 4}, {"俄羅斯", 4}, {"挪威海", 4}},
    {"馬格里布西部", "馬格里布東部", "埃及", "尼羅河北部", "尼羅河南部", "非洲西岸", "撒哈拉沙漠"},
    {"剛果河", "非洲南端", "非洲東岸", "馬達加斯加"},
    {"阿拉伯半島", "中亞", "裏海"},
    {"阿拉伯海", "孟加拉灣", "印度洋"},
    {"北大西洋", "南大西洋", "亞速爾群島"},
    {"北美東海岸", "加勒比海", "墨西哥灣", "加州"},
    {"巴拿馬地峽", "蓋亞那", "亞馬遜河", "巴西", "拉普拉塔河", "智利", "祕魯"},
    {"大巽他群島", "東南亞島嶼", "南海"},
    {"華南", "華北", "東海", "日本近海", "朝鮮半島"},
    {"北太平洋", "馬紹爾群島", "南太平洋", "皮特肯群島"}
}

testarray = {{{1, 0}, {2, 0}},
             {{3, 0}, {4, 0}, {5, 0}},
             {{6, 0}, {7, 0}},
             {{1, 0}, {2, 0}},
             {{3, 0}, {4, 0}, {5, 0}},
             {{6, 0}, {7, 0}}}

-- ========== Function ================

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
addRadioGroup("version", 1)
for i = 1, Maps[area][place][2] do
    addRadioButton(tostring(i), i)
end
dialogShow("編號")

-- toast("array[5][3][1] is ".. testarray[5][3][1])