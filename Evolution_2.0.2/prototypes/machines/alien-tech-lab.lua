data:extend({
  {
      type = "recipe",
      name = "alien-tech-lab",
      enabled = "true",
      ingredients = {
        {'alien-bioconstruct', 50},
        {'iron-plate', 10},
	{'copper-plate', 10},
	{'copper-cable', 30},
      },
      result = "alien-tech-lab"
  },
 {
    type = "item",
    name = "alien-tech-lab",
    icon = "__Evolution__/graphics/icons/alien-tech-lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = "Evolution",
    order = "a[alien-tech-lab]",
    place_result = "alien-tech-lab",

    stack_size = 12,
  },

  {
    type = "lab",
    name = "alien-tech-lab",
    icon = "__Evolution__/graphics/icons/alien-tech-lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "alien-tech-lab"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8},
    on_animation =
    {
      filename = "__Evolution__/graphics/entity/alien-tech-lab/alien-tech-lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__Evolution__/graphics/entity/alien-tech-lab/alien-tech-lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1.5
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "400kW",
    inputs =
    {
      "alien-bioconstruct",
      "alien-fragments",
      "endo-skeleton",
      "exo-skeleton"
    },
    module_slots = 0
    --module_slots = 2
  },
})