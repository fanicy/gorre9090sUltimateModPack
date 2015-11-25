
data:extend(
{
  {
    type = "item",
    name = "alien-artifacts",
    icon = "__Evolution__/graphics/icons/alien-artifacts.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "f[alien-artifacts]",
    stack_size = 50
  },
  {
    type = "noise-layer",
    name = "alien-artifacts"
  },
  {
    type = "autoplace-control",
    name = "alien-artifacts",
    richness = true,
    order = "b-f"
  },
  {
    type = "resource",
    name = "alien-artifacts",
    icon = "__Evolution__/graphics/icons/alien-artifacts.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    infinite = true,
    minimum = 10,
    normal = 100,

    minable =
    {
      hardness = 0.9,
      mining_particle = "copper-ore-particle",
      mining_time = 2,
      result = "alien-artifacts"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      control = "alien-artifacts",
      sharpness = 1,
      richness_multiplier = 1500,
      richness_base = 50,
      size_control_multiplier = 0.06,
      peaks = {
        {
          influence = 0.2,
          starting_area_weight_optimal = 0,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.2,
          noise_layer = "alien-artifacts",
          noise_octaves_difference = -1.9,
          noise_persistence = 0.3,
          starting_area_weight_optimal = 0,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.3,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.55,
          noise_layer = "alien-artifacts",
          noise_octaves_difference = -2.3,
          noise_persistence = 0.4,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = -0.2,
          max_influence = 0,
          noise_layer = "iron-ore",
          noise_octaves_difference = -2.3,
          noise_persistence = 0.45,
        },
        {
          influence = -0.2,
          max_influence = 0,
          noise_layer = "coal",
          noise_octaves_difference = -2.3,
          noise_persistence = 0.45,
        },
        {
          influence = -0.2,
          max_influence = 0,
          noise_layer = "stone",
          noise_octaves_difference = -3,
          noise_persistence = 0.45,
        },
      },
    },
    stage_counts = {1000, 600, 400, 200, 100, 50, 20, 1},
    stages =
	{
		sheet = 
		{
			filename = "__Evolution__/graphics/entity/alien-artifacts/alien-artifacts.png",
		priority = "extra-high",
		width = 38,
		height = 38,
		frame_count = 4,
		variation_count = 8
		},
    },
    map_color = {r=0.128, g=0.26, b=0.188}
  },
})
