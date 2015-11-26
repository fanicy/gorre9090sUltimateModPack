data:extend({
-- Item
	{
		type = "item",
		name = "cargo-wagon-roboport",
		icon = "__5dim_trains__/resources/icons/wagon-roboport.png",
		flags = {"goes-to-quickbar"},
		subgroup = "trains-logistics",
		order = "a",
		place_result = "cargo-wagon-roboport",
		stack_size = 5
	},

--Recipe
    {
    type = "recipe",
    name = "cargo-wagon-roboport",
    enabled = "false", -- TESTING ONLY
    ingredients =
    {
      {"cargo-wagon", 1},
	  {"roboport", 1},
	  {"copper-cable", 15}
    },
    result = "cargo-wagon-roboport"
  },

--Entity
    {
    type = "cargo-wagon",
    name = "cargo-wagon-roboport",
		icon = "__5dim_trains__/resources/icons/wagon-roboport.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 10,
    minable = {mining_time = 1, result = "cargo-wagon-roboport"},
    max_health = 600,
    corpse = "medium-remnants",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-0.7, -2.5}, {1, 2.5}},
    weight = 1500,
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
        "__5dim_trains__/resources/wagon-roboport/spritesheet-1.png",
        "__5dim_trains__/resources/wagon-roboport/spritesheet-2.png",
        "__5dim_trains__/resources/wagon-roboport/spritesheet-3.png",
        "__5dim_trains__/resources/wagon-roboport/spritesheet-4.png",
        "__5dim_trains__/resources/wagon-roboport/spritesheet-5.png",
        "__5dim_trains__/resources/wagon-roboport/spritesheet-6.png",
        "__5dim_trains__/resources/wagon-roboport/spritesheet-7.png",
        "__5dim_trains__/resources/wagon-roboport/spritesheet-8.png",
      },
      line_length = 4,
      lines_per_file = 4,
      shift={0.4, -1.20}
    },
    rail_category = "regular"
  },
   {
    type = "roboport",
    name = "roboport-trans",
    icon = "__5dim_trains__/resources/icons/wagon-roboport.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {hardness = 1, mining_time = 1, result = "roboport"},
    max_health = 10000,
    --corpse = "small-remnants",
	order = "z",
		collision_box = {{-2.0, -2.0}, {2.0, 2.0}},
		collision_mask = {"ghost-layer"},
		selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "1MW",
      buffer_capacity = "10MJ"
    },
    recharge_minimum = "1MJ",
    energy_usage = "100kW",
    -- per one charge slot
    charging_energy = "200kW",
    logistics_radius = 15,
    construction_radius = 45,
    charge_approach_distance = 5,
    robot_slots_count = 8,
    material_slots_count = 2,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-0.5, -0.5}, {0.5, -0.5}, {0.5, 0.5}, {-0.5, 0.5},
    },
    base =
    {
      filename = "__5dim_trains__/resources/trans.png",
      width = 1,
      height = 1,
      shift = {0, 0}
    },
    base_patch =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "medium",
      width = 69,
      height = 50,
      frame_count = 1,
      shift = {0.03125, 0.203125}
    },
    base_animation =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5,
      shift = {0, 0}
    },
    door_animation_up =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5,
      shift = {0, 0}
    },
    door_animation_down =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5,
      shift = {0, 0}
    },
    recharging_animation =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5,
      shift = {0, 0}
    },
    recharging_light = {intensity = 0.4, size = 5},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 0.33,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-radius-visualization.png",
      width = 12,
      height = 12
    },
    construction_radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-construction-radius-visualization.png",
      width = 12,
      height = 12
    }
  },
})