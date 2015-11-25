data:extend(
{ 
	{
		type = "item",
		name = "logic-belt-lamp-on",
		icon = "__LogicBelt__/graphics/belts/logic-belt-lamp/light-on.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy",
		order = "c[light]-a[small-lamp]",
		place_result = "logic-belt-lamp-on",
		stack_size = 50
	},
	{
		type = "lamp",
		name = "logic-belt-lamp-on",
		icon = "__LogicBelt__/graphics/belts/logic-belt-lamp/light-on.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "logic-belt-lamp-on"},
		max_health = 55,
		corpse = "small-remnants",
		collision_box = {{0, 0}, {0, 0}},
		collision_mask = { "item-layer"},
		selection_box = {{-0.1, -0.1}, {0.1, 0.1}},
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input"
		},
		energy_usage_per_tick = "1KW",
		light = {intensity = 0.1, size = 1},
		picture_off =
		{
		  filename = "__LogicBelt__/graphics/belts/logic-belt-lamp/light-on.png",
		  priority = "high",
		  width = 14,
		  height = 19,
		  frame_count = 1,
		  axially_symmetrical = false,
		  direction_count = 1,
		},
		picture_on =
		{
		  filename = "__LogicBelt__/graphics/belts/logic-belt-lamp/light-on.png",
		  priority = "high",
		  width = 14,
		  height = 19,
		  frame_count = 1,
		  axially_symmetrical = false,
		  direction_count = 1,
        }
	},
})