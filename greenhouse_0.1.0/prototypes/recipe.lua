data:extend({
 {
    type = "recipe",
    name = "gh-sapling",
    enabled = "false",
    energy_required = 0.5,
    ingredients = {{"raw-wood",1}},
    result = "gh-sapling"
  },
 {
    type = "recipe",
    name = "gh-logs",
    category = "gh-mod-dummy",
    enabled = "false",
    energy_required = 240,
    ingredients = {{"gh-sapling",10}},
    result_count = 50,
    result = "raw-wood"
  },
 {
    type = "recipe",
    name = "gh-greenhouse",
    enabled = "false",
    ingredients = 
    {
      {"iron-stick",20},
      {"copper-cable",10},
      {"stone",20},
      {"small-lamp",10}
    },
    result = "gh-greenhouse"
  }
})