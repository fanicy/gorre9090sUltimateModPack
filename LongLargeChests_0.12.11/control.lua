require "defines"
require "util"
require("config.chests");
require "utils.ldUtils";

--[[ 
Everything will be prefixed by ldLC_
--]]

-----------------------------------------------------------
-- the chests' names
-----------------------------------------------------------
local ldLC_chest_names = { };
for k, dim in pairs(ldLC_chest_dimentions)
do
  local chest_name = ldLC_make_chest_name(dim[1], dim[2]);
  table.insert(ldLC_chest_names, chest_name .. "-obj");
end

-----------------------------------------------------------
-- utility functions
-- return the current player object.
-----------------------------------------------------------
local function ldLC_getPlayer(event)
  -- multiplayer
  --[[
  if(nil ~= event and nil ~= event.player_index) then
    ldUtils_debugMsg("event.player_index = " .. event.player_index);
  else
    ldUtils_debugMsg("event.player_index = nil");
  end
  --]]
  if(event ~= nil and event.player_index ~= nil and event.player_index > 0 and game.players[event.player_index] ~= nil)
  then
    return game.players[event.player_index];
  end;
  if(#game.players > 1)
  then
    for index, player in pairs(game.players) do
      if(player.valid) then
        return player;
      end;
    end
  end
  return game.player;
end;

-----------------------------------------------------------
-- utility functions
-----------------------------------------------------------
local function ldLC_IsLargeChest(name)
  for k, v in pairs(ldLC_chest_names)
  do
    if(name == v)
    then
      return true;
    end;
  end;
  return false;
end

-----------------------------------------------------------
-- when a chest is created
-----------------------------------------------------------
function ldLC_CreateLC(event)
  if ldLC_IsLargeChest(event.created_entity.name) 
  then
    local chest = event.created_entity
    local surface = chest.surface;
    local wagon_name = string.gsub(chest.name, "-obj$", "")
    local position = chest.position
    -- ldUtils_debugObj("chest -- ", chest)
    chest.destroy()
    local rail = surface.create_entity{name="ldLC-temporary-rail", position = position, direction = 0,force=game.forces.player}
    -- ldUtils_debugObj("rail  -- ", rail)
    local wagon = surface.create_entity{name=wagon_name, position = position, direction = 0,force=game.forces.player}
    -- ldUtils_debugObj("wagon -- ", wagon)
    -- rail.destroy()
    event.created_entity = wagon
    -- for inv in chest.getinventory(1) do
    --   inv.setfilter("coin")
    -- end
    -- chest.setfilter(1, "coin")
  end
end

-----------------------------------------------------------
-- when a chest is mined
-----------------------------------------------------------
local function ldLC_IsLoneTempRail(rail)
  if (rail ~= nil and rail.valid and rail.name == "ldLC-temporary-rail" and rail.minable)
  then
    return true
  else
    return false
  end
end

-----------------------------------------------------------
-- when a chest is mined
-----------------------------------------------------------
function ldLC_MinedLC(event)
  if ldLC_IsLargeChest(event.item_stack.name) 
  then
    local player = ldLC_getPlayer(event);
    local rail = player.selected;
    local surface = player.surface;
    -- ldUtils_debugMsg("pidx  -- " .. event.player_index .. " -- name = " .. player.name);
    -- ldUtils_debugObj("rail  -- ", rail)
    if (not ldLC_IsLoneTempRail(rail))
    then
      -- see if we can find the piece of rail that is left befind...
      -- local cursor = player.screen2realposition(player.cursorposition);
      local cursor = player.position;
      -- ldUtils_debugMsg("cursor-- ", cursor.x .. "," .. cursor.y)
      local player_reach = 8;
      local width = 4 + player_reach
      local height = 4 + player_reach
      if (event.item_stack.name == "ldLC-chest-5x5-obj")
      then
        width = 6 + player_reach
        height = 6 + player_reach
      end
      -- ldUtils_debugMsg("area  -- { {" .. (cursor.x - width) .. "," .. (cursor.y - height) .. "}, {" .. (cursor.x + width) .. ", " .. (cursor.y + height) .. "} }")
      local entities = surface.find_entities_filtered{area = {{cursor.x - width, cursor.y - height}, {cursor.x + width, cursor.y + height}}, name = "ldLC-temporary-rail"}
      for key,value in pairs(entities)
      do
        -- ldUtils_debugObj("value -- ", value)
        if (ldLC_IsLoneTempRail(value))
        then
          rail = value
          break
        end
      end
    end
    if (ldLC_IsLoneTempRail(rail))
    then
      rail.destroy()
    end
  end
end

-----------------------------------------------------------
-- register our events
-----------------------------------------------------------
script.on_event(defines.events.on_built_entity, ldLC_CreateLC)
script.on_event(defines.events.on_player_mined_item, ldLC_MinedLC)
-- since our "chest" is a wagon on rail, the blueprints will only capture the rail.
-- as a result, robots can't mine it.
script.on_event(defines.events.on_robot_built_entity, ldLC_CreateLC)
script.on_event(defines.events.on_robot_mined, ldLC_MinedLC)
