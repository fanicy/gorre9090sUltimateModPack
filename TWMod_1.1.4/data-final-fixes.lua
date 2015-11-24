local MagSize = 500


--Changes the inventory size from 60 to 120
data.raw["player"]["player"].inventory_size = 120

--Changes the player health
data.raw.player.player.max_health=1000

-- Fuel changes
data.raw.item["coal"].fuel_value = "120MJ"
data.raw.item["wood"].fuel_value = "10MJ"
data.raw.item["raw-wood"].fuel_value = "40MJ"

-- Steel axe settings
data.raw["mining-tool"]["steel-axe"].speed = 60
data.raw["mining-tool"]["steel-axe"].durability = 200000

-- Iton axe settings
data.raw["mining-tool"]["iron-axe"].speed = 35
data.raw["mining-tool"]["iron-axe"].durability = 10000


-- Repairpack tweaks
data.raw["repair-tool"]["repair-pack"].durability = 500000
data.raw["repair-tool"]["repair-pack"].speed = 50000

-- Mining speed on drills
data.raw["mining-drill"]["basic-mining-drill"].mining_speed = 6
data.raw["mining-drill"]["burner-mining-drill"].mining_speed = 3

-- Furnace tweaks
data.raw.furnace["electric-furnace"].crafting_speed = 10
data.raw.furnace["steel-furnace"].crafting_speed = 6
data.raw.furnace["stone-furnace"].crafting_speed = 3
--Steel and stone furnace won't work with modules.. yet.
--data.raw.furnace["steel-furnace"].module_slots = 2
--data.raw.furnace["stone-furnace"].module_slots = 1
data.raw.furnace["electric-furnace"].module_slots = 4

--Resource modifiers
data.raw.resource["copper-ore"].autoplace.richness_base = 8000
data.raw.resource["coal"].autoplace.richness_base = 8000
data.raw.resource["iron-ore"].autoplace.richness_base = 8000
data.raw.resource["crude-oil"].autoplace.richness_base = 35000
data.raw.resource["stone"].autoplace.richness_base = 8000

data.raw.resource["copper-ore"].autoplace.richness_multiplier = 15000
data.raw.resource["coal"].autoplace.richness_multiplier = 15000
data.raw.resource["iron-ore"].autoplace.richness_multiplier = 15000
data.raw.resource["crude-oil"].autoplace.richness_multiplier = 50000
data.raw.resource["stone"].autoplace.richness_multiplier = 15000