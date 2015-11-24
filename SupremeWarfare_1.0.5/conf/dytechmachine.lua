local SWVar = SWVariables
-------------------------------------------------------------- Prototypes ----------------------------------------------------------------------------
--[[
------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Artillery -----------------------------------------------------------------------------
--MK2 Artillery
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
arty_mk2.recipe.energy_required = 140
arty_mk2.recipe.ingredients = {{"steel-plate", 200}, {"electric-engine-unit", 25}, {"radar-mk2", 2}, {"advanced-circuit", 50}}

--MK3 RapidFire
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
arty_mk3.recipe.ingredients = {{"steel-plate", 200}, {"electric-engine-unit", 50}, {"radar-mk3", 2}, {"processing-unit", 50}}
------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------- Technology -----------------------------------------------------------------------------
--Advanced Rocketry
SWVar.technology.advanced_rocketry = {}
local advanced_rocketry = SWVar.technology.advanced_rocketry
advanced_rocketry.count = 300
advanced_rocketry.ingredients =
{
	{"science-pack-1", 1},
	{"science-pack-2", 1},
	{"science-pack-3", 1}
}
advanced_rocketry.time = 60
advanced_rocketry.prerequisites = {"military-3", "radar-2", "explosive-rocketry"}
]]