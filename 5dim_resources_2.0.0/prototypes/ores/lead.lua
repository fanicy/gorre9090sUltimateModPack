data:extend({
-- Item
	{
		type = "item",
		name = "5d-lead-dust",
		icon = "__5dim_resources__/graphics/icon/leaddust-ore.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "1",
		stack_size = 200
	},

--Recipe
	{
		type = "recipe",
		name = "5d-lead-plate-2",
		category = "smelting",
		energy_required = 3.5,
		ingredients = {{ "5d-lead-dust", 1}},
		result = "lead-plate"
	},
	{
		type = "recipe",
		name = "5d-lead-dust",
		enabled = "true",
		category = "mashering",
		energy_required = 3.5,
		ingredients = 
		{
			{"lead-ore",1}
		},
		result = "5d-lead-dust",
		result_count = 2,
	},
})