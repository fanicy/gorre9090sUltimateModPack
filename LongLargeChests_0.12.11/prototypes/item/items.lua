require("config.chests");

data:extend(
{
  ---------------------------------------------------------
  -- the temporary rail segment used to place the wagon part.
  --  - based on base.item["straight-rail"]
  ---------------------------------------------------------
  {
    type = "item",
    name = "ldLC-temporary-rail",
    icon = "__base__/graphics/icons/straight-rail.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-a[temporary-rail]",
    place_result = "ldLC-temporary-rail",
    stack_size = 100
  }
});

local function ldLC_make_items(chest_width, chest_height)
  ---------------------------------------------------------
  -- each chest is represented by two objects:
  --  - a cargo wagon, which is the actual product.
  --  - a chest (-obj suffix), which is a temporary object that is carried around.
  --  - when the temp object is placed, we will build a temp rail, place the wagon, and destroy the rail.
  --  - based on base.item["steel-chest"]
  ---------------------------------------------------------
  local chest_name = ldLC_make_chest_name(chest_width, chest_height);
  local wagon = {
    type = "item",
    name = chest_name;
    icon = "__LongLargeChests__/graphics/icons/" .. chest_name .. ".png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "storage",
    order = "a[items]-c[" .. chest_name .. "]",
    place_result = chest_name,
    stack_size = 50
  };
  local chest = {
    type = "item",
    name = chest_name .. "-obj",
    icon = "__LongLargeChests__/graphics/icons/" .. chest_name .. ".png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-c[" .. chest_name .. "-obj]",
    place_result = chest_name .. "-obj",
    stack_size = 50
  };
  return { wagon, chest };
end

for k, dim in pairs(ldLC_chest_dimentions)
do
  local chest_set = ldLC_make_items(dim[1], dim[2]);
  data:extend( chest_set );
end
