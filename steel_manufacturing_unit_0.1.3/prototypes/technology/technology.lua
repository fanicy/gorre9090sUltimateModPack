data:extend({
  {
    type = "technology",
    name = "steel-manufacturing-unit",
    icon = "__steel_manufacturing_unit__/graphics/technology/steel-manufacturing-unit.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "steel-manufacturing-unit"
      },
    },
    prerequisites = {"automation-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
		{"science-pack-3", 1},
      },
      time = 30
    },
    order = "d-a-c",
  },
  }
  )
  