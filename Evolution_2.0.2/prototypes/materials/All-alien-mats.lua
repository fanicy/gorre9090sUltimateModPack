data:extend({
  {
    type = "recipe",
    name = "alien-bioconstruct",
	icon = '__Evolution__/graphics/icons/alien-bioconstruct.png',
	flags = {"goes-to-main-inventory"},
    subgroup = "materials",
    order = "a[alien-bioconstruct]-a",
    category = "smelting",
    enabled = "true",
    energy_required = 10.5,
    ingredients = {{"alien-artifacts", 1}},
    result = "alien-bioconstruct"
  },
  
    {
    type = "tool",
    name = "alien-bioconstruct",
    icon = "__Evolution__/graphics/icons/alien-bioconstruct.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "materials",
    order = "a[exo-skeleton]-a",
    stack_size = 50,
	durability = 1,
  },

  {
      type = "recipe",
      name = "alien-fragments",
      enabled = "false",
      ingredients = {
        {'alien-bioconstruct', 1},
        {'iron-plate', 1}
      },
      result = "alien-fragments"
  },
  
  {
    type = "tool",
    name = "alien-fragments",
    icon = "__Evolution__/graphics/icons/alien-fragments.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "materials",
    order = "a[exo-skeleton]-a",
    stack_size = 50,
	durability = 1,
  },

  {
      type = "recipe",
      name = "endo-skeleton",
      enabled = "false",
      ingredients = {
        {'alien-bioconstruct', 2},
        {'steel-plate', 3},
		{'alien-fragments', 1}
      },
      result = "endo-skeleton"
  },
  
  {
    type = "tool",
    name = "endo-skeleton",
    icon = "__Evolution__/graphics/icons/endo-skeleton.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "materials",
    order = "a[exo-skeleton]-b",
    stack_size = 50,
	durability = 1,
  },
  
  {
      type = "recipe",
      name = "exo-skeleton",
      enabled = "false",
      ingredients = {
        {'endo-skeleton', 1},
        {'alien-fragments', 2}
      },
      result = "exo-skeleton"
  },

  {
    type = "tool",
    name = "exo-skeleton",
    icon = "__Evolution__/graphics/icons/exo-skeleton.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "materials",
    order = "a[exo-skeleton]-c",
    stack_size = 50,
	durability = 1,
  },



})