data:extend(
{  
  
  {
    type = "capsule",
    name = "small-biter-capsule",
    icon = "__base__/graphics/icons/small-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
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
              projectile = "small-biter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "biters",
    order = "a[small-biter-capsule]",
    stack_size = 50
  },

  {
    type = "capsule",
    name = "small-spitter-capsule",
    icon = "__base__/graphics/icons/small-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
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
              projectile = "small-spitter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "spitters",
    order = "a[small-spitter-capsule]",
    stack_size = 50
  },
  
    {
    type = "capsule",
    name = "medium-biter-capsule",
    icon = "__base__/graphics/icons/medium-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
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
              projectile = "medium-biter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "biters",
    order = "b[medium-biter-capsule]",
    stack_size = 50
  },
  
    {
    type = "capsule",
    name = "medium-spitter-capsule",
    icon = "__base__/graphics/icons/medium-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
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
              projectile = "medium-spitter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "spitters",
    order = "b[medium-spitter-capsule]",
    stack_size = 50
  },
  
    {
    type = "capsule",
    name = "big-biter-capsule",
    icon = "__base__/graphics/icons/big-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
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
              projectile = "big-biter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "biters",
    order = "c[big-biter-capsule]",
    stack_size = 50
  },
  
    {
    type = "capsule",
    name = "big-spitter-capsule",
    icon = "__base__/graphics/icons/big-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
		type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
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
              projectile = "big-spitter-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "spitters",
    order = "c[big-spitter-capsule]",
    stack_size = 50
  },
  
})