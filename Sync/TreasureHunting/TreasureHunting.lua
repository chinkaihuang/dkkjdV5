-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ========== Locations ===============

-- ========== Regions =================

-- ========== Constants ===============
-- Areas = {"歐洲", "北非", "南非", "中東", "印度", "大西洋", "北美", "南美", "東南亞", "遠東", "太平洋"}
Areas = {"Europe", "NorthAfrica", "SouthAfrica", "MiddleEast", "India", "Atlantic", "NorthAmerica", "SouthAmerica", "SouthEastAsia", "FarEast", "Pacific"}
EuropeSeas = {"伊比利半島", "地中海", "亞得里亞海", "小亞細亞", "黑海", "法蘭西", "不列顛群島", "北海", "波羅的海", "俄羅斯", "挪威海"}
NorthAfricaSeas = {"馬格里布西部", "馬格里布東部", "埃及", "尼羅河北部", "尼羅河南部", "非洲西岸", "撒哈拉沙漠"}
SouthAfricaSeas = {"剛果河", "非洲南端", "非洲東岸", "馬達加斯加"}
ArabianSeas = {"阿拉伯半島", "中亞", "裏海"}
IndianSeas = {"阿拉伯海", "孟加拉灣", "印度洋"}
AtlanticOcean = {"北大西洋", "南大西洋", "亞速爾群島"}
NorthAmericaSeas = {"北美東海岸", "加勒比海", "墨西哥灣", "加州"}
SouthAmericaSeas = {"巴拿馬地峽", "蓋亞那", "亞馬遜河", "巴西", "拉普拉塔河", "智利", "祕魯"}
SouthEastAsiaSeas = {"大巽他群島", "東南亞島嶼", "南海"}
FarEastSeas = {"華南", "華北", "東海", "日本近海", "朝鮮半島"}
PacificOcean = {"北太平洋", "馬紹爾群島", "南太平洋", "皮特肯群島"}

-- ========== Function ================

-- ========== Main program ============
dialogInit()
addRadioGroup("area", 1)
for i = 1, 11 do
    addRadioButton(Areas[i], i)
end
dialogShow("Choose Area")

-- dialogInit()
-- addRadioGroup("place", 1)
-- i = 1
-- while seaMaps[i] ~= nil do
--     addRadioButton(Areas[i], i)
--     i = i + 1
-- end
-- dialogShow("Choose Place")
