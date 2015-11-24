data:extend(
{

  {
    type = "unit",
    name = "small-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 10,
    order="b-b-d",
    subgroup="enemies",
    resistances = 
    {
      {
        type = "physical",
        percent = 15,
      },
    },
    healing_per_tick = 0.01,
    collision_box = {{0, -0.01}, {0, 0.01}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=1,
                                                 scale=smallspitterscale,
                                                 tint=smallspittertint}),
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 200,
    corpse = "small-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(smallspitterscale, smallspittertint)
  },

  {
    type = "unit",
    name = "medium-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 50,
    order="b-b-e",
    subgroup="enemies",
    resistances = 
    {
      {
        type = "physical",
        percent = 30,
      },
      {
        type = "acid",
        percent = 30,
      },
    },
    healing_per_tick = 0.01,
    collision_box = {{0, -0.01}, {0, 0.01}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=1.5,
                                                 scale=mediumspitterscale,
                                                 tint=mediumspittertint}),
    vision_distance = 30,
    movement_speed = 0.165,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "medium-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(mediumspitterscale, mediumspittertint)
  },

  {
    type = "unit",
    name = "big-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 200,
    order="b-b-f",
    subgroup="enemies",
    resistances = 
    {
      {
        type = "physical",
        percent = 50,
      },
      {
        type = "laser",
        percent = 50,
      },
      {
        type = "acid",
        percent = 50,
      },
    },
    healing_per_tick = 0.01,
    collision_box = {{0, -0.01}, {0, 0.01}},
    selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = spitterattackparameters({range=15,
                                                 cooldown=100,
                                                 damage_modifier=2,
                                                 scale=bigspitterscale,
                                                 tint=bigspittertint}),
    vision_distance = 30,
    movement_speed = 0.15,
    distance_per_frame = 0.05,
    -- in pu
    pollution_to_join_attack = 600,
    corpse = "big-spitter-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_spitter_dying_sounds(1.0),
    run_animation = spitterrunanimation(bigspitterscale, bigspittertint)
  },
  
})
