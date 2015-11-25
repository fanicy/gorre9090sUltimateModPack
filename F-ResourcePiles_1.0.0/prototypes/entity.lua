data:extend(
{
	{
		type = "container",
		name = "stone-pile",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-1.8, -1.5}, {1.5, 1.5}},
		selection_box = {{-1.8, -1.5}, {1.5, 1.5}},
		minable = {hardness = 0.2, mining_time = 3, result = "stone-pile"},
		max_health = 450,
		drawing_position = {0.7, 0.12},
		icon = "__F-ResourcePiles__/graphics/stone-icon.png",
		inventory_size = 100,
		picture =
		{
			filename = "__F-ResourcePiles__/graphics/stone-pile.png",
			width = 150,
			height = 121,
			priority = "extra-high"
		}
	},
	{
		type = "container",
		name = "coal-pile",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-1.8, -1.5}, {1.5, 1.5}},
		selection_box = {{-1.8, -1.5}, {1.5, 1.5}},
		minable = {hardness = 0.2, mining_time = 3, result = "coal-pile"},
		max_health = 450,
		drawing_position = {0.7, 0.12},
		icon = "__F-ResourcePiles__/graphics/coal-icon.png",
		inventory_size = 100,
		picture =
		{
			filename = "__F-ResourcePiles__/graphics/coal-pile.png",
			width = 150,
			height = 121,
			priority = "extra-high"
		}
	},
	{
		type = "container",
		name = "iron-ore-pile",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-1.8, -1.5}, {1.5, 1.5}},
		selection_box = {{-1.8, -1.5}, {1.5, 1.5}},
		minable = {hardness = 0.2, mining_time = 3, result= "iron-ore-pile"},
		max_health = 450,
		drawing_position = {0.7, 0.12},
		icon = "__F-ResourcePiles__/graphics/iron-ore-icon.png",
		inventory_size = 100,
		picture =
		{
			filename = "__F-ResourcePiles__/graphics/iron-ore-pile.png",
			width = 150,
			height = 121,
			priority = "extra-high"
		}
	},
	{
		type = "container",
		name = "copper-ore-pile",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-1.8, -1.5}, {1.5, 1.5}},
		selection_box = {{-1.8, -1.5}, {1.5, 1.5}},
		minable = {hardness = 0.2, mining_time = 3, result = "copper-ore-pile"},
		max_health = 450,
		drawing_position = {0.7, 0.12},
		icon = "__F-ResourcePiles__/graphics/copper-ore-icon.png",
		inventory_size = 100,
		picture =
		{
			filename = "__F-ResourcePiles__/graphics/copper-ore-pile.png",
			width = 150,
			height = 121,
			priority = "extra-high"
		}
	},
	{
		type = "container",
		name = "mixed-resource-pile",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-1.8, -1.5}, {1.5, 1.5}},
		selection_box = {{-1.8, -1.5}, {1.5, 1.5}},
		minable = {hardness = 0.2, mining_time = 2.5, result = "mixed-resource-pile"},
		max_health = 400,
		drawing_position = {0.7, 0.12},
		icon = "__F-ResourcePiles__/graphics/mixed-resource-icon.png",
		inventory_size = 70,
		picture =
		{
			filename = "__F-ResourcePiles__/graphics/mixed-resource-pile.png",
			width = 150,
			height = 121,
			priority = "extra-high"
		}
	}
}
)