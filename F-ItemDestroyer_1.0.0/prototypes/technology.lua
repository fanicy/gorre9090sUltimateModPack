data:extend(
{
	{
		type = "technology",
		name = "item-destroyer",
		prerequisites = {"alien-technology"},
		icon = "__F-ItemDestroyer__/graphics/technology.png",
		unit =
		{
			count = 300,
			time = 35,
			ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"alien-science-pack", 3}}
		},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "black-hole"
			},
			{
				type = "unlock-recipe",
				recipe = "item-destroyer"
			}
		}
	}
}
)