data:extend(
{

	{
		type = "recipe",
		name = "Evolution-armor-mk1",
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 2},
			{"alien-bioconstruct", 50},
		},
		result = "Evolution-armor-mk1",
		energy_required = 0.5,
	},

	{
		type = "recipe",
		name = "Evolution-armor-mk2",
		enabled = "false",
		ingredients =
		{
			{"Evolution-armor-mk1", 1},
			{"steel-plate", 2},
			{"alien-fragments", 50},
			{"endo-skeleton", 30},
		},
		result = "Evolution-armor-mk2",
		energy_required = 0.5,
	},
	{
		type = "recipe",
		name = "Evolution-armor-mk3",
		enabled = "false",
		ingredients =
		{
			{"Evolution-armor-mk2", 1},
			{"steel-plate", 10},
			{"alien-bioconstruct", 50},
			{"endo-skeleton", 40},
		},
		result = "Evolution-armor-mk3",
		energy_required = 2.5,
	},

	{
		type = "recipe",
		name = "Evolution-armor-mk4",
		enabled = "false",
		ingredients =
		{
			{"Evolution-armor-mk3", 1},
			{"exo-skeleton", 20},
			{"steel-plate", 15},
			{"alien-bioconstruct", 50},
			{"endo-skeleton", 30},
		},
		result = "Evolution-armor-mk4",
		energy_required = 5,
	},

	{
		type = "recipe",
		name = "Evolution-armor-mk5",
		enabled = "false",
		ingredients =
		{
			{"Evolution-armor-mk4", 1},
			{"exo-skeleton", 50},
			{"steel-plate", 20},
			{"alien-bioconstruct", 60},
			{"endo-skeleton", 35},
			{"alien-artifact", 40},
		},
		result = "Evolution-armor-mk5",
		energy_required = 10,
	},

})