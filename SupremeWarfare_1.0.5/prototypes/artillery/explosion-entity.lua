data:extend(
{
  {
    type = "explosion",
    name = "sb-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/explosion/explosion-1.png",
        priority = "extra-high",
        width = 64,
        height = 59,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-2.png",
        priority = "extra-high",
        width = 64,
        height = 57,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-3.png",
        priority = "extra-high",
        width = 64,
        height = 49,
        frame_count = 16,
        animation_speed = 0.5
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-4.png",
        priority = "extra-high",
        width = 64,
        height = 51,
        frame_count = 16,
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 20},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound =
    {
      {
        filename = "__base__/sound/explosion1.ogg",
        volume = 0.3
      },
      {
        filename = "__base__/sound/fight/old/explosion2.ogg",
        volume = 0.3
      }
    }
  },
  {
    type = "explosion",
    name = "sb-huge-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "extra-high",
        width = 112,
        height = 94,
        frame_count = 54,
        line_length = 6,
        shift = {-0.56, -0.96},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50},
    sound =
    {
      {
        filename = "__base__/sound/fight/old/huge-explosion.ogg",
        volume = 0.5
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
})