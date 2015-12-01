game.reload_script()

for index, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()

  if force.technologies["sulfur-processing"].researched then
    force.recipes["sulfur-2"].enabled = true
    force.recipes["sulfuric-acid-2"].enabled = true
  end

  if force.technologies["oil-processing"].researched then
    force.recipes["bob-resin-oil"].enabled = true
    force.recipes["liquid-fuel"].enabled = true
  end

  if force.technologies["advanced-oil-processing"].researched then
    force.recipes["petroleum-gas-cracking"].enabled = true
    force.recipes["coal-cracking"].enabled = true
  end

  if force.technologies["electronics"].researched then
    force.recipes["basic-electronic-components"].enabled = true
    force.recipes["basic-electronic-circuit-board"].enabled = true
    force.recipes["solder"].enabled = true
    force.recipes["solder-alloy"].enabled = true
    force.recipes["solder-alloy-lead"].enabled = true
  end

  if force.technologies["advanced-electronics"].researched then
    force.recipes["electronic-components"].enabled = true
    force.recipes["phenolic-board"].enabled = true
    force.recipes["phenolic-board-synthetic"].enabled = true
    force.recipes["circuit-board"].enabled = true
    force.recipes["electronic-circuit-board"].enabled = true
  end

  if force.technologies["advanced-electronics-2"].researched then
    force.recipes["intergrated-electronics"].enabled = true
    force.recipes["fibreglass-board"].enabled = true
    force.recipes["superior-circuit-board"].enabled = true
    force.recipes["electronic-processing-board"].enabled = true
  end

  if force.technologies["plastics"].researched then
    force.recipes["synthetic-wood"].enabled = true
    force.recipes["wooden-board-synthetic"].enabled = true
  end

  if force.technologies["steel-processing"].researched then
    force.recipes["steel-gear-wheel"].enabled = true
    force.recipes["steel-bearing-ball"].enabled = true
    force.recipes["steel-bearing"].enabled = true
  end
end




