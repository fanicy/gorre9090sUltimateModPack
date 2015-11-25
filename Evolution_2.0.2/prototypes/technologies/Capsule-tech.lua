data:extend(
{
  {
    type = 'technology',
    name='alien-capsule-V1',
    icon = '__Evolution__/graphics/icons/small-biter-capsule.png',
    effects = {{type = 'unlock-recipe', recipe='small-biter-capsule'}, {type = 'unlock-recipe', recipe='small-spitter-capsule'} },
    prerequisites = {"alien-fragments"},
    unit = alien_research(30, 1, 0, 0, 0, 15),
    order='a-f-a',
  },
  
  {
    type = 'technology',
    name='alien-capsule-V2',
    icon = '__Evolution__/graphics/icons/medium-biter-capsule.png',
    effects = {{type = 'unlock-recipe', recipe='medium-biter-capsule'}, {type = 'unlock-recipe', recipe='medium-spitter-capsule'} },
    prerequisites = {"alien-fragments"},
    unit = alien_research(40, 1, 1, 0, 0, 15),
    order='a-f-a',
  },
  {
    type = 'technology',
    name='alien-capsule-V3',
    icon = '__Evolution__/graphics/icons/big-biter-capsule.png',
    effects = {{type = 'unlock-recipe', recipe='big-biter-capsule'}, {type = 'unlock-recipe', recipe='big-spitter-capsule'} },
    prerequisites = {"endo-skeleton"},
    unit = alien_research(50, 1, 1, 1, 0, 20),
    order='a-f-a',
  },
})