data:extend(
{
  {
    type = "technology",
    name = "ldEB-electric-boiler",
    icon = "__LongElectricBoiler__/graphics/icons/electric-boiler.png",
    
    effects = 
    {
      {
        type = "unlock-recipe",
        recipe = "ldEB-electric-boiler"
      }
    },
    prerequisites = {"advanced-material-processing-2"},
    unit = {
      count = 30,
      ingredients = {{"science-pack-1", 1}},
      time = 10
    }
  }
}
)