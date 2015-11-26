require ("railpictureswaterenergy")
data:extend({
-- Item
  {
    type = "item",
    name = "5d-power-rail-water",
    icon = "__5dim_trains__/resources/icons/icon_5d_straight-rail_e_.png",
    flags = {"goes-to-quickbar"},
    subgroup = "trains-rails",
    order = "g",
    place_result = "5d-power-rail-water",
    stack_size = 50
  },

--Recipe
    {
    type = "recipe",
    name = "5d-power-rail-water",
    enabled = "false",
    ingredients = 
	{
		{"straight-rail", 1},
		{"steel-plate", 1},
		{"copper-plate", 1}
	},
    result = "5d-power-rail-water",
    result_count = 1
  },

--Entity
    {
    type = "straight-rail" ,
    name = "5d-power-rail-water",
    icon = "__5dim_trains__/resources/icons/icon_5d_straight-rail_e_.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 1, result = "5d-power-rail-water"},
    max_health = 100,
    corpse = "straight-rail-remnants",
	collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.5, -0.8}, {0.5, 0.8}},
	collision_mask = {"not-colliding-with-itself"},
    bending_type = "straight",
    rail_category = "regular",
    pictures = railpictureswaterenergy({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}}),
	order = "z",
  },
})