data:extend({
-- Item
  {
    type = "item",
    name = "tin-plate",
    icon = "__5dim_core__/graphics/icon/tin-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "b[tin-plate]",
    stack_size = 200
  },

--Recipe
  {
    type = "recipe",
    name = "5d-tin-plate",
    category = "smelting",
    energy_required = 3.5,
    ingredients = {{ "tin-ore", 1}},
    result = "tin-plate"
  },
  
-- Item
  {
    type = "item",
    name = "5d-tin-gear-wheel",
    icon = "__5dim_core__/graphics/icon/icon_5dim_tin-gear-wheel.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "b[tin-gear-wheel]",
    stack_size = 100
  },

--Recipe
  {
    type = "recipe",
    name = "5d-tin-gear-wheel",
    ingredients = {{"tin-plate", 2}},
    result = "5d-tin-gear-wheel"
  },
})