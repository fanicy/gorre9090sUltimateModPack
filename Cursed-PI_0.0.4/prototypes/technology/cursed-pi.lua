
local obj = util.table.deepcopy(data.raw["technology"]["steel-processing"])
obj.name = "cursed-basic-automation"
obj.upgrade = true
obj.icon = "__Cursed-PI__/graphics/icons/basic-inserter/cursed-basic-inserter.png"
obj.effects = {}
obj.effects[1] = { type = "unlock-recipe", recipe = "cursed-burner-inserter" }
obj.effects[2] = { type = "unlock-recipe", recipe = "cursed-basic-inserter" }
obj.prerequisites = nil
data.raw[obj.type][obj.name] = obj

local obj = util.table.deepcopy(data.raw["technology"]["automation"])
obj.name = "cursed-automation"
obj.upgrade = true
obj.icon = "__Cursed-PI__/graphics/icons/long-handed-inserter/cursed-long-handed-inserter.png"
obj.effects = {}
obj.effects[2] = { type = "unlock-recipe", recipe = "cursed-long-handed-inserter" }
obj.prerequisites = {"automation"}
data.raw[obj.type][obj.name] = obj

local obj = util.table.deepcopy(data.raw["technology"]["electronics"])
obj.name = "cursed-electronics"
obj.upgrade = true
obj.icon = "__Cursed-PI__/graphics/icons/smart-inserter/cursed-smart-inserter.png"
obj.effects = {}
obj.effects[1] = { type = "unlock-recipe", recipe = "cursed-smart-inserter" }
obj.prerequisites = {"electronics"}
data.raw[obj.type][obj.name] = obj

local obj = util.table.deepcopy(data.raw["technology"]["logistics"])
obj.name = "cursed-logistics"
obj.upgrade = true
obj.icon = "__Cursed-PI__/graphics/icons/fast-inserter/cursed-fast-inserter.png"
obj.effects = {}
obj.effects[1] = { type = "unlock-recipe", recipe = "cursed-fast-inserter" }
obj.prerequisites = {"logistics"}
data.raw[obj.type][obj.name] = obj
