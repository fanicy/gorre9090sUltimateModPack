require ("railpictures")
data:extend({
-- Item
  {
    type = "item",
    name = "straight-power-rail",
    icon = "__5dim_trains__/resources/icons/straight-power-rail.png",
    flags = {"goes-to-quickbar"},
    subgroup = "trains-rails",
    order = "c",
    place_result = "straight-power-rail",
    stack_size = 50
  },

--Recipe
    {
    type = "recipe",
    name = "straight-power-rail",
    enabled = "false",
    ingredients = 
	{
		{"straight-rail", 1},
		{"steel-plate", 1},
		{"copper-plate", 1}
	},
    result = "straight-power-rail",
    result_count = 1
  },

--Entity
    {
    type = "rail",
    name = "straight-power-rail",
    icon = "__5dim_trains__/resources/icons/straight-power-rail.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 1, result = "straight-power-rail"},
    max_health = 100,
    corpse = "straight-rail-remnants",
	collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.5, -0.8}, {0.5, 0.8}},
    bending_type = "straight",
    rail_category = "regular",
    pictures = powerrailpictures({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}}),
	order = "z",
  },
})