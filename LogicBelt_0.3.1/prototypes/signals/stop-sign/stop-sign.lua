data:extend({
	{
		type = "item",
		name = "stop-sign",
		icon = "__base__/graphics/icons/cargo-wagon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "a[train-system]-g[stop-sign]",
		place_result = "stop-sign",
		stack_size = 5
	},
	{
		type = "cargo-wagon",
		name = "stop-sign",
		icon = "__base__/graphics/icons/cargo-wagon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 0,
		minable = {mining_time = 1, result = "stop-sign"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 1000000,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.3, -1.2}, {0.3, 1.2}},
		--collision_box = {{-0.6, -2.4}, {0.6, 2.4}}, --original
		selection_box = {{-0.35, -1.25}, {0.5, 1.25}},
		--selection_box = {{-0.7, -2.5}, {1, 2.5}}, --original
		weight = 1000,
		max_speed = 0,
		braking_force = 3,
		friction_force = 0.0015,
		air_resistance = 0.002,
		connection_distance = 1.65,
		joint_distance = 2,
		energy_per_hit_point = 5,
		resistances = {},
		back_light = rolling_stock_back_light(),
		stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
		  priority = "very-low",
		  width = 50,
		  height = 44,
		  back_equals_front = true,
		  direction_count = 1,
		  filenames =
		  {
			"__LogicBelt__/graphics/signals/stop-sign/stop.png"
			--"__LogicBelt__/graphics/signals/stop-sign/transparent.png", --alternativ
		  },
		  line_length = 1,
		  lines_per_file = 1,
		  --shift = {0.7, -0.45}
		},
		rail_category = "regular",
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 50,
		working_sound =
		{
		  sound =
		  {
			filename = "__base__/sound/train-wheels.ogg",
			volume = 0.5
		  },
		  match_volume_to_activity = true,
		},
		crash_trigger = crash_trigger(),
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		sound_minimum_speed = 0.5;
		vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
	},
})

