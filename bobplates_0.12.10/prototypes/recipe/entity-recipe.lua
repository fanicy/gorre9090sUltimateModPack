data:extend(
{
  {
    type = "recipe",
    name = "mixing-furnace",
    energy_required = 3,
    enabled = "false",
    ingredients = 
    {
      {"stone-brick", 5},
    },
    result = "mixing-furnace"
  },

  {
    type = "recipe",
    name = "chemical-boiler",
    energy_required = 3,
    enabled = "false",
    ingredients =
    {
      {"stone-brick", 5},
      {"pipe", 2},
    },
    result = "chemical-boiler"
  },

  {
    type = "recipe",
    name = "electric-mixing-furnace",
    energy_required = 10,
    enabled = "false",
    ingredients = 
    {
      {"steel-plate", 15},
      {"stone-brick", 10},
      {"advanced-circuit", 5},
    },
    result = "electric-mixing-furnace"
  },

  {
    type = "recipe",
    name = "chemical-furnace",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 15},
      {"stone-brick", 10},
      {"advanced-circuit", 5},
      {"pipe", 5},
    },
    result = "chemical-furnace"
  },

  {
    type = "recipe",
    name = "electric-chemical-mixing-furnace",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"chemical-furnace", 1},
      {"tungsten-plate", 15},
      {"invar-alloy", 10},
      {"processing-unit", 10},
      {"tungsten-gear-wheel", 10},
      {"pipe", 5},
    },
    result = "electric-chemical-mixing-furnace"
  },

  {
    type = "recipe",
    name = "electric-chemical-mixing-furnace-2",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"electric-chemical-mixing-furnace", 1},
      {"copper-tungsten-alloy", 15},
      {"tungsten-plate", 10},
      {"advanced-processing-unit", 10},
      {"tungsten-gear-wheel", 10},
      {"pipe", 5},
    },
    result = "electric-chemical-mixing-furnace-2"
  },


  {
    type = "recipe",
    name = "electrolyser",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"stone-brick", 5},
      {"electronic-circuit", 5},
      {"pipe", 2},
    },
    result = "electrolyser"
  },

  {
    type = "recipe",
    name = "electrolyser-2",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"electrolyser", 1},
      {"glass", 10},
      {"steel-plate", 10},
      {"advanced-circuit", 5},
      {"pipe", 5},
    },
    result = "electrolyser-2"
  },

  {
    type = "recipe",
    name = "electrolyser-3",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"electrolyser-2", 1},
      {"glass", 10},
      {"tungsten-plate", 10},
      {"invar-alloy", 10},
      {"processing-unit", 10},
      {"pipe", 5},
    },
    result = "electrolyser-3"
  },

  {
    type = "recipe",
    name = "electrolyser-4",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"electrolyser-3", 1},
      {"silicon-nitride", 10},
      {"copper-tungsten-alloy", 10},
      {"nitinol-alloy", 10},
      {"advanced-processing-unit", 10},
      {"pipe", 5},
    },
    result = "electrolyser-4"
  },


  {
    type = "recipe",
    name = "chemical-plant-2",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"chemical-plant", 1},
      {"glass", 10},
      {"steel-bearing", 5},
      {"steel-gear-wheel", 5},
      {"advanced-circuit", 5},
      {"pipe", 5},
    },
    result = "chemical-plant-2"
  },

  {
    type = "recipe",
    name = "chemical-plant-3",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"chemical-plant-2", 1},
      {"titanium-plate", 10},
      {"titanium-bearing", 5},
      {"titanium-gear-wheel", 5},
      {"processing-unit", 10},
      {"pipe", 5},
    },
    result = "chemical-plant-3"
  },

  {
    type = "recipe",
    name = "chemical-plant-4",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"chemical-plant-3", 1},
      {"nitinol-alloy", 10},
      {"nitinol-bearing", 5},
      {"nitinol-gear-wheel", 5},
      {"advanced-processing-unit", 10},
      {"pipe", 5},
    },
    result = "chemical-plant-4"
  },


  {
    type = "recipe",
    name = "air-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"iron-gear-wheel", 2},
      {"iron-plate", 2},
      {"electronic-circuit", 2},
      {"pipe", 2},
    },
    result = "air-pump"
  },

  {
    type = "recipe",
    name = "air-pump-2",
    energy_required = 4,
    enabled = "false",
    ingredients =
    {
      {"air-pump", 1},
      {"steel-plate", 2},
      {"steel-gear-wheel", 4},
      {"advanced-circuit", 3},
      {"pipe", 2},
    },
    result = "air-pump-2"
  },

  {
    type = "recipe",
    name = "air-pump-3",
    energy_required = 7,
    enabled = "false",
    ingredients =
    {
      {"air-pump-2", 1},
      {"titanium-plate", 2},
      {"titanium-gear-wheel", 4},
      {"titanium-bearing", 4},
      {"processing-unit", 3},
      {"pipe", 2},
    },
    result = "air-pump-3"
  },

  {
    type = "recipe",
    name = "air-pump-4",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"air-pump-3", 1},
      {"nitinol-alloy", 2},
      {"nitinol-gear-wheel", 4},
      {"nitinol-bearing", 4},
      {"electric-engine-unit", 1},
      {"advanced-processing-unit", 3},
    },
    result = "air-pump-4"
  },


  {
    type = "recipe",
    name = "water-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"iron-gear-wheel", 2},
      {"iron-plate", 2},
      {"electronic-circuit", 2},
      {"pipe", 2},
    },
    result = "water-pump"
  },

  {
    type = "recipe",
    name = "water-pump-2",
    energy_required = 4,
    enabled = "false",
    ingredients =
    {
      {"water-pump", 1},
      {"steel-plate", 2},
      {"steel-gear-wheel", 4},
      {"advanced-circuit", 3},
      {"pipe", 2},
    },
    result = "water-pump-2"
  },

  {
    type = "recipe",
    name = "water-pump-3",
    energy_required = 7,
    enabled = "false",
    ingredients =
    {
      {"water-pump-2", 1},
      {"titanium-plate", 2},
      {"titanium-gear-wheel", 4},
      {"titanium-bearing", 4},
      {"processing-unit", 3},
      {"pipe", 2},
    },
    result = "water-pump-3"
  },

  {
    type = "recipe",
    name = "water-pump-4",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"water-pump-3", 1},
      {"nitinol-alloy", 2},
      {"nitinol-gear-wheel", 4},
      {"nitinol-bearing", 4},
      {"electric-engine-unit", 1},
      {"advanced-processing-unit", 3},
    },
    result = "water-pump-4"
  },


  {
    type = "recipe",
    name = "void-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"iron-gear-wheel", 2},
      {"iron-plate", 2},
      {"electronic-circuit", 2},
      {"pipe", 2},
    },
    result = "void-pump"
  },
}
)


