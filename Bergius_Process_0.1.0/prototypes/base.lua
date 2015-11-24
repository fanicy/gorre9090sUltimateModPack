data:extend(
{
	{
	type = "fluid",
	name = "hydrogen-gas",
	default_temperature = 25,
	max_temperature = 100,
	heat_capacity = "0.1KJ",
	base_color = {r=0.7, g=0.7, b=0.7},
	flow_color = {r=0.7, g=0.7, b=0.7},
	icon = "__Bergius_Process__/graphics/hydrogen-gas.png",
	order = "hydrogen-gas",
	pressure_to_speed_ratio = 0.4,
	flow_to_energy_ratio = 0.6
	},



		{
			type = "fluid",
			name = "liquefied-coal",
			default_temperature = 25,
			max_temperature = 100,
			heat_capacity = "11.1KJ",
			base_color = {r=0, g=0, b=0},
			flow_color = {r=0.1, g=0.1, b=0.1},
			icon = "__base__/graphics/icons/fluid/crude-oil.png",
			order = "liquified-coal",
			pressure_to_speed_ratio = 0.4,
			flow_to_energy_ratio = 0.6
		},
	})
	

