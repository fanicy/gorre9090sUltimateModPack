require("config.chests");

local function ldLC_make_recipes(chest_width, chest_height)
  local chest_name = ldLC_make_chest_name(chest_width, chest_height);
  local recipe =
  {
    type = "recipe",
    name = chest_name,
    ingredients = {
      {
        "iron-chest",
        chest_width * chest_height
      }
    },
    result = chest_name .. "-obj",
    enabled = false
  };
  return recipe;
end

for k, dim in pairs(ldLC_chest_dimentions)
do
  local chest = ldLC_make_recipes(dim[1], dim[2]);
  data:extend( { chest } );
end
