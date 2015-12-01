game.reload_script()

for index, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()

  if force.technologies["lead-processing"].researched then
    force.recipes["silver-from-lead"].enabled = true
  end
end


