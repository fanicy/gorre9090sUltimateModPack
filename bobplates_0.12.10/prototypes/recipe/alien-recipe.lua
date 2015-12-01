data:extend(
{ 
  {
    type = "recipe",
    name = "alien-blue-alloy",
    category = "mixing-furnace",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type = "item", name = "alien-artifact-blue", amount = 1},
      {type = "item", name = "tungsten-plate", amount = 10},
    },
    result = "alien-blue-alloy",
    result_count = 10,
  },

  {
    type = "recipe",
    name = "alien-orange-alloy",
    category = "mixing-furnace",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type = "item", name = "alien-artifact-orange", amount = 1},
      {type = "item", name = "steel-plate", amount = 10},
    },
    result = "alien-orange-alloy",
    result_count = 10,
  },

  {
    type = "recipe",
    name = "alien-acid",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "alien-artifact-purple", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 10},
    },
    results =
    {
      {type = "fluid", name = "alien-acid", amount = 10},
    },
    main_product= "alien-acid",
  },

  {
    type = "recipe",
    name = "alien-explosive",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "alien-artifact-yellow", amount = 1},
      {type = "item", name = "coal", amount = 8},
      {type = "item", name = "sulfur", amount = 8},
    },
    results =
    {
      {type = "fluid", name = "alien-explosive", amount = 10},
    },
    main_product= "alien-explosive",
  },

  {
    type = "recipe",
    name = "alien-poison",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "alien-artifact-green", amount = 1},
      {type = "item", name = "coal", amount = 8},
      {type = "fluid", name = "nitric-acid", amount = 8},
    },
    results =
    {
      {type = "fluid", name = "alien-poison", amount = 10},
    },
    main_product= "alien-poison",
  },

  {
    type = "recipe",
    name = "alien-fire",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "alien-artifact-red", amount = 1},
      {type = "fluid", name = "heavy-oil", amount = 8},
      {type = "fluid", name = "light-oil", amount = 8},
    },
    results =
    {
      {type = "fluid", name = "alien-fire", amount = 10},
    },
    main_product= "alien-fire",
  },
}
)

