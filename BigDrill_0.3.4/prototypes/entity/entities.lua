data:extend(
{
  {
    type = "mining-drill",
    name = "bucketw",
    icon = "__base__/graphics/icons/basic-mining-drill.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "bucket-wheel-excavator"},
    max_health = 1200,
    resource_categories = {"basic-solid"},
    corpse = "big-remnants",
    collision_box = {{ -4.25, -3.75}, {4.45, 4.45}},
    selection_box = {{ -4.35, -3.85}, {4.55, 3.65}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-mining-drill.ogg",
        volume = 0.75
      },
      apparent_volume = 1.5,
    },
    animations =
    {
      north =
      {
        priority = "extra-high",
        width = 357,
        height = 331,
        line_length = 5,
        shift = {0.2, -0.2},
        filename = "__BigDrill__/graphics/bucket-wh/BigWheelMinerSheet2.png",
        frame_count = 30,
        animation_speed = 0.125,
        run_mode = "forward-then-backward",
      }
    },
    mining_speed = 7,
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.063,
      usage_priority = "secondary-input"
    },
    energy_usage = "1600kW",
    mining_power = 3,
    resource_searching_radius = 5.3,
    vector_to_place_result = {0, -5},
    module_slots = 3,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/basic-mining-drill/mining-drill-radius-visualization.png",
      width = 12,
      height = 12
    }
  },
  {
    type = "mining-drill",
    name = "bucketw-mk2",
    icon = "__BigDrill__/graphics/icons/bucketW-mk2.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "bucket-wheel-excavator-mk2"},
    max_health = 1200,
    resource_categories = {"basic-solid"},
    corpse = "big-remnants",
    collision_box = {{ -4.25, -3.75}, {4.45, 4.45}},
    selection_box = {{ -4.35, -3.85}, {4.55, 3.65}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-mining-drill.ogg",
        volume = 0.75
      },
      apparent_volume = 1.5,
    },
    animations =
    {
      north =
      {
        priority = "extra-high",
        width = 357,
        height = 331,
        line_length = 5,
        shift = {0.2, -0.2},
        filename = "__BigDrill__/graphics/bucket-wh/BigWheelMinerSheet2.png",
        frame_count = 30,
        animation_speed = 0.125,
        run_mode = "forward-then-backward",
      }
    },
    mining_speed = 7,
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.053,
      usage_priority = "secondary-input"
    },
    energy_usage = "2800kW",
    mining_power = 8,
    resource_searching_radius = 6,
    vector_to_place_result = {0, -5},
    module_slots = 3,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/basic-mining-drill/mining-drill-radius-visualization.png",
      width = 12,
      height = 12
    }
  },
  {
    type = "mining-drill",
    name = "bucketw-mk3",
    icon = "__BigDrill__/graphics/icons/bucketW-mk3.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "bucket-wheel-excavator-mk3"},
    max_health = 1200,
    resource_categories = {"basic-solid"},
    corpse = "big-remnants",
    collision_box = {{ -4.25, -3.75}, {4.45, 4.45}},
    selection_box = {{ -4.35, -3.85}, {4.55, 3.65}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-mining-drill.ogg",
        volume = 0.75
      },
      apparent_volume = 1.5,
    },
    animations =
    {
      north =
      {
        priority = "extra-high",
        width = 357,
        height = 331,
        line_length = 5,
        shift = {0.2, -0.2},
        filename = "__BigDrill__/graphics/bucket-wh/BigWheelMinerSheet2.png",
        frame_count = 30,
        animation_speed = 0.125,
        run_mode = "forward-then-backward",
      }
    },
    mining_speed = 7,
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.043,
      usage_priority = "secondary-input"
    },
    energy_usage = "4000kW",
    mining_power = 24,
    resource_searching_radius = 6.5,
    vector_to_place_result = {0, -5},
    module_slots = 3,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/basic-mining-drill/mining-drill-radius-visualization.png",
      width = 12,
      height = 12
    }
  },
  {
    type = "container",
    name = "ore-unloader",
    icon = "__BigDrill__/graphics/icons/ore-unloader.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "ore-unloader"},
    max_health = 50,
    corpse = "small-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    fast_replaceable_group = "container",
    selection_box = {{-1.4, -1.4}, {1.4, 1.4}},
    inventory_size = 22,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    picture =
    {
      filename = "__BigDrill__/graphics/ore-unloader/ore-unloader.png",
      priority = "extra-high",
      width = 129,
      height = 100,
      shift = {0.3, 0}
    }
  },
  {
    type = "container",
    name = "ore-unloader-mk2",
    icon = "__BigDrill__/graphics/icons/ore-unloader-mk2.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "ore-unloader-mk2"},
    max_health = 50,
    corpse = "small-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    fast_replaceable_group = "container",
    selection_box = {{-1.4, -1.4}, {1.4, 1.4}},
    inventory_size = 40,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    picture =
    {
      filename = "__BigDrill__/graphics/ore-unloader/ore-unloader-mk2.png",
      priority = "extra-high",
      width = 129,
      height = 100,
      shift = {0.3, 0}
    }
  },
  {
    type = "container",
    name = "ore-unloader-mk3",
    icon = "__BigDrill__/graphics/icons/ore-unloader-mk3.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "ore-unloader-mk3"},
    max_health = 50,
    corpse = "small-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    fast_replaceable_group = "container",
    selection_box = {{-1.4, -1.4}, {1.4, 1.4}},
    inventory_size = 60,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    picture =
    {
      filename = "__BigDrill__/graphics/ore-unloader/ore-unloader-mk3.png",
      priority = "extra-high",
      width = 129,
      height = 100,
      shift = {0.3, 0}
    }
  },
  }
  )
