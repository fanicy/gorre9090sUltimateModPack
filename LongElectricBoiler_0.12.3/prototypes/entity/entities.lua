---------------------------------------------------------
-- our "boiler" is actually a pump:
--  - based on base.entities["pump"]
---------------------------------------------------------
local boiler = util.table.deepcopy(data.raw["pump"]["small-pump"]);
boiler.name = "ldEB-electric-boiler";
boiler.icon = "__LongElectricBoiler__/graphics/icons/electric-boiler.png";
boiler.minable = {hardness = 0.2, mining_time = 0.5, result = "ldEB-electric-boiler"};
boiler.pumping_speed = 1.0;
boiler.energy_source = { type = "electric", usage_priority = "terciary", emissions = 0 };
boiler.energy_usage = "390kW";
boiler.working_sound = { sound = { filename = "__base__/sound/boiler.ogg", volume = 0.8 }, max_sounds_per_type = 3 };
boiler.animations =
    {
      north =
      {
        filename = "__base__/graphics/entity/boiler/boiler-left-up.png",
        priority = "extra-high",
        width = 66,
        height = 74,
        -- shift = {0.05, 0}
        frame_count = 1,
        animation_speed = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/boiler/boiler-right-down.png",
        priority = "extra-high",
        width = 44,
        height = 50,
        frame_count = 1,
        animation_speed = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/boiler/boiler-down.png",
        priority = "extra-high",
        width = 66,
        height = 72,
        -- shift = {0.05, 0}
        frame_count = 1,
        animation_speed = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/boiler/boiler-left.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.03125, 0},
        frame_count = 1,
        animation_speed = 0.5
      }
    };

data:extend({boiler});
