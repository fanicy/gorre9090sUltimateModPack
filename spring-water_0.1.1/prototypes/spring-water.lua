
data:extend(
{
  {
    type = "autoplace-control",
    name = "spring-water",
    richness = true,
    order = "a-c-a"
  },
  
  {
    type = "noise-layer",
    name = "spring-water"
  },
  
  {
    type = "resource",
    name = "spring-water",
    icon = "__base__/graphics/icons/fluid/water.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    order="a-c-a",
    infinite = true,
    minimum = 75000,
    normal = 75000,
    minable =
    {
      hardness = 1,
      mining_time = 0.1,
      results =
      {
        {
          type = "fluid",
          name = "water",
          amount_min = 12.5,
          amount_max = 12.5,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      control = "spring-water",
      sharpness = 0.8,
      max_probability = 0.06,
      richness_multiplier = 150000,
      richness_base = 10000,
      size_control_multiplier = -0.2,
      peaks =
      {
        {
          influence = 0.67,
          noise_layer = "spring-water",
          noise_octaves_difference = -2.7,
          noise_persistence = 0.3
        }
      }
    },
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__spring-water__/graphics/entity/spring-water/spring-water.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1
      }
    },
    map_color = {r=0.5, g=0.8, b=0.9},
    map_grid = false
  }
})
