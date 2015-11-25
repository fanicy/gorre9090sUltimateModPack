data:extend{
  { type = "technology", name = "faster-crafting-1",
    icon = "__base__/graphics/icons/repair-pack.png",
    effects = {},
    prerequisites = {"toolbelt","automation","research-effectivity-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-m-d"
  },
  { type = "technology", name = "faster-crafting-2",
    icon = "__base__/graphics/icons/repair-pack.png",
    effects = {},
    prerequisites = {"faster-crafting-1","automation-2","research-effectivity-2"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 45
    },
	upgrade = "true",
    order = "c-m-d"
  },
  { type = "technology", name = "faster-crafting-3",
    icon = "__base__/graphics/icons/repair-pack.png",
    effects = {},
    prerequisites = {"faster-crafting-2","automation-3","research-effectivity-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
      },
      time = 60
    },
	upgrade = "true",
    order = "c-m-d"
  },
  { type = "technology", name = "faster-crafting-4",
    icon = "__base__/graphics/icons/repair-pack.png",
    effects = {},
    prerequisites = {"faster-crafting-3","research-effectivity-4","power-armor"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 4},
        {"science-pack-2", 3},
        {"science-pack-3", 2},
        {"alien-science-pack", 1},
      },
      time = 75
    },
	upgrade = "true",
    order = "c-m-d"
  },
  { type = "technology", name = "faster-crafting-5",
    icon = "__base__/graphics/icons/repair-pack.png",
    effects = {},
    prerequisites = {"faster-crafting-4","power-armor-2"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 5},
        {"science-pack-2", 3},
        {"science-pack-3", 2},
        {"alien-science-pack", 1},
      },
      time = 90
    },
	upgrade = "true",
    order = "c-m-d"
  },
}