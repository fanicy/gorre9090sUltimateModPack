data:extend(
{
  {
    type = "technology",
    name = "equalizer-chests",
    icon = "__Equalizer_Chests__/graphics/icons/equalizer-chest.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "equalizer-chest"
      },
    },
    unit =
    {
      count = 30,
      ingredients = {
		{"science-pack-1", 1},
		{"science-pack-2", 1},
	  },
      time = 20
    },
    order = "c-a",
	prerequisites = {"advanced-electronics"}
  },
}
)