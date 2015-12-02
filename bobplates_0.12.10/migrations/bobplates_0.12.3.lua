for index, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()

  if force.technologies["advanced-electronics-3"].researched then
    force.recipes["advanced-processing-unit"].enabled = true
  end
end




