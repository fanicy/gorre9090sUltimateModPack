require("config.chests");

local function ldLC_make_effect(chest_width, chest_height)
  local chest_name = ldLC_make_chest_name(chest_width, chest_height);
  local effect =
  {
    type = "unlock-recipe",
    recipe = chest_name
  };
  return effect;
end

local function ldLC_make_effects()
  local effects = {};
  for k, dim in pairs(ldLC_chest_dimentions)
  do
    local effect = ldLC_make_effect(dim[1], dim[2]);
    table.insert(effects, effect);
  end
  return effects;
end

data:extend(
{
  {
    type = "technology",
    name = "large_chests",
    icon = "__LongLargeChests__/graphics/technology/large_chests.png",
    
    effects = ldLC_make_effects(),
    prerequisites = { },
    unit = {
      count = 30,
      ingredients = {{"science-pack-1", 1}},
      time = 10
    }
  }
}
)