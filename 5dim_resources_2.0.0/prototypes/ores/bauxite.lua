data:extend({
-- Item
	{
		type = "item",
		name = "5d-aluminium-dust",
		icon = "__5dim_resources__/graphics/icon/bauxitedust-ore.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "1",
		stack_size = 200
	},

--Recipe
	{
		type = "recipe",
		name = "5d-aluminium-plate-2",
		category = "smelting",
		energy_required = 3.5,
		ingredients = {{ "5d-aluminium-dust", 1}},
		result = "aluminium-plate"
	},
	{
		type = "recipe",
		name = "5d-aluminium-dust",
		enabled = "true",
		category = "mashering",
		energy_required = 3.5,
		ingredients = 
		{
			{"bauxite-ore",1}
		},
		result = "5d-aluminium-dust",
		result_count = 2,
	},
})