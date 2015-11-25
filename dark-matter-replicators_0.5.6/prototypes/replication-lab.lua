data:extend({
  {
      type = "recipe",
      name = "replication-lab",
      enabled = "false",
      ingredients = {
        {'dark-matter-scoop', 5},
        {'electronic-circuit', 10},
        {'copper-plate', 10}
      },
      result = "replication-lab",
      subgroup = "replicators",
	  order = "a",
  },
  {
    type = "item",
    name = "replication-lab",
    icon = "__dark-matter-replicators__/graphics/icons/replication-lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = "replicators",
    order = "a",
    place_result = "replication-lab",

    stack_size = 50,
  },

  {
    type = "lab",
    name = "replication-lab",
    icon = "__dark-matter-replicators__/graphics/icons/replication-lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "replication-lab"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8},
    on_animation =
    {
      filename = "__dark-matter-replicators__/graphics/entity/replication-lab/replication-lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__dark-matter-replicators__/graphics/entity/replication-lab/replication-lab.png",
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
    energy_usage = "60kW",
    inputs =
    {
      "tenemut",
      "dark-matter-scoop",
      "dark-matter-transducer",
      "matter-conduit"
    },
	module_specification =
    {
		module_slots = 2
	},
	allowed_effects = {"consumption", "speed", "productivity"},
  },
})