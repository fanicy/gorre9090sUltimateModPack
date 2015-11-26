data:extend({
--Entity
  {
    type = "electric-pole",
    name = "electric-pole-trans",
    icon = "__5dim_trains__/resources/icons/trans-icon.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {hardness = 1, mining_time = 1, result = "copper-cable"},
    max_health = 10000,
    --corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    --selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    --drawing_box = {{-2.8, -0.5}, {0.5, 0.5}},
	collision_mask = { "ghost-layer"},
    maximum_wire_distance = 11,
    supply_area_distance = 0.5,
	order = "z",
    pictures =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      axially_symmetrical = true,
      direction_count = 1,
      shift = {0, 0}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {0, 0},
          green = {0, 0},
          red = {0, 0}
        },
        wire =
        {
          copper = {0, 0},
          green = {0, 0},
          red = {0, 0}
        }
      },

	},
	copper_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    green_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    wire_shadow_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
  },

  {
    type = "electric-pole",
    name = "electric-pole-rail",
    icon = "__5dim_trains__/resources/icons/trans-icon.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {hardness = 0.1, mining_time = 0.5, result = "nothing-item"},
    max_health = 100000,
    --corpse = "small-remnants",
    collision_box = {{-0.20, -0.20}, {0.20, 0.20}},
    --selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    --drawing_box = {{-2.8, -0.5}, {0.5, 0.5}},
	--selection_box = {{-0.2, -0.2}, {0.2, 0.2}},
    maximum_wire_distance = 6,
    supply_area_distance = 1,
	order = "z",
	collision_mask = { "ghost-layer"},
    pictures =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      axially_symmetrical = true,
      direction_count = 1,
      shift = {0, 0}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {0, 0},
          green = {0, 0},
          red = {0, 0}
        },
        wire =
        {
          copper = {0, 0},
          green = {0, 0},
          red = {0, 0}
        }
      },

	},
	copper_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    green_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    wire_shadow_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
  },
  {
    type = "electric-pole",
    name = "electric-pole-large-rail",
    icon = "__5dim_trains__/resources/icons/trans-icon.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    --minable = {hardness = 0.1, mining_time = 0.5, result = "nothing-item"},
	--minable = {hardness = 1, mining_time = 1},
    max_health = 10000,
    --corpse = "small-remnants",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    --selection_box = {{-0.2, -0.2}, {0.2, 0.2}},
    --drawing_box = {{-2.8, -0.5}, {0.5, 0.5}},
    maximum_wire_distance = 6,
    supply_area_distance = 2,
	order = "z",
	collision_mask = { "ghost-layer"},
    pictures =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      axially_symmetrical = true,
      direction_count = 1,
      shift = {0, 0}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {0, 0},
          green = {0, 0},
          red = {0, 0}
        },
        wire =
        {
          copper = {0, 0},
          green = {0, 0},
          red = {0, 0}
        }
      },

	},
	copper_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    green_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    radius_visualisation_picture =
    {
      --filename = "__5dim_trains__/resources/electric-pole-rail-radius-visualization.png",
	  filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
    wire_shadow_picture =
    {
      filename = "__5dim_trains__/resources/trans.png",
      priority = "very-low",
      width = 1,
      height = 1
    },
  },

})