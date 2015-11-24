data:extend({
  {
    type = "technology",
    name = "Bergius-Process",
    icon = "__base__/graphics/technology/oil-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bergius-process"
      },
	  {
        type = "unlock-recipe",
        recipe = "water-electrolysis"
      },
	  {
        type = "unlock-recipe",
        recipe = "coal-liquefaction"
      },
	  
     
    },
    prerequisites = {"oil-processing"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
		{"science-pack-3", 1}
      },
      time = 30
    },
    order = "d-a-c",
  },
  }
  )
  