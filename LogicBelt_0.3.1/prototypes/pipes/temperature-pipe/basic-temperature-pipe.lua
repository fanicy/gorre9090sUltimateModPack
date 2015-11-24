data:extend({
	{
		type = "item",
		name = "basic-temperature-pipe",
		icon = "__LogicBelt__/graphics/pipes/temperature-pipe/basic-temperature-pipe.png",
		flags = {"goes-to-quickbar"},
		subgroup = "lb-pipes",
		order = "03[temperature]-01[basic]",
		place_result = "basic-temperature-pipe",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "basic-temperature-pipe",
		enabled = false,
		ingredients = {
			{"pipe", 1},
			{"electronic-circuit", 3}
		},
		result = "basic-temperature-pipe"
	},
	{
		type = "pipe",
		name = "basic-temperature-pipe",
		icon = "__LogicBelt__/graphics/pipes/temperature-pipe/basic-temperature-pipe.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "basic-temperature-pipe"},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 90
		  }
		},
		fast_replaceable_group = "pipe",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
		  base_area = 1,
		  pipe_connections =
		  {
			{ position = {0, -1} },
			{ position = {1, 0} },
			{ position = {0, 1} },
			{ position = {-1, 0} }
		  },
		},
		pictures = pipepictures(),
		working_sound =
		{
		  sound = {
			{
			  filename = "__base__/sound/pipe.ogg",
			  volume = 0.65
			},
		  },
		  match_volume_to_activity = true,
		  max_sounds_per_type = 3
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.15625}},
		vertical_window_bounding_box = {{-0.28125, -0.40625}, {0.03125, 0.125}}
	},
})

table.insert(
	data.raw.technology["fluid-handling"].effects,
	{
		type = "unlock-recipe",
		recipe = "basic-temperature-pipe"
	}
)
