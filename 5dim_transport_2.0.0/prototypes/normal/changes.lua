data.raw.item["basic-splitter"].subgroup = "transport-splitters"
data.raw.item["fast-splitter"].subgroup = "transport-splitters"
data.raw.item["express-splitter"].subgroup = "transport-splitters"
data.raw.item["basic-transport-belt"].subgroup = "transport-belt"
data.raw.item["fast-transport-belt"].subgroup = "transport-belt"
data.raw.item["express-transport-belt"].subgroup = "transport-belt"
data.raw.item["basic-transport-belt-to-ground"].subgroup = "transport-ground"
data.raw.item["fast-transport-belt-to-ground"].subgroup = "transport-ground"
data.raw.item["express-transport-belt-to-ground"].subgroup = "transport-ground"
data.raw.item["pipe"].subgroup = "transport-pipe"
data.raw.item["pipe-to-ground"].subgroup = "transport-pipe-ground"
data.raw.item["basic-splitter"].order = "a"
data.raw.item["fast-splitter"].order = "b"
data.raw.item["express-splitter"].order = "c"
data.raw.item["basic-transport-belt"].order = "a"
data.raw.item["fast-transport-belt"].order = "b"
data.raw.item["express-transport-belt"].order = "c"
data.raw.item["basic-transport-belt-to-ground"].order = "a"
data.raw.item["fast-transport-belt-to-ground"].order = "b"
data.raw.item["express-transport-belt-to-ground"].order = "c"
data.raw.item["pipe"].order = "a"
data.raw.item["pipe-to-ground"].order = "a"
data.raw.item["wooden-chest"].subgroup = "store-solid"
data.raw.item["wooden-chest"].order = "a"
data.raw.item["iron-chest"].subgroup = "store-solid"
data.raw.item["iron-chest"].order = "b"
data.raw.item["steel-chest"].subgroup = "store-solid"
data.raw.item["steel-chest"].order = "c"
data.raw.item["smart-chest"].subgroup = "store-solid"
data.raw.item["smart-chest"].order = "d"
data.raw.item["storage-tank"].subgroup = "store-liquid"
data.raw.item["storage-tank"].order = "a"

data:extend({
  {
    type = "storage-tank",
    name = "storage-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 3, result = "storage-tank"},
    max_health = 500,
    corpse = "medium-remnants",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "storage-tank",
    fluid_box =
    {
      base_area = 250,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1, -2} },
        { position = {2, 1} },
        { position = {1, 2} },
        { position = {-2, -1} },
      },
    },
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
          priority = "extra-high",
          frames = 2,
          width = 140,
          height = 115,
          shift = {0.6875, 0.109375}
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 17,
        height = 24
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      }
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
          filename = "__base__/sound/storage-tank.ogg",
          volume = 0.8
      },
      apparent_volume = 1.5,
      max_sounds_per_type = 3
    },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {2.6875, 1.3125},
          green = {2.6875, 1.3125},
        },
        wire =
        {
          red = {1.1875, -0.28125},
          green = {1.1875, -0.28125},
        }
      },
      {
        shadow =
        {
          red = {0.21875, 1.1875},
          green = {0.21875, 1.1875},
        },
        wire =
        {
          red = {-1, -0.25},
          green = {-1, -0.25},
        }
      },
      {
        shadow =
        {
          red = {2.6875, 1.3125},
          green = {2.6875, 1.3125},
        },
        wire =
        {
          red = {1.1875, -0.28125},
          green = {1.1875, -0.28125},
        }
      },
      {
        shadow =
        {
          red = {0.21875, 1.1875},
          green = {0.21875, 1.1875},
        },
        wire =
        {
          red = {-1, -0.25},
          green = {-1, -0.25},
        }
      }
    },

    circuit_wire_max_distance = 7.5
  },
})