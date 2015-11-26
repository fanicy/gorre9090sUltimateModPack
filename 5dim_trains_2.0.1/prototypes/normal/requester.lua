require ("railpictures")
data:extend({
-- Item
	{
		type = "item",
		name = "cargo-wagon-requester",
		icon = "__5dim_trains__/resources/icons/wagon-requester.png",
		flags = {"goes-to-quickbar"},
		subgroup = "trains-logistics",
		order = "e",
		place_result = "cargo-wagon-requester",
		stack_size = 5
	},

--Recipe
  {
    type = "recipe",
    name = "cargo-wagon-requester",
    enabled = "false", -- TESTING ONLY
    ingredients =
    {
      {"cargo-wagon", 1},
	  {"logistic-chest-requester", 1}
    },
    result = "cargo-wagon-requester"
  },

--Entity
  {
    type = "cargo-wagon",
    name = "cargo-wagon-requester",
	icon = "__5dim_trains__/resources/icons/wagon-requester.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 20,
    minable = {mining_time = 1, result = "cargo-wagon-requester"},
    max_health = 600,
    corpse = "medium-remnants",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-0.7, -2.5}, {1, 2.5}},
    weight = 1000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.0015,
    air_resistance = 0.002,
    connection_distance = 3.3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    pictures =
    {
      priority = "very-low",
      width = 256,
      height = 256,
      axially_symmetrical = false,
      back_equals_front = true,
      direction_count = 64,
      filenames =
      {
        "__5dim_trains__/resources/wagon-blue/spritesheet-1.png",
        "__5dim_trains__/resources/wagon-blue/spritesheet-2.png",
        "__5dim_trains__/resources/wagon-blue/spritesheet-3.png",
        "__5dim_trains__/resources/wagon-blue/spritesheet-4.png",
        "__5dim_trains__/resources/wagon-blue/spritesheet-5.png",
        "__5dim_trains__/resources/wagon-blue/spritesheet-6.png",
        "__5dim_trains__/resources/wagon-blue/spritesheet-7.png",
        "__5dim_trains__/resources/wagon-blue/spritesheet-8.png",
      },
      line_length = 4,
      lines_per_file = 4,
      shift={0.4, -1.20}
    },
    rail_category = "regular"
  },
  {
    type = "logistic-container",
    name = "logistic-chest-requester-trans",
    icon = "__5dim_trains__/resources/icons/trans-icon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    --minable = {hardness = 0.2, mining_time = 99.0, result = "logistic-chest-requester"},
    max_health = 10000,
    --corpse = "small-remnants",
		collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
		collision_mask = {"ghost-layer"},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    --fast_replaceable_group = "container",
    inventory_size = 20,
    logistic_mode = "requester",
	order = "a",
    picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      shift = {0, 0}
    },
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    circuit_wire_max_distance = 7.5
  },
})