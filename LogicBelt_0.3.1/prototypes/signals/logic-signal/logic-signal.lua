data:extend({
	{
		type = "recipe",
		name = "logic-signal",
		enabled = false,
		ingredients =
		{
		  {"rail-signal", 1},
		  {"electronic-circuit", 5}
		},
		result = "logic-signal"
	},
	{
		type = "item",
		name = "logic-signal",
		icon = "__LogicBelt__/graphics/signals/logic-signal/logic-signal.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-rail-signals",
		order = "01[logic]-01[normal]",
		place_result = "logic-signal",
		stack_size = 50
	},
	{
		type = "rail-signal",
		name = "logic-signal",
		icon = "__LogicBelt__/graphics/signals/logic-signal/logic-signal.png",
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
		fast_replaceable_group = "rail-signal",
		minable = {mining_time = 1, result = "logic-signal"},
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
		recipe = "logic-signal"
	}
)