data:extend({
-- Item
	{
		type = "item",
		name = "cargo-wagon-gun-turret",
		icon = "__5dim_trains__/resources/icons/wagon-gun-turret.png",
		flags = {"goes-to-quickbar"},
		subgroup = "trains-warwagons",
		order = "yx",
		place_result = "cargo-wagon-gun-turret",
		stack_size = 5
	},

--Recipe
	{
		type = "recipe",
		name = "cargo-wagon-gun-turret",
		enabled = "false", -- TESTING ONLY
		ingredients =
		{
			{"cargo-wagon", 1},
			{"gun-turret", 6},
		},
		result = "cargo-wagon-gun-turret"
	},

--Entity
    {
    type = "cargo-wagon",
    name = "cargo-wagon-gun-turret",
	icon = "__5dim_trains__/resources/icons/wagon-passive-provider.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "placeable-player"},
    inventory_size = 20,
    minable = {mining_time = 1, result = "cargo-wagon-gun-turret"},
    max_health = 600,
    corpse = "medium-remnants",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
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
        "__5dim_trains__/resources/wagon-gun/spritesheet-1.png",
        "__5dim_trains__/resources/wagon-gun/spritesheet-2.png",
        "__5dim_trains__/resources/wagon-gun/spritesheet-3.png",
        "__5dim_trains__/resources/wagon-gun/spritesheet-4.png",
        "__5dim_trains__/resources/wagon-gun/spritesheet-5.png",
        "__5dim_trains__/resources/wagon-gun/spritesheet-6.png",
        "__5dim_trains__/resources/wagon-gun/spritesheet-7.png",
        "__5dim_trains__/resources/wagon-gun/spritesheet-8.png",
      },
      line_length = 4,
      lines_per_file = 4,
      shift={0.4, -1.20}
    },
    rail_category = "regular"
  },
    {
		type = "ammo-turret",
		name = "gun-turret-mounted",
		icon = "__base__/graphics/icons/gun-turret.png",
		flags = {"placeable-player", "player-creation"},
		--minable = {mining_time = 0.5, result = "gun-turret"},
		max_health = 600,
		corpse = "small-remnants",
		collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
		collision_mask = {"ghost-layer"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		rotation_speed = 0.015,
		preparing_speed = 0.08,
		folding_speed = 0.08,
		dying_explosion = "medium-explosion",
		inventory_size = 3,
		automated_ammo_count = 10,
		order="z",
    folded_animation = 
    {
      layers =
      {
        gun_turret_extension{frame_count=1, line_length = 1},
        gun_turret_extension_mask{frame_count=1, line_length = 1},
        gun_turret_extension_shadow{frame_count=1, line_length = 1}
      }
    },
    preparing_animation = 
    {
      layers =
      {
        gun_turret_extension{},
        gun_turret_extension_mask{},
        gun_turret_extension_shadow{}
      }
    },
    prepared_animation = gun_turret_attack{frame_count=1},
    attacking_animation = gun_turret_attack{},
    folding_animation = 
    { 
      layers = 
      { 
        gun_turret_extension{run_mode = "backward"},
        gun_turret_extension_mask{run_mode = "backward"},
        gun_turret_extension_shadow{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__5dim_trains__/resources/trans.png",
          priority = "high",
          width = 1,
          height = 1,
          axially_symmetrical = false,
          direction_count = 1,
          shift = {5.0625, -5.2},
        },
        {
          filename = "__5dim_trains__/resources/trans.png",
          line_length = 1,
          width = 1,
          height = 1,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 1,
          shift = {5.0625, -1.2},
          apply_runtime_tint = true
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 6,
      projectile_creation_distance = 1.39375,
      projectile_center = {0.0625, -0.0875}, -- same as gun_turret_attack shift
      damage_modifier = 2,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 17,
      sound = make_heavy_gunshot_sounds(),
    }
	},
})