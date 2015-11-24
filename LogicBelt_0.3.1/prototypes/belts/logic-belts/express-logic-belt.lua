data:extend(
{ 
	{
		type = "item",
		name = "express-logic-transport-belt",
		icon = "__LogicBelt__/graphics/belts/logic-belt/express-logic-belt.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-belts",
		order = "01[logic-belts]-03[express]",
		place_result = "express-logic-transport-belt",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "express-logic-transport-belt",
		enabled = false,
		ingredients = {
			{"express-transport-belt", 1},
			{"processing-unit", 3}
		},
		result = "express-logic-transport-belt"
	},
	{
		type = "transport-belt",
		name = "express-logic-transport-belt",
		icon = "__LogicBelt__/graphics/belts/logic-belt/express-logic-belt.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.3, result = "express-logic-transport-belt"},
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
		  filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
		  priority = "extra-high",
		  width = 40,
		  height = 40,
		  frame_count = 32,
		  direction_count = 12
		},
		belt_horizontal = express_belt_horizontal, -- specified in transport-belt-pictures.lua
		belt_vertical = express_belt_vertical,
		ending_top = express_belt_ending_top,
		ending_bottom = express_belt_ending_bottom,
		ending_side = express_belt_ending_side,
		starting_top = express_belt_starting_top,
		starting_bottom = express_belt_starting_bottom,
		starting_side = express_belt_starting_side,
		ending_patch = ending_patch_prototype,
		ending_patch = ending_patch_prototype,
		fast_replaceable_group = "transport-belt",
		speed = 0.09375
	},
})

table.insert(
	data.raw.technology["logistics-3"].effects,
	{
		type = "unlock-recipe",
		recipe = "express-logic-transport-belt"
	}
)