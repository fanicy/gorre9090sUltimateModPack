data:extend(
{
  {
    type = "technology",
    name = "logistic-wagons",
    icon = "__5dim_trains__/resources/icons/wagon-passive-provider.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon-passive"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon-active"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon-storage"
      },
	  {
        type = "unlock-recipe",
        recipe = "cargo-wagon-requester"
      },
    },
    prerequisites = { "logistic-system"},
    unit = {
      count = 200,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "c-k-d-z",
  },
    {
    type = "technology",
    name = "powered-wagons",
    icon = "__5dim_trains__/resources/icons/wagon-roboport.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon-accumulator"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon-roboport"
      },
    },
    prerequisites = { "logistic-wagons", "electric-trains" },
    unit = {
      count = 300,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "c-k-d-z-a",
  },
  
  {
    type = "technology",
    name = "electric-trains",
    icon = "__5dim_trains__/resources/icons/electric-locomotive.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-locomotive"
      },
      {
        type = "unlock-recipe",
        recipe = "straight-power-rail"
      },
	  {
        type = "unlock-recipe",
        recipe = "curved-power-rail"
      },
    },
    prerequisites = {"rail-signals"},
    unit = {
      count = 200,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "c-g-c-z",
  },
  {
    type = "technology",
    name = "electric-trains-2",
    icon = "__5dim_trains__/resources/icons/electric-locomotive.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "5d-power-rail-water"
      },
      {
        type = "unlock-recipe",
        recipe = "5d-curved-power-rail-water"
      },
    },
    prerequisites = {"electric-trains", "railway-2"},
    unit = {
      count = 250,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "c-g-c-z",
  },
   {
    type = "technology",
    name = "battle-wagons",
    icon = "__5dim_trains__/resources/icons/wagon-laser-turret.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon-gun-turret"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon-laser-turret"
      },
    },
    prerequisites = { "electric-trains", "laser-turrets"},
    unit = {
      count = 200,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "c-k-d-z",
  },
  {
    type = "technology",
    name = "railway-2",
    icon = "__base__/graphics/technology/railway.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "5d-rail-water-curve"
      },
      {
        type = "unlock-recipe",
        recipe = "5d-rail-water"
      },
    },
    prerequisites = {"railway"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 20
    },
    order = "c-g-a",
  },
})