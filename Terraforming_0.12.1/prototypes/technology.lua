data:extend({
{
	type = "technology",
	name = "terraforming-1",
	icon = "__Terraforming__/graphics/technology/terraforming1.png",
	effects =
	{
		{
			type = "unlock-recipe",
			recipe = "bridge-builder",
		},
		{
			type = "unlock-recipe",
			recipe = "ford",
		},
	},
	prerequisites = {"electronics"},
	unit =
	{
		count = 20,
		ingredients =
		{
			{"science-pack-1", 1},
			{"science-pack-2", 1},
		},
		time = 10
	},
	order = "t-a"
},

{
	type = "technology",
	name = "terraforming-2",
	icon = "__Terraforming__/graphics/technology/terraforming2.png",
	effects =
	{
		{
			type = "unlock-recipe",
			recipe = "stone-bridge",
		},
		{
			type = "unlock-recipe",
			recipe = "concrete-bridge",
		},
		{
			type = "unlock-recipe",
			recipe = "moat-digger",
		},
		{
			type = "unlock-recipe",
			recipe = "moat",
		},
		{
			type = "unlock-recipe",
			recipe = "fill-water-barrel",
		},
		{
			type = "unlock-recipe",
			recipe = "empty-water-barrel",
		},
	},
	prerequisites = {"terraforming-1", "steel-processing", "fluid-handling"},
	unit =
	{
		count = 50,
		ingredients =
		{
			{"science-pack-1", 1},
			{"science-pack-2", 1},
		},
		time = 15
	},
	order = "t-b"
},

{
	type = "technology",
	name = "terraforming-3",
	icon = "__Terraforming__/graphics/technology/terraforming3.png",
	effects =
	{
		{
			type = "unlock-recipe",
			recipe = "stone-moat",
		},
		{
			type = "unlock-recipe",
			recipe = "concrete-moat",
		},
		{
			type = "unlock-recipe",
			recipe = "draw-bridge",
		},
		{
			type = "unlock-recipe",
			recipe = "rail-bridge",
		},
	},
	prerequisites = {"terraforming-2", "railway"},
	unit =
	{
		count = 100,
		ingredients =
		{
			{"science-pack-1", 1},
			{"science-pack-2", 1},
		},
		time = 20
	},
	order = "t-c"
},
  
})