data:extend({
-- Item
  {
    type = "item",
    name = "zinc-plate",
    icon = "__5dim_core__/graphics/icon/zinc-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "b[zinc-plate]",
    stack_size = 200
  },

--Recipe
  {
    type = "recipe",
    name = "5d-zinc-plate",
    category = "smelting",
    energy_required = 4.5,
    ingredients = {{ "zinc-ore", 1}},
    result = "zinc-plate"
  },

--Item
  {
    type = "item",
    name = "5d-zinc-gear-wheel",
    icon = "__5dim_core__/graphics/icon/icon_5dim_zinc-gear-wheel.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "b[zinc-gear-wheel]",
    stack_size = 100
  },

--Recipe
  {
    type = "recipe",
    name = "5d-zinc-gear-wheel",
    ingredients = {{"zinc-plate", 2}},
    result = "5d-zinc-gear-wheel"
  },
})