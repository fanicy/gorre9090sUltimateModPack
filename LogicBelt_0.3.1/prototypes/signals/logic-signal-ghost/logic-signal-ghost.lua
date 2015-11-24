data:extend(
{ 
	{
		type = "item",
		name = "logic-signal-ghost",
		icon = "__base__/graphics/icons/smart-inserter.png",
		flags = {"goes-to-quickbar"},
		subgroup = "inserter",
		order = "f[inserter]-e[smart-inserter]",
		place_result = "logic-signal-ghost",
		stack_size = 50
	},
	{
		type = "inserter",
		name = "logic-signal-ghost",
		icon = "__base__/graphics/icons/smart-inserter.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation", "placeable-off-grid"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "logic-signal-ghost"},
		max_health = 40,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 90
		  }
		},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
		  match_progress_to_activity = true,
		  sound =
		  {
			{
			  filename = "__base__/sound/inserter-fast-1.ogg",
			  volume = 0.75
			},
			{
			  filename = "__base__/sound/inserter-fast-2.ogg",
			  volume = 0.75
			},
			{
			  filename = "__base__/sound/inserter-fast-3.ogg",
			  volume = 0.75
			},
			{
			  filename = "__base__/sound/inserter-fast-4.ogg",
			  volume = 0.75
			},
			{
			  filename = "__base__/sound/inserter-fast-5.ogg",
			  volume = 0.75
			}
		  }
		},
		collision_box = {{0, 0}, {0, 0}},
		--collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{-0.3, -0.3}, {0.3, 0.3}},
		pickup_position = {0, 0},
		insert_position = {0, 0},
		energy_per_movement = 7000,
		energy_per_rotation = 7000,
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input",
		  drain = "100W"
		},
		extension_speed = 0.1,
		rotation_speed = 0.1,
		fast_replaceable_group = "inserter",
		filter_count = 1,
		hand_base_picture =
		{
		  filename = "__LogicBelt__/graphics/transparent.png",
		  priority = "very-low",
		  width = 10,
		  height = 10
		},
		hand_closed_picture =
		{
		  filename = "__LogicBelt__/graphics/transparent.png",
		  priority = "very-low",
		  width = 10,
		  height = 10
		},
		hand_open_picture =
		{
		  filename = "__LogicBelt__/graphics/transparent.png",
		  priority = "very-low",
		  width = 10,
		  height = 10
		},
		hand_base_shadow =
		{
		  filename = "__LogicBelt__/graphics/transparent.png",
		  priority = "very-low",
		  width = 10,
		  height = 10
		},
		hand_closed_shadow =
		{
		  filename = "__LogicBelt__/graphics/transparent.png",
		  priority = "very-low",
		  width = 10,
		  height = 10
		},
		hand_open_shadow =
		{
		  filename = "__LogicBelt__/graphics/transparent.png",
		  priority = "very-low",
		  width = 10,
		  height = 10
		},
		platform_picture =
		{
			sheet=
			{
				filename = "__LogicBelt__/graphics/signals/logic-signal-ghost/logic-signal-ghost.png",
				priority = "very-low",
				width = 15,
				height = 15,
			}
		},
		uses_arm_movement = "basic-inserter",
		programmable = true,
		circuit_wire_connection_point =
		{
		  shadow =
		  {
			red = {0, 0},
			green = {0, 0}
		  },
		  wire =
		  {
			red = {0, 0},
			green = {0, 0}
		  }
		},
		circuit_wire_max_distance = 7.5,
	}
})