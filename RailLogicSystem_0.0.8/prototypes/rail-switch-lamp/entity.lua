data:extend(
{ 
	{
		type = "lamp",
		name = "rail-switch-lamp",
		icon = "__RailLogicSystem__/graphics/rail-switch-lamp/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "rail-switch-lamp"},
		max_health = 55,
		corpse = "small-remnants",
		collision_box = {{0, 0}, {1, 1}},
		selection_box = {{-0.3, -0.3}, {0.7, 0.7}},
		collision_mask = { "resource-layer" },
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input"
		},
		energy_usage_per_tick = "10KW",
		light = {intensity = 0, size = 0},
		picture_off =
		{
		  filename = "__RailLogicSystem__/graphics/rail-switch-lamp/light-off.png",
		  priority = "high",
		  width = 53,
		  height = 46,
		  frame_count = 1,
		  axially_symmetrical = false,
		  direction_count = 1,
		  shift = {0.078125, -0.03125},
		},
		picture_on =
		{
		  filename = "__RailLogicSystem__/graphics/rail-switch-lamp/light-on-patch.png",
		  priority = "high",
		  width = 50,
		  height = 50,
		  frame_count = 1,
		  axially_symmetrical = false,
		  direction_count = 1,
		  shift = {0.0625, -0.21875},
        },
		circuit_wire_connection_point =
		{
		  shadow =
		  {
			red = {0.75, -0.2},
			green = {0.75, -0.2},
		  },
		  wire =
		  {
			red = {0.35, -0.5},
			green = {0.35, -0.5},
		  }
		},
		
		circuit_wire_max_distance = 7.5
	}
})