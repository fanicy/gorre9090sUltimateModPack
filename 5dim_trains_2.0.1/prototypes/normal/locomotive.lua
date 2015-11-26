require ("railpictures")
data:extend({
-- Item
	{
		type = "item",
		name = "electric-locomotive",
		icon = "__5dim_trains__/resources/icons/electric-locomotive.png",
		flags = {"goes-to-quickbar"},
		subgroup = "trains-locomotive",
		order = "a",
		place_result = "electric-locomotive",
		stack_size = 5
	},
  {
    type = "item",
    name = "5d-coal",
    icon = "__5dim_trains__/graphics/micoal.png",
    dark_background_icon = "__base__/graphics/icons/coal-dark-background.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "0.2MJ",
    subgroup = "raw-material",
    order = "b[coal]",
    stack_size = 500
  },

--Recipe
  {
    type = "recipe",
    name = "electric-locomotive",
    enabled = "false",
    ingredients =
    {
      {"electric-engine-unit", 15},
      {"electronic-circuit", 5},
      {"steel-plate", 10},
    },
    result = "electric-locomotive"
  },

--Entity
    {
    type = "locomotive",
    name = "electric-locomotive",
    icon = "__5dim_trains__/resources/icons/electric-locomotive.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 1, result = "electric-locomotive"},
    max_health = 1000,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-0.85, -2.6}, {0.9, 2.5}},
    drawing_box = {{-1, -4}, {1, 3}},
    weight = 2000,
    max_speed = 1.2,
    max_power = "600kW",
    braking_force = 10,
    friction_force = 0.0015,
    -- this is a percentage of current speed that will be subtracted
    air_resistance = 0.002,
    connection_distance = 3.3,
    joint_distance = 4.6,
    energy_per_hit_point = 5,
    energy_source =
    {
      type = "burner",
      --effectivity = 1,
      fuel_inventory_size = 1,
	  --usage_priority = "primary-input",
	  emissions = 0,
	  --buffer_capacity = "10MJ",
	  effectivity = 2.0,
    },
    front_light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -16},
        size = 2,
        intensity = 0.6
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -16},
        size = 2,
        intensity = 0.6
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
	pictures =
    {
      priority = "very-low",
      width = 256,
      height = 256,
      axially_symmetrical = true,
      back_equals_front = false,
      direction_count = 64,
      filenames =
      {
        "__5dim_trains__/resources/elec-loco/spritesheet-1.png",
        "__5dim_trains__/resources/elec-loco/spritesheet-2.png",
        "__5dim_trains__/resources/elec-loco/spritesheet-3.png",
        "__5dim_trains__/resources/elec-loco/spritesheet-4.png",
        "__5dim_trains__/resources/elec-loco/spritesheet-5.png",
        "__5dim_trains__/resources/elec-loco/spritesheet-6.png",
        "__5dim_trains__/resources/elec-loco/spritesheet-7.png",
        "__5dim_trains__/resources/elec-loco/spritesheet-8.png",
      },
      line_length = 4,
      lines_per_file = 4,
      shift={0.4, -1.20}
    },
    rail_category = "regular",

    stop_trigger =
    {
      -- -- left side
      -- {
        -- type = "create-smoke",
        -- repeat_count = 125,
        -- entity_name = "smoke-train-stop",
        -- initial_height = 0,
        -- -- smoke goes to the left
        -- speed = {-0.03, 0},
        -- speed_multiplier = 0.75,
        -- speed_multiplier_deviation = 1.1,
        -- offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      -- },
      -- -- right side
      -- {
        -- type = "create-smoke",
        -- repeat_count = 125,
        -- entity_name = "smoke-train-stop",
        -- initial_height = 0,
        -- -- smoke goes to the right
        -- speed = {0.03, 0},
        -- speed_multiplier = 0.75,
        -- speed_multiplier_deviation = 1.1,
        -- offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      -- },
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/train-breaks.ogg",
            volume = 0.6
          },
        }
      },
    },
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    crash_trigger = crash_trigger(),
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.4
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    sound_minimum_speed = 0.5;
  },
   {
    type = "furnace",
    name = "locomotive-furnace-moving-trans",
    icon = "__5dim_trains__/resources/icons/electric-locomotive.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {mining_time = 1, result = "electric-furnace"},
    max_health = 10000,
    --corpse = "big-remnants",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	collision_mask = { "ghost-layer"},
    module_slots = 2,
    smelting_categories = {"smelting"},
    crafting_categories = {"smelting"},
    crafting_speed = 1,
    energy_usage = "700kW",
    result_inventory_size = 1,
    smelting_speed = 0.01,
    smelting_energy_consumption = "700KW",
    source_inventory_size = 1,
	order = "z",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0,
    },
    animation =
    {
      filename = "__5dim_trains__/resources/trans.png",
      width = 1,
      height = 1,
      line_length = 1,
      frame_count = 1,
      shift = {0, 0},
      animation_speed = 0.5
    },
    fast_replaceable_group = "furnace"
  },

    {
    type = "furnace",
    name = "locomotive-furnace-static-trans",
    icon = "__5dim_trains__/resources/icons/electric-locomotive.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {mining_time = 1, result = "electric-furnace"},
    max_health = 10000,
    --corpse = "big-remnants",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	collision_mask = { "ghost-layer"},
    module_slots = 2,
    smelting_categories = {"smelting"},
    crafting_categories = {"smelting"},
    crafting_speed = 1,
    energy_usage = "5kW",
    result_inventory_size = 1,
    smelting_speed = 0.01,
    smelting_energy_consumption = "100W",
    source_inventory_size = 1,
	order = "z",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0,
    },
    animation =
    {
      filename = "__5dim_trains__/resources/trans.png",
      width = 1,
      height = 1,
      line_length = 1,
      frame_count = 1,
      shift = {0, 0},
      animation_speed = 0.5
    },
    fast_replaceable_group = "furnace"
  },
})