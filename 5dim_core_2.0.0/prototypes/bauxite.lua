data:extend({
-- Item
  {
    type = "item",
    name = "aluminium-plate",
    icon = "__5dim_core__/graphics/icon/aluminium-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "b[aluminium-plate]",
    stack_size = 200
  },

--Recipe
  {
    type = "recipe",
    name = "5d-aluminium-plate",
    category = "smelting",
    energy_required = 10,
    ingredients = {{ "bauxite-ore", 2}},
    result = "aluminium-plate"
  },
  
-- Item
  {
    type = "item",
    name = "5d-aluminium-wire",
    icon = "__5dim_core__/graphics/icon/5dim_icon_aluminiunwire.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "circuit-network",
    order = "a[wires]-d[copper-cable]",
    stack_size = 500
  },

--Recipe
  {
    type = "recipe",
    name = "5d-aluminium-wire",
    ingredients = {{"aluminium-plate", 1}},
    result_count = 4,
    result = "5d-aluminium-wire"
  },
-- Item
  {
    type = "item",
    name = "5d-aluminium-gear-wheel",
    icon = "__5dim_core__/graphics/icon/icon_5dim_aluminio-gear-wheel.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "b[aluminium-gear-wheel]",
    stack_size = 500
  },

--Recipe
  {
    type = "recipe",
    name = "5d-aluminium-gear-wheel",
    ingredients = {{"aluminium-plate", 1}},
    result_count = 4,
    result = "5d-aluminium-gear-wheel"
  },
})