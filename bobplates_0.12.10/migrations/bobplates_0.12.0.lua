game.reload_script()

for index, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()

  if force.technologies["chemical-processing-1"].researched then
    force.recipes["carbon"].enabled = true
  end

  if force.technologies["chemical-processing-2"].researched then
    force.recipes["ferric-chloride-solution"].enabled = true
  end

  if force.technologies["chemical-processing-3"].researched then
    force.recipes["chemical-plant-2"].enabled = true
  end

  if force.technologies["alloy-processing-2"].researched then
    force.recipes["electric-mixing-furnace"].enabled = true
  end

  if force.technologies["alloy-processing-3"].researched then
    force.recipes["electric-chemical-mixing-furnace"].enabled = true
  end

  if force.technologies["chemical-processing-2"].researched then
    force.recipes["solid-fuel-from-hydrogen"].enabled = true
  end

  if force.technologies["barrels"].researched then
    force.recipes["empty-canister"].enabled = true
    force.recipes["liquid-fuel-canister"].enabled = true
    force.recipes["empty-liquid-fuel-canister"].enabled = true
    force.recipes["ferric-chloride-canister"].enabled = true
    force.recipes["empty-ferric-chloride-canister"].enabled = true
  end
end


