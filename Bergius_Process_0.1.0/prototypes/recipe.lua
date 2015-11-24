data:extend(
{ 
  
  {
    type = "recipe",
    name = "bergius-process",
    energy_required = 12,
    enabled = "false",
	order = "a[oil-processing]-c[burgius-process]",
    category = "oil-processing",
    ingredients =
    {

		{type="fluid", name="heavy-oil", amount=2},
		{type="fluid", name="liquefied-coal", amount=10},

    },
      results=
    {
      {type="fluid", name="heavy-oil", amount=3},
      {type="fluid", name="light-oil", amount=2},
      {type="fluid", name="petroleum-gas", amount=1}
    },
	  main_product= "",
	  icon = "__Bergius_Process__/graphics/bergius-process.png",
    subgroup = "fluid-recipes"
	  },
	  
	  
	  {
    type = "recipe",
    name = "water-electrolysis",
    category = "chemistry",
    enabled = false,
    energy_required = 6,
    ingredients =
    {
      {type="fluid", name="water", amount=1},
    },
    results=
    {
      {type="fluid", name="hydrogen-gas", amount=0.65}
    },
    main_product= "",
    icon = "__Bergius_Process__/graphics/hydrogen-gas.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-g"
  },
  
    {
    type = "recipe",
    name = "coal-liquefaction",
	category = "chemistry",
    enabled = false,
    energy_required = 12,
    ingredients =
    {
      {type="fluid", name="hydrogen-gas", amount=5},
	  {type="item", name="coal", amount=5}
    },
    results=
    {
      {type="fluid", name="liquefied-coal", amount=5}
    },
    main_product= "",
    icon = "__Bergius_Process__/graphics/liquefied-coal.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-h"
  },
}
)