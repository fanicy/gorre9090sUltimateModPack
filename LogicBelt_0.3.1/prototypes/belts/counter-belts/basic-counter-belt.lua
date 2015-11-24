data:extend(
{ 
	{
		type = "item",
		name = "basic-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/basic-counter-belt.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-belts",
		order = "02[counter-belts]-01[basic]",
		place_result = "basic-counter-transport-belt",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "basic-counter-transport-belt",
		enabled = false,
		ingredients = {
			{"basic-transport-belt", 1},
			{"electronic-circuit", 3}
		},
		result = "basic-counter-transport-belt"
	},
	{
		type = "transport-belt",
		name = "basic-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/basic-counter-belt.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.3, result = "basic-counter-transport-belt"},
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
		  filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
		  priority = "extra-high",
		  width = 40,
		  height = 40,
		  frame_count = 16,
		  direction_count = 12
		},
		belt_horizontal = basic_belt_horizontal, -- specified in transport-belt-pictures.lua
		belt_vertical = basic_belt_vertical,
		ending_top = basic_belt_ending_top,
		ending_bottom = basic_belt_ending_bottom,
		ending_side = basic_belt_ending_side,
		starting_top = basic_belt_starting_top,
		starting_bottom = basic_belt_starting_bottom,
		starting_side = basic_belt_starting_side,
		ending_patch = ending_patch_prototype,
		fast_replaceable_group = "transport-belt",
		speed = 0.03125
	},
})

table.insert(
	data.raw.technology["logistics"].effects,
	{
		type = "unlock-recipe",
		recipe = "basic-counter-transport-belt"
	}
)