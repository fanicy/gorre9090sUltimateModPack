table.insert(data.raw["technology"]["laser-turrets"].effects,{type = "unlock-recipe",recipe = "laser-turret-2"})
table.insert(data.raw["technology"]["laser-turrets"].effects,{type = "unlock-recipe",recipe = "laser-turret-3"})

data:extend(
{
  
  {
    type = "technology",
    name = "laser-turrets-1",
    icon = "__base__/graphics/technology/laser-turrets.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-turret-4"
      },
	  {
        type = "unlock-recipe",
        recipe = "laser-turret-5"
      },
	  {
        type = "unlock-recipe",
        recipe = "laser-turret-6"
      },
    },
    prerequisites = {"laser-turrets", "gold-processing", "zinc-processing", "silver-processing"},
    unit =
    {
      count = 450,
      ingredients =
      {
	    {"science-pack-1", 1}, 
		{"science-pack-2", 1}, 
		{"science-pack-3", 1}
      },
      time = 30
    },
    order = "l-t-1",
	upgrade = true,
  },
  {
    type = "technology",
    name = "laser-turrets-2",
    icon = "__base__/graphics/technology/laser-turrets.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-turret-7"
      },
	  {
        type = "unlock-recipe",
        recipe = "laser-turret-8"
      },
	  {
        type = "unlock-recipe",
        recipe = "laser-turret-9"
      },
    },
    prerequisites = {"laser-turrets-1", "lead-processing", "cobalt-processing", "tungsten-processing", "ardite-processing"},
    unit =
    {
      count = 550,
      ingredients =
      {
	    {"science-pack-1", 2}, 
		{"science-pack-2", 1}, 
		{"science-pack-3", 1},
		{"alien-science-pack", 1},
      },
      time = 30
    },
    order = "l-t-2",
	upgrade = true,
  },
  {
    type = "technology",
    name = "laser-turrets-3",
    icon = "__base__/graphics/technology/laser-turrets.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-turret-sniper-1"
      },
	  {
        type = "unlock-recipe",
        recipe = "laser-turret-sniper-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "laser-turret-sniper-3"
      },
    },
    prerequisites = {"laser-turrets-1"},
    unit =
    {
      count = 1000,
      ingredients =
      {
	    {"science-pack-1", 3}, 
		{"science-pack-2", 2}, 
		{"science-pack-3", 1},
		{"alien-science-pack", 1},
      },
      time = 30
    },
    order = "l-t-3",
	upgrade = true,
  },
  {
    type = "technology",
    name = "laser-turrets-4",
    icon = "__base__/graphics/technology/laser-turrets.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-turret-diamond-1"
      },
	  {
        type = "unlock-recipe",
        recipe = "laser-turret-diamond-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "laser-turret-diamond-3"
      },
    },
    prerequisites = {"laser-turrets-3"},
    unit =
    {
      count = 5000,
      ingredients =
      {
	    {"science-pack-1", 3}, 
		{"science-pack-2", 2}, 
		{"science-pack-3", 1},
		{"alien-science-pack", 1},
      },
      time = 30
    },
    order = "l-t-3",
	upgrade = true,
  },
}
)