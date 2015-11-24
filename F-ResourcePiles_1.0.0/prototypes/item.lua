data:extend(
{
	{
		type = "item",
		subgroup = "intermediate-product",
		name = "waste",
		order = "b-c-a",
		stack_size = 1,
		fuel_value = "500kJ",
		flags = { "goes-to-main-inventory" },
		icon = "__F-ResourcePiles__/graphics/waste.png"
	},
	{
		type = "item",
		subgroup = "storage",
		name = "stone-pile",
		order = "b-b-a",
		place_result = "stone-pile",
		stack_size = 10,
		flags = { "goes-to-quickbar" },
		icon = "__F-ResourcePiles__/graphics/stone-icon.png"
	},
	{
		type = "item",
		subgroup = "storage",
		name = "coal-pile",
		order = "b-b-b",
		place_result = "coal-pile",
		stack_size = 10,
		flags = { "goes-to-quickbar" },
		icon = "__F-ResourcePiles__/graphics/coal-icon.png"
	},
	{
		type = "item",
		subgroup = "storage",
		name = "iron-ore-pile",
		order = "b-b-c",
		place_result = "iron-ore-pile",
		stack_size = 10,
		flags = { "goes-to-quickbar" },
		icon = "__F-ResourcePiles__/graphics/iron-ore-icon.png"
	},
	{
		type = "item",
		subgroup = "storage",
		name = "copper-ore-pile",
		order = "b-b-d",
		place_result = "copper-ore-pile",
		stack_size = 10,
		flags = { "goes-to-quickbar" },
		icon = "__F-ResourcePiles__/graphics/copper-ore-icon.png"
	},
	{
		type = "item",
		subgroup = "storage",
		name = "mixed-resource-pile",
		order = "b-b-e",
		place_result = "mixed-resource-pile",
		stack_size = 10,
		flags = { "goes-to-quickbar" },
		icon = "__F-ResourcePiles__/graphics/mixed-resource-icon.png"
	}
}
)