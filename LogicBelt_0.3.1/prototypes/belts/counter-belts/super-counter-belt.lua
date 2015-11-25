data:extend(
{ 
	{
		type = "item",
		name = "super-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/super-counter-belt.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-belts",
		order = "02[counter-belts]-04[super]",
		place_result = "super-counter-transport-belt",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "super-counter-transport-belt",
		enabled = false,
		ingredients = {
			{"super-transport-belt", 1},
			{"advanced-processing-unit", 3}
		},
		result = "super-counter-transport-belt"
	},
	{
		type = "transport-belt",
		name = "super-counter-transport-belt",
		icon = "__LogicBelt__/graphics/belts/counter-belt/super-counter-belt.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.3, result = "super-counter-transport-belt"},
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
		  filename = "__MAIN-DyTech-Machine__/graphics/transport-belts/super-transport-belt.png",
		  priority = "extra-high",
		  width = 40,
		  height = 40,
		  frame_count = 32,
		  direction_count = 12
		},
		 belt_horizontal = super_belt_horizontal,
		belt_vertical = super_belt_vertical,
		ending_top = super_belt_ending_top,
		ending_bottom = super_belt_ending_bottom,
		ending_side = super_belt_ending_side,
		starting_top = super_belt_starting_top,
		starting_bottom = super_belt_starting_bottom,
		starting_side = super_belt_starting_side,
		ending_patch = ending_patch_prototype,
		fast_replaceable_group = "transport-belt",
		speed = 0.133
	},
})

table.insert(
	data.raw.technology["logistics-4"].effects,
	{
		type = "unlock-recipe",
		recipe = "super-counter-transport-belt"
	}
)