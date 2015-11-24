data:extend({
	{
		type = "item",
		name = "reader-pipe-ghost",
		icon = "__base__/graphics/icons/storage-tank.png",
		flags = {"goes-to-quickbar"},
		subgroup = "storage",
		order = "b[fluid]-a[storage-tank]",
		place_result = "reader-pipe-ghost",
		stack_size = 50
	},
	{
		type = "storage-tank",
		name = "reader-pipe-ghost",
		icon = "__base__/graphics/icons/storage-tank.png",
		flags = {"placeable-player", "player-creation", "placeable-off-grid"},
		minable = {hardness = 0.2, mining_time = 3, result = "reader-pipe-ghost"},
		max_health = 500,
		corpse = "medium-remnants",
		collision_box = {{0, 0}, {0, 0}},
		selection_box = {{-0.3, -0.3}, {0.3, 0.3}},
		fluid_box =
		{
		  base_area = 1000,
		  pipe_covers = pipecoverspictures(),
		  pipe_connections =
		  {
			--{ position = {-1, -2} },
			--{ position = {2, 1} },
			--{ position = {1, 2} },
			--{ position = {-2, -1} },
		  },
		},
		window_bounding_box = {{0, 0}, {0, 0}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
			  filename = "__LogicBelt__/graphics/transparent.png",
			  priority = "very-low",
			  frames = 1,
			  width = 15,
			  height = 15,
			}
		  },
		  fluid_background =
		  {
			filename = "__LogicBelt__/graphics/transparent.png",
			priority = "very-low",
			width = 15,
			height = 15
		  },
		  window_background =
		  {
			filename = "__LogicBelt__/graphics/transparent.png",
			priority = "very-low",
			width = 15,
			height = 15
		  },
		  flow_sprite =
		  {
			filename = "__LogicBelt__/graphics/transparent.png",
			priority = "very-low",
			width = 15,
			height = 15
		  }
		},
		flow_length_in_ticks = 360,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
		  sound = {
			  filename = "__base__/sound/storage-tank.ogg",
			  volume = 0.8
		  },
		  apparent_volume = 1.5,
		  max_sounds_per_type = 3
		},
		circuit_wire_connection_points =
		{
		  {
			shadow =
			{
			  red = {0, 0},
			  green = {0, 0},
			},
			wire =
			{
			  red = {0, 0},
			  green = {0, 0},
			}
		  },
		  {
			shadow =
			{
			  red = {0, 0},
			  green = {0, 0},
			},
			wire =
			{
			  red = {0, 0},
			  green = {0, 0},
			}
		  },
		  {
			shadow =
			{
			  red = {0, 0},
			  green = {0, 0},
			},
			wire =
			{
			  red = {0, 0},
			  green = {0, 0},
			}
		  },
		  {
			shadow =
			{
			  red = {0, 0},
			  green = {0, 0},
			},
			wire =
			{
			  red = {0, 0},
			  green = {0, 0},
			}
		  },
		},

		circuit_wire_max_distance = 7.5
	},
})
