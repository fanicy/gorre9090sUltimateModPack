data:extend(
{ 
	{
		type = "item",
		name = "extreme-logic-transport-belt",
		icon = "__LogicBelt__/graphics/belts/logic-belt/extreme-logic-belt.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-belts",
		order = "01[logic-belts]-05[extreme]",
		place_result = "extreme-logic-transport-belt",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "extreme-logic-transport-belt",
		enabled = false,
		ingredients = {
			{"extreme-transport-belt", 1},
			{"logic-diamond-processor", 3}
		},
		result = "extreme-logic-transport-belt"
	},
	{
		type = "transport-belt",
		name = "extreme-logic-transport-belt",
		icon = "__LogicBelt__/graphics/belts/logic-belt/extreme-logic-belt.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.3, result = "extreme-logic-transport-belt"},
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
			filename = "__base__/sound/basic-transport-belt.ogg",
			volume = 0.4
		  },
		  max_sounds_per_type = 3
		},
		animation_speed_coefficient = 32,
		animations =
		{
		  filename = "__MAIN-DyTech-Machine__/graphics/transport-belts/extreme-transport-belt.png",
		  priority = "extra-high",
		  width = 40,
		  height = 40,
		  frame_count = 32,
		  direction_count = 12
		},
		belt_horizontal = extreme_belt_horizontal,
		belt_vertical = extreme_belt_vertical,
		ending_top = extreme_belt_ending_top,
		ending_bottom = extreme_belt_ending_bottom,
		ending_side = extreme_belt_ending_side,
		starting_top = extreme_belt_starting_top,
		starting_bottom = extreme_belt_starting_bottom,
		starting_side = extreme_belt_starting_side,
		ending_patch = ending_patch_prototype,
		fast_replaceable_group = "transport-belt",
		speed = 0.18
	  },
})

table.insert(
	data.raw.technology["logistics-5"].effects,
	{
		type = "unlock-recipe",
		recipe = "extreme-logic-transport-belt"
	}
)