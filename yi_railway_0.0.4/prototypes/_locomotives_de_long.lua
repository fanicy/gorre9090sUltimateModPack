
data:extend(
{

  {
    type = "locomotive",
    name = "y_loco_emd3000_white",
    icon = "__yi_railway__/graphics/entity/railway/emd_gp_icon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 1, result = "y_loco_emd3000_white"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 1500,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.0}, {0.6, 2.0}},
    selection_box = {{-0.85, -1.5}, {0.9, 1.5}},
    drawing_box = {{-1, -1}, {1, 1}},
    weight = 2200,
    max_speed = 0.9,
    max_power = "1200kW",
    braking_force = 18,
    friction_force = 0.003,
    -- this is a percentage of current speed that will be subtracted
    air_resistance = 0.003,
	
    connection_distance = 3.4,
    joint_distance = 3.2,
	
--    connection_distance = 3.5,
--    joint_distance = 1.3,
    energy_per_hit_point = 5,
    resistances =
    {
      {type = "fire", decrease = 15, percent = 50 },
      {type = "physical", decrease = 15, percent = 30 },
      {type = "impact",decrease = 50,percent = 60},
      {type = "explosion",decrease = 15,percent = 30},
      {type = "acid",decrease = 10,percent = 20}
    },
    energy_source =
    {
      type = "burner",
      effectivity = 1,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 100,
          position = {0, 0.5},
          slow_down_factor = 15,
          starting_frame = 1,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 1,
          height = 2,
          height_deviation = 0.2,
          starting_vertical_speed = 0.2,
          starting_vertical_speed_deviation = 0.06,
        }
      }
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
    --back_light = rolling_stock_back_light(),
    --stand_by_light = rolling_stock_stand_by_light(),
    pictures =
    {
      priority = "very-low",
      width = 256,
      height = 256,
      direction_count = 128,
      filenames =
      {
        "__yi_railway__/graphics/entity/railway/emd_gp_white_sheet-0.png",
        "__yi_railway__/graphics/entity/railway/emd_gp_white_sheet-1.png",
      },
      line_length = 8,
      lines_per_file = 8,
      shift = {0.42, -1.125}
    },
    rail_category = "regular",

    stop_trigger =
    {
      -- left side
      {
        type = "create-smoke",
        repeat_count = 75,
        entity_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      },
      -- right side
      {
        type = "create-smoke",
        repeat_count = 75,
        entity_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      },
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
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    sound_minimum_speed = 0.2;
  },

  {
    type = "locomotive",
    name = "yir_loco_del_bluegray",
    icon = "__yi_railway__/graphics/entity/railway/emd-gp_bluegray_icon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 1, result = "yir_loco_del_bluegray"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 1600,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.0}, {0.6, 2.0}},
    selection_box = {{-0.85, -1.5}, {0.9, 1.5}},
    drawing_box = {{-1, -1}, {1, 1}},
    weight = 2000,
    max_speed = 0.8,
    max_power = "1300kW",
    braking_force = 20,
    friction_force = 0.00275,
    -- this is a percentage of current speed that will be subtracted
    air_resistance = 0.00275,
	
    connection_distance = 3.4,
    joint_distance = 3.2,
	
--    connection_distance = 3.5,
--    joint_distance = 1.3,
    energy_per_hit_point = 5,
    resistances =
    {
      {type = "fire", decrease = 15, percent = 50 },
      {type = "physical", decrease = 15, percent = 30 },
      {type = "impact",decrease = 50,percent = 60},
      {type = "explosion",decrease = 15,percent = 30},
      {type = "acid",decrease = 10,percent = 20}
    },
    energy_source =
    {
      type = "burner",
      effectivity = 1.1,
      fuel_inventory_size = 4,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 100,
          position = {0, -0.5},
          slow_down_factor = 15,
          starting_frame = 1,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 1,
          height = 2,
          height_deviation = 0.2,
          starting_vertical_speed = 0.2,
          starting_vertical_speed_deviation = 0.06,
        }
      }
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
    --back_light = rolling_stock_back_light(),
    --stand_by_light = rolling_stock_stand_by_light(),
    pictures =
    {
      priority = "very-low",
      width = 256,
      height = 256,
      direction_count = 128,
      filenames =
      {
        "__yi_railway__/graphics/entity/railway/emd_gp_bg_sheet-0.png",
        "__yi_railway__/graphics/entity/railway/emd_gp_bg_sheet-1.png",
      },
      line_length = 8,
      lines_per_file = 8,
      shift = {0.42, -1.125}
    },
    rail_category = "regular",

    stop_trigger =
    {
      -- left side
      {
        type = "create-smoke",
        repeat_count = 75,
        entity_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      },
      -- right side
      {
        type = "create-smoke",
        repeat_count = 75,
        entity_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      },
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
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    sound_minimum_speed = 0.3;
  },
  
  
})