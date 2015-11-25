data:extend(
{
  {
    type = "technology",
    name = "q2-class-weapons",
    icon = "__Q2Weapons__/graphics/technology/q2weaponsunlock.png",
    effects =
    {
       {
        type = "unlock-recipe",
        recipe = "q2-class-railgun"
      },
       {
        type = "unlock-recipe",
        recipe = "q2-rocket-launcher"
      },
       {
        type = "unlock-recipe",
        recipe = "q2-super-shotgun"
      },
       {
        type = "unlock-recipe",
        recipe = "q2-railgun-slugs"
      },
       {
        type = "unlock-recipe",
        recipe = "q2-rockets"
      },
       {
        type = "unlock-recipe",
        recipe = "q2-shotgun-shells"
      }



    },
    prerequisites = {"military-4"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 15
    },
    order = "e-c-b"
  }
})