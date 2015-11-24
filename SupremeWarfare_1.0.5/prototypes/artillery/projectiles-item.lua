data:extend({
	-- HE Shell MK1
	{
		type = "ammo",
		name = "sb-heshell-mk1",
		icon = "__SupremeWarfare__/graphics/projectiles/icon/he-shell-mk1.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "rocket",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "muzzle-flash",
						starting_speed = 0.01,
						direction_deviation = 0.0,
						range_deviation = 0.0,
						max_range = .50		
					}
				},
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "sb-heshell-mk1",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 200
					}
				}
			}
		},
		subgroup = "sb-shells",
		order = "a[mk1]",
		stack_size = SWVariables.heshell_mk1.stack_size
	},
	-- HE Shell MK2
	{
		type = "ammo",
		name = "sb-heshell-mk2",
		icon = "__SupremeWarfare__/graphics/projectiles/icon/he-shell-mk2.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "he-shell-mk2",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "muzzle-flash",
						starting_speed = 0.01,
						direction_deviation = 0.0,
						range_deviation = 0.0,
						max_range = .50		
					}
				},
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "sb-heshell-mk2",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 200
					}
				}
			}
		},
		subgroup = "sb-shells",
		order = "a[mk2]",
		stack_size = SWVariables.heshell_mk2.stack_size
	},
	-- HE Shell MK3
	{
		type = "ammo",
		name = "sb-heshell-mk3",
		icon = "__SupremeWarfare__/graphics/projectiles/icon/he-shell-mk3.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "he-shell-mk3",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "muzzle-flash",
						starting_speed = 0.01,
						direction_deviation = 0.0,
						range_deviation = 0.0,
						max_range = .50		
					}
				},
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "sb-heshell-mk3",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 200
					}
				}
			}
		},
		subgroup = "sb-shells",
		order = "a[mk3]",
		stack_size = SWVariables.heshell_mk3.stack_size
	},
	-- HE Shell MK3
	{
		type = "ammo",
		name = "he-rocket-mk3",
		icon = "__SupremeWarfare__/graphics/projectiles/icon/he-shell-mk3.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "he-rocket-mk3",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "muzzle-flash",
						starting_speed = 0.01,
						direction_deviation = 0.0,
						range_deviation = 0.0,
						max_range = .50		
					}
				},
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "he-rocket-mk3",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 200
					}
				}
			}
		},
		subgroup = "sb-shells",
		order = "a[mk3]",
		stack_size = SWVariables.heshell_mk3.stack_size
	},
		-- HE Shell MK4
	{
		type = "ammo",
		name = "sb-heshell-mk4",
		icon = "__SupremeWarfare__/graphics/projectiles/icon/he-shell-mk4.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "he-shell-mk4",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "muzzle-flash",
						starting_speed = 0.01,
						direction_deviation = 0.0,
						range_deviation = 0.0,
						max_range = .50		
					}
				},
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "sb-heshell-mk4",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 2000
					}
				}
			}
		},
		subgroup = "sb-shells",
		order = "a[mk4]",
		stack_size = SWVariables.heshell_mk4.stack_size
	},
	--Capsule
	{
    type = "capsule",
    name = "sb-target-capsule",
    icon = "__SupremeWarfare__/graphics/projectiles/icon/target-capsule.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
	    type = "projectile",
        ammo_category = "capsule",
        cooldown = SWVariables.target_capsule.cooldown,
        projectile_creation_distance = 0.6,
        range = SWVariables.target_capsule.range,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "sb-target-capsule",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "sb-shells",
    order = "b[target]",
    stack_size = SWVariables.target_capsule.stack_size
   },
})