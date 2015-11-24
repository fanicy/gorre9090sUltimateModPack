data:extend({
  {
    type = "technology",
    name = 'expansion-bay',
    prerequisites = {'matter-conduit'},
    icon = "__dark-matter-replicators__/graphics/icons/expansion-bay.png",
    effects = {
      {type = 'unlock-recipe', recipe = 'expansion-bay'}
    },
    unit = research(200, 1, 1, 0, 0, 30)
  },
  {
    type = "item",
    name = "expansion-bay",
    icon = "__dark-matter-replicators__/graphics/icons/expansion-bay.png",
    flags = {"goes-to-quickbar"},
    subgroup = "module",
    order = "a[basic-beacon]",
    place_result = "expansion-bay",
    stack_size = 10
  },
  {
    type = "recipe",
    name = "expansion-bay",
    enabled = "false",
    energy_required = 15,
    ingredients =
    {
      {"electronic-circuit", 10},
      {"steel-plate", 10},
      {"copper-cable", 10},
      {"matter-conduit", 5}
    },
    result = "expansion-bay"
  },

  {
    type = "beacon",
    name = "expansion-bay",
    icon = "__dark-matter-replicators__/graphics/icons/expansion-bay.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "expansion-bay"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    allowed_effects = {"pollution", "consumption", "speed"},
    base_picture =
    {
      filename = "__dark-matter-replicators__/graphics/entity/expansion-bay/expansion-bay-base.png",
      width = 116,
      height = 93,
      shift = { 0.34 /3, 0.06/3},
      scale = 0.33
    },
    animation =
    {
      filename = "__base__/graphics/entity/basic-beacon/basic-beacon-antenna.png",
      width = 54,
      height = 50,
      line_length = 8,
      frame_count = 32,
      shift = { -0.03/3, -1.72/3},
      animation_speed = 0.5,
      scale = 0.33
    },
    animation_shadow =
    {
      filename = "__base__/graphics/entity/basic-beacon/basic-beacon-antenna-shadow.png",
      width = 63,
      height = 49,
      line_length = 8,
      frame_count = 32,
      shift = { 3.12/3, 0.5/3},
      animation_speed = 0.5,
      scale=0.33
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/basic-beacon/beacon-radius-visualization.png",
      width = 12,
      height = 12
    },
    supply_area_distance = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "480kW",
    distribution_effectivity = 1,
    module_specification =
    {
      module_slots = 3,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    }
  },


})