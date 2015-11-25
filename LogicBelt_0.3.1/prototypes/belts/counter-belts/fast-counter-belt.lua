data:extend(
{ 
	{
		type = "item",
		name = "fast-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/fast-counter-belt.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-belts",
		order = "02[counter-belts]-02[fast]",
		place_result = "fast-counter-transport-belt",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "fast-counter-transport-belt",
		enabled = false,
		ingredients = {
			{"fast-transport-belt", 1},
			{"advanced-circuit", 3}
		},
		result = "fast-counter-transport-belt"
	},
	{
		type = "transport-belt",
		name = "fast-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/fast-counter-belt.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.3, result = "fast-counter-transport-belt"},
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
		  filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
		  priority = "extra-high",
		  width = 40,
		  height = 40,
		  frame_count = 32,
		  direction_count = 12
		},
		belt_horizontal = fast_belt_horizontal, -- specified in transport-belt-pictures.lua
		belt_vertical = fast_belt_vertical,
		ending_top = fast_belt_ending_top,
		ending_bottom = fast_belt_ending_bottom,
		ending_side = fast_belt_ending_side,
		starting_top = fast_belt_starting_top,
		starting_bottom = fast_belt_starting_bottom,
		starting_side = fast_belt_starting_side,
		ending_patch = ending_patch_prototype,
		fast_replaceable_group = "transport-belt",
		speed = 0.0625
	},
})

table.insert(
	data.raw.technology["logistics-2"].effects,
	{
		type = "unlock-recipe",
		recipe = "fast-counter-transport-belt"
	}
)