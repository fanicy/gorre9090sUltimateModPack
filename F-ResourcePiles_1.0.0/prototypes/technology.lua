data:extend(
{
	{
		type = "technology",
		name = "resource-piles",
		prerequisites = {"steel-processing", "logistics"},
		icon = "__F-ResourcePiles__/graphics/technology.png",
		unit =
		{
			count = 50,
			time = 25,
			ingredients = {{"science-pack-1", 1}}
		},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "stone-pile"
			},
			{
				type = "unlock-recipe",
				recipe = "coal-pile"
			},
			{
				type = "unlock-recipe",
				recipe = "iron-ore-pile"
			},
			{
				type = "unlock-recipe",
				recipe = "copper-ore-pile"
			},
			{
				type = "unlock-recipe",
				recipe = "mixed-resource-pile"
			}
		}
	}
}
)