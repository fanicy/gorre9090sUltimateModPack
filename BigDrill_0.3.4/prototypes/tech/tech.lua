data:extend(
{
  {
    type = "technology",
    name = "bucket-wheel-excavator",
    icon = "__base__/graphics/icons/basic-mining-drill.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bucket-wheel-excavator"
      },
    },
    prerequisites = { "electric-engine", "logistics-3"},
    unit = {
      count = 80,
      ingredients = {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
		{"science-pack-3", 1}
      },
      time = 35
    },
    order = "c-g-b-z",
  },
  {
    type = "technology",
    name = "bucket-wheel-excavator-mk2",
    icon = "__BigDrill__/graphics/icons/bucketW-mk2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bucket-wheel-excavator-mk2"
      },
    },
    prerequisites = {"logistics-2", "bucket-wheel-excavator"},
    unit = {
      count = 40,
      ingredients = {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
		{"science-pack-3", 2}
      },
      time = 60
    },
    order = "c-g-b-z",
  },
  {
    type = "technology",
    name = "bucket-wheel-excavator-mk3",
    icon = "__BigDrill__/graphics/icons/bucketW-mk3.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bucket-wheel-excavator-mk3"
      },
    },
    prerequisites = {"logistics-3", "bucket-wheel-excavator-mk2"},
    unit = {
      count = 50,
      ingredients = {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
		{"science-pack-3", 2},
		{"alien-science-pack", 1}
      },
      time = 70
    },
    order = "c-g-b-z",
  },
  {
    type = "technology",
    name = "ore-unloader",
    icon = "__BigDrill__/graphics/icons/ore-unloader.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ore-unloader"
      },
    },
    prerequisites = {"logistics-2"},
    unit = {
      count = 20,
      ingredients = {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
		{"science-pack-3", 1}
      },
      time = 60
    },
    order = "c-g-b-z",
  },
  {
    type = "technology",
    name = "ore-unloader-mk2",
    icon = "__BigDrill__/graphics/icons/ore-unloader.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ore-unloader-mk2"
      },
    },
    prerequisites = {"logistics-2", "ore-unloader"},
    unit = {
      count = 40,
      ingredients = {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
		{"science-pack-3", 2}
      },
      time = 60
    },
    order = "c-g-b-z",
  },
  {
    type = "technology",
    name = "ore-unloader-mk3",
    icon = "__BigDrill__/graphics/icons/ore-unloader.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ore-unloader-mk3"
      },
    },
    prerequisites = {"logistics-3", "ore-unloader-mk2"},
    unit = {
      count = 50,
      ingredients = {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
		{"science-pack-3", 2},
		{"alien-science-pack", 1}
      },
      time = 70
    },
    order = "c-g-b-z",
  },
})