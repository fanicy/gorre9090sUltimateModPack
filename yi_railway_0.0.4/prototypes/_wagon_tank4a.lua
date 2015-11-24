
data:extend(
{


	{
		type = "cargo-wagon",
		name = "y_wagon_tank_fm1",
		icon = "__yi_railway__/graphics/entity/railway/4atw_fm1_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 0,
		minable = {mining_time = 1, result = "y_wagon_tank_fm1"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 600,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -2.0}, {0.6, 2.0}},
		selection_box = {{-0.7, -2.1}, {1, 2.1}},		
		--collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		--selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1200,
		max_speed = 1.2,
		braking_force = 2,
		friction_force = 0.0015,
		air_resistance = 0.002,
		connection_distance = 3.4,
		joint_distance = 3.4,
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
			filename = "__yi_railway__/graphics/entity/railway/4atw_fm1_sheet-0.png",      
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
		name = "y_wagon_tank_fm2",
		icon = "__yi_railway__/graphics/entity/railway/4atw_fm2_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 0,
		minable = {mining_time = 1, result = "y_wagon_tank_fm2"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 600,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -2.0}, {0.6, 2.0}},
		selection_box = {{-0.7, -2.1}, {1, 2.1}},		
		--collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		--selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1200,
		max_speed = 1.2,
		braking_force = 2,
		friction_force = 0.0015,
		air_resistance = 0.002,
		connection_distance = 3.4,
		joint_distance = 3.4,
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
			filename = "__yi_railway__/graphics/entity/railway/4atw_fm2_sheet-0.png",      
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