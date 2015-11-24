data:extend(
{
	{
		type = "container",
		name = "item-destroyer",
		order = "m-a",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-2.4, -1.3}, {1.2, 0.9}},
		selection_box = {{-2.4, -1.3}, {1.2, 0.9}},
		minable = {hardness = 0.2, mining_time = 0.5, result = "item-destroyer"},
		max_health = 230,
		shift = {0,0.5},
		icon = "__F-ItemDestroyer__/graphics/icon-destroyer.png",
		inventory_size = 104,
		picture =
		{
			filename = "__F-ItemDestroyer__/graphics/item-destroyer.png",
			width = 150,
			height = 112,
			priority = "extra-high"
		}
	}
}
)