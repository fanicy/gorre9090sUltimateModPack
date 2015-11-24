require "util"
mk1_extension =
{
  filename = "__SupremeWarfare__/graphics/artillery/mk1/place.png",
  priority = "high",
  width = 96,
  height = 80,
  direction_count = 4,
  frame_count = 1,
  axially_symmetrical = false,
  shift = {0.4, 0}
}
mk2_extension =
{
  filename = "__SupremeWarfare__/graphics/artillery/mk2/place.png",
  priority = "high",
  width = 168,
  height = 168,
  direction_count = 4,
  frame_count = 1,
  axially_symmetrical = false,
  shift = {0, -1.5}
}
inv_extension =
{
  filename = "__SupremeWarfare__/graphics/artillery/mk1/place.png",
  priority = "medium",
  width = 1,
  height = 1,
  direction_count = 1,
  frame_count = 1,
  axially_symmetrical = false,
  shift = {0, 0}
}
data:extend({
	-- Artillery MK1
   {
		type = "turret",
		name = "sb-artillery-mk1",
		icon = "__SupremeWarfare__/graphics/artillery/mk1/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.arty_mk1.minable,
		max_health = SWVariables.arty_mk1.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = SWVariables.arty_mk1.resistances,
		collision_box = {{-0.4, -0.9 }, {0.4, 0.9}},
		selection_box = {{0, 0 }, {0, 0}},
		order = "i[items][sb-artillery-mk1]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "rocket",
			cooldown = 360000,
			range = 30,
			projectile_creation_distance = 1.8,
		ammo_type =
		{
			category = "biological",
			action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "projectile",
				projectile = "pewpewbang",
				starting_speed = 5
			  }
			}
		}
		},
		rotation_speed = 0.015,
		preparing_speed = 0.08,
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(mk1_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(mk1_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),
		preparing_animation = mk1_extension,
		prepared_animation =
		{
		  filename = "__SupremeWarfare__/graphics/artillery/mk1/picture.png",
		  priority = "medium",
		  width = 96,
		  height = 80,
		  direction_count = 64,
		  frame_count = 1,
		  line_length = 16,
		  axially_symmetrical = false,
		  shift = {0.4, 0}
		}

	},
	-- Artillery MK2
   {
		type = "turret",
		name = "sb-artillery-mk2",
		icon = "__SupremeWarfare__/graphics/artillery/mk2/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.arty_mk2.minable,
		max_health = SWVariables.arty_mk2.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		resistances = SWVariables.arty_mk2.resistances,
		collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
		selection_box = {{0, 0}, {0, 0}},
		order = "i[items][sb-artillery-mk2]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "he-shell-mk2",
			cooldown = 360000,
			range = 30,
			projectile_creation_distance = 1.8,
		ammo_type =
		{
			category = "biological",
			action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "projectile",
				projectile = "pewpewbang",
				starting_speed = 5
			  }
			}
		}
		},
		rotation_speed = 0.015,
		preparing_speed = 0.08,
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(mk2_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(mk2_extension)
                          return res
                       end)(),
		preparing_animation = mk2_extension,
		prepared_animation =
		{
		  filename = "__SupremeWarfare__/graphics/artillery/mk2/picture.png",
		  priority = "medium",
		  width = 168,
		  height = 168,
		  direction_count = 64,
		  frame_count = 1,
		  line_length = 8,
		  axially_symmetrical = false,
		  shift = {0, -1.5}
		}
	},
	-- Artillery MK3
   {
		type = "container",
		name = "sb-artillery-mk3",
		icon = "__SupremeWarfare__/graphics/artillery/rapidfire/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.arty_mk3.minable,
		max_health = SWVariables.arty_mk3.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		resistances = SWVariables.arty_mk3.resistances,
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{0, 0}, {0, 0}},
		order = "i[items][sb-artillery-mk3]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		picture =
		{
			filename = "__SupremeWarfare__/graphics/artillery/rapidfire/picture.png",
			priority = "high",
			width = 160,
			height = 160,
			shift = {0.5, -0.875}
		},
	},
	-- RocketLauncher MK3
	{
		type = "container",
		name = "sb-rocketlauncher-mk3",
		icon = "__SupremeWarfare__/graphics/artillery/rocketmk3/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.rocketl_mk3.minable,
		max_health = SWVariables.rocketl_mk3.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		resistances = SWVariables.rocketl_mk3.resistances,
		collision_box = {{-1.2, -1.2 }, {1.2, 1.2}},
		selection_box = {{0, 0}, {0, 0}},
		order = "i[items][sb-rocketlauncher-mk3]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		picture =
		{
			filename = "__SupremeWarfare__/graphics/artillery/rocketmk3/picture.png",
			priority = "high",
			width = 104,
			height = 96
		},
	},
	-- Artillery MK4
   {
		type = "container",
		name = "sb-artillery-mk4",
		icon = "__SupremeWarfare__/graphics/artillery/bigbang/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.arty_mk4.minable,
		max_health = SWVariables.arty_mk4.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		resistances = SWVariables.arty_mk4.resistances,
		collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
		selection_box = {{0, 0}, {0, 0}},
		order = "i[items][sb-artillery-mk4]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		picture =
		{
		  filename = "__SupremeWarfare__/graphics/artillery/bigbang/picture.png",
		  priority = "low",
		  width = 320,
		  height = 320,
		  shift = {1.125, -1.625}
		}
	},
	--Inventory
	{
		type = "ammo-turret",
		name = "sb-artillery-mk1i",
		icon = "__SupremeWarfare__/graphics/artillery/mk1/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.arty_mk1.minable,
		max_health = SWVariables.arty_mk1.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = SWVariables.arty_mk1.resistances,
		collision_box = {{-0.4, -0.9 }, {0.4, 0.9}},
		selection_box = {{-0.5, -1 }, {0.5, 1}},
		order = "i[items][sb-artillery-mk1]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "rocket",
			cooldown = 2,
			range = 0,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),

	},
	{
		type = "ammo-turret",
		name = "sb-artillery-mk2i",
		icon = "__SupremeWarfare__/graphics/artillery/mk2/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.arty_mk2.minable,
		max_health = SWVariables.arty_mk2.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = SWVariables.arty_mk2.resistances,
		collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
		selection_box = {{-0.8, -1}, {0.8, 1}},
		order = "i[items][sb-artillery-mk2]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "he-shell-mk2",
			cooldown = 2,
			range = 0,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),

	},
	{
		type = "ammo-turret",
		name = "sb-artillery-mk3i",
		icon = "__SupremeWarfare__/graphics/artillery/rapidfire/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.arty_mk3.minable,
		max_health = SWVariables.arty_mk3.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = SWVariables.arty_mk3.resistances,
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		order = "i[items][sb-artillery-mk3]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "he-shell-mk3",
			cooldown = 2,
			range = 0,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),

	},
	{
		type = "ammo-turret",
		name = "sb-rocketlauncher-mk3i",
		icon = "__SupremeWarfare__/graphics/artillery/rapidfire/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.rocketl_mk3.minable,
		max_health = SWVariables.rocketl_mk3.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = SWVariables.rocketl_mk3.resistances,
		collision_box = {{-1.2, -1.2 }, {1.2, 1.2}},
		selection_box = {{-1.3, -1.3 }, {1.3, 1.3}},
		order = "i[items][sb-rocketlauncher-mk3]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "he-rocket-mk3",
			cooldown = 2,
			range = 0,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),

	},
		{
		type = "ammo-turret",
		name = "sb-artillery-mk4i",
		icon = "__SupremeWarfare__/graphics/artillery/bigbang/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = SWVariables.arty_mk4.minable,
		max_health = SWVariables.arty_mk4.health,
		corpse = "small-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = SWVariables.arty_mk4.resistances,
		collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
		selection_box = {{-3.25, -3.0}, {3.25, 3.0}},
		order = "i[items][sb-artillery-mk4]",
		group = "speedy-core",
		subgroup = "sb-artillery",
		fast_replaceable_group = "artillery",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "he-shell-mk4",
			cooldown = 2,
			range = 0,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),

	},
})