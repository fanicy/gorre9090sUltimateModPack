data:extend({

{
	type = "recipe",
	name = "bridge-builder",
	category = "crafting",
	enabled = false,
	energy_required = 5,
	ingredients = 
	{
		{"steel-plate", 4},
		{"electronic-circuit", 2},
	},
	result = "bridge-builder",
	result_count = 1,
},

{
	type = "recipe",
	name = "ford",
	category = "terraforming",
	enabled = false,
	energy_required = 4,
	ingredients = 
	{
		{"raw-wood", 3},
		{"stone", 5},
	},
	result = "ford",
	result_count = 1,
},

{
	type = "recipe",
	name = "stone-bridge",
	category = "terraforming",
	enabled = false,
	energy_required = 7,
	ingredients = 
	{
		{"wood", 3},
		{"stone-brick", 5},
	},
	result = "stone-bridge",
	result_count = 1,
},

{
	type = "recipe",
	name = "concrete-bridge",
	category = "terraforming",
	enabled = false,
	energy_required = 10,
	ingredients = 
	{
		{"iron-plate", 3},
		{"concrete", 5},
	},
	result = "concrete-bridge",
	result_count = 1,
},

{
	type = "recipe",
	name = "moat-digger",
	category = "crafting",
	enabled = false,
	energy_required = 5,
	ingredients = 
	{
		{"steel-axe", 3},
		{"steel-plate", 2},
		{"empty-barrel", 2},
	},
	result = "moat-digger",
	result_count = 1,
},

{
	type = "recipe",
	name = "moat",
	category = "digging",
	enabled = false,
	energy_required = 4,
	ingredients = 
	{
		{"wood", 1},
		{"stone", 1},
		{"water-barrel", 1}
	},
	-- NB: For multiple results, must name the icon, group & subgroup as well
	icon = "__Terraforming__/graphics/icon/moat.png",
	group = "terraforming", 
	subgroup = "features",
	results=
	{
		{type="item", name="empty-barrel", amount=1}, -- NB: Barrel must be first result for it to be retained!
		{type="item", name="moat", amount=1},
	},
},

{
	type = "recipe",
	name = "stone-moat",
	category = "digging",
	enabled = false,
	energy_required = 7,
	ingredients = 
	{
		{"iron-axe", 1},
		{"wood", 3},
		{"stone-brick", 3},
		{"water-barrel", 1}
	},
	-- NB: For multiple results, must name the icon, group & subgroup as well
	icon = "__Terraforming__/graphics/icon/stone-moat.png",
	group = "terraforming", 
	subgroup = "features",
	results=
	{
		{type="item", name="empty-barrel", amount=1}, -- NB: Barrel must be first result for it to be retained!
		{type="item", name="stone-moat", amount=1},
	},
},

{
	type = "recipe",
	name = "concrete-moat",
	category = "digging",
	enabled = false,
	energy_required = 10,
	ingredients = 
	{
		{"iron-axe", 1},
		{"iron-plate", 3},
		{"concrete", 3},
		{"water-barrel", 1}
	},
	-- NB: No barrel back for a concrete moat!!
	result = "concrete-moat",
	result_count = 1,
},

{
	type = "recipe",
	name = "fill-water-barrel",
	category = "crafting-with-fluid",
	energy_required = 1,
	subgroup = "water-barrel",
	order = "c[water-barrel]-a[fill]",
	enabled = false,
	icon = "__Terraforming__/graphics/icon/fill-water-barrel.png",
	ingredients =
	{
		{type="fluid", name="water", amount=25},
		{type="item", name="empty-barrel", amount=1},
	},
	results=
	{
		{type="item", name="water-barrel", amount=1}
	}
},

{
	type = "recipe",
	name = "empty-water-barrel",
	category = "crafting-with-fluid",
	energy_required = 1,
	subgroup = "water-barrel",
	order = "c[water-barrel]-b[empty]",
	enabled = false,
	icon = "__Terraforming__/graphics/icon/empty-water-barrel.png",
	ingredients =
	{
		{type="item", name="water-barrel", amount=1}
	},
	results=
	{
		{type="fluid", name="water", amount=25},
		{type="item", name="empty-barrel", amount=1},
	}
},

{
	type = "recipe",
	name = "draw-bridge",
	category = "crafting",
	enabled = false,
	energy_required = 5,
	ingredients = 
	{
		{"gate", 2},
		{"steel-plate", 2},
		{"concrete", 3},
	},
	result = "draw-bridge",
	result_count = 1,
},

{
	type = "recipe",
	name = "rail-bridge",
	category = "crafting",
	enabled = false,
	energy_required = 10,
	ingredients = 
	{
		{"gate", 2},
		{"straight-rail", 2},
		{"concrete", 3},
	},
	result = "rail-bridge",
	result_count = 1,
},

})