data:extend({
{
    type = "technology",
    name = "character-logistic-trash-slots-3",
    icon = "__base__/graphics/technology/character-logistic-trash-slots.png",
    effects =
    {
      {
        type = "character-logistic-trash-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-trash-slots-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-f-b"
  },
  {
    type = "technology",
    name = "character-logistic-trash-slots-4",
    icon = "__base__/graphics/technology/character-logistic-trash-slots.png",
    effects =
    {
      {
        type = "character-logistic-trash-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-trash-slots-3"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-f-b"
  },
}
)
