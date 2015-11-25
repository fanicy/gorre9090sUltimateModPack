function research(count, one, two, three, four, time)
  local ing = {}
  if one > 0 then
    ing[#ing + 1] = {"science-pack-1", one}
  end
  if two > 0 then
    ing[#ing + 1] = {"science-pack-2", two}
  end
  if three > 0 then
    ing[#ing + 1] = {"science-pack-3", three}
  end
  if four > 0 then
    ing[#ing + 1] = {"alien-science-pack", four}
  end
  local unit = {
    count = count or 10,
    ingredients = ing,
    time=time or 10
  }
  return unit
end

function alien_research(count, one, two, three, four, time)
  local ing = {}
  if one > 0 then
    ing[#ing + 1] = {"alien-bioconstruct", one}
  end
  if two > 0 then
    ing[#ing + 1] = {"alien-fragments", two}
  end
  if three > 0 then
    ing[#ing + 1] = {"endo-skeleton", three}
  end
  if four > 0 then
    ing[#ing + 1] = {"exo-skeleton", four}
  end
  local unit = {
    count = count or 10,
    ingredients = ing,
    time=time or 10
  }
  return unit
end


require("prototypes.item-groups")

require("prototypes.tools.attractor")
require("prototypes.tools.attractor-recipe")
require("prototypes.tools.capsule")
require("prototypes.tools.projectiles")
require("prototypes.tools.rocket-projectiles")
require("prototypes.aliens.biters")
require("prototypes.aliens.spawner")
require("prototypes.aliens.spitters")
require("prototypes.aliens.worms")
require("prototypes.aliens.biters-recipe")
require("prototypes.aliens.spawner-recipe")
require("prototypes.aliens.spitters-recipe")
require("prototypes.aliens.worms-recipe")

require("prototypes.alien-armor.armor")
require("prototypes.alien-armor.armor-recipe")

require('prototypes.resources.alien-artifacts')

require('prototypes.machines.alien-tech-lab')


require('prototypes.materials.All-alien-mats')

require('prototypes.technologies.Materials-tech')
require('prototypes.technologies.Hive-tech')
require('prototypes.technologies.Defense-tech')
require('prototypes.technologies.Capsule-tech')
require('prototypes.technologies.Hive-lord')
require('prototypes.technologies.Armor-tech')