data:extend({
  {
      type = "technology",
      name = "gh-treefarming",
      icon = "__greenhouse__/graphics/icon-sapling.png",
      effects =
      {
        {
            type = "unlock-recipe",
            recipe = "gh-sapling"
        },
        {
            type = "unlock-recipe",
            recipe = "gh-logs"
        },
        {
            type = "unlock-recipe",
            recipe = "gh-greenhouse"
        }
      },
      prerequisites = {"optics"},
      unit =
      {
        count = 20,
        ingredients =
        {
          {"science-pack-1", 1}
        },
        time = 20
      }
  }
})