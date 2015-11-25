data:extend({  

{
    type = "gun",
    name = "q2-class-railgun",
    icon = "__Q2Weapons__/graphics/icons/q2railgun.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "gun",
    order = "c[railgun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "q2-railgun-slugs",
      cooldown = 3 * 20,
      movement_slow_down_factor = 0.3,
      projectile_creation_distance = 0.8,
      range = 35,
      sound =
      {
        {
          filename = "__Q2Weapons__/sound/q2railgunfire.ogg",
          volume = 0.8
        }
      }
    },
    stack_size = 1
  },
{
    type = "gun",
    name = "q2-rocket-launcher",
    icon = "__Q2Weapons__/graphics/icons/q2rocketlauncher.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "gun",
    order = "d[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "q2-rockets",
      movement_slow_down_factor = 0.3,
      damage_modifier = 2.5,
      cooldown = 60,
      projectile_creation_distance = 0.8,
      range = 28
,
      sound =
      {
        {
          filename = "__Q2Weapons__/sound/q2rocketfire.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
{
    type = "gun",
    name = "q2-super-shotgun",
    icon = "__Q2Weapons__/graphics/icons/q2supershotgun.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "gun",
    order = "b[shotgun]-a[combat]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "q2-shotgun-shells",
      explosion = "explosion-gunshot",
      cooldown = 50,
      movement_slow_down_factor = 0.4,
      damage_modifier = 2.5,
      projectile_creation_distance = 0.6,
      range = 20,
      sound =
      {
        {
          filename = "__Q2Weapons__/sound/q2supershotgunfire.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },

}
)
