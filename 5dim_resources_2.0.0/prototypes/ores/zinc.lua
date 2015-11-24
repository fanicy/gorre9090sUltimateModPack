data:extend({
-- Item
	{
		type = "item",
		name = "5d-zinc-dust",
		icon = "__5dim_resources__/graphics/icon/zincdust-ore.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "1",
		stack_size = 200
	},

--Recipe
	{
		type = "recipe",
		name = "5d-zinc-plate-2",
		category = "smelting",
		energy_required = 3.5,
		ingredients = {{ "5d-zinc-dust", 1}},
		result = "zinc-plate"
	},
	{
		type = "recipe",
		name = "5d-zinc-dust",
		enabled = "true",
		category = "mashering",
		energy_required = 3.5,
		ingredients = 
		{
			{"zinc-ore",1}
		},
		result = "5d-zinc-dust",
		result_count = 2,
	},
})