data:extend(
{
  {
    type = "technology",
    name = "rail-logic-system",
    icon = "__RailLogicSystem__/graphics/tech.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rail-switch-lamp"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-signal-detector"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-station-controller"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-train-detector"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-cargo-reader"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-cargo-reader2"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-mode-controller"
      }
    },
    prerequisites = {"circuit-network","railway","rail-signals"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order = "a-d-d",
  }
})