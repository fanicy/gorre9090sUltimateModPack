--[[
Hey there! 
Thanks for taking a interest in changing the balance of Supreme Warfare.

How does it work?
Uncomment (delete "--[[" and "]]") the section you want to change
and adjust the desired value
]]

local SWVar = SWVariables
-------------------------------------------------------------- Prototypes ----------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Artillery -----------------------------------------------------------------------------
--MK1 Rocket Launcher
--[[
SWVar.arty_mk1 = {}
local arty_mk1 = SWVar.arty_mk1
arty_mk1.health = 205
arty_mk1.resistances = 
{
	{
		type = "explosion",
		percent = 10
	}
}
arty_mk1.minable = {mining_time = 0.5, result = "sb-artillery-mk1"}
arty_mk1.stack_size = 10
arty_mk1.recipe = {}
arty_mk1.recipe.energy_required = 120
arty_mk1.recipe.ingredients = {{"steel-plate", 50}, {"electric-engine-unit", 25}, {"radar", 2}, {"electronic-circuit", 25}}
]]

--MK2 Artillery
--[[
SWVar.arty_mk2 = {}
local arty_mk2 = SWVar.arty_mk2
arty_mk2.health = 500
arty_mk2.resistances = 
{
	{
		type = "explosion",
		percent = 10
	}
}
arty_mk2.minable = {mining_time = 1.5, result = "sb-artillery-mk2"}
arty_mk2.stack_size = 10
arty_mk2.recipe = {}
arty_mk2.recipe.energy_required = 180
arty_mk2.recipe.ingredients = {{"steel-plate", 100}, {"electric-engine-unit", 25}, {"radar", 2}, {"advanced-circuit", 25}}
]]

--MK3 RapidFire
--[[
SWVar.arty_mk3 = {}
local arty_mk3 = SWVar.arty_mk3
arty_mk3.health = 2000
arty_mk3.resistances = 
{
	{
		type = "explosion",
		percent = 10
	}
}
arty_mk3.minable = {mining_time = 3.5, result = "sb-artillery-mk3"}
arty_mk3.stack_size = 10
arty_mk3.recipe = {}
arty_mk3.recipe.energy_required = 240
arty_mk3.recipe.ingredients = {{"steel-plate", 200}, {"electric-engine-unit", 50}, {"radar", 2}, {"processing-unit", 25}}
]]

--MK4 BigBang
--[[
SWVar.arty_mk4 = {}
local arty_mk4 = SWVar.arty_mk4
arty_mk4.health = 2500
arty_mk4.resistances = 
{
	{
		type = "explosion",
		percent = 10
	}
}
arty_mk4.minable = {mining_time = 10, result = "sb-artillery-mk4"}
arty_mk4.stack_size = 5
arty_mk4.recipe = {}
arty_mk4.recipe.energy_required = 1800
arty_mk4.recipe.ingredients = {{"fusion-reactor-equipment", 5}, {"steel-plate", 200}, {"battery-mk2-equipment", 10}, {"processing-unit", 100}}
]]
------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ Projectiles -----------------------------------------------------------------------------
--HE Rocket MK1
--[[
SWVar.heshell_mk1 = {}
local heshell_mk1 = SWVar.heshell_mk1
heshell_mk1.stack_size = 100
heshell_mk1.acceleration = 0.1
heshell_mk1.perimeter = 2
heshell_mk1.damage = 
{
	type = "damage",
	damage = {amount = 15, type = "explosion"}
}
heshell_mk1.recipe = {}
heshell_mk1.recipe.energy_required = 5
heshell_mk1.recipe.ingredients = {{"electronic-circuit", 1}, {"rocket", 1}}
]]

--HE Shell MK2
--[[
SWVar.heshell_mk2 = {}
local heshell_mk2 = SWVar.heshell_mk2
heshell_mk2.stack_size = 100
heshell_mk2.acceleration = 0.001
heshell_mk2.perimeter = 4
heshell_mk2.damage = 
{
	type = "damage",
	damage = {amount = 30, type = "explosion"}
}
heshell_mk2.recipe = {}
heshell_mk2.recipe.energy_required = 5
heshell_mk2.recipe.ingredients = {{"electronic-circuit", 1}, {"rocket", 1}}
]]

--HE Shell MK3
--[[
SWVar.heshell_mk3 = {}
local heshell_mk3 = SWVar.heshell_mk3
heshell_mk3.stack_size = 200
heshell_mk3.acceleration = 0
heshell_mk3.perimeter = 5
heshell_mk3.damage = 
{
	type = "damage",
	damage = {amount = 30, type = "explosion"}
}
heshell_mk3.recipe = {}
heshell_mk3.recipe.energy_required = 5
heshell_mk3.recipe.ingredients = {{"advanced-circuit", 1}, {"explosive-rocket", 1}}
]]

--HE Shell MK4
--[[
SWVar.heshell_mk4 = {}
local heshell_mk4 = SWVar.heshell_mk4
heshell_mk4.stack_size = 50
heshell_mk4.acceleration = 0.0005
heshell_mk4.perimeter = 30
heshell_mk4.damage = 
{
	type = "damage",
	damage = {amount = 340, type = "explosion"}
}
heshell_mk4.recipe = {}
heshell_mk4.recipe.energy_required = 5
heshell_mk4.recipe.ingredients = {{"processing-unit", 5},{"electric-engine-unit", 5}, {"explosive-rocket", 5}}
]]

--Target Capsule
--[[
SWVar.target_capsule = {}
local target_capsule = SWVar.target_capsule
target_capsule.cooldown = 60*20
target_capsule.range = 25
target_capsule.stack_size = 100
target_capsule.acceleration = 0.005
target_capsule.recipe = {}
target_capsule.recipe.energy_required = 5
target_capsule.recipe.ingredients = {{"processing-unit", 10},{"battery",25}, {"basic-beacon", 1}}
]]
------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------- Technology -----------------------------------------------------------------------------
--SWVar.technology = {}
--Advanced Rocketry
--[[
SWVar.technology.advanced_rocketry = {}
local advanced_rocketry = SWVar.technology.advanced_rocketry
advanced_rocketry.count = 300
advanced_rocketry.ingredients =
{
	{"science-pack-1", 1},
	{"science-pack-2", 1},
	{"science-pack-3", 1}
}
advanced_rocketry.time = 30
advanced_rocketry.prerequisites = {"military-3", "explosive-rocketry"}
]]

--Artillery
--[[
SWVar.technology.artillery = {}
local tech_artillery = SWVar.technology.artillery
tech_artillery.count = 450
tech_artillery.ingredients =
{
	{"science-pack-1", 1},
	{"science-pack-2", 1},
	{"science-pack-3", 1}
}
tech_artillery.time = 30
tech_artillery.prerequisites = {"advanced-rocketry"}
]]

--Advanced Artillery
--[[
SWVar.technology.advanced_artillery = {}
local advanced_artillery = SWVar.technology.advanced_artillery
advanced_artillery.count = 600
advanced_artillery.ingredients =
{
	{"science-pack-1", 1},
	{"science-pack-2", 1},
	{"science-pack-3", 1}
}
advanced_artillery.time = 30
advanced_artillery.prerequisites = {"artillery"}
]]

--Supreme Warfare
--[[
SWVar.technology.supreme_warfare = {}
local supreme_warfare = SWVar.technology.supreme_warfare
supreme_warfare.count = 300
supreme_warfare.ingredients =
{
	{"science-pack-1", 3},
	{"science-pack-2", 3},
	{"science-pack-3", 3},
	{"alien-science-pack", 1}
}
supreme_warfare.time = 60
supreme_warfare.prerequisites = {"advanced-artillery"}
]]

--Supreme Artillery
--[[
SWVar.technology.supreme_artillery = {}
local supreme_artillery = SWVar.technology.supreme_artillery
supreme_artillery.count = 150
supreme_artillery.ingredients =
{
	{"science-pack-1", 3},
	{"science-pack-2", 3},
	{"science-pack-3", 3},
	{"alien-science-pack", 1}
}
supreme_artillery.time = 60
supreme_artillery.prerequisites = {"supreme-warfare"}
]]