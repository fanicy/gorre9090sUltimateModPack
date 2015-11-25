data:extend(
{
  {
    type = "technology",
    name = "upgraded-electric-poles",
    icon = "__base__/graphics/technology/electric-energy-distribution.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "upgraded-small-electric-pole"
      },
      {
        type = "unlock-recipe",
        recipe = "upgraded-big-electric-pole"
      },
      {
        type = "unlock-recipe",
        recipe = "upgraded-medium-electric-pole"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-2", 1}},
      time = 5
    },
    order = "c-a"
  }
  }
  )