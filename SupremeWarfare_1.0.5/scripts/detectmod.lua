-----------------------
--Cross Mod Detection--
-----------------------
SWConfig.mod = {}

--Detect DyTechWar
if data.raw["unit"]["adult-berserk-biter"] ~= nil and data.raw["unit"]["adult-queen-spitter"] ~= nil then
	SWConfig.mod.DyTechWar=true
else 
	SWConfig.mod.DyTechWar=false
end

--Detect DyTechMachine
if data.raw["item"]["radar-mk2"] ~= nil and data.raw["technology"]["radar-2"] ~= nil then
	SWConfig.mod.DyTechMachine=true
else 
	SWConfig.mod.DyTechMachine=false
end