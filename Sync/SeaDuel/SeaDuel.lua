-- ========== Settings ================
setImmersiveMode(true)
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)

-- ==========  regions ================
menuR = Region(266, 41, 328, 25)
evR = Region(404, 276, 116, 18)

-- ==========  functions ==============
function SwitchGroup( bestGroup )
    grouping = menuR.find("grouping.png")
end

-- ==========  main program ===========
evs = regionFindAll(Region(471, 230, 117, 21), "evpoint.png")
if (table.getn(evs) > 0)
then Region().click(562, 50, 30, 31) end