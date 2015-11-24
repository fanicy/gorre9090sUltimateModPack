data:extend({
	{
		type = "technology",
		name = "advanced-rocketry",
		icon = "__SupremeWarfare__/graphics/technology/advanced-rocketry.png",
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "sb-artillery-mk1"
			},
			{
				type = "unlock-recipe",
				recipe = "sb-heshell-mk1"
			}
		},
		prerequisites = SWVariables.technology.advanced_rocketry.prerequisites,
		unit = 
		{
			count = SWVariables.technology.advanced_rocketry.count,
			ingredients =SWVariables.technology.advanced_rocketry.ingredients,
			time = SWVariables.technology.advanced_rocketry.time
		}
	},
	{
		type = "technology",
		name = "artillery",
		icon = "__SupremeWarfare__/graphics/technology/artillery.png",
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "sb-artillery-mk2"
			},
			{
				type = "unlock-recipe",
				recipe = "sb-heshell-mk2"
			}
		},
		prerequisites = SWVariables.technology.artillery.prerequisites,
		unit = 
		{
			count = SWVariables.technology.artillery.count,
			ingredients =SWVariables.technology.artillery.ingredients,
			time = SWVariables.technology.artillery.time
		}
	},
	{
		type = "technology",
		name = "advanced-artillery",
		icon = "__SupremeWarfare__/graphics/technology/advanced-artillery.png",
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "sb-artillery-mk3"
			},
			{
				type = "unlock-recipe",
				recipe = "sb-heshell-mk3"
			}
		},
		prerequisites = SWVariables.technology.advanced_artillery.prerequisites,
		unit = 
		{
			count = SWVariables.technology.advanced_artillery.count,
			ingredients =SWVariables.technology.advanced_artillery.ingredients,
			time = SWVariables.technology.advanced_artillery.time
		}
	},
	{
		type = "technology",
		name = "supreme-warfare",
		icon = "__SupremeWarfare__/graphics/technology/supreme-warfare.png",
		effects = 
		{
		},
		prerequisites = SWVariables.technology.supreme_warfare.prerequisites,
		unit = 
		{
			count = SWVariables.technology.supreme_warfare.count,
			ingredients =SWVariables.technology.supreme_warfare.ingredients,
			time = SWVariables.technology.supreme_warfare.time
		}
	},
	{
		type = "technology",
		name = "supreme-artillery",
		icon = "__SupremeWarfare__/graphics/technology/supreme-artillery.png",
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "sb-artillery-mk4"
			},
			{
				type = "unlock-recipe",
				recipe = "sb-heshell-mk4"
			},
			{
				type = "unlock-recipe",
				recipe = "sb-target-capsule"
			}
		},
		prerequisites = SWVariables.technology.supreme_artillery.prerequisites,
		unit = 
		{
			count = SWVariables.technology.supreme_artillery.count,
			ingredients =SWVariables.technology.supreme_artillery.ingredients,
			time = SWVariables.technology.supreme_artillery.time
		}
	}
})
