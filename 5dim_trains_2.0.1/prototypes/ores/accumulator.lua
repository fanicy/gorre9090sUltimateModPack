require ("railpictures")
data:extend({
-- Item
	{
		type = "item",
		name = "cargo-wagon-accumulator",
		icon = "__5dim_trains__/resources/icons/wagon-accumulator.png",
		flags = {"goes-to-quickbar"},
		subgroup = "trains-accumulators",
		order = "zz",
		place_result = "cargo-wagon-accumulator",
		stack_size = 5
	},

--Recipe
  	{
    type = "recipe",
    name = "cargo-wagon-accumulator",
    enabled = "false",
    ingredients =
    {
      {"cargo-wagon", 1},
	  {"basic-accumulator", 10},
	  {"5d-gold-wire", 15}
    },
    result = "cargo-wagon-accumulator"
  },

--Entity
  {
    type = "cargo-wagon",
    name = "cargo-wagon-accumulator",
		icon = "__5dim_trains__/resources/icons/wagon-accumulator.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 0,
    minable = {mining_time = 1, result = "cargo-wagon-accumulator"},
    max_health = 600,
    corpse = "medium-remnants",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-0.7, -2.3}, {1, 2.3}},
    weight = 3000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.0015,
    air_resistance = 0.002,
    connection_distance = 3.3,
    joint_distance = 3.3,
    energy_per_hit_point = 5,
    pictures =
    {
      priority = "very-low",
      width = 285,
      height = 215,
      axially_symmetrical = false,
      --back_equals_front = true,
      direction_count = 256,
      filenames =
      {
        "__5dim_trains__/resources/wagon-accumulator/cargo-wagon-spritesheet-1.png",
        "__5dim_trains__/resources/wagon-accumulator/cargo-wagon-spritesheet-2.png",
        "__5dim_trains__/resources/wagon-accumulator/cargo-wagon-spritesheet-3.png",
        "__5dim_trains__/resources/wagon-accumulator/cargo-wagon-spritesheet-4.png",
		"__5dim_trains__/resources/wagon-accumulator/cargo-wagon-spritesheet-5.png",
        "__5dim_trains__/resources/wagon-accumulator/cargo-wagon-spritesheet-6.png",
        "__5dim_trains__/resources/wagon-accumulator/cargo-wagon-spritesheet-7.png",
        "__5dim_trains__/resources/wagon-accumulator/cargo-wagon-spritesheet-8.png"
      },
      line_length = 4,
      lines_per_file = 8,
      shift={0.85, -0.55}
    },
    rail_category = "regular"
  },
  {
    type = "accumulator",
    name = "large-accumulator-trans",
    icon = "__5dim_trains__/resources/icons/wagon-accumulator.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {hardness = 1, mining_time = 1, result = "basic-accumulator"},
    max_health = 10000,
    --corpse = "small-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    --selection_box = {{-1, -1}, {1, 1}},
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	collision_mask = { "ghost-layer"},
	order = "z",
    energy_source =
    {
      type = "electric",
      buffer_capacity = "50MJ",
      usage_priority = "terciary",
      input_flow_limit = "3MW",
      output_flow_limit = "2MW"
    },
    picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__5dim_trains__/resources/trans.png",
      width = 1,
      height = 1,
      line_length = 1,
      frame_count = 1,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0, size = 0},
    discharge_animation =
    {
      filename = "__5dim_trains__/resources/trans.png",
      width = 1,
      height = 1,
      line_length = 1,
      frame_count = 1,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0, size = 0}
  },
})