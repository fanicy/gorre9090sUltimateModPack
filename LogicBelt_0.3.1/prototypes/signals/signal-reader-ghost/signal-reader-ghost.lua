data:extend(
{
	{
		type = "item",
		name = "signal-reader-ghost",
		icon = "__LogicBelt__/graphics/signals/signal-reader/signal-reader.png",
		flags = {"goes-to-quickbar"},
		subgroup = "storage",
		order = "a[items]-d[smart-chest]",
		place_result = "signal-reader-ghost",
		stack_size = 50
	},
	{
		type = "smart-container",
		name = "signal-reader-ghost",
		icon = "__LogicBelt__/graphics/signals/signal-reader/signal-reader.png",
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		minable =
		{
		  hardness = 0.2,
		  mining_time = 0.5,
		  result = "signal-reader-ghost"
		},
		max_health = 150,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 70
		  }
		},
		collision_box = {{0, 0}, {0, 0}},
		selection_box = {{-0.3, -0.3}, {0.3, 0.3}},
		fast_replaceable_group = "container",
		inventory_size = 1,
		--vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture =
		{
		  filename = "__LogicBelt__/graphics/signals/signal-reader/signal-reader-ghost.png",
		  priority = "very-low",
		  width = 15,
		  height = 15
		},
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
		circuit_wire_max_distance = 7.5
	}
})

