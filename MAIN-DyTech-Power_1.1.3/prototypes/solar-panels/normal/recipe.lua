data:extend(
{
  {
    type = "recipe",
    name = "solar-panel-secondary",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"electronic-circuit", 15},
      {"copper-cable", 5},
      {"flux-capacitor-1", 1},
	  {"frame-1", 1}
    },
    result = "solar-panel-secondary"
  },
  {
    type = "recipe",
    name = "solar-panel-primary-mk2",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 5},
      {"solar-panel", 1},
      {"electronic-circuit", 20},
      {"flux-capacitor-1", 1},
	  {"frame-1", 1}
    },
    result = "solar-panel-primary-mk2"
  },
  {
    type = "recipe",
    name = "solar-panel-secondary-mk2",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 5},
      {"solar-panel", 1},
      {"electronic-circuit", 20},
      {"flux-capacitor-1", 1},
	  {"frame-1", 1}
    },
    result = "solar-panel-secondary-mk2"
  },
  {
    type = "recipe",
    name = "solar-panel-primary-mk3",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {"solar-panel-primary-mk2", 1},
      {"advanced-circuit", 15},
      {"tin-plate", 20},
      {"flux-capacitor-2", 2},
	  {"frame-2", 1}
    },
    result = "solar-panel-primary-mk3"
  },
  {
    type = "recipe",
    name = "solar-panel-secondary-mk3",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {"solar-panel-secondary-mk2", 1},
      {"advanced-circuit", 15},
      {"tin-plate", 20},
      {"flux-capacitor-2", 2},
	  {"frame-2", 1}
    },
    result = "solar-panel-secondary-mk3"
  },
  {
    type = "recipe",
    name = "solar-panel-primary-mk4",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {"solar-panel-primary-mk3", 1},
      {"processing-unit", 15},
      {"zinc-plate", 40},
      {"flux-capacitor-3", 5},
	  {"frame-3", 1},
    },
    result = "solar-panel-primary-mk4"
  },
  {
    type = "recipe",
    name = "solar-panel-secondary-mk4",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {"solar-panel-secondary-mk3", 1},
      {"processing-unit", 15},
      {"zinc-plate", 40},
      {"flux-capacitor-3", 5},
	  {"frame-3", 1},
    },
    result = "solar-panel-secondary-mk4"
  },
  {
    type = "recipe",
    name = "solar-panel-primary-mk5",
    enabled = false,
    energy_required = 50,
    ingredients =
    {
      {"solar-panel-primary-mk4", 1},
      {"advanced-processing-unit", 5},
      {"gold-plate", 80},
      {"flux-capacitor-4", 10},
	  {"frame-3", 1},
    },
    result = "solar-panel-primary-mk5"
  },
  {
    type = "recipe",
    name = "solar-panel-secondary-mk5",
    enabled = false,
    energy_required = 50,
    ingredients =
    {
      {"solar-panel-secondary-mk4", 1},
      {"advanced-processing-unit", 5},
      {"gold-plate", 80},
      {"flux-capacitor-4", 10},
	  {"frame-3", 1},
    },
    result = "solar-panel-secondary-mk5"
  },
}
)