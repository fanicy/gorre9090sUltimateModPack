data:extend({
-- Item
	{
		type = "item",
		name = "5d-iron-dust",
		icon = "__5dim_resources__/graphics/icon/icon_5d_iron_dust.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "1",
		stack_size = 200
	},

--Recipe
	{
		type = "recipe",
		name = "5d-iron-plate",
		category = "smelting",
		energy_required = 3.5,
		ingredients = {{ "5d-iron-dust", 1}},
		result = "iron-plate"
	},
	{
		type = "recipe",
		name = "5d-iron-dust",
		enabled = "true",
		category = "mashering",
		energy_required = 3.5,
		ingredients = 
		{
			{"iron-ore",1}
		},
		result = "5d-iron-dust",
		result_count = 2,
	},

--Entity
})