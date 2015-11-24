data:extend({
-- Item
  {
    type = "item",
    name = "lead-plate",
    icon = "__5dim_core__/graphics/icon/lead-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "b[lead-plate]",
    stack_size = 200
  },

--Recipe
  {
    type = "recipe",
    name = "5d-lead-plate",
    category = "smelting",
    energy_required = 2,
    ingredients = {{ "lead-ore", 3}},
    result = "lead-plate"
  },
})