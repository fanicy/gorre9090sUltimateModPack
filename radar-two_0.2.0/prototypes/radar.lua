require("util")

local newradar, newitem

local function copyradar(name, kw, cost, near, far, passive, useoldgraphic, scale)
	local icon = "__radar-two__/graphics/icons/"..name..".png"
	newradar = util.table.deepcopy(data.raw.radar.radar)
	newradar.name = name
	newradar.icon = icon
	newradar.minable.result = name-- = {hardness = 0.2, mining_time = 0.5, result = name}
	newradar.energy_per_sector = cost
	newradar.max_distance_of_sector_revealed = far
	newradar.max_distance_of_nearby_sector_revealed = near
	newradar.energy_per_nearby_scan = passive
	newradar.energy_usage = kw
	if useoldgraphic then
		newradar.pictures = {
			  filename = "__radar-two__/graphics/radar.png",
			  priority = "low",
			  width = 169,
			  height = 140,
			  axially_symmetrical = false,
			  apply_projection = false,
			  direction_count = 64,
			  line_length = 8,
			  shift = {1.55, 0.9},--{1.15, 0.75},
			}
	end
	if scale then
		local difference = newradar.selection_box[2][1] - newradar.collision_box[2][1]
		local num = newradar.selection_box[2][1] * scale
		newradar.selection_box={{-num,-num},{num,num}}
		num = num-difference
		newradar.collision_box={{-num,-num},{num,num}}
		newradar.pictures.scale = scale
		newradar.minable.mining_time = newradar.minable.mining_time*(scale^2)
	end
	newitem = { type = "item", name = name,
    icon = icon,
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "d[radar]-a["..name.."]",
    place_result = name,
    stack_size = 50  }
end

data.raw.item.radar.order = "d[radar]-a[radar-1]"

copyradar("radar-2","250kW","7500kJ",3,14, "200kW")
data:extend{newradar, newitem}

copyradar("scouting-radar-1","450kW","16MJ",4,17,"350kW", false, 4/3)
newradar.pictures.tint = {r=1,g=.7,b=.6,a=1}
--newitem.icon = "__radar-two__/graphics/icons/scouting-radar.png",
data:extend{newradar, newitem}
copyradar("scouting-radar-2","550kW","19MJ",5,19,"500kW", false, 4/3)
newradar.pictures.tint = {r=.8,g=.9,b=1,a=1}
--newitem.icon = "__radar-two__/graphics/icons/scouting-radar-2.png",
data:extend{newradar, newitem}

copyradar("tactical-radar-1","400kW","9MJ",7,9,"360kW", true, 4/3)
newradar.pictures.tint = {r=1,g=.7,b=.6,a=1}
--newitem.icon = "__radar-two__/graphics/icons/tactical-radar.png",
data:extend{newradar, newitem}
copyradar("tactical-radar-2","500kW","10MJ",8,10,"450kW", true, 4/3)
--newitem.icon = "__radar-two__/graphics/icons/tactical-radar-2.png",
data:extend{newradar, newitem}


data:extend{
  { type = "recipe", name = "radar-2",
    enabled = "false",
    energy_required = 3,
    ingredients =
    {
      {"radar", 1},
      {"electronic-circuit", 3},
      {"copper-cable", 5}
    },
    result = "radar-2"
  },
  { type = "recipe", name = "tactical-radar",
    enabled = "false",
    energy_required = 3,
    ingredients =
    {
	  {"radar-2", 1},
      {"processing-unit", 3},
      {"copper-plate", 5},
      {"plastic-bar", 10}
    },
    result = "tactical-radar-1"
  },
  { type = "recipe", name = "tactical-radar-2",
    enabled = "false",
    energy_required = 3,
    ingredients =
    {
      {"tactical-radar-1", 1},
      {"substation", 1},
      {"steel-plate", 4}
    },
    result = "tactical-radar-2"
  },
  { type = "recipe", name = "scouting-radar",
    enabled = "false",
    energy_required = 3,
    ingredients =
    {
	  {"radar-2", 1},
      {"big-electric-pole", 1},
      {"advanced-circuit", 4},
      {"steel-plate", 5}
    },
    result = "scouting-radar-1"
  },
  { type = "recipe", name = "scouting-radar-2",
    enabled = "false",
    energy_required = 3,
    ingredients =
    {
      {"scouting-radar-1", 1},
      {"processing-unit", 1},
      {"copper-cable", 5}
    },
    result = "scouting-radar-2"
  },

}

data.raw.radar.radar.pictures.tint={r=1,g=.7,b=.6,a=1}
data.raw.item.radar.icon = "__radar-two__/graphics/icons/radar.png"
