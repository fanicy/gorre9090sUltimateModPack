data:extend(
{
	{
		type = "tool",
		name = "tenemut",
		icon = "__dark-matter-replicators__/graphics/icons/tenemut.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-resource",
		order = "f[tenemut]",
		stack_size = 200,
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount"
	},
	{
		type = "noise-layer",
		name = "tenemut"
	},
	{
		type = "autoplace-control",
		name = "tenemut",
		richness = true,
		order = "b-f"
	},
	{
		type = "resource",
		name = "tenemut",
		icon = "__dark-matter-replicators__/graphics/icons/tenemut.png",
		flags = {"placeable-neutral"},
		order="a-b-a",
		infinite = false,
		minimum = 50,
		normal = 200,
		minable =
	{
		hardness = 0.5,
		mining_particle = "tenemut-particle",
		mining_time = 2.5,
		result = "tenemut"
	},
	collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
	selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	autoplace =
	{
		control = "tenemut",
		sharpness = 1,
		max_probability = 0.2,
		richness_multiplier = 13000,
		richness_base = 750,
		size_control_multiplier = 0.02,
		peaks = {
			{
				influence = 0.2,
				starting_area_weight_optimal = 0,
				starting_area_weight_range = 0,
				starting_area_weight_max_range = 2,
			},
			{
				influence = 0.65,
				noise_layer = "tenemut",
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
				noise_octaves_difference = -2.3,
				noise_persistence = 0.45,
			},
		},
	},
	stage_counts = {1000, 600, 400, 200, 100, 50, 20, 1},
	stages =
	{
		sheet =
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut/tenemut.png",
			priority = "extra-high",
			width = 38,
			height = 38,
			frame_count = 4,
			variation_count = 8
		}
	},
	map_color = {r=0.550, g=0.392, b=0.550}
},
{
	type = "particle",
	name = "tenemut-particle",
	flags = {"not-on-map"},
	life_time = 180,
	pictures =
	{
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut-particle/tenemut-particle-1.png",
			priority = "extra-high",
			width = 5,
			height = 5,
			frame_count = 1
		},
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut-particle/tenemut-particle-2.png",
			priority = "extra-high",
			width = 6,
			height = 4,
			frame_count = 1
		},
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut-particle/tenemut-particle-3.png",
			priority = "extra-high",
			width = 7,
			height = 8,
			frame_count = 1
		},
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut-particle/tenemut-particle-4.png",
			priority = "extra-high",
			width = 6,
			height = 5,
			frame_count = 1
		}
	},
	shadows =
	{
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut-particle/tenemut-particle-shadow-1.png",
			priority = "extra-high",
			width = 5,
			height = 5,
			frame_count = 1
		},
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut-particle/tenemut-particle-shadow-2.png",
			priority = "extra-high",
			width = 6,
			height = 4,
			frame_count = 1
		},
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut-particle/tenemut-particle-shadow-3.png",
			priority = "extra-high",
			width = 7,
			height = 8,
			frame_count = 1
		},
		{
			filename = "__dark-matter-replicators__/graphics/entity/tenemut-particle/tenemut-particle-shadow-4.png",
			priority = "extra-high",
			width = 6,
			height = 5,
			frame_count = 1
		}
	}
},
})