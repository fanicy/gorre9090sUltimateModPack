data:extend(
{ 
	{
		type = "item",
		name = "purple-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/purple-counter-belt.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-belts",
		order = "02[counter-belts]-07[purple]",
		place_result = "purple-counter-transport-belt",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "purple-counter-transport-belt",
		enabled = false,
		ingredients = {
			{"purple-transport-belt", 1},
			{"processing-unit", 5},
			{"speed-module", 1}
		},
		result = "purple-counter-transport-belt"
	},
	{
		type = "transport-belt",
		name = "purple-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/purple-counter-belt.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.3, result = "purple-counter-transport-belt"},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 50
		  }
		},
		collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		collision_mask = { "item-layer"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		working_sound =
		{
		  sound =
		  {
			filename = "__base__/sound/express-transport-belt.ogg",
			volume = 0.4
		  },
		  max_sounds_per_type = 3
		},
		animation_speed_coefficient = 32,
		animations =
		{
		  filename = "__boblogistics__/graphics/entity/transport-belt/purple-transport-belt.png",
		  priority = "extra-high",
		  width = 40,
		  height = 40,
		  frame_count = 32,
		  direction_count = 12
		},
		belt_horizontal = purple_belt_horizontal,
		belt_vertical = purple_belt_vertical,
		ending_top = purple_belt_ending_top,
		ending_bottom = purple_belt_ending_bottom,
		ending_side = purple_belt_ending_side,
		starting_top = purple_belt_starting_top,
		starting_bottom = purple_belt_starting_bottom,
		starting_side = purple_belt_starting_side,
		ending_patch = ending_patch_prototype,
		fast_replaceable_group = "transport-belt",
		speed = 0.15625,
	},
})

table.insert(
	data.raw.technology["bob-logistics-5"].effects,
	{
		type = "unlock-recipe",
		recipe = "purple-counter-transport-belt"
	}
)