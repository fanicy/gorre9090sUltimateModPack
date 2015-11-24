data.raw["technology"]["logistic-robot-speed-2"].effects = {{type = "logistic-robot-speed", modifier = 0.42}}
data.raw["technology"]["logistic-robot-speed-3"].effects = {{type = "logistic-robot-speed", modifier = 0.50}}
data.raw["technology"]["logistic-robot-speed-4"].effects = {{type = "logistic-robot-speed", modifier = 0.60}}
data.raw["technology"]["logistic-robot-speed-5"].effects = {{type = "logistic-robot-speed", modifier = 0.72}}

data:extend(
{
	  {
    type = "technology",
    name = "logistic-robot-speed-6",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.87"
      }
    },
    prerequisites = {
      "logistic-robot-speed-5"
    },
    unit = {
      count = 650,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
		{"alien-science-pack", 1},
      },
      time = 60
    },
    upgrade = "true",
    order = "c-k-f-a",
  },
  {
    type = "technology",
    name = "logistic-robot-speed-7",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "1.04"
      }
    },
    prerequisites = {
      "logistic-robot-speed-6"
    },
    unit = {
      count = 800,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
		{"alien-science-pack", 1},
      },
      time = 60
    },
    upgrade = "true",
    order = "c-k-f-a",
  },
  {
    type = "technology",
    name = "logistic-robot-speed-8",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "1.25"
      }
    },
    prerequisites = {
      "logistic-robot-speed-7"
    },
    unit = {
      count = 950,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
		{"alien-science-pack", 1},
      },
      time = 60
    },
    upgrade = "true",
    order = "c-k-f-a",
  },
  {
    type = "technology",
    name = "logistic-robot-speed-9",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "1.50"
      }
    },
    prerequisites = {
      "logistic-robot-speed-8"
    },
    unit = {
      count = 1100,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
		{"alien-science-pack", 1},
      },
      time = 60
    },
    upgrade = "true",
    order = "c-k-f-a",
  },
  {
    type = "technology",
    name = "logistic-robot-speed-10",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "1.81"
      }
    },
    prerequisites = {
      "logistic-robot-speed-9"
    },
    unit = {
      count = 1250,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
		{"alien-science-pack", 1},
      },
      time = 60
    },
    upgrade = "true",
    order = "c-k-f-a",
  },
}  
  )