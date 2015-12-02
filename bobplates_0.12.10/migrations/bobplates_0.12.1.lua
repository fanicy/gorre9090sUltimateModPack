for index, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()

  if force.technologies["advanced-oil-processing"].researched then
    force.recipes["bob-oil-processing"].enabled = true
  end
end




