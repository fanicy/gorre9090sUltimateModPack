
data:extend(
{

	{
		type = "recipe",
		name = "y_loco_desw_recipe",
		energy_required = 2.0,
		enabled = "false",
		ingredients = {{"y-basic-t1-mf", 2}, {"steel-plate", 8}, {"y-bluegear", 3}}, 
		results= {{type="item", name="y_loco_desw", amount=1, },	},		
		icon = "__yi_railway__/graphics/entity/railway/des_green_icon.png",
		subgroup = "yir_locomotives_diesel", order = "a1",
	},
	{
		type = "recipe",
		name = "y_loco_desw_orange_recipe",
		energy_required = 2.0,
		enabled = "false",
		ingredients = {{"y_loco_desw", 1},{"y-orange-stuff", 14},}, 
		results= {{type="item", name="y_loco_desw_orange", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/des_orange_icon.png",
		subgroup = "yir_locomotives_diesel", order = "a2",
	},
	{
		type = "recipe",
		name = "y_loco_desw_blue_recipe",
		energy_required = 2.0,
		enabled = "false",
		category = "yuoki-stargate-recipe",
		ingredients = {{"y_loco_desw", 1},{"y-fame", 25},}, 
		results= {{type="item", name="y_loco_desw_blue", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/des_blue_icon.png",
		subgroup = "yir_locomotives_diesel", order = "a3",
	},
	{
		type = "recipe",
		name = "y_loco_ses_std_recipe",
		energy_required = 2.0,
		enabled = "false",
		ingredients = {{"steam-engine", 1}, {"steel-plate", 12}, {"y-bluegear", 4}}, 
		results= {{type="item", name="y_loco_ses_std", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/sea-ss-icon.png",
		subgroup = "yir_locomotives_steam", order = "a4",
	},
	{
		type = "recipe",
		name = "y_loco_ses_red_recipe",
		energy_required = 2.0,
		enabled = "false",
		category = "yuoki-stargate-recipe",
		ingredients = {{"y_loco_ses_std", 1},{"y-fame", 35},}, 
		results= {{type="item", name="y_loco_ses_red", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/sea-sr-icon.png",
		subgroup = "yir_locomotives_steam", order = "a5",
	},

	{
		type = "recipe",
		name = "y_wagon_trans_recipe",
		energy_required = 2.0,
		enabled = "false",
		ingredients = {{"y_structure_element", 4},{"iron-plate", 12},}, 
		results= {{type="item", name="y_wagon_trans", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/cws_trans_icon.png",
		subgroup = "yir_cargowagons", order = "c1",		
	},
	{
		type = "recipe",
		name = "y_wagon_coal_recipe",
		energy_required = 2.0,
		enabled = "false",
		ingredients = {{"y_structure_element", 4},{"iron-plate", 12},{"coal", 1},}, 
		results= {{type="item", name="y_wagon_coal", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/cws_rcoal_icon.png",
		subgroup = "yir_cargowagons", order = "c2",		
	},
	{
		type = "recipe",
		name = "y_wagon_copper_recipe",
		energy_required = 2.0,
		enabled = "false",
		ingredients = {{"y_structure_element", 4},{"iron-plate", 12},{"copper-ore", 1},}, 
		results= {{type="item", name="y_wagon_copper", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/cws_rcopper_icon.png",
		subgroup = "yir_cargowagons", order = "c3",		
	},
	{
		type = "recipe",
		name = "y_wagon_iron_recipe",
		energy_required = 2.0,
		enabled = "false",
		ingredients = {{"y_structure_element", 4},{"iron-plate", 12},{"iron-ore", 1},}, 
		results= {{type="item", name="y_wagon_iron", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/cws_riron_icon.png",
		subgroup = "yir_cargowagons", order = "c4",		
	},
	{
		type = "recipe",
		name = "y_wagon_stone_recipe",
		energy_required = 2.0,
		enabled = "false",
		ingredients = {{"y_structure_element", 4},{"iron-plate", 12},{"stone", 1},}, 
		results= {{type="item", name="y_wagon_stone", amount=1, },},		
		icon = "__yi_railway__/graphics/entity/railway/cws_rstone_icon.png",
		subgroup = "yir_cargowagons", order = "c5",		
	},

	-- items	
	--[[
	{
		type = "item",
		name = "y_loco_desw",
		icon = "__yi_railway__/graphics/entity/railway/des_green_icon.png",
		flags = {"goes-to-main-inventory"},		
		subgroup = "yir_locomotives",
		stack_size = 10,
		place_result = "y_loco_desw",
	},	
	{
		type = "item",
		name = "y_loco_desw_orange",
		icon = "__yi_railway__/graphics/entity/railway/des_orange_icon.png",
		flags = {"goes-to-main-inventory"},		
		subgroup = "yir_locomotives",
		stack_size = 10,
		place_result = "y_loco_desw_orange",
	},
	{
		type = "item",
		name = "y_loco_desw_blue",
		icon = "__yi_railway__/graphics/entity/railway/des_blue_icon.png",
		flags = {"goes-to-main-inventory"},		
		subgroup = "yir_locomotives",
		stack_size = 10,
		place_result = "y_loco_desw_blue",
	},
	{
		type = "item",
		name = "y_loco_ses_std",
		icon = "__yi_railway__/graphics/entity/railway/sea-ss-icon.png",
		flags = {"goes-to-main-inventory"},		
		subgroup = "yir_locomotives",
		stack_size = 10,
		place_result = "y_loco_ses_std",
	},
	{
		type = "item",
		name = "y_loco_ses_red",
		icon = "__yi_railway__/graphics/entity/railway/sea-sr-icon.png",
		flags = {"goes-to-main-inventory"},		
		subgroup = "yir_locomotives",
		stack_size = 10,
		place_result = "y_loco_ses_red",
	},
	
	{
		type = "item",
		name = "y_wagon_trans", place_result = "y_wagon_trans",
		icon = "__yi_railway__/graphics/entity/railway/cws_trans_icon.png",
		flags = {"goes-to-main-inventory"},	subgroup = "yir_cargowagons", stack_size = 10, 
	},
	{
		type = "item",
		name = "y_wagon_coal", place_result = "y_wagon_coal",
		icon = "__yi_railway__/graphics/entity/railway/cws_rcoal_icon.png",
		flags = {"goes-to-main-inventory"},	subgroup = "yir_cargowagons", stack_size = 10, 
	},
	{
		type = "item",
		name = "y_wagon_copper", place_result = "y_wagon_copper",
		icon = "__yi_railway__/graphics/entity/railway/cws_rcopper_icon.png",
		flags = {"goes-to-main-inventory"},	subgroup = "yir_cargowagons", stack_size = 10, 
	},
	{
		type = "item",
		name = "y_wagon_iron", place_result = "y_wagon_iron",
		icon = "__yi_railway__/graphics/entity/railway/cws_riron_icon.png",
		flags = {"goes-to-main-inventory"},	subgroup = "yir_cargowagons", stack_size = 10, 
	},
	{
		type = "item",
		name = "y_wagon_stone", place_result = "y_wagon_stone",
		icon = "__yi_railway__/graphics/entity/railway/cws_rstone_icon.png",
		flags = {"goes-to-main-inventory"},	subgroup = "yir_cargowagons", stack_size = 10, 
	},
	]]
	
	{
		type = "locomotive",
		name = "y_loco_desw",
		icon = "__yi_railway__/graphics/entity/railway/des_green_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		minable = {mining_time = 1, result = "y_loco_desw"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 700,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.1}, {0.6, 1.1}},
		selection_box = {{-0.85, -1.5}, {0.9, 1.5}},
		drawing_box = {{-1, -1}, {1, 1}},
		weight = 1400,
		max_speed = 0.4,
		max_power = "400kW",
		braking_force = 6,
		friction_force = 0.005,
		-- this is a percentage of current speed that will be subtracted
		air_resistance = 0.005,
		
		connection_distance = 3.6,
		joint_distance = 1.8,
		
		--    connection_distance = 3.5,
		--    joint_distance = 1.3,
		energy_per_hit_point = 5,
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},
		energy_source =
		{
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 2,
			smoke =
			{
				{
					name = "smoke",
					deviation = {0.1, 0.1},
					frequency = 150,
					position = {0, -0.6},
					slow_down_factor = 15,
					starting_frame = 1,
					starting_frame_deviation = 5,
					starting_frame_speed = 0,
					starting_frame_speed_deviation = 1,
					height = 2,
					height_deviation = 0.2,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.06,
				}
			}
		},
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.6, -16},
				size = 2,
				intensity = 0.6
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.6, -16},
				size = 2,
				intensity = 0.6
			}
		},
		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			direction_count = 128,
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/des_gs1.png",
				"__yi_railway__/graphics/entity/railway/des_gs2.png",
				"__yi_railway__/graphics/entity/railway/des_gs3.png",
				"__yi_railway__/graphics/entity/railway/des_gs4.png",
				"__yi_railway__/graphics/entity/railway/des_gs5.png",
				"__yi_railway__/graphics/entity/railway/des_gs6.png",
				"__yi_railway__/graphics/entity/railway/des_gs7.png",
				"__yi_railway__/graphics/entity/railway/des_gs8.png",		
			},
			line_length = 4,
			lines_per_file = 4,
			shift = {0.42, -1.125}
		},
		rail_category = "regular",

		stop_trigger =
		{
			-- left side
			{
				type = "create-smoke",
				repeat_count = 125,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the left
				speed = {-0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
			},
			-- right side
			{
				type = "create-smoke",
				repeat_count = 125,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the right
				speed = {0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
			},
			{
				type = "play-sound",
				sound =
				{
					{
						filename = "__base__/sound/train-breaks.ogg",
						volume = 0.6
					},
				}
			},
		},
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 50,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/train-engine.ogg",
				volume = 0.6
			},
			match_speed_to_activity = true,
		},
		open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
		close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
		sound_minimum_speed = 0.2;
	},

	{
		type = "locomotive",
		name = "y_loco_desw_orange",
		icon = "__yi_railway__/graphics/entity/railway/des_orange_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		minable = {mining_time = 1, result = "y_loco_desw_orange"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 800,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.1}, {0.6, 1.1}},
		selection_box = {{-0.85, -1.5}, {0.9, 1.5}},
		drawing_box = {{-1, -1}, {1, 1}},
		weight = 1600,
		max_speed = 0.375,
		max_power = "500kW",
		braking_force = 8,
		friction_force = 0.0025,
		-- this is a percentage of current speed that will be subtracted
		air_resistance = 0.004,
		connection_distance = 3.5,
		joint_distance = 1.3,
		energy_per_hit_point = 5,
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},
		energy_source =
		{
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 2,
			smoke =
			{
				{
					name = "smoke",
					deviation = {0.1, 0.1},
					frequency = 150,
					position = {0, -0.6},
					slow_down_factor = 15,
					starting_frame = 1,
					starting_frame_deviation = 5,
					starting_frame_speed = 0,
					starting_frame_speed_deviation = 1,
					height = 2,
					height_deviation = 0.2,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.06,
				}
			}
		},
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.6, -16},
				size = 2,
				intensity = 0.6
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.6, -16},
				size = 2,
				intensity = 0.6
			}
		},
		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			direction_count = 128,
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/des_os1.png",
				"__yi_railway__/graphics/entity/railway/des_os2.png",
				"__yi_railway__/graphics/entity/railway/des_os3.png",
				"__yi_railway__/graphics/entity/railway/des_os4.png",
				"__yi_railway__/graphics/entity/railway/des_os5.png",
				"__yi_railway__/graphics/entity/railway/des_os6.png",
				"__yi_railway__/graphics/entity/railway/des_os7.png",
				"__yi_railway__/graphics/entity/railway/des_os8.png",		
			},
			line_length = 4,
			lines_per_file = 4,
			shift = {0.42, -1.125}
		},
		rail_category = "regular",

		stop_trigger =
		{
			-- left side
			{
				type = "create-smoke",
				repeat_count = 125,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the left
				speed = {-0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
			},
			-- right side
			{
				type = "create-smoke",
				repeat_count = 125,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the right
				speed = {0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
			},
			{
				type = "play-sound",
				sound =
				{
					{
						filename = "__base__/sound/train-breaks.ogg",
						volume = 0.6
					},
				}
			},
		},
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 50,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/train-engine.ogg",
				volume = 0.6
			},
			match_speed_to_activity = true,
		},
		open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
		close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
		sound_minimum_speed = 0.2;
	},
	{
		type = "locomotive",
		name = "y_loco_desw_blue",
		icon = "__yi_railway__/graphics/entity/railway/des_blue_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		minable = {mining_time = 1, result = "y_loco_desw_blue"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 900,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.1}, {0.6, 1.1}},
		selection_box = {{-0.85, -1.5}, {0.9, 1.5}},
		drawing_box = {{-1, -1}, {1, 1}},
		weight = 1800,
		max_speed = 0.35,
		max_power = "600kW",
		braking_force = 10,
		friction_force = 0.003,
		-- this is a percentage of current speed that will be subtracted
		air_resistance = 0.004,
		connection_distance = 3.5,
		joint_distance = 1.3,
		energy_per_hit_point = 5,
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},
		energy_source =
		{
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 2,
			smoke =
			{
				{
					name = "smoke",
					deviation = {0.1, 0.1},
					frequency = 150,
					position = {0, -0.6},
					slow_down_factor = 15,
					starting_frame = 1,
					starting_frame_deviation = 5,
					starting_frame_speed = 0,
					starting_frame_speed_deviation = 1,
					height = 2,
					height_deviation = 0.2,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.06,
				}
			}
		},
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.6, -16},
				size = 2,
				intensity = 0.6
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.6, -16},
				size = 2,
				intensity = 0.6
			}
		},
		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			direction_count = 128,
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/des_bs1.png",
				"__yi_railway__/graphics/entity/railway/des_bs2.png",
				"__yi_railway__/graphics/entity/railway/des_bs3.png",
				"__yi_railway__/graphics/entity/railway/des_bs4.png",
				"__yi_railway__/graphics/entity/railway/des_bs5.png",
				"__yi_railway__/graphics/entity/railway/des_bs6.png",
				"__yi_railway__/graphics/entity/railway/des_bs7.png",
				"__yi_railway__/graphics/entity/railway/des_bs8.png",		
			},
			line_length = 4,
			lines_per_file = 4,
			shift = {0.42, -1.125}
		},
		rail_category = "regular",

		stop_trigger =
		{
			-- left side
			{
				type = "create-smoke",
				repeat_count = 125,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the left
				speed = {-0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
			},
			-- right side
			{
				type = "create-smoke",
				repeat_count = 125,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the right
				speed = {0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
			},
			{
				type = "play-sound",
				sound =
				{
					{
						filename = "__base__/sound/train-breaks.ogg",
						volume = 0.6
					},
				}
			},
		},
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 30,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/train-engine.ogg",
				volume = 0.6
			},
			match_speed_to_activity = true,
		},
		open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
		close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
		sound_minimum_speed = 0.2;
	},


	-- steam
	{
		type = "locomotive",
		name = "y_loco_ses_std",
		icon = "__yi_railway__/graphics/entity/railway/sea-ss-icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		minable = {mining_time = 1, result = "y_loco_ses_std"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 700,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.1}, {0.6, 1.1}},
		selection_box = {{-0.85, -1.5}, {0.9, 1.5}},
		drawing_box = {{-1, -1}, {1, 1}},
		weight = 1100,
		max_speed = 0.4,
		max_power = "300kW",
		braking_force = 6,
		friction_force = 0.005,
		-- this is a percentage of current speed that will be subtracted
		air_resistance = 0.005,
		
		connection_distance = 3.6,
		joint_distance = 1.8,
		
		--    connection_distance = 3.5,
		--    joint_distance = 1.3,
		energy_per_hit_point = 5,
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},
		energy_source =
		{
			type = "burner",
			effectivity = 0.8,
			fuel_inventory_size = 2,
			smoke =
			{
				{
					name = "smoke",
					deviation = {0.1, 0.1},
					frequency = 300,
					position = {0, -1.6},
					slow_down_factor = 15,
					starting_frame = 1,
					starting_frame_deviation = 5,
					starting_frame_speed = 0,
					starting_frame_speed_deviation = 1,
					height = 2,
					height_deviation = 0.2,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.06,
				}
			}
		},
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.6, -16},
				size = 2,
				intensity = 0.6
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.6, -16},
				size = 2,
				intensity = 0.6
			}
		},
		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{			
			priority = "very-low",
			width = 256,
			height = 256,
			direction_count = 128,
			--[[
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/ses_sa1.png",
				"__yi_railway__/graphics/entity/railway/ses_sa2.png",
				"__yi_railway__/graphics/entity/railway/ses_sa3.png",
				"__yi_railway__/graphics/entity/railway/ses_sa4.png",
				"__yi_railway__/graphics/entity/railway/ses_sa5.png",
				"__yi_railway__/graphics/entity/railway/ses_sa6.png",
				"__yi_railway__/graphics/entity/railway/ses_sa7.png",
				"__yi_railway__/graphics/entity/railway/ses_sa8.png",		
			},
			line_length = 4,
			lines_per_file = 4,
			]]
			
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-0.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-1.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-2.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-3.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-4.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-5.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-6.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-7.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-8.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-9.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-10.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-11.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-12.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-13.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-14.png",
				"__yi_railway__/graphics/entity/railway/ses-bx/ses_std-x_sheet-15.png",				
			},
			frame_count = 5,
			line_length = 1,
			lines_per_file = 8,						
			shift = {0.42, -1.125}
		},
		rail_category = "regular",

		stop_trigger =
		{
			-- left side
			{
				type = "create-smoke",
				repeat_count = 200,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the left
				speed = {-0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
			},
			-- right side
			{
				type = "create-smoke",
				repeat_count = 200,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the right
				speed = {0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
			},
			{
				type = "play-sound",
				sound =
				{
					{
						filename = "__base__/sound/train-breaks.ogg",
						volume = 0.6
					},
				}
			},
		},
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 50,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/steam-engine-90bpm.ogg",
				--filename = "__yi_railway__/graphics/entity/railway/steam-locomotive-depart-01.ogg",
				volume = 0.6
			},
			match_speed_to_activity = true,
		},
		open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
		close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
		sound_minimum_speed = 0.2;
	},

	{
		type = "locomotive",
		name = "y_loco_ses_red",
		icon = "__yi_railway__/graphics/entity/railway/sea-sr-icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		minable = {mining_time = 1, result = "y_loco_ses_red"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 800,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.1}, {0.6, 1.1}},
		selection_box = {{-0.85, -1.5}, {0.9, 1.5}},
		drawing_box = {{-1, -1}, {1, 1}},
		weight = 900,
		max_speed = 1.4,
		max_power = "300kW",
		braking_force = 6,
		friction_force = 0.002,
		-- this is a percentage of current speed that will be subtracted
		air_resistance = 0.002,
		
		connection_distance = 3.6,
		joint_distance = 1.8,
		
		--    connection_distance = 3.5,
		--    joint_distance = 1.3,
		energy_per_hit_point = 5,
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},
		energy_source =
		{
			type = "burner",
			effectivity = 0.8,
			fuel_inventory_size = 2,
			smoke =
			{
				{
					name = "smoke",
					deviation = {0.1, 0.1},
					frequency = 300,
					position = {0, -1.6},
					slow_down_factor = 15,
					starting_frame = 1,
					starting_frame_deviation = 5,
					starting_frame_speed = 0,
					starting_frame_speed_deviation = 1,
					height = 2,
					height_deviation = 0.2,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.06,
				}
			}
		},
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.6, -16},
				size = 2,
				intensity = 0.6
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.6, -16},
				size = 2,
				intensity = 0.6
			}
		},
		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			direction_count = 128,
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/ses_ared1.png",
				"__yi_railway__/graphics/entity/railway/ses_ared2.png",
				"__yi_railway__/graphics/entity/railway/ses_ared3.png",
				"__yi_railway__/graphics/entity/railway/ses_ared4.png",
				"__yi_railway__/graphics/entity/railway/ses_ared5.png",
				"__yi_railway__/graphics/entity/railway/ses_ared6.png",
				"__yi_railway__/graphics/entity/railway/ses_ared7.png",
				"__yi_railway__/graphics/entity/railway/ses_ared8.png",		
			},
			line_length = 4,
			lines_per_file = 4,
			shift = {0.42, -1.125}
		},
		rail_category = "regular",

		stop_trigger =
		{
			-- left side
			{
				type = "create-smoke",
				repeat_count = 200,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the left
				speed = {-0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
			},
			-- right side
			{
				type = "create-smoke",
				repeat_count = 200,
				entity_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the right
				speed = {0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
			},
			{
				type = "play-sound",
				sound =
				{
					{
						filename = "__base__/sound/train-breaks.ogg",
						volume = 0.6
					},
				}
			},
		},
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 50,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				--filename = "__base__/sound/steam-engine-90bpm.ogg",
				filename = "__yi_railway__/graphics/entity/railway/steam-locomotive-depart-01.ogg",
				volume = 0.6
			},
			match_speed_to_activity = true,
		},
		open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
		close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
		sound_minimum_speed = 0.2;
	},


	{
		type = "cargo-wagon",
		name = "y_wagon_trans",
		icon = "__yi_railway__/graphics/entity/railway/cws_trans_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 20,
		minable = {mining_time = 1, result = "y_wagon_trans"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1000,
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
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/wcs_ts1.png",
				"__yi_railway__/graphics/entity/railway/wcs_ts2.png",
				"__yi_railway__/graphics/entity/railway/wcs_ts3.png",
				"__yi_railway__/graphics/entity/railway/wcs_ts4.png",
			},
			line_length = 4,
			lines_per_file = 4,
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
		name = "y_wagon_coal",
		icon = "__yi_railway__/graphics/entity/railway/cws_rcoal_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 20,
		minable = {mining_time = 1, result = "y_wagon_coal"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1000,
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
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/wcs_coal_s1.png",
				"__yi_railway__/graphics/entity/railway/wcs_coal_s2.png",
				"__yi_railway__/graphics/entity/railway/wcs_coal_s3.png",
				"__yi_railway__/graphics/entity/railway/wcs_coal_s4.png",
			},
			line_length = 4,
			lines_per_file = 4,
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
		name = "y_wagon_copper",
		icon = "__yi_railway__/graphics/entity/railway/cws_rcopper_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 20,
		minable = {mining_time = 1, result = "y_wagon_copper"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1000,
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
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/wcs_copper_s1.png",
				"__yi_railway__/graphics/entity/railway/wcs_copper_s2.png",
				"__yi_railway__/graphics/entity/railway/wcs_copper_s3.png",
				"__yi_railway__/graphics/entity/railway/wcs_copper_s4.png",
			},
			line_length = 4,
			lines_per_file = 4,
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
		name = "y_wagon_iron",
		icon = "__yi_railway__/graphics/entity/railway/cws_riron_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 20,
		minable = {mining_time = 1, result = "y_wagon_iron"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1000,
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
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/wcs_iron_s1.png",
				"__yi_railway__/graphics/entity/railway/wcs_iron_s2.png",
				"__yi_railway__/graphics/entity/railway/wcs_iron_s3.png",
				"__yi_railway__/graphics/entity/railway/wcs_iron_s4.png",
			},
			line_length = 4,
			lines_per_file = 4,
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
		name = "y_wagon_stone",
		icon = "__yi_railway__/graphics/entity/railway/cws_rstone_icon.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
		inventory_size = 20,
		minable = {mining_time = 1, result = "y_wagon_stone"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 400,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -2.6}, {1, 1.2}},
		weight = 1000,
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
			filenames =
			{
				"__yi_railway__/graphics/entity/railway/wcs_stone_s1.png",
				"__yi_railway__/graphics/entity/railway/wcs_stone_s2.png",
				"__yi_railway__/graphics/entity/railway/wcs_stone_s3.png",
				"__yi_railway__/graphics/entity/railway/wcs_stone_s4.png",
			},
			line_length = 4,
			lines_per_file = 4,
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