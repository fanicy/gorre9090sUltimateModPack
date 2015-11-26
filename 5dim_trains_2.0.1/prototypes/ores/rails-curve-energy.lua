require ("railpictures")
data:extend({
-- Item
  {
    type = "item",
    name = "curved-power-rail",
    icon = "__5dim_trains__/resources/icons/curved-power-rail.png",
    flags = {"goes-to-quickbar"},
    subgroup = "trains-rails",
    order = "d",
    place_result = "curved-power-rail",
    stack_size = 50
  },

--Recipe
  {
    type = "recipe",
    name = "curved-power-rail", 
    enabled = "false",
    ingredients = 
	{
		{"curved-rail", 1},
		{"steel-plate", 2},
		{"copper-plate", 2}
	},
    result = "curved-power-rail",
    result_count = 1
  },

--Entity
  {
    type = "rail",
    name = "curved-power-rail",
    icon = "__base__/graphics/icons/curved-rail.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 1, result = "curved-power-rail"},
    max_health = 200,
    corpse = "curved-rail-remnants",
    collision_box = {{-0.75, -0.65}, {0.75, 1.7}},
    secondary_collision_box = {{-0.85, -2.6}, {0.85, 2.6}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    bending_type = "turn",
    rail_category = "regular",
    pictures = powerrailpictures({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}}),
	order = "za",
  },
})