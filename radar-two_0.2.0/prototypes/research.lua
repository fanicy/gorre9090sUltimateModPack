data:extend{
	{type = "technology",name="advanced-radar",
	icon = "__radar-two__/graphics/icons/radar64.png",
	effects = 
	{
		{type = "unlock-recipe", recipe = "radar-2" },
	},
	prerequisites = {"military", "optics"},
	unit = 
	{
     count = 20,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
 	},
	order = "e-[radar]-a",
	},
	{type = "technology",name="advanced-radar-2",
	icon = "__radar-two__/graphics/icons/radar64.png",
	effects = 
	{
		{type = "unlock-recipe", recipe = "tactical-radar" },
		{type = "unlock-recipe", recipe = "scouting-radar" },
	},
	prerequisites = {"advanced-radar"},
	upgrade = "true",
	unit = 
	{
     count = 40,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"science-pack-3", 1}
      },
      time = 60
 	},
	order = "a-[radar]-b",
	},
	{type = "technology",name="advanced-radar-3",
	icon = "__radar-two__/graphics/icons/radar64.png",
	effects = 
	{
		{type = "unlock-recipe", recipe = "tactical-radar-2" },
		{type = "unlock-recipe", recipe = "scouting-radar-2" },
	},
	prerequisites = {"advanced-radar-2"},
	upgrade = "true",
	unit = 
	{
     count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 45
 	},
	order = "a-[radar]-c",
	},
}