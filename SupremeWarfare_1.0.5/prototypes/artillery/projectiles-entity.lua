require "util"
data:extend({
	--Projectile
	-- HE Shell
	{
    type = "projectile",
    name = "sb-heshell-mk1",
    flags = {"not-on-map"},
    acceleration = SWVariables.heshell_mk1.acceleration,
	action =
	{
		{
			type = "area",
			perimeter = SWVariables.heshell_mk1.perimeter,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					SWVariables.heshell_mk1.damage
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "explosion"
					}
				}
			}
		}
	},
	light = {intensity = 0.5, size = 6},
    animation =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk1.png",
        priority = "extra-high",
        width = 10,
        height = 30,
        frame_count = 1
    },
    shadow =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk1-shadow.png",
        priority = "extra-high",
        width = 10,
        height = 30,
        frame_count = 1
    }
  },
  -- HE Shell MK2
	{
    type = "projectile",
    name = "sb-heshell-mk2",
    flags = {"not-on-map"},
    acceleration = SWVariables.heshell_mk2.acceleration,
	action =
	{
		{
			type = "area",
			perimeter = SWVariables.heshell_mk2.perimeter,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					SWVariables.heshell_mk2.damage,
					{
					type = "create-entity",
					entity_name = "explosion"
					}
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "explosion-gunshot"
					}
				}
			}
		}
	},
	light = {intensity = 0.5, size = 6},
    animation =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk2.png",
        priority = "extra-high",
        width = 10,
        height = 23,
        frame_count = 1
    },
    shadow =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk2-shadow.png",
        priority = "extra-high",
        width = 10,
        height = 23,
        frame_count = 1
    }
  },
  -- He Shell MK3
  {
    type = "projectile",
    name = "sb-heshell-mk3",
    flags = {"not-on-map"},
    acceleration = SWVariables.heshell_mk3.acceleration,
	action =
	{
		{
			type = "area",
			perimeter = SWVariables.heshell_mk3.perimeter,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					SWVariables.heshell_mk3.damage,
					{
					type = "create-entity",
					entity_name = "explosion"
					}
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "explosion-gunshot"
					}
				}
			}
		}
	},
	light = {intensity = 0.5, size = 6},
    animation =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk3.png",
        priority = "extra-high",
        width = 9,
        height = 30,
        frame_count = 1
    },
    shadow =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk3-shadow.png",
        priority = "extra-high",
        width = 9,
        height = 30,
        frame_count = 1
    }
  },
  -- He Rocket MK3
  {
    type = "projectile",
    name = "he-rocket-mk3",
    flags = {"not-on-map"},
    acceleration = SWVariables.herocket_mk3.acceleration,
	action =
	{
		{
			type = "area",
			perimeter = SWVariables.herocket_mk3.perimeter,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					SWVariables.herocket_mk3.damage,
					{
					type = "create-entity",
					entity_name = "explosion"
					}
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "explosion-gunshot"
					}
				}
			}
		}
	},
	light = {intensity = 0.5, size = 6},
    animation =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk3.png",
        priority = "extra-high",
        width = 9,
        height = 30,
        frame_count = 1
    },
    shadow =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk3-shadow.png",
        priority = "extra-high",
        width = 9,
        height = 30,
        frame_count = 1
    }
  },
  -- HE Shell MK4
  {
    type = "projectile",
    name = "sb-heshell-mk4",
    flags = {"not-on-map"},
    acceleration = SWVariables.heshell_mk4.acceleration,
	action =
	{
		{
			type = "area",
			perimeter = SWVariables.heshell_mk4.perimeter,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
					type = "damage",
					damage = {amount = 100, type = "physical"}
					},
					SWVariables.heshell_mk4.damage
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "sb-t4-explosion"
					},
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "sb-arty-explosion",
					}
				}
			}
		}
	},
	light = {intensity = 0.5, size = 6},
    animation =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk4.png",
        priority = "extra-high",
        width = 12,
        height = 30,
        frame_count = 1
    },
    shadow =
    {
        filename = "__SupremeWarfare__/graphics/projectiles/he-shell-mk4-shadow.png",
        priority = "extra-high",
        width = 12,
        height = 30,
        frame_count = 1
    }
  },
  {
	type = "projectile",
	name = "muzzle-flash",
	flags = {"not-on-map"},
	acceleration = 0.0,
	animation = 
	{
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "extra-high",
        width = 112,
        height = 94,
        frame_count = 54,
		line_length = 6,	
        animation_speed = 0.5
	},
	light = {intensity = 0.5, size = 6}

  },
  -- Smoke
  {
    type = "smoke-with-trigger",
    name = "sb-poison-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__base__/graphics/entity/cloud/cloud-45-frames.png",
      priority = "low",
      width = 256,
      height = 256,
      frame_count = 45,
      animation_speed = 3,
      line_length = 7,
      scale = 6,
    },
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
    color = { r = 0.2, g = 0.9, b = 0.2 },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            perimeter = 22,
            entity_flags = {"breaths-air"},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 10, type = "poison"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  -- Target Smoke
  {
    type = "smoke-with-trigger",
    name = "sb-smoke-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__base__/graphics/entity/cloud/cloud-45-frames.png",
      priority = "low",
      width = 256,
      height = 256,
      frame_count = 45,
      animation_speed = 3,
      line_length = 7,
      scale = 2,
    },
    slow_down_factor = 0,
	affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
    color = { r = 0.5, g = 0.0, b = 0.0 },

  },
  -- Target Capsule
  {
    type = "projectile",
    name = "sb-target-capsule",
    flags = {"not-on-map"},
    acceleration = SWVariables.target_capsule.acceleration,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
		  {
			  type = "create-entity",
			  trigger_created_entity="true",
			  entity_name = "sb-smoke-cloud"
		  }
		}
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__SupremeWarfare__/graphics/projectiles/target-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__SupremeWarfare__/graphics/projectiles/target-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = {
	  {
		name = "smoke-fast",
		deviation = {0.15, 0.15},
		frequency = 1,
		position = {0, 0},
		slow_down_factor = 1,
		starting_frame = 3,
		starting_frame_deviation = 5,
		starting_frame_speed = 0,
		starting_frame_speed_deviation = 5
	  }
	},
  },
  --Target
    {
		type = "simple-entity",
		name = "sb-target",
		flags = {"not-on-map"},
		max_health = 1,
		render_layer = "object",
		pictures =
		{
		   {
			 filename = "__base__/graphics/entity/decorative/green-carpet-grass/green-carpet-grass-01.png",
			 width = 1,
			 height = 1
		   },
		}
   },
   -- v_v
	{
		type = "projectile",
		name = "pewpewbang",
		flags = {"not-on-map"},
		acceleration = 0.0,
		animation = 
		{
			filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
			priority = "extra-high",
			width = 1,
			height = 1,
			frame_count = 1,
			line_length = 1,	
			animation_speed = 3
		},
		light = {intensity = 0.5, size = 6}

	},
	  -- Explosion Smoke
	{
		type = "smoke-with-trigger",
		name = "sb-arty-explosion",
		flags = {"not-on-map"},
		show_when_smoke_off = true,
		animation =
		{
		  filename = "__SupremeWarfare__/graphics/explosion.png",
		  priority = "high",
		  width = 192,
		  height = 192,
		  frame_count = 20,
		  animation_speed = 8,
		  line_length = 5,
		  scale = 12,
		},
		slow_down_factor = 0,
		affected_by_wind = false,
		cyclic = false,
		duration = 60 * 3,

		spread_duration = 10,


	  },
	  -- BIG ARTY Explosion
	  {
		type = "explosion",
		name = "sb-t4-explosion",
		flags = {"not-on-map"},
		animations =
		{
		  {
			filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
			priority = "extra-high",
			width = 112,
			height = 94,
			scale = 0.8,
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
			filename = "__base__/sound/fight/large-explosion-1.ogg",
			volume = 2.0
		  },
		  {
			filename = "__base__/sound/fight/large-explosion-2.ogg",
			volume = 2.0
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
				repeat_count = 60,
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