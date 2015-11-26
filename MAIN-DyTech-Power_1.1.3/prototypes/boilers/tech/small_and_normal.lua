data:extend(
{
  {
    type = "technology",
    name = "boilers-1",
    icon = "__MAIN-DyTech-Power__/graphics/boilers/boiler2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "boiler-mk2"
      },
      {
        type = "unlock-recipe",
        recipe = "high-boiler-mk2"
      },
    },
    prerequisites = {"tin-processing", "rotor-1"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
      },
      time = 30
    },
    order = "b-2",
	upgrade = true,
  },
  {
    type = "technology",
    name = "boilers-2",
    icon = "__MAIN-DyTech-Power__/graphics/boilers/boiler2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "boiler-mk3"
      },
      {
        type = "unlock-recipe",
        recipe = "high-boiler-mk3"
      },
    },
    prerequisites = {"boilers-1", "lead-processing", "rotor-2"},
    unit =
    {
      count = 225,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 60
    },
    order = "b-3",
	upgrade = true,
  },
  {
    type = "technology",
    name = "boilers-3",
    icon = "__MAIN-DyTech-Power__/graphics/boilers/boiler2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "boiler-mk4"
      },
      {
        type = "unlock-recipe",
        recipe = "high-boiler-mk4"
      },
    },
    prerequisites = {"boilers-2", "steel-processing"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
      },
      time = 60
    },
    order = "b-4",
	upgrade = true,
  },
  {
    type = "technology",
    name = "boilers-4",
    icon = "__MAIN-DyTech-Power__/graphics/boilers/boiler2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "boiler-mk5"
      },
      {
        type = "unlock-recipe",
        recipe = "high-boiler-mk5"
      },
    },
    prerequisites = {"boilers-3", "zinc-processing", "rotor-3"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
      },
      time = 60
    },
    order = "b-5",
	upgrade = true,
  },
}
)