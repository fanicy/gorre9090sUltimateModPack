require("config.chests");

data:extend(
{
  ---------------------------------------------------------
  -- define our own rail category and segment here
  ---------------------------------------------------------
  {
    type = "rail-category",
    name = "ldLC-temporary"
  }
});

local temp_rail = util.table.deepcopy(data.raw["straight-rail"]["straight-rail"]);
temp_rail.name = "ldLC-temporary-rail";
temp_rail.flags = {"placeable-neutral", "player-creation", "placeable-off-grid"};
temp_rail.rail_category = "ldLC-temporary";
data:extend( { temp_rail } );

local function ldLC_make_box(chest_width, chest_height, border)
  local x = -0.5 * chest_width;
  local y = -0.5 * chest_height;
  if(chest_width % 2 == 0)
  then
    -- x = x + 1 - border;
  end
  if(chest_height % 2 == 0)
  then
    -- y = y + 0.5;
  end
  return {{x + border, y + border}, {x + chest_width - border, y + chest_height - border}};
end

local function ldLC_make_entities(chest_width, chest_height)
  ---------------------------------------------------------
  -- each chest is represented by two objects:
  --  - a cargo wagon, which is the actual product.
  --  - a chest (-obj suffix), which is a temporary object that is carried around.
  --  - when the temp object is placed, we will build a temp rail, place the wagon, and destroy the rail.
  --  - based on base.entities["cargo-wagon"], base.entities["steel-chest"]
  ---------------------------------------------------------
  local wagon = util.table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"]);
  local chest = util.table.deepcopy(data.raw["container"]["iron-chest"]);
  wagon.name = ldLC_make_chest_name(chest_width, chest_height);
  chest.name = wagon.name .. "-obj";
  wagon.icon = "__LongLargeChests__/graphics/icons/" .. wagon.name .. ".png";
  chest.icon = wagon.icon;
  wagon.minable = {mining_time = 1, result = chest.name };  -- mining a wagon results in a chest.
  chest.minable = {mining_time = 1, result = chest.name };
  -- overwrite wagon - specific stuff...
  wagon.weight = 20;
  wagon.joint_distance = 0.1;
  wagon.connection_distance = 0.1;
  wagon.rail_category = "ldLC-temporary";
  wagon.pictures =
    {
      priority = "very-low",
      width = 33 * chest_width,
      height = 34 * chest_height,
      axially_symmetrical = true,
      back_equals_front = true,
      direction_count = 1,
      filenames =
      {
        "__LongLargeChests__/graphics/entities/" .. wagon.name .. ".png"
      },
      line_length = 1,
      lines_per_file = 1,
      shift = {0, 0}
    };
  wagon.back_light = nil;
  wagon.stand_by_light = nil;
  wagon.collision_box = ldLC_make_box(chest_width, chest_height, 0.3);
  chest.collision_box = wagon.collision_box;
  wagon.selection_box = ldLC_make_box(chest_width, chest_height, 0.0);
  chest.selection_box = wagon.selection_box;
  wagon.inventory_size = chest_width * chest_height * 2;
  chest.inventory_size = wagon.inventory_size;
  chest.picture =
  {
    filename = "__LongLargeChests__/graphics/entities/" .. wagon.name .. ".png",
    priority = "extra-high",
    width = 33 * chest_width,
    height = 34 * chest_height
  };
  return { wagon, chest };
end

for k, dim in pairs(ldLC_chest_dimentions)
do
  local chest_set = ldLC_make_entities(dim[1], dim[2]);
  data:extend( chest_set );
end
