SWConfig = {}
SWVariables = {}
require "config"
require "scripts.detectmod" --Detect supported Mods

---------------------------------------------------------------
------------------------- Load Config -------------------------
---------------------------------------------------------------
require "conf.vanilla"
--Mod: DyTechWar
if SWConfig.mod.DyTechWar and SWConfig.DyTech then
	require "conf.dytechwar"
	--Mod: DyTechMachine
	if SWConfig.mod.DyTechMachine then
		require "conf.dytechmachine"
	end
end
--Custom
if SWConfig.Custom then
	require "conf.!custom"
end
---------------------------------------------------------------



---------------------------------------------------------------
----------------------- Load Prototypes -----------------------
---------------------------------------------------------------
--SupremeOres
if SWConfig.SupremeOres then
	-- METALLURGY
	require("prototypes.metallurgy.item")
	require("prototypes.metallurgy.recipe")

	-- ORES
	require("prototypes.resources.metallurgy-ore-ilmenit")

	-- Autoplace Control
	require("prototypes.autoplace-controls")

	-- Noise Layers
	require("prototypes.tile.noise-layers")
end

-- Items Groups
require("prototypes.item-group.core")

-- Artillery
require("prototypes.artillery.artillery-item")
require("prototypes.artillery.artillery-recipe")
require("prototypes.artillery.artillery-entity")
require("prototypes.technology.artillery-technology")

-- Projectiles
require("prototypes.artillery.projectiles-item")
require("prototypes.artillery.projectiles-recipe")
require("prototypes.artillery.projectiles-entity")
require("prototypes.artillery.explosion-entity")

-- Extra Loot
if SWConfig.ExtraLoot then
	require("prototypes.extra-loot.item")
	require("prototypes.extra-loot.recipe")
	require("prototypes.extra-loot")
	require("prototypes.item-group.extra-loot")
end

--Base Override
if SWConfig.BaseOverride then
	require("prototypes.base-override")
end
---------------------------------------------------------------