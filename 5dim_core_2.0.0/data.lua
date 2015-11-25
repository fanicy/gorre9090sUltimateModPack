require("config")

if dimoresenable == true then
	if bobmods then
		if bobmods.ores then
			if bobmods.ores.tin then
				bobmods.ores.tin.enabled = true
			end
			if bobmods.ores.bauxite then
				bobmods.ores.bauxite.enabled = true
			end
			if bobmods.ores.lead then
				bobmods.ores.lead.enabled = true
			end
			if bobmods.ores.zinc then
				bobmods.ores.zinc.enabled = true
			end
			if bobmods.ores.gold then
				bobmods.ores.gold.enabled = true
			end
			if bobmods.ores.gems then
				bobmods.ores.gems.enabled = false
			end
			if bobmods.ores.nickel then
				bobmods.ores.nickel.enabled = false
			end
		end
	end
end

--Basic plates
if dimoresenable == true then
require("prototypes.tin")
require("prototypes.bauxite")
require("prototypes.gold")
require("prototypes.lead")
require("prototypes.zinc")
end
--Item
if stackchanges == true then
require("prototypes.stackchanges")
end
if inventorychanges == true then
require("prototypes.inventorychanges")
end
--Item group
require("prototypes.item-groups-automatization")
require("prototypes.item-groups-energy")
require("prototypes.item-groups-logistic")
require("prototypes.item-groups-mining")
require("prototypes.item-groups-module")
require("prototypes.item-groups-transport")
require("prototypes.item-groups-trains")
require("prototypes.item-groups-decorative")