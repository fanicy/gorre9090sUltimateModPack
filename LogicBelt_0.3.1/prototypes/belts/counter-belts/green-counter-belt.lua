data:extend(
{ 
	{
		type = "item",
		name = "green-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/green-counter-belt.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-belts",
		order = "02[counter-belts]-06[green]",
		place_result = "green-counter-transport-belt",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "green-counter-transport-belt",
		enabled = false,
		ingredients = {
			{"green-transport-belt", 1},
			{"processing-unit", 5}
		},
		result = "green-counter-transport-belt"
	},
	{
		type = "transport-belt",
		name = "green-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/green-counter-belt.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.3, result = "green-counter-transport-belt"},
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
		  filename = "__boblogistics__/graphics/entity/transport-belt/green-transport-belt.png",
		  priority = "extra-high",
		  width = 40,
		  height = 40,
		  frame_count = 32,
		  direction_count = 12
		},
		belt_horizontal = green_belt_horizontal,
		belt_vertical = green_belt_vertical,
		ending_top = green_belt_ending_top,
		ending_bottom = green_belt_ending_bottom,
		ending_side = green_belt_ending_side,
		starting_top = green_belt_starting_top,
		starting_bottom = green_belt_starting_bottom,
		starting_side = green_belt_starting_side,
		ending_patch = ending_patch_prototype,
		fast_replaceable_group = "transport-belt",
		speed = 0.125,
	},
})

table.insert(
	data.raw.technology["bob-logistics-4"].effects,
	{
		type = "unlock-recipe",
		recipe = "green-counter-transport-belt"
	}
)