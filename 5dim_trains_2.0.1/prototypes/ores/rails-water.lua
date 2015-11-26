require ("railpictureswater")
data:extend({
-- Item
  {
    type = "item",
    name = "5d-rail-water",
    icon = "__5dim_trains__/resources/icons/icon_5d_straight-rail_wp1_.png",
    flags = {"goes-to-quickbar"},
    subgroup = "trains-rails",
    order = "e",
    place_result = "5d-rail-water",
    stack_size = 50
  },
	
--Recipe
  {
    type = "recipe",
    name = "5d-rail-water",
    enabled = "false",
    ingredients =
    {
      {"straight-rail", 1}
    },
    result = "5d-rail-water",
    result_count = 1
  },

--Entity
	{
		type = "rail",
		name = "5d-rail-water",
		icon = "__5dim_trains__/resources/icons/icon_5d_straight-rail_wp1_.png",
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 1, result = "5d-rail-water"},
		max_health = 100,
		corpse = "straight-rail-remnants",
		collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
		selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
		bending_type = "straight",
		rail_category = "regular",
		pictures = railpictureswater({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}}),
	collision_mask = {"not-colliding-with-itself"},
	},
})