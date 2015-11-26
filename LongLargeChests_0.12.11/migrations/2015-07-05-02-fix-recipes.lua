if game.isdemo() then
  return
end

game.player.force.resetrecipes()

for index, force in pairs(game.forces) do
  if force.technologies["large_chests"].researched then
    force.recipes["ldLC-chest-2x2"].enabled = true
    force.recipes["ldLC-chest-3x3"].enabled = true
    force.recipes["ldLC-chest-5x5"].enabled = true
  end
end
