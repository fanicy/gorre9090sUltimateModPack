require ("railpictureswater")
data:extend({
-- Item
  {
    type = "item",
    name = "5d-rail-water-curve",
    icon = "__5dim_trains__/resources/icons/icon_5d_curved-rail_wp_.png",
    flags = {"goes-to-quickbar"},
    subgroup = "trains-rails",
    order = "f",
    place_result = "5d-rail-water-curve",
    stack_size = 50
  },
  
--Recipe
  {
    type = "recipe",
    name = "5d-rail-water-curve",
    enabled = "false",
    ingredients =
    {
      {"straight-rail", 1}
    },
    result = "5d-rail-water-curve",
    result_count = 1
  },

--Entity
	{
		type = "rail",
		name = "5d-rail-water-curve",
		icon = "__5dim_trains__/resources/icons/icon_5d_curved-rail_wp_.png",
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 1, result = "5d-rail-water-curve"},
		max_health = 100,
		corpse = "curved-rail-remnants",
		collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
		secondary_collision_box = {{-0.85, -2.6}, {0.85, 2.6}},
		selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
		bending_type = "turn",
		rail_category = "regular",
		pictures = railpictureswater({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}}),
		--collision_mask = {"ground-tile"}
	},
})