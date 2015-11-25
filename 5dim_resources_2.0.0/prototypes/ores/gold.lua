data:extend({
-- Item
	{
		type = "item",
		name = "5d-gold-dust",
		icon = "__5dim_resources__/graphics/icon/golddust-ore.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "1",
		stack_size = 200
	},

--Recipe
	{
		type = "recipe",
		name = "5d-gold-plate-2",
		category = "smelting",
		energy_required = 3.5,
		ingredients = {{ "5d-gold-dust", 1}},
		result = "gold-plate"
	},
	{
		type = "recipe",
		name = "5d-gold-dust",
		enabled = "true",
		category = "mashering",
		energy_required = 3.5,
		ingredients = 
		{
			{"gold-ore",1}
		},
		result = "5d-gold-dust",
	},
})