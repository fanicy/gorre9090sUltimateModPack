data:extend(
{

  {
    type = "recipe",
    name = "small-worm",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 2},
      {"alien-bioconstruct", 30},
      {"stone", 25},
    },
    result = "small-worm",
    energy_required = 2.5,
  },
  
  {
    type = "recipe",
    name = "medium-worm",
    enabled = "false",
    ingredients =
    {
      {"small-worm", 1},
      {"endo-skeleton", 1},
      {"stone", 50},
    },
    result = "medium-worm",
    energy_required = 3.5,
  },

  {
    type = "recipe",
    name = "big-worm",
    enabled = "false",
    ingredients =
    {
      {"medium-worm", 1},
      {"exo-skeleton", 1},
      {"stone", 100},
    },
    result = "big-worm",
    energy_required = 5,
  },

})