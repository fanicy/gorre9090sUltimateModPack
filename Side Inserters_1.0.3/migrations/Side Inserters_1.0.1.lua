-- Reload recipes and technologies
for i, player in ipairs(game.players) do
  player.force.reset_recipes()
  player.force.reset_technologies()
end

for index, force in pairs(game.forces) do
  -- Generate technology and recipe tables
  local tech = force.technologies
  local recipes = force.recipes
 
  -- Unlock researched recipes
  if tech["logistics"] and tech["logistics"].researched then
  
    if recipes["fast-inserter-left"] then
      recipes["fast-inserter-left"].enabled = true
    end
    if recipes["fast-inserter-right"] then
      recipes["fast-inserter-right"].enabled = true
    end
  end

  if tech["automation"] and tech["automation"].researched then
    if recipes["long-handed-inserter-left"] then
      recipes["long-handed-inserter-left"].enabled = true
    end
    if recipes["long-handed-inserter-right"] then
      recipes["long-handed-inserter-right"].enabled = true
    end
  end

  if tech["electronics"] and tech["electronics"].researched then
    if recipes["smart-inserter-left"] then
      recipes["smart-inserter-left"].enabled = true
    end
    if recipes["smart-inserter-right"] then
      recipes["smart-inserter-right"].enabled = true
    end
  end
end