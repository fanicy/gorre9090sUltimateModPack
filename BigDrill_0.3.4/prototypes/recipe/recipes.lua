data:extend(
{
  {
    type = "recipe",
    name = "bucket-wheel-excavator",
    enabled = "false",
    ingredients =
    {
      {"iron-plate", 80},
      {"steel-plate", 35},
	  {"iron-gear-wheel", 30},
	  {"advanced-circuit", 4},
	  {"electric-engine-unit", 10}
    },
    result = "bucket-wheel-excavator"
  },
  {
    type = "recipe",
    name = "bucket-wheel-excavator-mk2",
    enabled = "false",
    ingredients =
    {
	  {"bucket-wheel-excavator", 1},
      {"iron-plate", 60},
      {"steel-plate", 55},
	  {"iron-gear-wheel", 50},
	  {"advanced-circuit", 8},
	  {"electric-engine-unit", 15}
    },
    result = "bucket-wheel-excavator-mk2"
  },
  {
    type = "recipe",
    name = "bucket-wheel-excavator-mk3",
    enabled = "false",
    ingredients =
    {
	  {"bucket-wheel-excavator-mk2", 1},
      {"iron-plate", 90},
      {"steel-plate", 90},
	  {"iron-gear-wheel", 95},
	  {"advanced-circuit", 16},
	  {"electric-engine-unit", 45}
    },
    result = "bucket-wheel-excavator-mk3"
  },
  {
    type = "recipe",
    name = "ore-unloader",
    enabled = "false",
    ingredients =
    {
	  {"iron-plate", 30},
      {"steel-plate", 10},
	  {"iron-gear-wheel", 30},
	  {"basic-transport-belt", 9}
    },
    result = "ore-unloader"
  },
  {
    type = "recipe",
    name = "ore-unloader-mk2",
    enabled = "false",
    ingredients =
    {
	  {"ore-unloader", 1},
      {"steel-plate", 10},
	  {"iron-gear-wheel", 30},
	  {"fast-transport-belt", 9}
    },
    result = "ore-unloader-mk2"
  },
  {
    type = "recipe",
    name = "ore-unloader-mk3",
    enabled = "false",
    ingredients =
    {
	  {"ore-unloader-mk2", 1},
      {"steel-plate", 10},
	  {"iron-gear-wheel", 30},
	  {"express-transport-belt", 9}
    },
    result = "ore-unloader-mk3"
  },
 })
 