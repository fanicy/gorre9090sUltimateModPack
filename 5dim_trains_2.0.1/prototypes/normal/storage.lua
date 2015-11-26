require ("railpictures")
data:extend({
-- Item
	{
		type = "item",
		name = "cargo-wagon-storage",
		icon = "__5dim_trains__/resources/icons/wagon-storage.png",
		flags = {"goes-to-quickbar"},
		subgroup = "trains-logistics",
		order = "d",
		place_result = "cargo-wagon-storage",
		stack_size = 5
	},

--Recipe
	{
    type = "recipe",
    name = "cargo-wagon-storage",
    enabled = "false", -- TESTING ONLY
    ingredients =
    {
      {"cargo-wagon", 1},
	  {"logistic-chest-storage", 1}
    },
    result = "cargo-wagon-storage"
  },

--Entity
  {
    type = "cargo-wagon",
    name = "cargo-wagon-storage",
	icon = "__5dim_trains__/resources/icons/wagon-storage.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 20,
    minable = {mining_time = 1, result = "cargo-wagon-storage"},
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
        "__5dim_trains__/resources/wagon-yellow/spritesheet-1.png",
        "__5dim_trains__/resources/wagon-yellow/spritesheet-2.png",
        "__5dim_trains__/resources/wagon-yellow/spritesheet-3.png",
        "__5dim_trains__/resources/wagon-yellow/spritesheet-4.png",
        "__5dim_trains__/resources/wagon-yellow/spritesheet-5.png",
        "__5dim_trains__/resources/wagon-yellow/spritesheet-6.png",
        "__5dim_trains__/resources/wagon-yellow/spritesheet-7.png",
        "__5dim_trains__/resources/wagon-yellow/spritesheet-8.png",
      },
      line_length = 4,
      lines_per_file = 4,
      shift={0.4, -1.20}
    },
    rail_category = "regular"
  },
  {
    type = "logistic-container",
    name = "logistic-chest-storage-provider-trans",
    icon = "__5dim_trains__/resources/icons/trans-icon.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {hardness = 1, mining_time = 1, result = "logistic-chest-storage"},
    max_health = 10000,
    --corpse = "small-remnants",
		collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
		collision_mask = {"ghost-layer"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    --fast_replaceable_group = "container",
    inventory_size = 20,
    logistic_mode = "storage",
	order = "z",
    picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      shift = {0, 0}
    }
  },
})