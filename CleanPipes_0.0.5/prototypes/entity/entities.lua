require ("pipeimages")

function PipeEntity(_NSEW, _Connections)
	if string.sub(_NSEW, 1, 1) == "2" then
		_Result = "cleanpipe-p2"
	else
		_Result = "cleanpipe-p"
	end
	
	local pipe = {
		type = "pipe",
		name = "cleanpipe-" .. _NSEW,
		icon = "__base__/graphics/icons/pipe.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = _Result},
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
			pipe_connections = _Connections,
		},
		pictures = PipeImages(_NSEW),
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
	}
	return pipe
end

function Empty()
	return {
			filename = "__CleanPipes__/graphics/empty.png",
			priority = "extra-high",
			width = 1,
			height = 1
		}
end

data:extend(
{
	PipeEntity("n",     {{ position = { 0, -1} }}),
	PipeEntity("s",     {{ position = { 0,  1} }}),
	PipeEntity("e",     {{ position = { 1,  0} }}),
	PipeEntity("w",     {{ position = {-1,  0} }}),
	PipeEntity("ns",    {{ position = { 0, -1} },
						 { position = { 0,  1} }}),
	PipeEntity("ew",    {{ position = { 1,  0} },
						 { position = {-1,  0} }}),
	PipeEntity("ne",    {{ position = { 0, -1} },
						 { position = { 1,  0} }}),
	PipeEntity("nw",    {{ position = { 0, -1} },
						 { position = {-1,  0} }}),
	PipeEntity("se",    {{ position = { 0,  1} },
						 { position = { 1,  0} }}),
	PipeEntity("sw",    {{ position = { 0,  1} },
						 { position = {-1,  0} }}),
	PipeEntity("nse",   {{ position = { 0, -1} },
						 { position = { 0,  1} },
						 { position = { 1,  0} }}),
	PipeEntity("nsw",   {{ position = { 0, -1} },
						 { position = { 0,  1} },
						 { position = {-1,  0} }}),
	PipeEntity("new",   {{ position = { 0, -1} },
						 { position = { 1,  0} },
						 { position = {-1,  0} }}),
	PipeEntity("sew",   {{ position = { 0,  1} },
						 { position = { 1,  0} },
						 { position = {-1,  0} }}),
	PipeEntity("nsew",  {{ position = { 0,  1} },
						 { position = { 0, -1} },
						 { position = { 1,  0} },
						 { position = {-1,  0} }}),
	PipeEntity("2n",    {{ position = { 0, -1} }}),
	PipeEntity("2s",    {{ position = { 0,  1} }}),
	PipeEntity("2e",    {{ position = { 1,  0} }}),
	PipeEntity("2w",    {{ position = {-1,  0} }}),
	PipeEntity("2ns",   {{ position = { 0, -1} },
						 { position = { 0,  1} }}),
	PipeEntity("2ew",   {{ position = { 1,  0} },
						 { position = {-1,  0} }}),
	PipeEntity("2ne",   {{ position = { 0, -1} },
						 { position = { 1,  0} }}),
	PipeEntity("2nw",   {{ position = { 0, -1} },
						 { position = {-1,  0} }}),
	PipeEntity("2se",   {{ position = { 0,  1} },
						 { position = { 1,  0} }}),
	PipeEntity("2sw",   {{ position = { 0,  1} },
						 { position = {-1,  0} }}),
	PipeEntity("2nse",  {{ position = { 0, -1} },
						 { position = { 0,  1} },
						 { position = { 1,  0} }}),
	PipeEntity("2nsw",  {{ position = { 0, -1} },
						 { position = { 0,  1} },
						 { position = {-1,  0} }}),
	PipeEntity("2new",  {{ position = { 0, -1} },
						 { position = { 1,  0} },
						 { position = {-1,  0} }}),
	PipeEntity("2sew",  {{ position = { 0,  1} },
						 { position = { 1,  0} },
						 { position = {-1,  0} }}),
	PipeEntity("2nsew", {{ position = { 0,  1} },
						 { position = { 0, -1} },
						 { position = { 1,  0} },
						 { position = {-1,  0} }}),
	{
		type = "inserter",
		name = "cleanpipe-p",
		icon = "__CleanPipes__/graphics/cleanpipe-p-icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "cleanpipe-p"},
		max_health = 40,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
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
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		pickup_position = {0, -1},
		insert_position = {0, -1},
		energy_per_movement = 0,
		energy_per_rotation = 0,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			drain = "0kW"
		},
		hand_base_picture = Empty(),
		hand_closed_picture = Empty(),
		hand_open_picture = Empty(),
		hand_base_shadow = Empty(),
		hand_closed_shadow = Empty(),
		hand_open_shadow = Empty(),
		platform_picture =
		{
			sheet =
			{
				priority = "extra-high",
				width = 58,
				height = 58,
				filename = "__CleanPipes__/graphics/cleanpipe-p.png",
			}
		},
		extension_speed = 0.001,
		rotation_speed = 0.001,
		uses_arm_movement = "basic-inserter"
	},
	{
		type = "inserter",
		name = "cleanpipe-p2",
		icon = "__CleanPipes__/graphics/cleanpipe-p2-icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "cleanpipe-p"},
		max_health = 40,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
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
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		pickup_position = {0, -1},
		insert_position = {0,  1},
		energy_per_movement = 0,
		energy_per_rotation = 0,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			drain = "0kW"
		},
		hand_base_picture = Empty(),
		hand_closed_picture = Empty(),
		hand_open_picture = Empty(),
		hand_base_shadow = Empty(),
		hand_closed_shadow = Empty(),
		hand_open_shadow = Empty(),
		platform_picture =
		{
			sheet =
			{
				priority = "extra-high",
				width = 58,
				height = 58,
				filename = "__CleanPipes__/graphics/cleanpipe-p.png",
			}
		},
		extension_speed = 0.001,
		rotation_speed = 0.001,
		uses_arm_movement = "basic-inserter"
	},
}
)