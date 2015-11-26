require ("railpictureswaterenergy")
data:extend({
-- Item
  {
    type = "item",
    name = "5d-curved-power-rail-water",
    icon = "__5dim_trains__/resources/icons/icon_5d_curved-rail_e_.png",
    flags = {"goes-to-quickbar"},
    subgroup = "trains-rails",
    order = "h",
    place_result = "5d-curved-power-rail-water",
    stack_size = 50
  },

--Recipe
  {
    type = "recipe",
    name = "5d-curved-power-rail-water", 
    enabled = "false",
    ingredients = 
	{
		{"curved-rail", 1},
		{"steel-plate", 2},
		{"copper-plate", 2}
	},
    result = "5d-curved-power-rail-water",
    result_count = 1
  },

--Entity
  {
    type = "rail",
    name = "5d-curved-power-rail-water",
    icon = "__5dim_trains__/resources/icons/icon_5d_curved-rail_e_.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 1, result = "5d-curved-power-rail-water"},
    max_health = 200,
    corpse = "curved-rail-remnants",
    collision_box = {{-0.75, -0.65}, {0.75, 1.7}},
    secondary_collision_box = {{-0.85, -2.6}, {0.85, 2.6}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
	--collision_mask = {"ground-tile"},
    bending_type = "turn",
    rail_category = "regular",
    pictures = railpictureswaterenergy({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}}),
	order = "za",
  },
})