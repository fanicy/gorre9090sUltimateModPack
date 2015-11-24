data:extend({
	{
		type = "recipe",
		name = "signal-reader",
		enabled = false,
		ingredients =
		{
		  {"rail-signal", 1},
		  {"electronic-circuit", 5}
		},
		result = "signal-reader"
	},
	{
		type = "item",
		name = "signal-reader",
		icon = "__LogicBelt__/graphics/signals/signal-reader/signal-reader.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-rail-signals",
		order = "02[reader]-01[normal]",
		place_result = "signal-reader",
		stack_size = 50
	},
	{
		type = "rail-signal",
		name = "signal-reader",
		icon = "__LogicBelt__/graphics/signals/signal-reader/signal-reader.png",
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
		fast_replaceable_group = "rail-signal",
		minable = {mining_time = 1, result = "signal-reader"},
		max_health = 80,
		corpse = "small-remnants",
		collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		building_collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		animation =
		{
		  filename = "__base__/graphics/entity/rail-signal/rail-signal.png",
		  priority = "high",
		  width = 70,
		  height = 46,
		  frame_count = 3,
		  direction_count = 8,
		},
		green_light = {intensity = 0.2, size = 4, color={g=1}},
		orange_light = {intensity = 0.2, size = 4, color={r=1, g=0.5}},
		red_light = {intensity = 0.2, size = 4, color={r=1}},
	},
})

table.insert(
	data.raw.technology["rail-signals"].effects,
	{
		type = "unlock-recipe",
		recipe = "signal-reader"
	}
)