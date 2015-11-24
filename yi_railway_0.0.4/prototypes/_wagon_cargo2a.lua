
data:extend(
{


	{
		type = "cargo-wagon",
		name = "y_wagon_closed",
		icon = "__yi_railway__/graphics/entity/railway/wcs_closed_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 20,
		minable = {mining_time = 1, result = "y_wagon_closed"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1100,
		max_speed = 1.2,
		braking_force = 2,
		friction_force = 0.0015,
		air_resistance = 0.002,
		connection_distance = 3.6,
		joint_distance = 1.8,
		energy_per_hit_point = 5,    
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},

		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			back_equals_front = true,
			direction_count = 64,
			filename = "__yi_railway__/graphics/entity/railway/wcs_closed_sheet.png",      
			line_length = 8,
			lines_per_file = 8,
			shift = {0.42, -1.125}
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

	{
		type = "cargo-wagon",
		name = "y_wagon_hopper_yellow",
		icon = "__yi_railway__/graphics/entity/railway/2a_hooper_y_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 10,
		minable = {mining_time = 1, result = "y_wagon_hopper_yellow"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1100,
		max_speed = 1.2,
		braking_force = 2,
		friction_force = 0.0015,
		air_resistance = 0.002,
		connection_distance = 3.6,
		joint_distance = 1.8,
		energy_per_hit_point = 5,    
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},

		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			back_equals_front = true,
			direction_count = 64,
			filename = "__yi_railway__/graphics/entity/railway/2a_hopper_y_sheet.png",      
			line_length = 8,
			lines_per_file = 8,
			shift = {0.42, -1.125}
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
	{
		type = "cargo-wagon",
		name = "y_wagon_corn_green",
		icon = "__yi_railway__/graphics/entity/railway/2a_corn_green_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 10,
		minable = {mining_time = 1, result = "y_wagon_corn_green"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1100,
		max_speed = 1.2,
		braking_force = 2,
		friction_force = 0.0015,
		air_resistance = 0.002,
		connection_distance = 3.6,
		joint_distance = 1.8,
		energy_per_hit_point = 5,    
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},

		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			back_equals_front = true,
			direction_count = 64,
			filename = "__yi_railway__/graphics/entity/railway/2a_corn_green_sheet.png",      
			line_length = 8,
			lines_per_file = 8,
			shift = {0.42, -1.125}
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
	{
		type = "cargo-wagon",
		name = "y_wagon_corn_blue",
		icon = "__yi_railway__/graphics/entity/railway/2a_corn_blue_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 10,
		minable = {mining_time = 1, result = "y_wagon_corn_blue"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1100,
		max_speed = 1.2,
		braking_force = 2,
		friction_force = 0.0015,
		air_resistance = 0.002,
		connection_distance = 3.6,
		joint_distance = 1.8,
		energy_per_hit_point = 5,    
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},

		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			back_equals_front = true,
			direction_count = 64,
			filename = "__yi_railway__/graphics/entity/railway/2a_corn_blue_sheet.png",      
			line_length = 8,
			lines_per_file = 8,
			shift = {0.42, -1.125}
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