data:extend(
{ 
    {
    type = 'technology',
    name='Worm-glaides-V1',
    icon = '__Evolution__/graphics/icons/Worm-glaides.png',
    effects = {{type = 'unlock-recipe', recipe='small-worm'}},
    prerequisites = {"alien-fragments"},
    unit = alien_research(100, 1, 0, 0, 0, 5),
    order='a-f-a',
  },
      {
    type = 'technology',
    name='Worm-glaides-V2',
    icon = '__Evolution__/graphics/icons/Worm-glaives-2.png',
    effects = {{type = 'unlock-recipe', recipe='medium-worm'}},
    prerequisites = {"endo-skeleton"},
    unit = alien_research(80, 2, 2, 0, 0, 10),
    order='a-f-a',
  },
      {
    type = 'technology',
    name='Worm-glaides-V3',
    icon = '__Evolution__/graphics/icons/Worm-glaives-3.png',
    effects = {{type = 'unlock-recipe', recipe='big-worm'}},
    prerequisites = {"exo-skeleton"},
    unit = alien_research(60, 1, 1, 1, 1, 20),
    order='a-f-a',
  },
  
  })