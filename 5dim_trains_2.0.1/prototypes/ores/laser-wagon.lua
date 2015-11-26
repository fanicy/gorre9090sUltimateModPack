data:extend({
-- Item
	{
		type = "item",
		name = "cargo-wagon-laser-turret",
		icon = "__5dim_trains__/resources/icons/wagon-laser-turret.png",
		flags = {"goes-to-quickbar"},
		subgroup = "trains-warwagons",
		order = "yy",
		place_result = "cargo-wagon-laser-turret",
		stack_size = 5
	},

--Recipe
	{
		type = "recipe",
		name = "cargo-wagon-laser-turret",
		enabled = "false", -- TESTING ONLY
		ingredients =
		{
			{"cargo-wagon", 1},
			{"basic-accumulator", 1},
			{"copper-cable", 15},
			{"5d-gold-circuit", 2},
			{"laser-turret", 4},
		},
		result = "cargo-wagon-laser-turret"
	},

--Entity
	{
    type = "cargo-wagon",
    name = "cargo-wagon-laser-turret",
	icon = "__5dim_trains__/resources/icons/wagon-laser-turret.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "placeable-player"},
    inventory_size = 0,
    minable = {mining_time = 1, result = "cargo-wagon-laser-turret"},
    max_health = 600,
    corpse = "medium-remnants",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    --selection_box = {{-0.7, -2.5}, {1, 2.5}},
    selection_box = {{-0.7, -2.5}, {1, 2.5}},
    weight = 1500,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.0015,
    air_resistance = 0.002,
    connection_distance = 3.3,
    joint_distance = 4,
    energy_per_hit_point = 5,
	dying_explosion = "medium-explosion",
    pictures =
    {
      priority = "very-low",
      width = 256,
      height = 256,
      axially_symmetrical = true,
      back_equals_front = false,
      direction_count = 64,
      filenames =
      {
        "__5dim_trains__/resources/wagon-laser/spritesheet-1.png",
        "__5dim_trains__/resources/wagon-laser/spritesheet-2.png",
        "__5dim_trains__/resources/wagon-laser/spritesheet-3.png",
        "__5dim_trains__/resources/wagon-laser/spritesheet-4.png",
        "__5dim_trains__/resources/wagon-laser/spritesheet-5.png",
        "__5dim_trains__/resources/wagon-laser/spritesheet-6.png",
        "__5dim_trains__/resources/wagon-laser/spritesheet-7.png",
        "__5dim_trains__/resources/wagon-laser/spritesheet-8.png",
      },
      line_length = 4,
      lines_per_file = 4,
      shift={0.4, -1.20}
    },
    rail_category = "regular"
	},
	{
    type = "electric-turret",
    name = "laser-turret-mounted",
    icon = "__5dim_trains__/resources/icons/wagon-laser-turret.png",
    flags = {"placeable-neutral", "placeable-off-grid", "placeable-player"},
    --minable = { mining_time = 0.5, result = "laser-turret" },
    max_health = 600,
    corpse = "small-remnants",
	collision_box = {{-2.0, -2.0}, {2.0, 2.0}},
	collision_mask = {"ghost-layer"},
	selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
	collision_mask = { "ghost-layer"},
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    dying_explosion = "medium-explosion",
    folding_speed = 0.05,
	order="z",
    energy_source =
    {
      type = "electric",
      buffer_capacity = "801kJ",
      input_flow_limit = "4800kW",
      drain = "24kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        laser_turret_extension{frame_count=1, line_length = 1},
        laser_turret_extension_shadow{frame_count=1, line_length=1},
        laser_turret_extension_mask{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        laser_turret_extension{},
        laser_turret_extension_shadow{},
        laser_turret_extension_mask{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
          line_length = 8,
          width = 68,
          height = 68,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          shift = {0.0625, -1}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
          line_length = 8,
          width = 54,
          height = 44,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {0.0625, -1.3125},
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
          line_length = 8,
          width = 88,
          height = 52,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          draw_as_shadow = true,
          shift = {1.59375, 0}
        }
      }
    },
    folding_animation = 
    {
      layers =
      {
        laser_turret_extension{run_mode = "backward"},
        laser_turret_extension_shadow{run_mode = "backward"},
        laser_turret_extension_mask{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__5dim_trains__/resources/trans.png",
          priority = "high",
          width = 98,
          height = 82,
          axially_symmetrical = false,
          direction_count = 1,
          shift = { 0.109375, 0.03125 }
        },
        {
          filename = "__5dim_trains__/resources/trans.png",
          line_length = 1,
          width = 54,
          height = 46,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = {0.046875, -0.109375},
        },
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      cooldown = 20,
      projectile_center = {0, -0.2},
      projectile_creation_distance = 1.4,
      range = 25,
      damage_modifier = 4,
      ammo_type =
      {
        type = "projectile",
        category = "laser-turret",
        energy_consumption = "800kJ",
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              {
                type = "projectile",
                projectile = "laser",
                starting_speed = 0.28
              }
            }
          }
        }
      },
      sound = make_laser_sounds()
    }
  },
})