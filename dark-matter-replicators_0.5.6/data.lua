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


function repl_research(count, one, two, three, four, time)
  local ing = {}
  if one > 0 then
    ing[#ing + 1] = {"tenemut", one}
  end
  if two > 0 then
    ing[#ing + 1] = {"dark-matter-scoop", two}
  end
  if three > 0 then
    ing[#ing + 1] = {"dark-matter-transducer", three}
  end
  if four > 0 then
    ing[#ing + 1] = {"matter-conduit", four}
  end
  local unit = {
    count = count or 10,
    ingredients = ing,
    time=time or 10
  }
  return unit
end


require('prototypes.replicators')
require('prototypes.matter-manipulation')

require('prototypes.small-e-furnace')
require('prototypes.expansion-bay')
require('prototypes.tenemut')
require('prototypes.replication-lab')

require("technology.replication")
