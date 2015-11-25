data:extend({
{
    type = "assembling-machine",
    name = "steel-manufacturing-unit",
    icon = "__steel_manufacturing_unit__/graphics/icons/steel-manufacturing-unit.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "steel-manufacturing-unit"},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "explosion",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    fast_replaceable_group = "furnace",
    animation =
    {
      filename = "__steel_manufacturing_unit__/graphics/entity/Steel-manufacturing-unit-4.png",
      priority="high",
      width = 66,
      height = 68,
      frame_count = 32,
      line_length = 8,
      shift = {0.25, -0.1}
    },
	working_visualisations =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__steel_manufacturing_unit__/graphics/entity/SMUHeat.png",
          priority = "extra-high",
          width = 20,
          height = 12,
          frame_count = 12,
          shift = { 0.2, 0.52}
        },
        light = {intensity = 0.8, size = 0.8}
      }
    },
	crafting_categories = {"crafting", "smelting"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 2.5
    },
    energy_usage = "160kW",
    ingredient_count = 1,
    module_specification =
    {
      module_slots = 3
    },
	allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        },
		{
		  filename = "__base__/sound/electric-furnace.ogg",
		  volume = 0.4
		},
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    }
  },
})
