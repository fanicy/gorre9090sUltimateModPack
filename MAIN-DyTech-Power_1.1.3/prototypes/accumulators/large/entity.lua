require "prototypes.internal-config"
require "prototypes.functions"

data:extend(
{
  {
    type = "accumulator",
    name = "large-basic-accumulator",
    icon = "__MAIN-DyTech-Power__/graphics/accumulators/icons/large/basic-accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "large-basic-accumulator"},
    max_health = Health.Tier4,
	resistances = Resistances.Tier4,
    corpse = "medium-remnants",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "accumulator",
    energy_source =
    {
      type = "electric",
      buffer_capacity = Accumulators.Buffer.Large.Tier1,
      usage_priority = "terciary",
      input_flow_limit = Accumulators.Input.Large.Tier1,
      output_flow_limit = Accumulators.Output.Large.Tier1
    },
    picture = LargeAccumulatorPictures(1.3, AccumulatorsTint.mk1),
    charge_animation = LargeAccumulatorChargePictures(1.3, AccumulatorsTint.mk1),
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation = LargeAccumulatorDischargePictures(1.3, AccumulatorsTint.mk1),
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  {
    type = "accumulator",
    name = "large-basic-accumulator-mk2",
    icon = "__MAIN-DyTech-Power__/graphics/accumulators/icons/large/basic-accumulator2.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "large-basic-accumulator-mk2"},
    max_health = Health.Tier4,
	resistances = Resistances.Tier4,
    corpse = "medium-remnants",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "accumulator",
    energy_source =
    {
      type = "electric",
      buffer_capacity = Accumulators.Buffer.Large.Tier2,
      usage_priority = "terciary",
      input_flow_limit = Accumulators.Input.Large.Tier2,
      output_flow_limit = Accumulators.Output.Large.Tier2
    },
    picture = LargeAccumulatorPictures(1.3, AccumulatorsTint.mk2),
    charge_animation = LargeAccumulatorChargePictures(1.3, AccumulatorsTint.mk2),
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation = LargeAccumulatorDischargePictures(1.3, AccumulatorsTint.mk2),
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  {
    type = "accumulator",
    name = "large-basic-accumulator-mk3",
    icon = "__MAIN-DyTech-Power__/graphics/accumulators/icons/large/basic-accumulator3.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "large-basic-accumulator-mk3"},
    max_health = Health.Tier4,
	resistances = Resistances.Tier4,
    corpse = "medium-remnants",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "accumulator",
    energy_source =
    {
      type = "electric",
      buffer_capacity = Accumulators.Buffer.Large.Tier3,
      usage_priority = "terciary",
      input_flow_limit = Accumulators.Input.Large.Tier3,
      output_flow_limit = Accumulators.Output.Large.Tier3
    },
    picture = LargeAccumulatorPictures(1.3, AccumulatorsTint.mk3),
    charge_animation = LargeAccumulatorChargePictures(1.3, AccumulatorsTint.mk3),
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation = LargeAccumulatorDischargePictures(1.3, AccumulatorsTint.mk3),
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  {
    type = "accumulator",
    name = "large-basic-accumulator-mk4",
    icon = "__MAIN-DyTech-Power__/graphics/accumulators/icons/large/basic-accumulator4.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "large-basic-accumulator-mk4"},
    max_health = Health.Tier6,
	resistances = Resistances.Tier6,
    corpse = "medium-remnants",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "accumulator",
    energy_source =
    {
      type = "electric",
      buffer_capacity = Accumulators.Buffer.Large.Tier4,
      usage_priority = "terciary",
      input_flow_limit = Accumulators.Input.Large.Tier4,
      output_flow_limit = Accumulators.Output.Large.Tier4
    },
    picture = LargeAccumulatorPictures(1.3, AccumulatorsTint.mk4),
    charge_animation = LargeAccumulatorChargePictures(1.3, AccumulatorsTint.mk4),
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation = LargeAccumulatorDischargePictures(1.3, AccumulatorsTint.mk4),
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  {
    type = "accumulator",
    name = "large-basic-accumulator-mk5",
    icon = "__MAIN-DyTech-Power__/graphics/accumulators/icons/large/basic-accumulator5.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "large-basic-accumulator-mk5"},
    max_health = Health.Tier6,
	resistances = Resistances.Tier6,
    corpse = "medium-remnants",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "accumulator",
    energy_source =
    {
      type = "electric",
      buffer_capacity = Accumulators.Buffer.Large.Tier5,
      usage_priority = "terciary",
      input_flow_limit = Accumulators.Input.Large.Tier5,
      output_flow_limit = Accumulators.Output.Large.Tier5
    },
    picture = LargeAccumulatorPictures(1.3, AccumulatorsTint.mk5),
    charge_animation = LargeAccumulatorChargePictures(1.3, AccumulatorsTint.mk5),
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation = LargeAccumulatorDischargePictures(1.3, AccumulatorsTint.mk5),
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  {
    type = "accumulator",
    name = "large-basic-accumulator-mk6",
    icon = "__MAIN-DyTech-Power__/graphics/accumulators/icons/large/basic-accumulator6.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "large-basic-accumulator-mk6"},
    max_health = Health.Tier9,
	resistances = Resistances.Tier9,
    corpse = "medium-remnants",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "accumulator",
    energy_source =
    {
      type = "electric",
      buffer_capacity = Accumulators.Buffer.Large.Tier6,
      usage_priority = "terciary",
      input_flow_limit = Accumulators.Input.Large.Tier6,
      output_flow_limit = Accumulators.Output.Large.Tier6
    },
    picture = LargeAccumulatorPictures(1.3, AccumulatorsTint.mk6),
    charge_animation = LargeAccumulatorChargePictures(1.3, AccumulatorsTint.mk6),
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation = LargeAccumulatorDischargePictures(1.3, AccumulatorsTint.mk6),
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
}
)