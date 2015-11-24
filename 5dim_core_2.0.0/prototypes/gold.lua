data:extend({
-- Item
  {
    type = "item",
    name = "gold-plate",
    icon = "__5dim_core__/graphics/icon/gold-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "b[gold-plate]",
    stack_size = 200
  },

--Recipe
  {
    type = "recipe",
    name = "5d-gold-plate",
    category = "smelting",
    energy_required = 7,
    ingredients = {{ "gold-ore", 2}},
    result = "gold-plate"
  },
  
-- Item
  {
    type = "item",
    name = "5d-gold-wire",
    icon = "__5dim_core__/graphics/icon/5dim_icon_goldwire.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "circuit-network",
    order = "a[wires]-e[copper-cable]",
    stack_size = 500
  },

--Recipe
  {
    type = "recipe",
    name = "5d-gold-wire",
    ingredients = {{"gold-plate", 1}},
    result_count = 3,
    result = "5d-gold-wire"
  },
  
-- Item
  {
    type = "item",
    name = "5d-gold-circuit",
    icon = "__5dim_core__/graphics/icon/icon_5dim-circuit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "f[a-gold-circuit]",
    stack_size = 500
  },

--Recipe
  {
    type = "recipe",
    name = "5d-gold-circuit",
    ingredients = 
	{
		{"5d-gold-wire", 4},
		{"iron-plate", 1},
		{"tin-plate", 5},
	},
    result = "5d-gold-circuit"
  },
})