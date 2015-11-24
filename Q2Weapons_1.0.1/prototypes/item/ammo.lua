data:extend(
{
  {
    type = "ammo",
    name = "q2-railgun-slugs",
    icon = "__Q2Weapons__/graphics/icons/railgun-slugs.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "q2-railgun-slugs",
      target_type = "direction",
      action =
      {
        type = "line",
        range = 40,
        width = 0.4,

        source_effects =
        {
          type = "create-entity",
          entity_name = "railgun-beam"
        },
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = { amount = 300, type="physical"}
          }
        }
      }
    },
    magazine_size = 5,
    subgroup = "ammo",
    order = "c[railgun]",
    stack_size = 100
  },
{
    type = "ammo",
    name = "q2-rockets",
    icon = "__Q2Weapons__/graphics/icons/q2rockets.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "q2-rockets",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-rocket",
          starting_speed = 0.3,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    magazine_size = 4,
    subgroup = "ammo",
    order = "d[rocket-launcher]-b[explosive]",
    stack_size = 100

  },
{
    type = "ammo",
    name = "q2-shotgun-shells",
    icon = "__Q2Weapons__/graphics/icons/q2shotgunshells.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "q2-shotgun-shells",
      target_type = "direction",
      source_effects =
      {
        type = "create-entity",
        entity_name = "explosion-gunshot"
      },
      action =
      {
        type = "direct",
        repeat_count = 40,
        action_delivery =
        {
          type = "projectile",
          projectile = "piercing-shotgun-pellet",
          starting_speed = 1,
          direction_deviation = 0.3,
          range_deviation = 0.3,
          max_range = 20,
        }
      }
    },
    magazine_size = 8,
    subgroup = "ammo",
    order = "b[shotgun]-b[piercing]",
    stack_size = 100
  }

}
)
