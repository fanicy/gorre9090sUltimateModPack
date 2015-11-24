data:extend(
{
  {
    type = "recipe",
    name = "biter-spawner",
    category = "chemistry",
    enabled = "false",
    ingredients =
    {
      {"exo-skeleton", 10},
      {"steel-plate", 2},
      {"alien-bioconstruct", 30},
      {"endo-skeleton", 15},
      {type="fluid", name="sulfuric-acid", amount=10},
    },
    result = "biter-spawner",
    energy_required = 5,
  },
  
  {
    type = "recipe",
    name = "spitter-spawner",
    enabled = "false",
	category = "chemistry",
    ingredients =
    {
      {"exo-skeleton", 20},
      {"steel-plate", 3},
      {"alien-bioconstruct", 40},
      {"endo-skeleton", 15},
      {type="fluid", name="sulfuric-acid", amount=60},
    },
    result = "spitter-spawner",
    energy_required = 5,
  },
})