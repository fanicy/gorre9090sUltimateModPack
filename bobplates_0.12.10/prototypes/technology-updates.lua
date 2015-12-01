-- fix a difficulty shift.
bobmods.lib.replace_technology_prerequisite ("robotics", "advanced-electronics-2", "advanced-electronics")

bobmods.lib.add_new_science_pack("advanced-electronics-2", "science-pack-3", 1)

data.raw.technology["battery"].upgrade = true


if data.raw.tool["science-pack-4"] then
  bobmods.lib.replace_science_pack("electrolysis-5", "alien-science-pack", "science-pack-4")
  bobmods.lib.replace_science_pack("chemical-processing-5", "alien-science-pack", "science-pack-4")
  bobmods.lib.replace_science_pack("alloy-processing-4", "alien-science-pack", "science-pack-4")
  bobmods.lib.replace_science_pack("nitinol-processing", "alien-science-pack", "science-pack-4")
  bobmods.lib.replace_science_pack("tungsten-alloy-processing", "alien-science-pack", "science-pack-4")
  bobmods.lib.replace_science_pack("air-compressor-4", "alien-science-pack", "science-pack-4")
  bobmods.lib.replace_science_pack("water-bore-4", "alien-science-pack", "science-pack-4")
  bobmods.lib.replace_science_pack("advanced-electronics-3", "alien-science-pack", "science-pack-4")
  bobmods.lib.replace_science_pack("battery-3", "alien-science-pack", "science-pack-4")
end

bobmods.lib.add_technology_recipe("sulfur-processing", "sulfur-2")
bobmods.lib.add_technology_recipe("sulfur-processing", "sulfuric-acid-2")

bobmods.lib.add_technology_recipe("oil-processing", "bob-resin-oil")
bobmods.lib.add_technology_recipe("oil-processing", "liquid-fuel")

bobmods.lib.add_technology_recipe("advanced-oil-processing", "petroleum-gas-cracking")
bobmods.lib.add_technology_recipe("advanced-oil-processing", "coal-cracking")
bobmods.lib.add_technology_recipe("advanced-oil-processing", "bob-oil-processing")

bobmods.lib.add_technology_recipe("plastics", "synthetic-wood")

bobmods.lib.add_technology_recipe("steel-processing", "steel-gear-wheel")
bobmods.lib.add_technology_recipe("steel-processing", "steel-bearing-ball")
bobmods.lib.add_technology_recipe("steel-processing", "steel-bearing")

bobmods.lib.remove_technology_recipe("advanced-electronics", "processing-unit")
bobmods.lib.add_technology_recipe("advanced-electronics-2", "processing-unit")


bobmods.lib.add_technology_recipe("nickel-processing", "bob-nickel-plate")

bobmods.lib.add_technology_recipe("zinc-processing", "bob-zinc-plate")
bobmods.lib.add_technology_recipe("zinc-processing", "brass-alloy")
bobmods.lib.add_technology_recipe("zinc-processing", "gunmetal-alloy")

bobmods.lib.add_technology_recipe("lead-processing", "lead-oxide")
bobmods.lib.add_technology_recipe("lead-processing", "bob-lead-plate")
bobmods.lib.add_technology_recipe("lead-processing", "silver-from-lead")

bobmods.lib.add_technology_recipe("aluminium-processing", "alumina")
bobmods.lib.add_technology_recipe("aluminium-processing", "bob-aluminium-plate")

bobmods.lib.add_technology_recipe("gold-processing", "bob-gold-plate")

bobmods.lib.add_technology_recipe("silicon-processing", "bob-silicon-plate")
bobmods.lib.add_technology_recipe("silicon-processing", "silicon-wafer")
bobmods.lib.add_technology_recipe("silicon-processing", "silicon-powder")

bobmods.lib.add_technology_recipe("titanium-processing", "bob-titanium-plate")

bobmods.lib.add_technology_recipe("tungsten-processing", "tungstic-acid")
bobmods.lib.add_technology_recipe("tungsten-processing", "tungsten-oxide")
bobmods.lib.add_technology_recipe("tungsten-processing", "powdered-tungsten")
bobmods.lib.add_technology_recipe("tungsten-processing", "bob-tungsten-plate")

bobmods.lib.add_technology_recipe("electrum-processing", "electrum-alloy")

bobmods.lib.add_technology_recipe("invar-processing", "invar-alloy")

bobmods.lib.add_technology_recipe("nitinol-processing", "nitinol-alloy")

bobmods.lib.add_technology_recipe("tungsten-alloy-processing", "copper-tungsten-alloy")
bobmods.lib.add_technology_recipe("tungsten-alloy-processing", "tungsten-carbide")
bobmods.lib.add_technology_recipe("tungsten-alloy-processing", "tungsten-carbide-2")

bobmods.lib.add_technology_recipe("cobalt-processing", "cobalt-oxide")
bobmods.lib.add_technology_recipe("cobalt-processing", "cobalt-oxide-from-copper")
bobmods.lib.add_technology_recipe("cobalt-processing", "cobalt-plate")
bobmods.lib.add_technology_recipe("cobalt-processing", "cobalt-steel-alloy")

bobmods.lib.add_technology_recipe("lithium-processing", "lithium")
bobmods.lib.add_technology_recipe("lithium-processing", "lithium-chloride")
bobmods.lib.add_technology_recipe("lithium-processing", "lithium-water-electrolysis")


bobmods.lib.add_technology_recipe("zinc-processing", "brass-gear-wheel")

bobmods.lib.add_technology_recipe("titanium-processing", "titanium-gear-wheel")
bobmods.lib.add_technology_recipe("titanium-processing", "titanium-bearing-ball")
bobmods.lib.add_technology_recipe("titanium-processing", "titanium-bearing")

bobmods.lib.add_technology_recipe("tungsten-processing", "tungsten-gear-wheel")

bobmods.lib.add_technology_recipe("nitinol-processing", "nitinol-gear-wheel")
bobmods.lib.add_technology_recipe("nitinol-processing", "nitinol-bearing-ball")
bobmods.lib.add_technology_recipe("nitinol-processing", "nitinol-bearing")



if data.raw.technology["alien-research"] then
  bobmods.lib.add_technology_prerequisite ("alien-blue-research", "alien-research")
  bobmods.lib.add_technology_prerequisite ("alien-orange-research", "alien-research")
  bobmods.lib.add_technology_prerequisite ("alien-purple-research", "alien-research")
  bobmods.lib.add_technology_prerequisite ("alien-yellow-research", "alien-research")
  bobmods.lib.add_technology_prerequisite ("alien-green-research", "alien-research")
  bobmods.lib.add_technology_prerequisite ("alien-red-research", "alien-research")
end

if data.raw.tool["science-pack-gold"] and
  data.raw.tool["alien-science-pack-blue"] and
  data.raw.tool["alien-science-pack-orange"] and
  data.raw.tool["alien-science-pack-purple"] and
  data.raw.tool["alien-science-pack-yellow"] and
  data.raw.tool["alien-science-pack-green"] and
  data.raw.tool["alien-science-pack-red"]
then
  data.raw.technology["alien-blue-research"].unit.ingredients = {{"science-pack-gold", 1},{"alien-science-pack-blue", 1}}
  data.raw.technology["alien-orange-research"].unit.ingredients = {{"science-pack-gold", 1},{"alien-science-pack-orange", 1}}
  data.raw.technology["alien-purple-research"].unit.ingredients = {{"science-pack-gold", 1},{"alien-science-pack-purple", 1}}
  data.raw.technology["alien-yellow-research"].unit.ingredients = {{"science-pack-gold", 1},{"alien-science-pack-yellow", 1}}
  data.raw.technology["alien-green-research"].unit.ingredients = {{"science-pack-gold", 1},{"alien-science-pack-green", 1}}
  data.raw.technology["alien-red-research"].unit.ingredients = {{"science-pack-gold", 1},{"alien-science-pack-red", 1}}
end

