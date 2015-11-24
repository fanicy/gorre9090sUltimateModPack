data:extend(
{
  {
    type = "technology",
    name = "energy-receiver",
    icon = "__base__/graphics/technology/laser.png",
    prerequisites = {"laser", "rocket-silo"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "energy-receiver"
      }
    },
    unit =
    {
      count = 140,
      ingredients = {{"science-pack-1", 2}, {"science-pack-2", 2}, {"science-pack-3", 2}, {"alien-science-pack", 2}},
      time = 40
    },
    order = "d-a-a"
  }, 
})