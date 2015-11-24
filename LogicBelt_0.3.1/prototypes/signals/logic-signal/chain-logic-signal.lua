data:extend({
	{
		type = "recipe",
		name = "chain-logic-signal",
		enabled = false,
		ingredients =
		{
		  {"rail-chain-signal", 1},
		  {"electronic-circuit", 5}
		},
		result = "chain-logic-signal"
	},
	{
		type = "item",
		name = "chain-logic-signal",
		icon = "__LogicBelt__/graphics/signals/logic-signal/chain-logic-signal.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-rail-signals",
		order = "01[logic]-02[chain]",
		place_result = "chain-logic-signal",
		stack_size = 50
	},
	{
		type = "rail-chain-signal",
		name = "chain-logic-signal",
		icon = "__LogicBelt__/graphics/signals/logic-signal/chain-logic-signal.png",
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
		fast_replaceable_group = "rail-signal",
		minable = {mining_time = 1, result = "chain-logic-signal"},
		max_health = 80,
		corpse = "small-remnants",
		collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		building_collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		animation =
		{
		  filename = "__base__/graphics/entity/rail-chain-signal/rail-chain-signal.png",
		  priority = "high",
		  line_length = 5,
		  width = 129,
		  height = 113,
		  frame_count = 5,
		  axially_symmetrical = false,
		  direction_count = 8,
		  shift = {0.421875, 0.515625},
		},
		rail_piece =
		{
		  filename = "__base__/graphics/entity/rail-chain-signal/rail-chain-signal-metal.png",
		  line_length = 4,
		  width = 78,
		  height = 74,
		  frame_count = 4,
		  axially_symmetrical = false,
		  shift = {0.15625, 0.25},
		},
		selection_box_offsets =
		{
		  {0.125, -0.21875},
		  {0.0625, -0.03125},
		  {-0.09375, 0.1875},
		  {-0.15625, -0.03125},
		  {-0.0625, -0.21875},
		  {0.15625, -0.3125},
		  {-0.125, -0.125},
		  {-0.125, -0.3125}
		},
		green_light = {intensity = 0.3, size = 4, color={r=0.592157, g=1, b=0.117647}},
		orange_light = {intensity = 0.3, size = 4, color={r=0.815686, g=0.670588, b=0.431373}},
		red_light = {intensity = 0.3, size = 4, color={r=0.784314, g=0.431373, b=0.431373}},
		blue_light = {intensity = 0.3, size = 4, color={r=0.431373, g=0.694118, b=0.623529}},
	},
})

table.insert(
	data.raw.technology["rail-signals"].effects,
	{
		type = "unlock-recipe",
		recipe = "chain-logic-signal"
	}
)