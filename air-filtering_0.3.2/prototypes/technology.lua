data:extend({
  {
    type = "technology",
    name = "air-filtering",
    icon = "__air-filtering__/graphics/technology/air-filtering.png",
    prerequisites = {"plastics", "steel-processing", "advanced-electronics"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "air-filter-machine"
      },
      {
        type = "unlock-recipe",
        recipe = "filter-air"
      },
      {
        type = "unlock-recipe",
        recipe = "air-filter"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "d-a-a"
  },
  {
    type = "technology",
    name = "air-filtering-mk2",
    icon = "__air-filtering__/graphics/technology/air-filtering.png",
    prerequisites = {"air-filtering"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "air-filter-machine-mk2"
      }
    },
    unit =
    {
      count = 300,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    order = "d-a-a"
  },
  {
    type = "technology",
    name = "air-filtering-mk3",
    icon = "__air-filtering__/graphics/technology/air-filtering.png",
    prerequisites = {"air-filtering-mk2"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "air-filter-machine-mk3"
      }
    },
    unit =
    {
      count = 500,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 2},
        {"alien-science-pack", 1}
      },
      time = 60
    },
    order = "d-a-a"
  },
  {
    type = "technology",
    name = "air-filter-recycling",
    icon = "__air-filtering__/graphics/technology/air-filter-recycling.png",
    prerequisites = {"air-filtering"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "air-filter-recycling"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 20
    },
    order = "d-a-a"
  }
})
