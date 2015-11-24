  data:extend({
    {
    type = 'technology',
    name='alien-fragments',
    icon = '__Evolution__/graphics/icons/alien-fragments.png',
    effects = {{type = 'unlock-recipe', recipe='alien-fragments'}},
    prerequisites = {},
    unit = alien_research(60, 1, 0, 0, 0, 3),
    order='a-f-a',
  },
    {
    type = 'technology',
    name='endo-skeleton',
    icon = '__Evolution__/graphics/icons/endo-skeleton.png',
    effects = {{type = 'unlock-recipe', recipe='endo-skeleton'}},
    prerequisites = {"alien-fragments"},
    unit = alien_research(40, 1, 1, 0, 0, 6),
    order='a-f-a',
  },
    {
    type = 'technology',
    name='exo-skeleton',
    icon = '__Evolution__/graphics/icons/exo-skeleton.png',
    effects = {{type = 'unlock-recipe', recipe='exo-skeleton'}},
    prerequisites = {"endo-skeleton"},
    unit = alien_research(60, 1, 1, 1, 0, 12),
    order='a-f-a',
  },
  })