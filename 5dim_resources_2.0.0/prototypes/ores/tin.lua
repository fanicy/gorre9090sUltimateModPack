data:extend({
-- Item
	{
		type = "item",
		name = "5d-tin-dust",
		icon = "__5dim_resources__/graphics/icon/tindust-ore.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "1",
		stack_size = 200
	},

--Recipe
	{
		type = "recipe",
		name = "5d-tin-plate-2",
		category = "smelting",
		energy_required = 3.5,
		ingredients = {{ "5d-tin-dust", 1}},
		result = "tin-plate"
	},
	{
		type = "recipe",
		name = "5d-tin-dust",
		enabled = "true",
		category = "mashering",
		energy_required = 3.5,
		ingredients = 
		{
			{"tin-ore",1}
		},
		result = "5d-tin-dust",
		result_count = 2,
	},
})