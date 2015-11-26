require ("railpictures")
data:extend({
-- Item
	{
		type = "item",
		name = "cargo-wagon-active",
		icon = "__5dim_trains__/resources/icons/wagon-active-provider.png",
		flags = {"goes-to-quickbar"},
		subgroup = "trains-logistics",
		order = "c",
		place_result = "cargo-wagon-active",
		stack_size = 5
	},

--Recipe
    {
    type = "recipe",
    name = "cargo-wagon-active",
    enabled = "false", -- TESTING ONLY
    ingredients =
    {
      {"cargo-wagon", 1},
	  {"logistic-chest-active-provider", 1}
    },
    result = "cargo-wagon-active"
  },

--Entity
  {
    type = "cargo-wagon",
    name = "cargo-wagon-active",
	icon = "__5dim_trains__/resources/icons/wagon-active-provider.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 20,
    minable = {mining_time = 1, result = "cargo-wagon-active"},
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
        "__5dim_trains__/resources/wagon-purple/spritesheet-1.png",
        "__5dim_trains__/resources/wagon-purple/spritesheet-2.png",
        "__5dim_trains__/resources/wagon-purple/spritesheet-3.png",
        "__5dim_trains__/resources/wagon-purple/spritesheet-4.png",
        "__5dim_trains__/resources/wagon-purple/spritesheet-5.png",
        "__5dim_trains__/resources/wagon-purple/spritesheet-6.png",
        "__5dim_trains__/resources/wagon-purple/spritesheet-7.png",
        "__5dim_trains__/resources/wagon-purple/spritesheet-8.png",
      },
      line_length = 4,
      lines_per_file = 4,
      shift={0.4, -1.20}
    },
    rail_category = "regular"
  },
   {
    type = "logistic-container",
    name = "logistic-chest-active-provider-trans",
    icon = "__5dim_trains__/resources/icons/trans-icon.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {hardness = 1, mining_time = 1, result = "logistic-chest-active-provider"},
    max_health = 10000,
    --corpse = "small-remnants",
		collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
		collision_mask = {"ghost-layer"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    --fast_replaceable_group = "container",
    inventory_size = 20,
    logistic_mode = "active-provider",
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