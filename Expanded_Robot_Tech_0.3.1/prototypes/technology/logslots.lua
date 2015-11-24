data.raw["technology"]["character-logistic-slots-5"].unit = {count = 200,ingredients ={{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}, {"alien-science-pack", 1}}, time = 30}

data:extend({
  {
    type = "technology",
    name = "character-logistic-slots-6",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-5"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-d"
  }, 
  {
    type = "technology",
    name = "character-logistic-slots-7",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-6"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-d"
  }, 
  {
    type = "technology",
    name = "character-logistic-slots-8",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-7"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-d"
  }, 
  {
    type = "technology",
    name = "character-logistic-slots-9",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-8"},
    unit =
    {
      count = 500,
      ingredients =
	  {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-d"
  }, 
  {
    type = "technology",
    name = "character-logistic-slots-10",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-9"},
    unit =
    {
      count = 600,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-d"
  }, 
}
)