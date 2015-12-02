if data.raw.item["basic-circuit-board"] then
  bobmods.lib.replace_recipe_item ("electrolyser", "electronic-circuit", "basic-circuit-board")
end

if data.raw.item["steel-pipe"] then
  bobmods.lib.replace_recipe_item ("chemical-furnace", "pipe", "steel-pipe")
  bobmods.lib.replace_recipe_item ("chemical-plant-2", "pipe", "steel-pipe")
end

if data.raw.item["titanium-pipe"] then
  bobmods.lib.replace_recipe_item ("chemical-plant-3", "pipe", "titanium-pipe")
end

if data.raw.item["tungsten-pipe"] then
  bobmods.lib.replace_recipe_item ("electric-chemical-mixing-furnace", "pipe", "tungsten-pipe")
  bobmods.lib.replace_recipe_item ("electric-chemical-mixing-furnace-2", "pipe", "tungsten-pipe")
  bobmods.lib.replace_recipe_item ("chemical-plant-4", "pipe", "tungsten-pipe")
  bobmods.lib.replace_recipe_item ("electrolyser-4", "pipe", "tungsten-pipe")
end

if data.raw.item["stone-pipe"] then
  bobmods.lib.replace_recipe_item ("electrolyser", "pipe", "stone-pipe")
end

if data.raw.item["plastic-pipe"] then
  bobmods.lib.replace_recipe_item ("electrolyser-2", "pipe", "plastic-pipe")
end

if data.raw.item["ceramic-pipe"] then
  bobmods.lib.replace_recipe_item ("electrolyser-3", "pipe", "ceramic-pipe")
end

if data.raw.item["copper-pipe"] then
  bobmods.lib.replace_recipe_item ("air-pump", "pipe", "copper-pipe")
  bobmods.lib.replace_recipe_item ("water-pump", "pipe", "copper-pipe")
  bobmods.lib.replace_recipe_item ("void-pump", "pipe", "copper-pipe")
end

if data.raw.item["bronze-pipe"] then
  bobmods.lib.replace_recipe_item ("air-pump-2", "pipe", "bronze-pipe")
  bobmods.lib.replace_recipe_item ("water-pump-2", "pipe", "bronze-pipe")
end

if data.raw.item["brass-pipe"] then
  bobmods.lib.replace_recipe_item ("air-pump-3", "pipe", "brass-pipe")
  bobmods.lib.replace_recipe_item ("water-pump-3", "pipe", "brass-pipe")
end


